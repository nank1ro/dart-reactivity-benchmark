# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.78s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.47s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.45s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.52s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.18s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.54s |

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
| avoidablePropagation | 212.65ms | 193.21ms | 162.53ms (fail) | 271.43ms | 201.51ms | 2.35s |
| broadPropagation | 456.55ms | 357.59ms | 6.34ms (fail) | 497.50ms | 456.00ms | 4.43s |
| deepPropagation | 172.88ms | 133.13ms | 141.34ms (fail) | 161.19ms | 177.03ms | 1.54s |
| diamond | 284.31ms | 238.18ms | 186.28ms (fail) | 350.08ms | 280.63ms | 2.42s |
| mux | 413.27ms | 382.63ms | 197.68ms (fail) | 442.05ms | 389.09ms | 1.90s |
| repeatedObservers | 47.23ms | 43.86ms | 52.02ms (fail) | 81.89ms | 40.04ms | 235.20ms |
| triangle | 101.19ms | 85.80ms | 79.36ms (fail) | 113.45ms | 99.15ms | 784.90ms |
| unstable | 77.39ms | 61.62ms | 338.20ms (fail) | 95.04ms | 75.13ms | 342.69ms |
| molBench | 486.77ms | 490.94ms | 952μs | 500.13ms | 487.31ms | 584.25ms |
| create_signals | 28.61ms | 27.09ms | 64.16ms | 57.91ms | 14.78ms | 62.53ms |
| comp_0to1 | 12.73ms | 8.34ms | 58.06ms | 27.12ms | 21.54ms | 16.09ms |
| comp_1to1 | 29.12ms | 4.47ms | 59.03ms | 46.16ms | 7.80ms | 42.65ms |
| comp_2to1 | 9.81ms | 2.58ms | 39.73ms | 44.38ms | 12.21ms | 36.38ms |
| comp_4to1 | 2.36ms | 9.15ms | 17.81ms | 4.47ms | 9.87ms | 16.22ms |
| comp_1000to1 | 5μs | 5μs | 45μs | 20μs | 9μs | 20μs |
| comp_1to2 | 24.52ms | 12.29ms | 48.32ms | 34.16ms | 22.13ms | 41.85ms |
| comp_1to4 | 10.02ms | 13.17ms | 46.24ms | 22.03ms | 33.27ms | 22.09ms |
| comp_1to8 | 9.97ms | 5.28ms | 45.92ms | 25.40ms | 8.36ms | 24.84ms |
| comp_1to1000 | 10.85ms | 3.86ms | 41.29ms | 15.03ms | 7.78ms | 15.66ms |
| update_1to1 | 10.31ms | 9.63ms | 6.01ms | 17.48ms | 8.39ms | 25.24ms |
| update_2to1 | 4.57ms | 2.21ms | 3.11ms | 8.53ms | 4.48ms | 12.99ms |
| update_4to1 | 2.56ms | 2.46ms | 1.55ms | 4.38ms | 2.11ms | 6.38ms |
| update_1000to1 | 26μs | 26μs | 15μs | 42μs | 20μs | 67μs |
| update_1to2 | 4.55ms | 4.93ms | 3.04ms | 8.93ms | 4.11ms | 11.96ms |
| update_1to4 | 2.58ms | 2.39ms | 1.55ms | 4.37ms | 2.17ms | 6.13ms |
| update_1to1000 | 45μs | 48μs | 406μs | 156μs | 885μs | 173μs |
| cellx1000 | 11.24ms | 7.61ms | 7.00ms | 15.64ms | 11.30ms | 105.72ms |
| cellx2500 | 51.03ms | 25.02ms | 40.19ms | 61.63ms | 45.43ms | 325.55ms |
| cellx5000 | 133.41ms | 74.59ms | 107.25ms | 206.66ms | 127.73ms | 712.00ms |
| 10x5 - 2 sources - read 20.0% (simple) | 515.38ms | 235.47ms | 234.62ms | 356.38ms | 447.05ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 283.05ms | 180.06ms | 197.28ms | 251.43ms | 277.52ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 3.88s | 289.28ms | 359.86ms | 476.68ms | 3.77s | 1.97s |
| 1000x5 - 25 sources (wide dense) | 3.45s | 407.77ms | 517.77ms | 616.94ms | 2.78s | 3.56s |
| 5x500 - 3 sources (deep) | 229.22ms | 192.07ms | 208.83ms | 260.67ms | 232.17ms | 1.22s |
| 100x15 - 6 sources - dynamic (very dynamic) | 477.71ms | 269.15ms | 265.28ms | 394.72ms | 465.07ms | 1.79s |

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
