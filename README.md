# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.76s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.44s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 10.88s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.06s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.83s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.35s |

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
| Test Case | preact_signals | solidart(2.0-dev) | mobx | alien_signals | state_beacon | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 220.57ms | 265.35ms | 2.28s | 184.74ms | 155.62ms (fail) | 211.05ms |
| broadPropagation | 525.53ms | 494.57ms | 4.21s | 356.51ms | 6.38ms (fail) | 474.06ms |
| deepPropagation | 194.50ms | 163.36ms | 1.47s | 119.15ms | 149.43ms (fail) | 181.58ms |
| diamond | 284.69ms | 397.54ms | 2.25s | 264.95ms | 187.29ms (fail) | 287.66ms |
| mux | 395.72ms | 428.54ms | 1.71s | 358.51ms | 185.87ms (fail) | 386.60ms |
| repeatedObservers | 42.21ms | 89.23ms | 231.34ms | 42.97ms | 54.09ms (fail) | 46.33ms |
| triangle | 106.71ms | 121.48ms | 719.86ms | 86.67ms | 80.82ms (fail) | 106.53ms |
| unstable | 73.22ms | 108.14ms | 339.16ms | 60.37ms | 342.69ms (fail) | 79.10ms |
| molBench | 547.91ms | 559.33ms | 639.13ms | 552.50ms | 1.06ms | 547.59ms |
| create_signals | 5.80ms | 57.81ms | 97.56ms | 28.56ms | 66.97ms | 29.29ms |
| comp_0to1 | 21.31ms | 26.77ms | 51.36ms | 8.11ms | 54.68ms | 12.61ms |
| comp_1to1 | 19.15ms | 47.11ms | 17.21ms | 4.11ms | 61.15ms | 26.66ms |
| comp_2to1 | 21.37ms | 43.08ms | 26.44ms | 2.19ms | 39.56ms | 12.51ms |
| comp_4to1 | 12.76ms | 4.42ms | 28.96ms | 14.97ms | 15.87ms | 2.39ms |
| comp_1000to1 | 4μs | 15μs | 15μs | 4μs | 39μs | 5μs |
| comp_1to2 | 25.36ms | 29.14ms | 40.26ms | 21.36ms | 44.82ms | 26.51ms |
| comp_1to4 | 32.05ms | 28.29ms | 23.19ms | 7.43ms | 44.07ms | 16.52ms |
| comp_1to8 | 6.66ms | 24.74ms | 25.12ms | 3.91ms | 42.00ms | 6.38ms |
| comp_1to1000 | 6.21ms | 14.67ms | 14.73ms | 3.48ms | 36.42ms | 4.05ms |
| update_1to1 | 8.47ms | 16.34ms | 23.59ms | 4.38ms | 6.23ms | 10.24ms |
| update_2to1 | 4.54ms | 8.14ms | 11.46ms | 2.27ms | 3.25ms | 5.05ms |
| update_4to1 | 2.17ms | 4.06ms | 5.89ms | 1.14ms | 1.63ms | 2.53ms |
| update_1000to1 | 21μs | 40μs | 57μs | 11μs | 16μs | 26μs |
| update_1to2 | 4.21ms | 8.35ms | 11.53ms | 2.24ms | 3.12ms | 5.25ms |
| update_1to4 | 2.16ms | 4.07ms | 5.74ms | 1.14ms | 1.59ms | 2.53ms |
| update_1to1000 | 590μs | 143μs | 153μs | 41μs | 359μs | 40μs |
| cellx1000 | 10.32ms | 12.95ms | 82.76ms | 7.13ms | 4.88ms | 9.56ms |
| cellx2500 | 34.76ms | 45.61ms | 291.09ms | 22.58ms | 23.65ms | 38.14ms |
| cellx5000 | 91.11ms | 108.35ms | 666.99ms | 54.27ms | 70.05ms | 91.14ms |
| 10x5 - 2 sources - read 20.0% (simple) | 426.96ms | 373.66ms | 2.01s | 243.26ms | 250.62ms | 495.51ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 260.22ms | 272.25ms | 1.41s | 183.81ms | 200.79ms | 271.86ms |
| 1000x12 - 4 sources - dynamic (large) | 3.42s | 430.50ms | 1.83s | 270.14ms | 315.65ms | 3.54s |
| 1000x5 - 25 sources (wide dense) | 2.59s | 640.47ms | 3.45s | 417.11ms | 463.74ms | 3.26s |
| 5x500 - 3 sources (deep) | 231.55ms | 270.20ms | 1.17s | 194.38ms | 203.56ms | 228.79ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 436.16ms | 343.57ms | 1.69s | 236.71ms | 236.49ms | 467.60ms |

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
