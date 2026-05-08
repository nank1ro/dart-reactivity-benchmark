# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.25s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 10.95s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.52s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.96s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.26s | 202.43ms | 197.30ms | 207.35ms | 272.03ms | 148.38ms (fail) |
| broadPropagation | 4.32s | 471.50ms | 355.93ms | 455.31ms | 502.05ms | 6.01ms (fail) |
| deepPropagation | 1.54s | 166.81ms | 128.09ms | 175.65ms | 166.98ms | 136.20ms (fail) |
| diamond | 2.40s | 289.16ms | 245.64ms | 285.50ms | 351.65ms | 176.62ms (fail) |
| mux | 1.78s | 398.01ms | 365.16ms | 371.89ms | 418.46ms | 177.30ms (fail) |
| repeatedObservers | 228.72ms | 45.77ms | 46.43ms | 42.44ms | 80.78ms | 58.33ms (fail) |
| triangle | 759.33ms | 102.16ms | 90.16ms | 99.41ms | 113.89ms | 75.06ms (fail) |
| unstable | 348.50ms | 75.61ms | 63.28ms | 74.75ms | 95.29ms | 339.98ms (fail) |
| molBench | 585.73ms | 494.24ms | 482.06ms | 496.03ms | 490.06ms | 1.06ms |
| create_signals | 66.95ms | 25.72ms | 27.86ms | 5.38ms | 92.11ms | 65.38ms |
| comp_0to1 | 34.20ms | 11.32ms | 9.13ms | 17.91ms | 32.95ms | 61.25ms |
| comp_1to1 | 36.47ms | 26.87ms | 4.17ms | 13.89ms | 48.65ms | 58.92ms |
| comp_2to1 | 33.69ms | 11.69ms | 2.27ms | 15.75ms | 34.78ms | 44.47ms |
| comp_4to1 | 23.47ms | 1.81ms | 7.37ms | 15.00ms | 4.72ms | 19.75ms |
| comp_1000to1 | 21μs | 5μs | 3μs | 4μs | 14μs | 46μs |
| comp_1to2 | 28.71ms | 20.34ms | 10.33ms | 18.83ms | 31.62ms | 49.81ms |
| comp_1to4 | 23.73ms | 9.01ms | 9.05ms | 33.58ms | 15.11ms | 49.59ms |
| comp_1to8 | 22.77ms | 12.96ms | 4.90ms | 6.40ms | 20.28ms | 47.93ms |
| comp_1to1000 | 14.85ms | 5.88ms | 3.47ms | 6.16ms | 14.51ms | 44.35ms |
| update_1to1 | 21.22ms | 8.95ms | 4.60ms | 9.40ms | 15.73ms | 10.19ms |
| update_2to1 | 10.38ms | 4.49ms | 2.34ms | 4.59ms | 7.86ms | 2.92ms |
| update_4to1 | 5.57ms | 2.29ms | 1.19ms | 2.35ms | 3.91ms | 2.33ms |
| update_1000to1 | 88μs | 22μs | 11μs | 23μs | 39μs | 14μs |
| update_1to2 | 10.45ms | 4.43ms | 2.31ms | 4.54ms | 7.99ms | 3.69ms |
| update_1to4 | 5.53ms | 2.26ms | 1.17ms | 2.42ms | 3.91ms | 1.50ms |
| update_1to1000 | 162μs | 40μs | 29μs | 784μs | 147μs | 424μs |
| cellx1000 | 70.41ms | 9.73ms | 8.95ms | 9.94ms | 12.50ms | 5.45ms |
| cellx2500 | 259.49ms | 31.88ms | 20.02ms | 28.27ms | 31.42ms | 28.36ms |
| cellx5000 | 545.31ms | 69.70ms | 42.69ms | 65.89ms | 74.24ms | 58.56ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.99s | 499.45ms | 241.41ms | 451.02ms | 342.39ms | 250.78ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.48s | 280.41ms | 187.22ms | 271.94ms | 253.16ms | 201.35ms |
| 1000x12 - 4 sources - dynamic (large) | 1.88s | 3.65s | 277.61ms | 3.85s | 462.04ms | 343.43ms |
| 1000x5 - 25 sources (wide dense) | 3.33s | 3.31s | 412.23ms | 2.80s | 601.91ms | 520.94ms |
| 5x500 - 3 sources (deep) | 1.13s | 222.10ms | 193.45ms | 232.40ms | 256.92ms | 207.70ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.70s | 478.55ms | 267.04ms | 448.44ms | 387.17ms | 257.90ms |

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
