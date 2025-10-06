# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.25s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.39s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 11.64s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.54s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.50s |

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
| avoidablePropagation | 210.17ms | 189.80ms | 146.63ms (fail) | 265.84ms | 201.61ms | 2.40s |
| broadPropagation | 462.90ms | 346.83ms | 6.83ms (fail) | 500.56ms | 473.04ms | 4.39s |
| deepPropagation | 180.65ms | 130.16ms | 141.12ms (fail) | 163.52ms | 180.01ms | 1.55s |
| diamond | 289.44ms | 237.43ms | 185.21ms (fail) | 352.19ms | 280.11ms | 2.42s |
| mux | 409.03ms | 385.11ms | 190.36ms (fail) | 428.54ms | 396.54ms | 1.84s |
| repeatedObservers | 46.29ms | 43.71ms | 53.07ms (fail) | 80.76ms | 40.51ms | 234.23ms |
| triangle | 103.54ms | 84.77ms | 78.11ms (fail) | 114.34ms | 98.30ms | 782.35ms |
| unstable | 76.38ms | 62.36ms | 377.00ms (fail) | 94.21ms | 74.73ms | 342.32ms |
| molBench | 485.09ms | 489.60ms | 981μs | 494.65ms | 484.40ms | 585.43ms |
| create_signals | 26.33ms | 27.74ms | 65.67ms | 57.94ms | 5.24ms | 52.89ms |
| comp_0to1 | 12.09ms | 8.90ms | 58.46ms | 25.11ms | 17.93ms | 19.48ms |
| comp_1to1 | 27.88ms | 8.84ms | 57.24ms | 42.24ms | 13.69ms | 29.13ms |
| comp_2to1 | 13.82ms | 4.35ms | 38.20ms | 28.44ms | 13.43ms | 15.13ms |
| comp_4to1 | 2.07ms | 15.20ms | 16.61ms | 8.96ms | 13.73ms | 14.84ms |
| comp_1000to1 | 5μs | 5μs | 44μs | 19μs | 4μs | 22μs |
| comp_1to2 | 18.02ms | 9.52ms | 47.77ms | 39.05ms | 18.67ms | 37.65ms |
| comp_1to4 | 9.55ms | 11.05ms | 45.72ms | 22.45ms | 41.17ms | 24.20ms |
| comp_1to8 | 7.09ms | 5.74ms | 45.15ms | 23.84ms | 8.47ms | 26.69ms |
| comp_1to1000 | 4.41ms | 3.04ms | 40.97ms | 14.25ms | 6.12ms | 15.62ms |
| update_1to1 | 10.27ms | 10.16ms | 6.00ms | 15.94ms | 8.46ms | 26.75ms |
| update_2to1 | 4.89ms | 2.23ms | 3.12ms | 8.95ms | 4.37ms | 12.88ms |
| update_4to1 | 2.55ms | 2.47ms | 1.58ms | 4.03ms | 2.10ms | 7.60ms |
| update_1000to1 | 25μs | 20μs | 15μs | 54μs | 20μs | 73μs |
| update_1to2 | 4.53ms | 4.96ms | 3.08ms | 7.97ms | 4.07ms | 13.47ms |
| update_1to4 | 2.52ms | 2.42ms | 1.55ms | 3.98ms | 2.09ms | 5.76ms |
| update_1to1000 | 43μs | 46μs | 408μs | 160μs | 174μs | 182μs |
| cellx1000 | 9.93ms | 7.42ms | 5.40ms | 11.80ms | 10.81ms | 93.58ms |
| cellx2500 | 36.31ms | 19.94ms | 27.20ms | 33.38ms | 31.56ms | 285.19ms |
| cellx5000 | 76.57ms | 45.12ms | 87.45ms | 89.77ms | 92.36ms | 613.71ms |
| 10x5 - 2 sources - read 20.0% (simple) | 521.38ms | 240.72ms | 245.49ms | 360.57ms | 441.34ms | 2.00s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 281.64ms | 182.12ms | 196.88ms | 249.41ms | 277.13ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 4.02s | 287.65ms | 351.13ms | 465.66ms | 3.74s | 1.87s |
| 1000x5 - 25 sources (wide dense) | 3.59s | 413.76ms | 513.43ms | 601.34ms | 2.73s | 3.47s |
| 5x500 - 3 sources (deep) | 225.14ms | 196.93ms | 205.39ms | 255.51ms | 227.87ms | 1.15s |
| 100x15 - 6 sources - dynamic (very dynamic) | 471.34ms | 264.95ms | 258.85ms | 383.01ms | 458.86ms | 1.69s |

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
