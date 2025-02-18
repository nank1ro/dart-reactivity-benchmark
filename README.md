# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.70s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 9.95s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.33s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.65s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.21s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.49s |

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
| Test Case | alien_signals | mobx | solidart | state_beacon | preact_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 185.59ms | 2.34s | 2.15s | 152.43ms (fail) | 206.65ms | 218.26ms |
| broadPropagation | 357.54ms | 4.38s | 5.36s | 6.09ms (fail) | 474.07ms | 460.61ms |
| deepPropagation | 119.69ms | 1.54s | 2.01s | 139.69ms (fail) | 176.32ms | 168.93ms |
| diamond | 231.40ms | 2.46s | 3.33s | 185.53ms (fail) | 282.80ms | 291.45ms |
| mux | 388.86ms | 1.85s | 1.99s | 192.38ms (fail) | 384.16ms | 414.78ms |
| repeatedObservers | 45.73ms | 240.72ms | 202.55ms | 52.32ms (fail) | 38.68ms | 46.90ms |
| triangle | 85.10ms | 792.03ms | 1.12s | 78.71ms (fail) | 99.11ms | 103.77ms |
| unstable | 60.95ms | 362.09ms | 334.31ms | 336.94ms (fail) | 70.89ms | 73.66ms |
| molBench | 493.39ms | 586.30ms | 1.70s | 1.02ms | 491.08ms | 489.01ms |
| create_signals | 27.27ms | 58.27ms | 83.52ms | 69.92ms | 4.82ms | 26.66ms |
| comp_0to1 | 8.67ms | 18.74ms | 33.37ms | 63.46ms | 17.76ms | 12.27ms |
| comp_1to1 | 4.46ms | 27.34ms | 52.99ms | 62.13ms | 13.94ms | 28.05ms |
| comp_2to1 | 2.47ms | 9.00ms | 20.86ms | 40.47ms | 20.95ms | 11.72ms |
| comp_4to1 | 8.78ms | 24.72ms | 11.75ms | 19.48ms | 19.83ms | 3.53ms |
| comp_1000to1 | 3μs | 20μs | 2.86ms | 45μs | 5μs | 6μs |
| comp_1to2 | 11.24ms | 37.38ms | 28.11ms | 51.50ms | 12.69ms | 17.71ms |
| comp_1to4 | 16.17ms | 24.64ms | 30.33ms | 47.70ms | 24.16ms | 13.68ms |
| comp_1to8 | 4.31ms | 24.28ms | 26.34ms | 49.28ms | 5.64ms | 7.99ms |
| comp_1to1000 | 3.36ms | 15.29ms | 18.12ms | 42.15ms | 4.31ms | 4.56ms |
| update_1to1 | 9.90ms | 25.38ms | 41.01ms | 5.73ms | 8.11ms | 8.97ms |
| update_2to1 | 5.03ms | 12.37ms | 20.52ms | 2.87ms | 4.05ms | 4.38ms |
| update_4to1 | 2.15ms | 6.81ms | 10.31ms | 1.47ms | 2.06ms | 2.23ms |
| update_1000to1 | 24μs | 59μs | 123μs | 15μs | 20μs | 23μs |
| update_1to2 | 4.66ms | 12.38ms | 20.97ms | 3.06ms | 4.07ms | 4.46ms |
| update_1to4 | 1.07ms | 6.01ms | 10.40ms | 1.92ms | 2.06ms | 2.28ms |
| update_1to1000 | 37μs | 171μs | 205μs | 420μs | 49μs | 45μs |
| cellx1000 | 7.46ms | 72.89ms | 186.95ms | 5.14ms | 9.55ms | 9.69ms |
| cellx2500 | 19.88ms | 253.28ms | 559.14ms | 21.92ms | 27.94ms | 38.13ms |
| cellx5000 | 43.31ms | 571.03ms | 1.20s | 53.44ms | 92.13ms | 88.78ms |
| 10x5 - 2 sources - read 20.0% (simple) | 229.12ms | 2.03s | 2.58s (partial) | 269.65ms | 440.38ms | 510.30ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 184.06ms | 1.56s | 2.38s (partial) | 215.65ms | 277.66ms | 277.89ms |
| 1000x12 - 4 sources - dynamic (large) | 275.53ms | 1.84s | 4.06s (partial) | 345.26ms | 3.48s | 3.79s |
| 1000x5 - 25 sources (wide dense) | 404.80ms | 3.57s | 4.87s (partial) | 506.89ms | 2.58s | 3.49s |
| 5x500 - 3 sources (deep) | 190.56ms | 1.18s | 2.00s (partial) | 205.57ms | 237.26ms | 227.96ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 263.15ms | 1.73s | 2.77s (partial) | 259.48ms | 441.85ms | 483.23ms |

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
