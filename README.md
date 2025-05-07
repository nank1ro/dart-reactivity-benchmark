# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.30s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.22s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.16s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.41s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.47s |

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
| Test Case | solidart(2.0-dev) | preact_signals | alien_signals | state_beacon | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 276.55ms | 205.26ms | 185.84ms | 154.90ms (fail) | 2.32s | 207.92ms |
| broadPropagation | 506.64ms | 451.22ms | 360.01ms | 6.33ms (fail) | 4.24s | 457.57ms |
| deepPropagation | 176.09ms | 178.74ms | 124.70ms | 141.37ms (fail) | 1.51s | 173.50ms |
| diamond | 356.90ms | 280.61ms | 235.69ms | 202.05ms (fail) | 2.38s | 288.33ms |
| mux | 437.17ms | 387.20ms | 371.52ms | 193.04ms (fail) | 1.81s | 412.11ms |
| repeatedObservers | 79.27ms | 38.39ms | 46.79ms | 52.26ms (fail) | 229.24ms | 45.38ms |
| triangle | 118.34ms | 100.90ms | 88.42ms | 83.49ms (fail) | 760.94ms | 100.32ms |
| unstable | 93.54ms | 70.54ms | 62.92ms | 337.18ms (fail) | 350.52ms | 72.17ms |
| molBench | 492.63ms | 491.67ms | 492.27ms | 1.31ms | 580.72ms | 490.73ms |
| create_signals | 55.88ms | 5.29ms | 28.09ms | 67.74ms | 80.91ms | 25.29ms |
| comp_0to1 | 26.95ms | 18.24ms | 10.35ms | 54.06ms | 23.08ms | 13.79ms |
| comp_1to1 | 35.54ms | 11.99ms | 4.17ms | 61.44ms | 17.14ms | 28.42ms |
| comp_2to1 | 46.96ms | 12.02ms | 2.34ms | 37.43ms | 24.25ms | 9.10ms |
| comp_4to1 | 4.67ms | 14.11ms | 7.73ms | 16.48ms | 15.05ms | 1.99ms |
| comp_1000to1 | 25μs | 5μs | 3μs | 42μs | 15μs | 5μs |
| comp_1to2 | 35.13ms | 24.59ms | 10.92ms | 45.35ms | 33.95ms | 20.27ms |
| comp_1to4 | 21.52ms | 22.44ms | 13.99ms | 44.40ms | 23.78ms | 9.55ms |
| comp_1to8 | 24.51ms | 9.32ms | 4.14ms | 43.39ms | 23.57ms | 8.79ms |
| comp_1to1000 | 15.60ms | 9.20ms | 3.18ms | 39.04ms | 15.02ms | 6.71ms |
| update_1to1 | 16.20ms | 8.35ms | 10.31ms | 5.73ms | 22.77ms | 9.25ms |
| update_2to1 | 7.93ms | 4.19ms | 5.04ms | 2.90ms | 11.22ms | 4.65ms |
| update_4to1 | 4.03ms | 2.09ms | 2.79ms | 1.47ms | 5.92ms | 2.29ms |
| update_1000to1 | 40μs | 20μs | 10μs | 15μs | 66μs | 23μs |
| update_1to2 | 8.12ms | 4.06ms | 5.62ms | 2.94ms | 10.53ms | 4.90ms |
| update_1to4 | 4.03ms | 2.06ms | 2.46ms | 1.49ms | 5.36ms | 2.33ms |
| update_1to1000 | 153μs | 3.12ms | 48μs | 381μs | 169μs | 44μs |
| cellx1000 | 12.26ms | 11.16ms | 7.51ms | 5.39ms | 70.00ms | 9.83ms |
| cellx2500 | 34.26ms | 37.32ms | 20.54ms | 23.61ms | 243.58ms | 31.71ms |
| cellx5000 | 79.56ms | 110.92ms | 45.38ms | 70.26ms | 575.63ms | 72.08ms |
| 10x5 - 2 sources - read 20.0% (simple) | 352.15ms | 457.75ms | 234.11ms | 251.48ms | 2.00s | 505.68ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 243.93ms | 270.88ms | 178.24ms | 204.40ms | 1.53s | 283.91ms |
| 1000x12 - 4 sources - dynamic (large) | 489.17ms | 3.62s | 282.33ms | 360.03ms | 1.93s | 3.80s |
| 1000x5 - 25 sources (wide dense) | 605.09ms | 2.61s | 412.63ms | 493.52ms | 3.67s | 3.43s |
| 5x500 - 3 sources (deep) | 254.57ms | 233.14ms | 190.26ms | 205.93ms | 1.14s | 227.32ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 385.89ms | 449.54ms | 266.20ms | 263.29ms | 1.77s | 474.67ms |

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
