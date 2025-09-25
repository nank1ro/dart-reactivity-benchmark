# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.31 | 100.0% | 35/35 | 5.23s |
| 🥉 | preact_signals | 0.29 | 100.0% | 35/35 | 10.27s |
| 4 | signals | 0.28 | 100.0% | 35/35 | 11.14s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.74s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.66s |

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
| avoidablePropagation | 210.74ms | 194.32ms | 150.93ms (fail) | 259.65ms | 203.16ms | 2.35s |
| broadPropagation | 461.14ms | 351.78ms | 6.55ms (fail) | 493.71ms | 463.30ms | 4.39s |
| deepPropagation | 170.09ms | 122.62ms | 143.45ms (fail) | 167.16ms | 179.56ms | 1.53s |
| diamond | 281.16ms | 231.47ms | 186.37ms (fail) | 354.25ms | 280.61ms | 2.41s |
| mux | 410.90ms | 375.73ms | 194.11ms (fail) | 424.89ms | 390.77ms | 1.85s |
| repeatedObservers | 46.14ms | 43.77ms | 53.25ms (fail) | 84.63ms | 40.28ms | 233.27ms |
| triangle | 102.22ms | 85.53ms | 80.79ms (fail) | 113.34ms | 99.71ms | 772.05ms |
| unstable | 79.61ms | 59.75ms | 377.39ms (fail) | 96.49ms | 74.71ms | 342.99ms |
| molBench | 484.89ms | 489.09ms | 1.38ms | 496.42ms | 488.35ms | 584.78ms |
| create_signals | 25.75ms | 22.50ms | 62.52ms | 90.55ms | 4.74ms | 60.84ms |
| comp_0to1 | 11.54ms | 8.22ms | 57.75ms | 35.95ms | 17.59ms | 19.29ms |
| comp_1to1 | 28.95ms | 4.14ms | 59.96ms | 46.21ms | 15.08ms | 35.08ms |
| comp_2to1 | 10.56ms | 2.26ms | 40.16ms | 23.39ms | 16.23ms | 18.43ms |
| comp_4to1 | 6.88ms | 8.46ms | 17.73ms | 13.53ms | 12.40ms | 31.60ms |
| comp_1000to1 | 5μs | 6μs | 46μs | 16μs | 5μs | 16μs |
| comp_1to2 | 21.67ms | 19.10ms | 49.66ms | 31.94ms | 14.26ms | 36.43ms |
| comp_1to4 | 20.10ms | 6.36ms | 47.87ms | 14.58ms | 20.53ms | 27.08ms |
| comp_1to8 | 6.63ms | 6.90ms | 47.09ms | 19.15ms | 6.37ms | 26.41ms |
| comp_1to1000 | 4.37ms | 3.35ms | 42.61ms | 17.80ms | 6.88ms | 16.12ms |
| update_1to1 | 10.17ms | 10.14ms | 7.61ms | 16.42ms | 8.27ms | 24.19ms |
| update_2to1 | 4.61ms | 2.20ms | 3.96ms | 8.00ms | 4.53ms | 11.70ms |
| update_4to1 | 2.55ms | 2.54ms | 1.94ms | 4.08ms | 2.12ms | 5.98ms |
| update_1000to1 | 26μs | 17μs | 17μs | 39μs | 20μs | 55μs |
| update_1to2 | 4.58ms | 4.59ms | 3.78ms | 8.34ms | 4.15ms | 11.75ms |
| update_1to4 | 2.59ms | 2.39ms | 1.94ms | 4.09ms | 2.10ms | 5.87ms |
| update_1to1000 | 43μs | 46μs | 419μs | 147μs | 506μs | 167μs |
| cellx1000 | 9.80ms | 7.06ms | 7.21ms | 13.47ms | 9.56ms | 93.85ms |
| cellx2500 | 33.19ms | 19.27ms | 31.41ms | 31.79ms | 25.88ms | 297.94ms |
| cellx5000 | 69.94ms | 43.58ms | 94.34ms | 68.41ms | 72.48ms | 625.41ms |
| 10x5 - 2 sources - read 20.0% (simple) | 500.79ms | 248.79ms | 236.81ms | 350.95ms | 453.09ms | 2.03s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 277.82ms | 180.38ms | 208.76ms | 247.28ms | 274.06ms | 1.54s |
| 1000x12 - 4 sources - dynamic (large) | 3.74s | 288.94ms | 387.54ms | 452.00ms | 3.68s | 1.93s |
| 1000x5 - 25 sources (wide dense) | 3.42s | 405.00ms | 572.45ms | 601.92ms | 2.71s | 3.49s |
| 5x500 - 3 sources (deep) | 219.91ms | 195.44ms | 206.57ms | 252.67ms | 238.35ms | 1.18s |
| 100x15 - 6 sources - dynamic (very dynamic) | 467.07ms | 263.37ms | 274.57ms | 381.76ms | 455.29ms | 1.76s |

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
