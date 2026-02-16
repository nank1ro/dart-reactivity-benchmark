# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.85s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.55s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.42s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 11.01s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.85s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.57s |

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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 202.55ms | 2.30s | 144.98ms (fail) | 193.31ms | 208.80ms | 281.82ms |
| broadPropagation | 465.15ms | 4.29s | 6.02ms (fail) | 357.01ms | 472.91ms | 504.40ms |
| deepPropagation | 170.17ms | 1.52s | 139.73ms (fail) | 126.03ms | 174.47ms | 167.95ms |
| diamond | 289.89ms | 2.36s | 186.16ms (fail) | 248.14ms | 286.26ms | 357.21ms |
| mux | 410.11ms | 1.80s | 188.16ms (fail) | 369.56ms | 384.90ms | 422.84ms |
| repeatedObservers | 47.07ms | 232.48ms | 55.11ms (fail) | 45.81ms | 42.16ms | 80.78ms |
| triangle | 102.16ms | 763.50ms | 82.56ms (fail) | 90.24ms | 101.86ms | 115.36ms |
| unstable | 75.70ms | 345.50ms | 342.32ms (fail) | 61.93ms | 72.56ms | 96.43ms |
| molBench | 495.64ms | 588.86ms | 1.26ms | 486.93ms | 497.87ms | 494.30ms |
| create_signals | 29.46ms | 86.90ms | 65.35ms | 29.51ms | 5.60ms | 63.27ms |
| comp_0to1 | 12.87ms | 15.47ms | 59.83ms | 8.15ms | 19.82ms | 26.65ms |
| comp_1to1 | 29.80ms | 47.68ms | 56.29ms | 4.32ms | 14.27ms | 50.58ms |
| comp_2to1 | 12.63ms | 41.01ms | 38.39ms | 2.33ms | 19.23ms | 49.98ms |
| comp_4to1 | 9.06ms | 15.01ms | 17.13ms | 10.84ms | 13.76ms | 17.05ms |
| comp_1000to1 | 5μs | 16μs | 83μs | 4μs | 6μs | 15μs |
| comp_1to2 | 19.44ms | 40.90ms | 45.98ms | 29.61ms | 21.77ms | 30.41ms |
| comp_1to4 | 14.90ms | 22.70ms | 45.94ms | 6.25ms | 29.27ms | 14.74ms |
| comp_1to8 | 7.78ms | 26.40ms | 44.95ms | 5.82ms | 7.04ms | 21.92ms |
| comp_1to1000 | 4.42ms | 15.84ms | 39.58ms | 3.34ms | 6.02ms | 14.18ms |
| update_1to1 | 8.87ms | 21.40ms | 8.58ms | 4.67ms | 9.04ms | 15.81ms |
| update_2to1 | 4.54ms | 10.51ms | 2.83ms | 2.37ms | 4.55ms | 7.91ms |
| update_4to1 | 2.30ms | 6.09ms | 2.41ms | 1.21ms | 2.29ms | 3.99ms |
| update_1000to1 | 22μs | 64μs | 14μs | 11μs | 32μs | 40μs |
| update_1to2 | 4.43ms | 10.62ms | 4.82ms | 2.36ms | 4.46ms | 11.44ms |
| update_1to4 | 2.26ms | 5.37ms | 1.41ms | 1.26ms | 2.33ms | 6.80ms |
| update_1to1000 | 45μs | 171μs | 377μs | 64μs | 937μs | 159μs |
| cellx1000 | 14.65ms | 124.20ms | 8.11ms | 9.38ms | 15.10ms | 23.04ms |
| cellx2500 | 68.86ms | 359.49ms | 38.66ms | 33.19ms | 67.12ms | 88.97ms |
| cellx5000 | 149.88ms | 716.58ms | 109.05ms | 112.18ms | 160.81ms | 209.14ms |
| 10x5 - 2 sources - read 20.0% (simple) | 503.24ms | 2.00s | 256.00ms | 236.84ms | 456.01ms | 352.61ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.83ms | 1.46s | 210.03ms | 183.34ms | 271.33ms | 256.44ms |
| 1000x12 - 4 sources - dynamic (large) | 3.71s | 1.93s | 359.54ms | 289.93ms | 4.08s | 482.75ms |
| 1000x5 - 25 sources (wide dense) | 3.56s | 3.53s | 523.27ms | 412.17ms | 2.87s | 608.70ms |
| 5x500 - 3 sources (deep) | 230.60ms | 1.39s | 211.61ms | 200.66ms | 237.07ms | 267.78ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 479.93ms | 1.78s | 272.52ms | 277.33ms | 458.12ms | 400.29ms |

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
