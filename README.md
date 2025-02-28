# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.26s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 10.03s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.20s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.64s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.43s |

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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 269.93ms | 205.33ms | 2.31s | 185.77ms | 206.46ms | 149.34ms (fail) |
| broadPropagation | 511.75ms | 462.40ms | 4.29s | 360.11ms | 468.20ms | 6.09ms (fail) |
| deepPropagation | 166.64ms | 177.00ms | 1.52s | 124.56ms | 179.06ms | 144.70ms (fail) |
| diamond | 348.20ms | 285.47ms | 2.41s | 236.64ms | 295.03ms | 182.15ms (fail) |
| mux | 439.76ms | 387.45ms | 1.84s | 375.42ms | 419.01ms | 191.10ms (fail) |
| repeatedObservers | 79.70ms | 38.59ms | 230.76ms | 44.97ms | 46.76ms | 52.30ms (fail) |
| triangle | 117.32ms | 99.59ms | 769.58ms | 85.67ms | 104.27ms | 77.20ms (fail) |
| unstable | 94.11ms | 71.29ms | 346.71ms | 60.84ms | 74.14ms | 347.21ms (fail) |
| molBench | 492.80ms | 491.55ms | 578.25ms | 491.69ms | 486.62ms | 1.07ms |
| create_signals | 74.30ms | 4.73ms | 69.41ms | 31.40ms | 26.22ms | 64.50ms |
| comp_0to1 | 26.01ms | 17.59ms | 26.29ms | 7.11ms | 11.59ms | 61.86ms |
| comp_1to1 | 27.62ms | 11.24ms | 41.50ms | 4.23ms | 18.80ms | 53.63ms |
| comp_2to1 | 31.17ms | 17.78ms | 22.28ms | 2.28ms | 17.58ms | 36.34ms |
| comp_4to1 | 4.72ms | 14.74ms | 27.23ms | 8.85ms | 7.49ms | 16.29ms |
| comp_1000to1 | 15μs | 4μs | 17μs | 5μs | 10μs | 40μs |
| comp_1to2 | 32.81ms | 17.96ms | 35.63ms | 13.63ms | 21.79ms | 45.31ms |
| comp_1to4 | 15.17ms | 37.46ms | 23.21ms | 9.22ms | 7.56ms | 43.43ms |
| comp_1to8 | 21.05ms | 7.50ms | 22.43ms | 5.36ms | 7.17ms | 42.58ms |
| comp_1to1000 | 14.76ms | 5.79ms | 14.90ms | 3.52ms | 4.48ms | 38.34ms |
| update_1to1 | 16.12ms | 8.17ms | 23.21ms | 11.35ms | 9.26ms | 5.73ms |
| update_2to1 | 7.94ms | 4.07ms | 10.57ms | 4.89ms | 5.29ms | 2.88ms |
| update_4to1 | 4.06ms | 2.04ms | 6.25ms | 2.76ms | 2.29ms | 1.47ms |
| update_1000to1 | 41μs | 20μs | 61μs | 13μs | 23μs | 15μs |
| update_1to2 | 8.12ms | 4.06ms | 11.04ms | 5.59ms | 4.85ms | 2.97ms |
| update_1to4 | 4.09ms | 2.03ms | 5.52ms | 2.43ms | 2.35ms | 1.47ms |
| update_1to1000 | 149μs | 185μs | 162μs | 47μs | 44μs | 371μs |
| cellx1000 | 12.10ms | 9.61ms | 86.80ms | 7.60ms | 12.14ms | 5.28ms |
| cellx2500 | 38.15ms | 31.14ms | 281.36ms | 21.19ms | 33.67ms | 28.17ms |
| cellx5000 | 105.64ms | 81.43ms | 591.53ms | 58.73ms | 68.06ms | 69.70ms |
| 10x5 - 2 sources - read 20.0% (simple) | 345.74ms | 441.14ms | 2.02s | 234.81ms | 504.14ms | 237.21ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 243.16ms | 274.81ms | 1.56s | 176.60ms | 277.24ms | 200.51ms |
| 1000x12 - 4 sources - dynamic (large) | 467.34ms | 3.54s | 1.93s | 283.23ms | 3.75s | 351.10ms |
| 1000x5 - 25 sources (wide dense) | 596.88ms | 2.60s | 3.63s | 415.48ms | 3.42s | 503.78ms |
| 5x500 - 3 sources (deep) | 261.82ms | 231.78ms | 1.17s | 189.40ms | 225.86ms | 205.37ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 381.53ms | 444.71ms | 1.74s | 263.57ms | 482.26ms | 261.38ms |

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
