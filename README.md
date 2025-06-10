# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.30s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.18s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.28s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.08s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.48s |

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
| avoidablePropagation | 160.37ms (fail) | 182.52ms | 2.33s | 275.45ms | 206.06ms | 198.59ms |
| broadPropagation | 6.61ms (fail) | 346.32ms | 4.49s | 507.98ms | 460.79ms | 447.57ms |
| deepPropagation | 143.35ms (fail) | 124.30ms | 1.59s | 164.98ms | 164.89ms | 176.86ms |
| diamond | 197.26ms (fail) | 231.54ms | 2.46s | 353.52ms | 281.24ms | 280.42ms |
| mux | 192.66ms (fail) | 367.20ms | 1.89s | 441.04ms | 409.10ms | 401.10ms |
| repeatedObservers | 55.56ms (fail) | 45.50ms | 238.25ms | 81.64ms | 45.19ms | 40.21ms |
| triangle | 83.36ms (fail) | 85.01ms | 779.74ms | 118.37ms | 101.11ms | 99.93ms |
| unstable | 340.77ms (fail) | 66.91ms | 355.89ms | 97.92ms | 80.03ms | 69.89ms |
| molBench | 914μs | 484.16ms | 572.22ms | 494.04ms | 485.37ms | 486.85ms |
| create_signals | 61.25ms | 27.77ms | 81.40ms | 77.09ms | 25.31ms | 4.47ms |
| comp_0to1 | 54.33ms | 6.84ms | 16.53ms | 28.25ms | 11.76ms | 17.40ms |
| comp_1to1 | 55.59ms | 4.21ms | 46.48ms | 39.81ms | 35.56ms | 13.60ms |
| comp_2to1 | 37.30ms | 2.35ms | 28.70ms | 25.67ms | 17.26ms | 16.82ms |
| comp_4to1 | 16.20ms | 8.42ms | 28.55ms | 13.03ms | 2.02ms | 12.01ms |
| comp_1000to1 | 41μs | 4μs | 17μs | 21μs | 5μs | 9μs |
| comp_1to2 | 45.35ms | 16.14ms | 35.28ms | 37.41ms | 21.01ms | 19.57ms |
| comp_1to4 | 44.19ms | 8.77ms | 18.48ms | 22.46ms | 23.73ms | 32.55ms |
| comp_1to8 | 43.18ms | 6.51ms | 20.78ms | 24.74ms | 6.15ms | 5.49ms |
| comp_1to1000 | 39.90ms | 3.23ms | 16.08ms | 16.85ms | 5.25ms | 5.79ms |
| update_1to1 | 5.65ms | 10.20ms | 25.72ms | 16.18ms | 8.85ms | 8.59ms |
| update_2to1 | 3.63ms | 2.36ms | 12.20ms | 8.05ms | 4.47ms | 4.33ms |
| update_4to1 | 1.46ms | 2.53ms | 6.63ms | 4.07ms | 2.21ms | 2.14ms |
| update_1000to1 | 14μs | 24μs | 68μs | 40μs | 22μs | 21μs |
| update_1to2 | 2.84ms | 5.09ms | 11.97ms | 8.18ms | 4.47ms | 4.65ms |
| update_1to4 | 1.47ms | 2.48ms | 6.59ms | 4.10ms | 2.21ms | 2.16ms |
| update_1to1000 | 392μs | 44μs | 173μs | 171μs | 43μs | 1.05ms |
| cellx1000 | 5.88ms | 7.15ms | 75.52ms | 12.21ms | 10.07ms | 9.80ms |
| cellx2500 | 26.26ms | 19.64ms | 262.67ms | 37.15ms | 30.00ms | 26.46ms |
| cellx5000 | 53.23ms | 44.62ms | 541.26ms | 87.96ms | 77.01ms | 76.85ms |
| 10x5 - 2 sources - read 20.0% (simple) | 268.82ms | 234.95ms | 2.07s | 352.10ms | 510.50ms | 438.15ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 202.89ms | 182.72ms | 1.59s | 245.29ms | 280.45ms | 273.07ms |
| 1000x12 - 4 sources - dynamic (large) | 345.88ms | 280.84ms | 1.95s | 471.61ms | 3.73s | 3.72s |
| 1000x5 - 25 sources (wide dense) | 516.58ms | 411.43ms | 3.63s | 591.05ms | 3.44s | 2.70s |
| 5x500 - 3 sources (deep) | 204.67ms | 189.55ms | 1.19s | 251.18ms | 223.92ms | 227.59ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 261.81ms | 263.04ms | 1.72s | 392.38ms | 481.27ms | 457.08ms |

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
