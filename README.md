# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.70s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.33s |
| 🥉 | preact_signals | 0.25 | 100.0% | 35/35 | 9.98s |
| 4 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.31s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.11s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.41s |

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
| Test Case | solidart(2.0-dev) | preact_signals | alien_signals | state_beacon | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 273.48ms | 203.60ms | 185.84ms | 149.86ms (fail) | 2.33s | 208.20ms |
| broadPropagation | 513.57ms | 463.04ms | 355.49ms | 5.79ms (fail) | 4.46s | 460.94ms |
| deepPropagation | 170.24ms | 179.73ms | 118.06ms | 139.03ms (fail) | 1.58s | 175.42ms |
| diamond | 359.35ms | 283.77ms | 237.47ms | 181.52ms (fail) | 2.47s | 286.66ms |
| mux | 442.90ms | 385.63ms | 374.81ms | 190.23ms (fail) | 1.90s | 423.04ms |
| repeatedObservers | 81.17ms | 38.93ms | 44.70ms | 52.07ms (fail) | 238.24ms | 46.52ms |
| triangle | 116.18ms | 100.59ms | 86.38ms | 81.64ms (fail) | 787.22ms | 100.93ms |
| unstable | 93.70ms | 71.94ms | 60.72ms | 337.00ms (fail) | 350.61ms | 75.22ms |
| molBench | 492.64ms | 491.89ms | 491.83ms | 1.14ms | 582.34ms | 488.21ms |
| create_signals | 94.66ms | 5.38ms | 28.16ms | 66.34ms | 82.90ms | 24.19ms |
| comp_0to1 | 32.45ms | 17.52ms | 6.93ms | 55.62ms | 35.15ms | 12.05ms |
| comp_1to1 | 37.37ms | 13.80ms | 4.14ms | 55.40ms | 29.67ms | 25.77ms |
| comp_2to1 | 9.97ms | 16.56ms | 2.24ms | 36.78ms | 8.42ms | 9.51ms |
| comp_4to1 | 13.60ms | 12.45ms | 11.32ms | 16.13ms | 17.94ms | 1.93ms |
| comp_1000to1 | 405μs | 9μs | 4μs | 46μs | 35μs | 5μs |
| comp_1to2 | 37.96ms | 21.40ms | 18.41ms | 43.81ms | 33.32ms | 19.73ms |
| comp_1to4 | 22.80ms | 22.11ms | 5.05ms | 42.83ms | 18.57ms | 9.57ms |
| comp_1to8 | 24.46ms | 7.48ms | 5.41ms | 41.83ms | 20.93ms | 12.61ms |
| comp_1to1000 | 15.36ms | 6.51ms | 3.27ms | 37.48ms | 14.73ms | 6.13ms |
| update_1to1 | 16.45ms | 8.30ms | 11.27ms | 5.72ms | 24.65ms | 8.78ms |
| update_2to1 | 8.14ms | 4.11ms | 5.13ms | 2.89ms | 11.47ms | 4.96ms |
| update_4to1 | 4.11ms | 2.05ms | 2.80ms | 1.48ms | 5.75ms | 2.16ms |
| update_1000to1 | 41μs | 20μs | 10μs | 15μs | 67μs | 21μs |
| update_1to2 | 8.08ms | 4.08ms | 5.59ms | 2.97ms | 12.24ms | 4.32ms |
| update_1to4 | 4.08ms | 2.06ms | 2.44ms | 1.48ms | 6.02ms | 2.19ms |
| update_1to1000 | 161μs | 725μs | 46μs | 394μs | 166μs | 83μs |
| cellx1000 | 11.63ms | 9.88ms | 9.31ms | 6.71ms | 75.33ms | 9.70ms |
| cellx2500 | 33.59ms | 27.78ms | 19.47ms | 28.67ms | 271.16ms | 32.15ms |
| cellx5000 | 81.01ms | 74.66ms | 45.60ms | 72.51ms | 546.12ms | 58.16ms |
| 10x5 - 2 sources - read 20.0% (simple) | 359.78ms | 441.58ms | 232.53ms | 238.60ms | 2.12s | 515.19ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 247.07ms | 277.11ms | 177.80ms | 200.80ms | 1.61s | 277.79ms |
| 1000x12 - 4 sources - dynamic (large) | 468.70ms | 3.52s | 282.97ms | 350.74ms | 1.94s | 3.75s |
| 1000x5 - 25 sources (wide dense) | 595.98ms | 2.59s | 410.04ms | 501.29ms | 3.62s | 3.57s |
| 5x500 - 3 sources (deep) | 255.01ms | 227.42ms | 193.97ms | 205.38ms | 1.18s | 222.84ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 383.16ms | 451.70ms | 265.10ms | 258.16ms | 1.72s | 479.23ms |

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
