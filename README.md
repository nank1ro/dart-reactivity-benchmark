# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.28s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.14s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.24s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.35s |
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
| Test Case | state_beacon | mobx | solidart(2.0-dev) | preact_signals | signals | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 173.75ms (fail) | 2.38s | 276.29ms | 201.76ms | 216.97ms | 183.66ms |
| broadPropagation | 6.03ms (fail) | 4.53s | 504.50ms | 448.24ms | 447.36ms | 347.10ms |
| deepPropagation | 136.54ms (fail) | 1.58s | 169.87ms | 175.37ms | 171.41ms | 115.99ms |
| diamond | 183.11ms (fail) | 2.44s | 349.25ms | 278.28ms | 280.86ms | 230.33ms |
| mux | 195.20ms (fail) | 1.86s | 438.48ms | 395.73ms | 454.49ms | 366.33ms |
| repeatedObservers | 55.13ms (fail) | 232.71ms | 81.71ms | 40.11ms | 45.58ms | 45.43ms |
| triangle | 77.79ms (fail) | 776.45ms | 116.89ms | 97.60ms | 101.65ms | 85.69ms |
| unstable | 335.67ms (fail) | 350.86ms | 97.79ms | 70.30ms | 79.18ms | 66.92ms |
| molBench | 933μs | 578.19ms | 495.19ms | 489.60ms | 486.16ms | 486.97ms |
| create_signals | 65.89ms | 85.02ms | 76.36ms | 5.42ms | 27.30ms | 28.75ms |
| comp_0to1 | 54.39ms | 23.93ms | 28.57ms | 17.73ms | 12.10ms | 7.79ms |
| comp_1to1 | 62.41ms | 18.51ms | 49.80ms | 13.98ms | 24.21ms | 4.37ms |
| comp_2to1 | 43.04ms | 20.91ms | 26.13ms | 22.01ms | 8.96ms | 2.32ms |
| comp_4to1 | 18.74ms | 31.21ms | 5.29ms | 9.63ms | 2.83ms | 7.66ms |
| comp_1000to1 | 42μs | 16μs | 20μs | 6μs | 9μs | 3μs |
| comp_1to2 | 48.77ms | 38.40ms | 29.69ms | 18.19ms | 22.57ms | 10.81ms |
| comp_1to4 | 46.91ms | 25.92ms | 37.29ms | 34.28ms | 7.25ms | 11.93ms |
| comp_1to8 | 43.11ms | 21.92ms | 27.70ms | 6.93ms | 6.41ms | 4.91ms |
| comp_1to1000 | 38.45ms | 16.11ms | 17.32ms | 4.87ms | 4.27ms | 3.79ms |
| update_1to1 | 5.64ms | 25.73ms | 16.26ms | 8.78ms | 8.88ms | 10.50ms |
| update_2to1 | 3.11ms | 10.93ms | 7.95ms | 4.26ms | 4.47ms | 2.31ms |
| update_4to1 | 1.46ms | 6.38ms | 4.03ms | 2.16ms | 2.26ms | 2.56ms |
| update_1000to1 | 14μs | 61μs | 40μs | 21μs | 23μs | 26μs |
| update_1to2 | 2.85ms | 10.89ms | 8.03ms | 4.62ms | 4.48ms | 5.10ms |
| update_1to4 | 1.46ms | 5.70ms | 4.03ms | 2.17ms | 2.21ms | 2.46ms |
| update_1to1000 | 382μs | 188μs | 169μs | 156μs | 43μs | 47μs |
| cellx1000 | 5.12ms | 74.55ms | 11.97ms | 9.82ms | 11.28ms | 7.98ms |
| cellx2500 | 22.52ms | 264.77ms | 33.77ms | 31.15ms | 32.88ms | 19.83ms |
| cellx5000 | 84.15ms | 593.77ms | 79.73ms | 76.19ms | 67.39ms | 44.74ms |
| 10x5 - 2 sources - read 20.0% (simple) | 236.92ms | 2.04s | 355.84ms | 436.50ms | 515.31ms | 228.56ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 198.42ms | 1.59s | 242.30ms | 267.08ms | 280.09ms | 184.06ms |
| 1000x12 - 4 sources - dynamic (large) | 341.74ms | 2.11s | 461.97ms | 3.68s | 3.60s | 285.22ms |
| 1000x5 - 25 sources (wide dense) | 504.14ms | 3.71s | 590.31ms | 2.70s | 3.50s | 412.82ms |
| 5x500 - 3 sources (deep) | 208.68ms | 1.16s | 258.58ms | 233.08ms | 228.91ms | 188.70ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 260.75ms | 1.73s | 380.75ms | 452.46ms | 474.60ms | 263.13ms |

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
