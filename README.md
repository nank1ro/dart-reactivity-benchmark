# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.66s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.35s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.48s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.28s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.91s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.43s |

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
| Test Case | state_beacon | alien_signals | mobx | solidart(2.0-dev) | signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 174.78ms (fail) | 188.94ms | 2.34s | 275.15ms | 213.16ms | 199.19ms |
| broadPropagation | 5.98ms (fail) | 342.45ms | 4.52s | 506.24ms | 462.05ms | 449.64ms |
| deepPropagation | 140.76ms (fail) | 120.29ms | 1.57s | 166.60ms | 169.85ms | 175.20ms |
| diamond | 183.47ms (fail) | 231.70ms | 2.47s | 354.65ms | 278.87ms | 277.68ms |
| mux | 197.34ms (fail) | 365.99ms | 1.85s | 447.93ms | 450.28ms | 402.27ms |
| repeatedObservers | 53.03ms (fail) | 45.87ms | 233.83ms | 81.82ms | 44.37ms | 39.76ms |
| triangle | 78.45ms (fail) | 84.09ms | 778.58ms | 117.85ms | 101.08ms | 101.08ms |
| unstable | 336.32ms (fail) | 67.48ms | 349.22ms | 99.48ms | 79.08ms | 69.21ms |
| molBench | 1.02ms | 483.42ms | 570.92ms | 495.45ms | 486.76ms | 488.31ms |
| create_signals | 66.83ms | 24.29ms | 69.02ms | 99.72ms | 25.00ms | 5.69ms |
| comp_0to1 | 58.52ms | 7.69ms | 28.87ms | 37.86ms | 11.20ms | 17.44ms |
| comp_1to1 | 57.72ms | 4.24ms | 32.20ms | 44.54ms | 27.24ms | 11.59ms |
| comp_2to1 | 35.79ms | 2.37ms | 12.28ms | 39.58ms | 13.77ms | 11.52ms |
| comp_4to1 | 16.34ms | 7.89ms | 25.26ms | 13.96ms | 4.61ms | 9.76ms |
| comp_1000to1 | 42μs | 3μs | 24μs | 18μs | 5μs | 9μs |
| comp_1to2 | 43.39ms | 9.24ms | 32.01ms | 34.58ms | 20.48ms | 22.34ms |
| comp_1to4 | 43.33ms | 11.33ms | 25.35ms | 17.43ms | 12.06ms | 32.85ms |
| comp_1to8 | 42.24ms | 4.98ms | 24.31ms | 21.77ms | 6.83ms | 7.83ms |
| comp_1to1000 | 38.33ms | 3.86ms | 16.08ms | 17.14ms | 4.13ms | 6.18ms |
| update_1to1 | 5.65ms | 10.16ms | 27.16ms | 16.20ms | 9.10ms | 8.60ms |
| update_2to1 | 3.12ms | 2.37ms | 13.42ms | 8.02ms | 4.62ms | 4.32ms |
| update_4to1 | 1.48ms | 2.49ms | 7.42ms | 4.08ms | 2.34ms | 2.20ms |
| update_1000to1 | 14μs | 27μs | 70μs | 40μs | 25μs | 21μs |
| update_1to2 | 2.88ms | 5.05ms | 13.13ms | 8.21ms | 4.58ms | 4.63ms |
| update_1to4 | 1.47ms | 2.48ms | 6.97ms | 4.07ms | 2.25ms | 2.18ms |
| update_1to1000 | 385μs | 47μs | 176μs | 182μs | 43μs | 954μs |
| cellx1000 | 5.31ms | 7.50ms | 77.53ms | 14.39ms | 9.50ms | 9.94ms |
| cellx2500 | 23.94ms | 19.69ms | 258.38ms | 34.43ms | 32.92ms | 28.30ms |
| cellx5000 | 58.78ms | 43.34ms | 568.39ms | 83.08ms | 62.50ms | 74.91ms |
| 10x5 - 2 sources - read 20.0% (simple) | 262.48ms | 231.53ms | 2.04s | 354.02ms | 511.45ms | 439.44ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 197.85ms | 179.14ms | 1.53s | 243.13ms | 283.99ms | 270.03ms |
| 1000x12 - 4 sources - dynamic (large) | 335.04ms | 277.73ms | 1.96s | 467.25ms | 3.86s | 3.73s |
| 1000x5 - 25 sources (wide dense) | 499.48ms | 410.43ms | 3.59s | 595.01ms | 3.58s | 2.70s |
| 5x500 - 3 sources (deep) | 203.47ms | 191.72ms | 1.18s | 255.81ms | 225.50ms | 226.17ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 258.56ms | 269.01ms | 1.70s | 392.18ms | 479.44ms | 455.39ms |

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
