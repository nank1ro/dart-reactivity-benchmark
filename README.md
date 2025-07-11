# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.66s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.24s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.34s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.35s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.85s |
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
| Test Case | solidart(2.0-dev) | state_beacon | preact_signals | signals | mobx | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 273.65ms | 166.98ms (fail) | 201.56ms | 210.69ms | 2.37s | 184.97ms |
| broadPropagation | 511.09ms | 6.28ms (fail) | 501.84ms | 448.01ms | 4.42s | 343.06ms |
| deepPropagation | 172.62ms | 145.03ms (fail) | 178.34ms | 177.03ms | 1.55s | 123.89ms |
| diamond | 348.76ms | 191.83ms (fail) | 295.59ms | 278.13ms | 2.43s | 229.51ms |
| mux | 447.13ms | 195.31ms (fail) | 408.38ms | 446.53ms | 1.82s | 364.94ms |
| repeatedObservers | 80.78ms | 54.73ms (fail) | 41.19ms | 44.90ms | 235.71ms | 45.34ms |
| triangle | 121.11ms | 76.34ms (fail) | 100.66ms | 101.22ms | 788.57ms | 83.96ms |
| unstable | 98.17ms | 334.69ms (fail) | 72.72ms | 79.21ms | 357.82ms | 66.72ms |
| molBench | 493.95ms | 912μs | 490.38ms | 485.99ms | 571.10ms | 487.10ms |
| create_signals | 54.48ms | 73.11ms | 5.30ms | 25.85ms | 83.24ms | 29.51ms |
| comp_0to1 | 27.28ms | 61.48ms | 17.65ms | 11.56ms | 45.97ms | 7.72ms |
| comp_1to1 | 45.22ms | 70.16ms | 12.75ms | 27.92ms | 18.44ms | 4.16ms |
| comp_2to1 | 54.41ms | 39.83ms | 17.09ms | 11.34ms | 12.81ms | 2.34ms |
| comp_4to1 | 17.78ms | 18.22ms | 14.46ms | 1.93ms | 28.61ms | 7.71ms |
| comp_1000to1 | 17μs | 70μs | 5μs | 4μs | 18μs | 3μs |
| comp_1to2 | 29.87ms | 54.29ms | 18.25ms | 22.94ms | 36.28ms | 14.95ms |
| comp_1to4 | 25.81ms | 51.63ms | 27.02ms | 11.12ms | 22.90ms | 8.75ms |
| comp_1to8 | 26.86ms | 50.94ms | 7.49ms | 7.60ms | 25.36ms | 3.82ms |
| comp_1to1000 | 17.22ms | 46.89ms | 5.20ms | 4.24ms | 16.12ms | 5.81ms |
| update_1to1 | 16.25ms | 5.64ms | 13.58ms | 8.97ms | 23.61ms | 8.00ms |
| update_2to1 | 7.86ms | 3.10ms | 5.59ms | 4.49ms | 13.16ms | 2.74ms |
| update_4to1 | 4.05ms | 1.43ms | 2.89ms | 2.24ms | 6.62ms | 2.58ms |
| update_1000to1 | 41μs | 15μs | 51μs | 22μs | 73μs | 25μs |
| update_1to2 | 8.03ms | 2.82ms | 5.80ms | 4.49ms | 11.19ms | 5.13ms |
| update_1to4 | 4.06ms | 1.42ms | 2.67ms | 2.23ms | 5.58ms | 2.47ms |
| update_1to1000 | 171μs | 476μs | 290μs | 43μs | 173μs | 45μs |
| cellx1000 | 12.72ms | 5.29ms | 11.98ms | 9.77ms | 69.09ms | 7.43ms |
| cellx2500 | 38.01ms | 28.94ms | 25.52ms | 31.77ms | 244.63ms | 19.52ms |
| cellx5000 | 78.39ms | 53.43ms | 69.58ms | 61.11ms | 537.74ms | 44.38ms |
| 10x5 - 2 sources - read 20.0% (simple) | 364.74ms | 249.45ms | 437.16ms | 510.88ms | 2.01s | 231.46ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 249.36ms | 197.87ms | 269.12ms | 281.98ms | 1.56s | 180.36ms |
| 1000x12 - 4 sources - dynamic (large) | 473.24ms | 326.09ms | 3.71s | 3.76s | 2.09s | 279.47ms |
| 1000x5 - 25 sources (wide dense) | 598.12ms | 492.97ms | 2.71s | 3.44s | 3.57s | 404.95ms |
| 5x500 - 3 sources (deep) | 259.19ms | 202.59ms | 227.30ms | 225.24ms | 1.16s | 192.14ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 381.97ms | 252.47ms | 451.68ms | 493.38ms | 1.72s | 263.77ms |

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
