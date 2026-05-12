# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.76s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.22s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.15s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.81s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.80s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.40s |

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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.30s | 204.62ms | 198.22ms | 211.04ms | 272.82ms | 147.99ms (fail) |
| broadPropagation | 4.28s | 465.91ms | 359.49ms | 467.50ms | 509.31ms | 5.92ms (fail) |
| deepPropagation | 1.57s | 171.23ms | 129.28ms | 184.07ms | 167.35ms | 135.27ms (fail) |
| diamond | 2.33s | 290.20ms | 246.00ms | 285.79ms | 346.25ms | 185.05ms (fail) |
| mux | 1.77s | 405.30ms | 363.26ms | 370.76ms | 415.08ms | 182.82ms (fail) |
| repeatedObservers | 223.33ms | 45.79ms | 45.73ms | 42.13ms | 80.57ms | 58.54ms (fail) |
| triangle | 759.50ms | 100.47ms | 88.72ms | 99.77ms | 114.61ms | 87.01ms (fail) |
| unstable | 339.26ms | 75.75ms | 62.14ms | 72.00ms | 94.96ms | 337.69ms (fail) |
| molBench | 584.45ms | 494.18ms | 482.32ms | 497.10ms | 490.89ms | 1.39ms |
| create_signals | 50.20ms | 27.39ms | 29.51ms | 4.81ms | 55.13ms | 59.35ms |
| comp_0to1 | 15.07ms | 11.72ms | 6.56ms | 17.81ms | 25.96ms | 54.31ms |
| comp_1to1 | 40.95ms | 27.78ms | 4.42ms | 13.76ms | 46.03ms | 55.23ms |
| comp_2to1 | 34.86ms | 11.29ms | 2.36ms | 16.48ms | 36.54ms | 36.63ms |
| comp_4to1 | 22.50ms | 1.97ms | 7.87ms | 14.09ms | 4.56ms | 16.35ms |
| comp_1000to1 | 15μs | 7μs | 4μs | 4μs | 31μs | 57μs |
| comp_1to2 | 34.70ms | 24.14ms | 14.71ms | 30.58ms | 32.49ms | 46.47ms |
| comp_1to4 | 17.82ms | 22.52ms | 9.22ms | 21.37ms | 14.57ms | 45.78ms |
| comp_1to8 | 19.59ms | 6.72ms | 3.92ms | 8.78ms | 19.63ms | 44.57ms |
| comp_1to1000 | 14.78ms | 4.08ms | 4.83ms | 5.96ms | 13.99ms | 40.21ms |
| update_1to1 | 21.17ms | 9.09ms | 4.66ms | 9.24ms | 15.61ms | 9.67ms |
| update_2to1 | 10.47ms | 4.47ms | 2.32ms | 4.68ms | 7.85ms | 2.83ms |
| update_4to1 | 5.60ms | 2.30ms | 1.19ms | 2.50ms | 3.93ms | 2.31ms |
| update_1000to1 | 52μs | 22μs | 20μs | 23μs | 39μs | 14μs |
| update_1to2 | 10.42ms | 4.53ms | 3.14ms | 4.51ms | 7.99ms | 3.94ms |
| update_1to4 | 5.20ms | 2.23ms | 1.21ms | 2.45ms | 3.97ms | 1.44ms |
| update_1to1000 | 153μs | 42μs | 46μs | 462μs | 158μs | 412μs |
| cellx1000 | 72.89ms | 10.63ms | 7.93ms | 10.20ms | 11.86ms | 5.14ms |
| cellx2500 | 251.68ms | 42.82ms | 24.97ms | 33.85ms | 32.91ms | 25.92ms |
| cellx5000 | 562.90ms | 78.27ms | 66.85ms | 70.14ms | 86.36ms | 59.70ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.99s | 511.89ms | 251.93ms | 553.67ms | 350.29ms | 242.79ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.51s | 282.33ms | 182.92ms | 299.52ms | 255.68ms | 198.46ms |
| 1000x12 - 4 sources - dynamic (large) | 1.84s | 3.69s | 282.26ms | 3.93s | 464.34ms | 334.02ms |
| 1000x5 - 25 sources (wide dense) | 3.34s | 3.42s | 410.23ms | 2.84s | 599.47ms | 515.45ms |
| 5x500 - 3 sources (deep) | 1.13s | 226.30ms | 192.80ms | 231.24ms | 255.23ms | 206.02ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.66s | 467.63ms | 267.27ms | 463.61ms | 379.34ms | 255.98ms |

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
