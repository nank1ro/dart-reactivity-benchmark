# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.77s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.24s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 10.49s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.48s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.44s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.52s |

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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 214.90ms | 192.06ms | 154.19ms (fail) | 259.18ms | 202.73ms | 2.34s |
| broadPropagation | 454.96ms | 349.93ms | 6.54ms (fail) | 485.49ms | 458.14ms | 4.38s |
| deepPropagation | 180.69ms | 126.07ms | 139.64ms (fail) | 166.41ms | 178.95ms | 1.53s |
| diamond | 281.73ms | 236.14ms | 196.08ms (fail) | 343.62ms | 279.06ms | 2.41s |
| mux | 407.86ms | 382.64ms | 192.54ms (fail) | 428.26ms | 393.86ms | 1.81s |
| repeatedObservers | 46.17ms | 43.63ms | 53.36ms (fail) | 80.71ms | 40.17ms | 237.51ms |
| triangle | 100.55ms | 86.10ms | 78.23ms (fail) | 112.25ms | 102.02ms | 792.10ms |
| unstable | 75.77ms | 60.38ms | 341.86ms (fail) | 97.17ms | 74.27ms | 341.63ms |
| molBench | 488.22ms | 492.05ms | 936μs | 500.89ms | 485.50ms | 584.47ms |
| create_signals | 26.80ms | 28.69ms | 67.06ms | 79.28ms | 5.40ms | 82.11ms |
| comp_0to1 | 13.33ms | 8.53ms | 58.91ms | 24.77ms | 18.06ms | 38.50ms |
| comp_1to1 | 28.52ms | 4.13ms | 57.15ms | 48.63ms | 10.91ms | 17.73ms |
| comp_2to1 | 13.41ms | 2.27ms | 44.95ms | 23.91ms | 11.64ms | 21.07ms |
| comp_4to1 | 3.69ms | 10.18ms | 16.89ms | 15.08ms | 11.91ms | 25.63ms |
| comp_1000to1 | 5μs | 5μs | 44μs | 18μs | 4μs | 35μs |
| comp_1to2 | 13.13ms | 12.27ms | 47.58ms | 37.61ms | 27.11ms | 31.09ms |
| comp_1to4 | 22.96ms | 13.47ms | 46.27ms | 20.45ms | 23.82ms | 28.23ms |
| comp_1to8 | 6.56ms | 4.91ms | 45.83ms | 19.60ms | 13.40ms | 24.61ms |
| comp_1to1000 | 5.49ms | 3.46ms | 41.10ms | 14.00ms | 5.22ms | 15.60ms |
| update_1to1 | 11.88ms | 10.01ms | 6.00ms | 19.56ms | 8.29ms | 25.11ms |
| update_2to1 | 5.37ms | 2.24ms | 3.09ms | 8.05ms | 4.34ms | 10.86ms |
| update_4to1 | 2.97ms | 2.49ms | 1.50ms | 4.09ms | 2.12ms | 6.76ms |
| update_1000to1 | 31μs | 18μs | 15μs | 40μs | 20μs | 68μs |
| update_1to2 | 5.14ms | 4.96ms | 3.02ms | 8.53ms | 4.08ms | 10.81ms |
| update_1to4 | 2.98ms | 2.54ms | 1.51ms | 4.10ms | 2.12ms | 6.93ms |
| update_1to1000 | 60μs | 37μs | 407μs | 150μs | 43μs | 173μs |
| cellx1000 | 11.57ms | 8.65ms | 5.38ms | 11.97ms | 9.73ms | 74.60ms |
| cellx2500 | 33.23ms | 19.98ms | 26.45ms | 34.50ms | 37.06ms | 250.21ms |
| cellx5000 | 75.56ms | 54.53ms | 84.57ms | 78.89ms | 97.26ms | 537.48ms |
| 10x5 - 2 sources - read 20.0% (simple) | 509.89ms | 269.60ms | 238.68ms | 349.62ms | 515.98ms | 2.07s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 288.11ms | 180.41ms | 197.59ms | 247.33ms | 296.20ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 3.78s | 297.05ms | 371.79ms | 463.05ms | 3.71s | 1.89s |
| 1000x5 - 25 sources (wide dense) | 3.65s | 409.09ms | 517.62ms | 612.05ms | 2.75s | 3.48s |
| 5x500 - 3 sources (deep) | 223.41ms | 192.64ms | 208.33ms | 253.61ms | 240.73ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 487.58ms | 263.08ms | 264.55ms | 388.90ms | 473.40ms | 1.71s |

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
