# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.23s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 10.85s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.52s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.64s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.41s |

<!-- ranking end -->

> [!TIP]
> ## Ranking algorithm
>
> The ranking system evaluates frameworks based on multiple factors:
>
> 1. **Test Case Scores**
>    - For each test case, the fastest passing implementation (with coefficient ≥ 0.5) serves as the baseline
>    - Individual test scores are calculated as: `(baseline_time / actual_time) * coefficient * weight`
>    - Test case weights are assigned based on operation types:
>      - Regular operations: 1.0
>      - Extended operations: 1.2-1.5
>
> 2. **Success Coefficient**
>    - Full pass (coefficient = 1.0): Test completely successful
>    - Partial pass (coefficient = 0.5): Part of the test failed
>    - Complete fail (coefficient = 0): Test failed entirely
>
> 3. **Final Score Calculation**
>    - Base score: Geometric mean of all weighted test case scores
>    - Time factor: sqrt(fastest_total_time / framework_total_time)
>    - Final score = base_score * time_factor
>
> This scoring system balances individual test performance with overall execution time while accounting for test reliability.

## Benchmark results of each framework

<!-- test-case start -->
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 202.56ms | 2.27s | 152.92ms (fail) | 203.18ms | 208.99ms | 272.46ms |
| broadPropagation | 459.05ms | 4.26s | 7.34ms (fail) | 358.54ms | 455.78ms | 499.13ms |
| deepPropagation | 169.86ms | 1.53s | 138.39ms (fail) | 126.20ms | 174.62ms | 165.62ms |
| diamond | 283.91ms | 2.31s | 182.33ms (fail) | 252.06ms | 287.82ms | 349.05ms |
| mux | 395.02ms | 1.78s | 176.43ms (fail) | 361.32ms | 400.13ms | 422.31ms |
| repeatedObservers | 45.95ms | 222.55ms | 55.69ms (fail) | 45.69ms | 41.72ms | 80.34ms |
| triangle | 100.93ms | 732.79ms | 77.58ms (fail) | 88.64ms | 99.22ms | 114.46ms |
| unstable | 75.64ms | 340.33ms | 341.36ms (fail) | 61.58ms | 71.64ms | 95.18ms |
| molBench | 493.88ms | 586.64ms | 1.45ms | 487.12ms | 495.13ms | 491.24ms |
| create_signals | 27.22ms | 83.08ms | 61.19ms | 27.62ms | 5.63ms | 55.45ms |
| comp_0to1 | 11.74ms | 37.96ms | 54.02ms | 7.25ms | 18.70ms | 26.28ms |
| comp_1to1 | 27.65ms | 17.60ms | 61.67ms | 4.24ms | 13.79ms | 47.06ms |
| comp_2to1 | 8.93ms | 21.17ms | 44.00ms | 2.35ms | 16.65ms | 46.43ms |
| comp_4to1 | 1.95ms | 19.83ms | 18.43ms | 10.58ms | 11.77ms | 4.68ms |
| comp_1000to1 | 4μs | 32μs | 44μs | 4μs | 6μs | 15μs |
| comp_1to2 | 18.32ms | 36.38ms | 48.56ms | 15.97ms | 33.03ms | 31.27ms |
| comp_1to4 | 11.28ms | 23.42ms | 48.71ms | 5.44ms | 31.35ms | 21.36ms |
| comp_1to8 | 7.93ms | 25.08ms | 44.26ms | 4.48ms | 7.82ms | 24.33ms |
| comp_1to1000 | 5.86ms | 15.10ms | 39.28ms | 3.22ms | 5.95ms | 15.03ms |
| update_1to1 | 8.99ms | 22.35ms | 8.44ms | 4.64ms | 9.00ms | 16.08ms |
| update_2to1 | 4.47ms | 12.20ms | 2.88ms | 2.31ms | 4.60ms | 7.99ms |
| update_4to1 | 2.28ms | 5.93ms | 1.96ms | 1.17ms | 2.32ms | 4.04ms |
| update_1000to1 | 22μs | 54μs | 14μs | 11μs | 22μs | 40μs |
| update_1to2 | 4.45ms | 11.14ms | 4.23ms | 2.35ms | 4.56ms | 8.16ms |
| update_1to4 | 2.28ms | 5.97ms | 1.46ms | 2.01ms | 2.37ms | 3.99ms |
| update_1to1000 | 55μs | 157μs | 378μs | 30μs | 989μs | 169μs |
| cellx1000 | 12.12ms | 86.33ms | 5.57ms | 9.57ms | 9.99ms | 14.08ms |
| cellx2500 | 35.39ms | 270.43ms | 28.37ms | 20.81ms | 28.00ms | 33.68ms |
| cellx5000 | 67.35ms | 568.65ms | 70.32ms | 44.82ms | 71.20ms | 84.32ms |
| 10x5 - 2 sources - read 20.0% (simple) | 502.65ms | 1.93s | 240.80ms | 241.62ms | 453.43ms | 345.61ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 281.75ms | 1.42s | 204.16ms | 176.79ms | 281.04ms | 247.55ms |
| 1000x12 - 4 sources - dynamic (large) | 3.47s | 1.85s | 340.86ms | 281.71ms | 3.78s | 467.66ms |
| 1000x5 - 25 sources (wide dense) | 3.42s | 3.37s | 487.70ms | 405.19ms | 2.80s | 600.89ms |
| 5x500 - 3 sources (deep) | 220.65ms | 1.12s | 204.53ms | 191.56ms | 232.79ms | 254.94ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 474.01ms | 1.65s | 259.49ms | 264.82ms | 452.54ms | 380.50ms |

<!-- test-case end -->

> [!TIP]
> - `(fail)`: Test case failed
> - `(half)`: Half of the test cases failed

## Integrate into your project

You can easily integrate Dart reactivity benchmark into your project to provide benchmarking.

### Install it

```bash
dart pub add dev:reactivity_benchmark
```

### Writing Tests

```dart
class YourReactiveFramework extends ReactiveFramework {
  ...
}

void main() {
  final framework = YourReactiveFramework();
  runFrameworkBench(framework);
}
```

## Local run benchmarks

Dart VM
```bash
dart run frameworks/[framework_name].dart
```

Run all benchamrks
```bash
bash bench.sh
```
