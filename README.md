# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.33s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.17s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.14s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.53s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.47s |

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
| avoidablePropagation | 209.28ms | 187.56ms | 147.07ms (fail) | 281.54ms | 205.92ms | 2.41s |
| broadPropagation | 458.83ms | 350.90ms | 6.45ms (fail) | 494.01ms | 461.32ms | 4.46s |
| deepPropagation | 173.49ms | 128.77ms | 139.93ms (fail) | 169.35ms | 178.82ms | 1.52s |
| diamond | 283.16ms | 229.58ms | 191.93ms (fail) | 363.45ms | 282.62ms | 2.40s |
| mux | 390.27ms | 355.16ms | 195.19ms (fail) | 435.87ms | 374.93ms | 1.89s |
| repeatedObservers | 46.81ms | 43.33ms | 52.68ms (fail) | 80.61ms | 40.64ms | 230.12ms |
| triangle | 101.64ms | 84.63ms | 76.85ms (fail) | 115.65ms | 101.09ms | 748.32ms |
| unstable | 78.16ms | 62.09ms | 336.45ms (fail) | 95.98ms | 69.14ms | 343.66ms |
| molBench | 495.64ms | 485.64ms | 1.47ms | 490.26ms | 480.44ms | 590.21ms |
| create_signals | 49.33ms | 28.98ms | 63.74ms | 74.21ms | 17.33ms | 66.23ms |
| comp_0to1 | 15.57ms | 8.90ms | 54.25ms | 26.10ms | 34.28ms | 19.11ms |
| comp_1to1 | 35.08ms | 4.38ms | 54.85ms | 46.88ms | 24.80ms | 35.79ms |
| comp_2to1 | 20.00ms | 2.37ms | 38.07ms | 19.19ms | 20.14ms | 22.79ms |
| comp_4to1 | 2.19ms | 10.47ms | 16.66ms | 14.99ms | 12.86ms | 23.85ms |
| comp_1000to1 | 6μs | 4μs | 47μs | 21μs | 5μs | 20μs |
| comp_1to2 | 20.49ms | 12.48ms | 45.23ms | 33.62ms | 12.39ms | 32.98ms |
| comp_1to4 | 7.41ms | 13.36ms | 45.31ms | 19.11ms | 24.43ms | 27.16ms |
| comp_1to8 | 6.52ms | 4.39ms | 43.42ms | 25.93ms | 10.68ms | 26.98ms |
| comp_1to1000 | 4.28ms | 3.44ms | 38.94ms | 14.85ms | 5.64ms | 15.27ms |
| update_1to1 | 9.36ms | 5.34ms | 6.11ms | 15.53ms | 8.72ms | 30.98ms |
| update_2to1 | 4.78ms | 2.48ms | 3.00ms | 7.82ms | 4.36ms | 13.54ms |
| update_4to1 | 2.35ms | 1.24ms | 1.64ms | 3.87ms | 2.22ms | 7.01ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 69μs |
| update_1to2 | 4.69ms | 2.29ms | 3.07ms | 7.77ms | 4.42ms | 12.38ms |
| update_1to4 | 2.52ms | 1.20ms | 1.63ms | 3.87ms | 2.24ms | 6.92ms |
| update_1to1000 | 44μs | 48μs | 378μs | 164μs | 46μs | 165μs |
| cellx1000 | 10.43ms | 8.98ms | 6.29ms | 14.81ms | 10.76ms | 88.78ms |
| cellx2500 | 47.41ms | 24.02ms | 34.01ms | 45.94ms | 33.58ms | 303.05ms |
| cellx5000 | 91.71ms | 66.89ms | 88.10ms | 121.06ms | 114.87ms | 660.28ms |
| 10x5 - 2 sources - read 20.0% (simple) | 505.33ms | 237.03ms | 231.91ms | 344.55ms | 432.25ms | 1.96s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.38ms | 177.11ms | 197.01ms | 242.37ms | 271.66ms | 1.47s |
| 1000x12 - 4 sources - dynamic (large) | 3.70s | 281.24ms | 358.04ms | 476.73ms | 3.66s | 1.88s |
| 1000x5 - 25 sources (wide dense) | 3.38s | 414.54ms | 526.81ms | 601.03ms | 2.58s | 3.39s |
| 5x500 - 3 sources (deep) | 228.24ms | 193.61ms | 207.61ms | 255.38ms | 228.81ms | 1.16s |
| 100x15 - 6 sources - dynamic (very dynamic) | 478.63ms | 262.32ms | 260.75ms | 385.97ms | 455.72ms | 1.70s |

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
