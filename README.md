# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.76s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 10.13s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.43s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 28.12s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.95s |
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
| avoidablePropagation | 186.11ms | 2.33s | 2.20s | 162.46ms (fail) | 204.48ms | 213.46ms |
| broadPropagation | 349.36ms | 4.34s | 5.41s | 6.21ms (fail) | 457.11ms | 454.47ms |
| deepPropagation | 121.92ms | 1.54s | 2.03s | 137.99ms (fail) | 176.68ms | 179.86ms |
| diamond | 241.09ms | 2.44s | 3.44s | 185.73ms (fail) | 282.95ms | 290.74ms |
| mux | 387.98ms | 1.90s | 2.08s | 192.72ms (fail) | 391.33ms | 411.19ms |
| repeatedObservers | 45.01ms | 235.53ms | 205.74ms | 52.40ms (fail) | 38.59ms | 46.82ms |
| triangle | 85.73ms | 790.88ms | 1.13s | 81.75ms (fail) | 98.97ms | 105.59ms |
| unstable | 59.76ms | 352.95ms | 344.63ms | 337.69ms (fail) | 70.88ms | 74.44ms |
| molBench | 490.27ms | 580.68ms | 1.71s | 1.22ms | 491.87ms | 485.81ms |
| create_signals | 28.03ms | 82.64ms | 61.90ms | 59.88ms | 4.66ms | 26.51ms |
| comp_0to1 | 8.33ms | 21.14ms | 29.31ms | 54.48ms | 17.58ms | 12.52ms |
| comp_1to1 | 4.27ms | 38.65ms | 46.93ms | 64.59ms | 11.91ms | 28.97ms |
| comp_2to1 | 2.34ms | 35.36ms | 22.07ms | 37.58ms | 22.10ms | 18.32ms |
| comp_4to1 | 7.91ms | 14.47ms | 29.54ms | 17.50ms | 9.09ms | 2.12ms |
| comp_1000to1 | 3μs | 21μs | 2.29ms | 45μs | 4μs | 5μs |
| comp_1to2 | 12.80ms | 30.33ms | 47.27ms | 48.78ms | 24.10ms | 14.49ms |
| comp_1to4 | 12.26ms | 24.49ms | 24.70ms | 48.83ms | 29.61ms | 15.53ms |
| comp_1to8 | 4.38ms | 23.94ms | 25.71ms | 44.00ms | 5.60ms | 6.86ms |
| comp_1to1000 | 3.27ms | 15.23ms | 19.12ms | 38.81ms | 6.50ms | 4.57ms |
| update_1to1 | 9.15ms | 24.96ms | 41.27ms | 5.76ms | 8.22ms | 9.27ms |
| update_2to1 | 5.28ms | 11.45ms | 20.69ms | 2.87ms | 4.05ms | 4.62ms |
| update_4to1 | 2.33ms | 6.35ms | 10.25ms | 1.43ms | 2.06ms | 2.33ms |
| update_1000to1 | 24μs | 59μs | 111μs | 15μs | 20μs | 23μs |
| update_1to2 | 4.49ms | 11.62ms | 20.89ms | 2.93ms | 4.04ms | 4.89ms |
| update_1to4 | 2.02ms | 6.19ms | 10.27ms | 1.45ms | 2.24ms | 2.33ms |
| update_1to1000 | 36μs | 168μs | 214μs | 381μs | 42μs | 45μs |
| cellx1000 | 8.07ms | 87.24ms | 193.22ms | 6.06ms | 11.18ms | 10.70ms |
| cellx2500 | 23.18ms | 285.77ms | 597.21ms | 34.09ms | 34.21ms | 39.59ms |
| cellx5000 | 57.71ms | 618.80ms | 1.27s | 99.17ms | 91.56ms | 91.40ms |
| 10x5 - 2 sources - read 20.0% (simple) | 237.41ms | 2.05s | 2.63s (partial) | 240.47ms | 444.31ms | 506.36ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 182.95ms | 1.60s | 2.42s (partial) | 201.21ms | 274.46ms | 278.48ms |
| 1000x12 - 4 sources - dynamic (large) | 293.97ms | 1.96s | 4.09s (partial) | 354.55ms | 3.58s | 3.77s |
| 1000x5 - 25 sources (wide dense) | 419.00ms | 3.64s | 4.90s (partial) | 498.06ms | 2.63s | 3.59s |
| 5x500 - 3 sources (deep) | 194.05ms | 1.22s | 2.05s (partial) | 207.45ms | 235.44ms | 231.42ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 269.65ms | 1.80s | 2.85s (partial) | 263.69ms | 459.68ms | 489.97ms |

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
