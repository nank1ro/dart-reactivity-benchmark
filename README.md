# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 4.15s |
| 🥈 | signals | 0.31 | 100.0% | 35/35 | 11.06s |
| 🥉 | preact_signals | 0.29 | 100.0% | 35/35 | 9.98s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 28.03s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.99s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.56s |

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
| Test Case | alien_signals | signals | preact_signals | solidart | state_beacon | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 200.22ms | 208.35ms | 210.54ms | 2.19s | 164.51ms (fail) | 2.32s |
| broadPropagation | 417.80ms | 460.12ms | 457.59ms | 5.48s | 6.71ms (fail) | 4.43s |
| deepPropagation | 158.05ms | 170.57ms | 176.99ms | 2.01s | 141.11ms (fail) | 1.57s |
| diamond | 270.96ms | 286.08ms | 272.59ms | 3.48s | 194.58ms (fail) | 2.48s |
| mux | 394.76ms | 413.51ms | 386.31ms | 2.06s | 194.50ms (fail) | 1.92s |
| repeatedObservers | 37.14ms | 45.19ms | 41.06ms | 209.93ms | 54.35ms (fail) | 237.72ms |
| triangle | 97.99ms | 100.41ms | 99.42ms | 1.13s | 79.77ms (fail) | 777.24ms |
| unstable | 89.28ms | 77.59ms | 69.90ms | 344.26ms | 339.20ms (fail) | 354.14ms |
| molBench | 493.62ms | 486.04ms | 483.14ms | 1.75s | 933μs | 589.05ms |
| create_signals | 21.52ms | 30.02ms | 4.67ms | 81.27ms | 74.94ms | 83.48ms |
| comp_0to1 | 4.58ms | 15.11ms | 17.39ms | 29.52ms | 53.42ms | 28.68ms |
| comp_1to1 | 17.75ms | 17.86ms | 15.77ms | 63.27ms | 53.06ms | 37.33ms |
| comp_2to1 | 12.28ms | 9.33ms | 15.98ms | 27.89ms | 36.00ms | 23.23ms |
| comp_4to1 | 16.35ms | 1.86ms | 11.13ms | 13.53ms | 18.04ms | 14.02ms |
| comp_1000to1 | 3μs | 5μs | 10μs | 2.29ms | 43μs | 15μs |
| comp_1to2 | 8.78ms | 13.80ms | 28.74ms | 32.30ms | 45.75ms | 33.78ms |
| comp_1to4 | 12.35ms | 13.78ms | 28.80ms | 30.49ms | 43.17ms | 20.96ms |
| comp_1to8 | 7.61ms | 7.84ms | 6.81ms | 24.27ms | 43.28ms | 23.83ms |
| comp_1to1000 | 3.44ms | 4.67ms | 6.02ms | 19.43ms | 40.13ms | 16.11ms |
| update_1to1 | 7.62ms | 9.35ms | 8.77ms | 43.35ms | 9.80ms | 21.45ms |
| update_2to1 | 1.97ms | 4.66ms | 4.37ms | 22.16ms | 2.88ms | 10.54ms |
| update_4to1 | 2.10ms | 2.34ms | 2.21ms | 10.73ms | 3.04ms | 7.79ms |
| update_1000to1 | 25μs | 23μs | 21μs | 115μs | 15μs | 53μs |
| update_1to2 | 4.86ms | 4.74ms | 4.36ms | 21.64ms | 4.38ms | 11.21ms |
| update_1to4 | 1.22ms | 2.33ms | 2.20ms | 10.97ms | 1.47ms | 5.38ms |
| update_1to1000 | 51μs | 48μs | 885μs | 224μs | 401μs | 163μs |
| cellx1000 | 7.72ms | 10.80ms | 9.91ms | 179.72ms | 6.21ms | 88.02ms |
| cellx2500 | 22.16ms | 37.62ms | 29.20ms | 535.84ms | 26.40ms | 272.63ms |
| cellx5000 | 55.11ms | 82.04ms | 104.80ms | 1.21s | 81.16ms | 573.72ms |
| 10x5 - 2 sources - read 20.0% (simple) | 239.42ms | 504.56ms | 435.52ms | 2.67s (partial) | 262.24ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 229.97ms | 286.06ms | 279.05ms | 2.38s (partial) | 209.06ms | 1.54s |
| 1000x12 - 4 sources - dynamic (large) | 293.31ms | 3.65s | 3.50s | 4.11s (partial) | 358.40ms | 1.90s |
| 1000x5 - 25 sources (wide dense) | 491.64ms | 3.38s | 2.58s | 4.95s (partial) | 506.83ms | 3.71s |
| 5x500 - 3 sources (deep) | 238.01ms | 233.78ms | 231.73ms | 2.05s (partial) | 237.74ms | 1.18s |
| 100x15 - 6 sources - dynamic (very dynamic) | 285.75ms | 479.93ms | 454.49ms | 2.81s (partial) | 265.73ms | 1.73s |

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
