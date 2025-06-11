# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.26s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.47s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.35s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.89s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.45s |

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
| Test Case | solidart(2.0-dev) | signals | mobx | preact_signals | state_beacon | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 275.24ms | 206.83ms | 2.36s | 202.74ms | 151.67ms (fail) | 188.32ms |
| broadPropagation | 499.78ms | 452.88ms | 4.57s | 501.78ms | 6.45ms (fail) | 343.68ms |
| deepPropagation | 168.41ms | 168.84ms | 1.57s | 179.84ms | 139.20ms (fail) | 124.61ms |
| diamond | 346.94ms | 280.04ms | 2.47s | 299.30ms | 186.24ms (fail) | 232.63ms |
| mux | 444.70ms | 449.16ms | 1.86s | 405.33ms | 191.38ms (fail) | 373.35ms |
| repeatedObservers | 81.60ms | 44.46ms | 235.96ms | 41.64ms | 57.78ms (fail) | 45.41ms |
| triangle | 119.56ms | 120.41ms | 774.90ms | 104.69ms | 75.60ms (fail) | 84.95ms |
| unstable | 97.18ms | 80.68ms | 356.96ms | 72.92ms | 337.33ms (fail) | 66.84ms |
| molBench | 492.59ms | 486.85ms | 573.59ms | 489.08ms | 1.19ms | 481.16ms |
| create_signals | 54.94ms | 24.73ms | 69.30ms | 4.61ms | 67.45ms | 29.36ms |
| comp_0to1 | 27.32ms | 12.66ms | 27.90ms | 17.28ms | 61.47ms | 7.89ms |
| comp_1to1 | 47.69ms | 27.78ms | 37.80ms | 12.56ms | 62.44ms | 4.27ms |
| comp_2to1 | 39.81ms | 17.43ms | 35.57ms | 17.05ms | 43.55ms | 2.30ms |
| comp_4to1 | 19.32ms | 5.47ms | 13.58ms | 12.34ms | 18.90ms | 8.46ms |
| comp_1000to1 | 20μs | 4μs | 23μs | 10μs | 42μs | 3μs |
| comp_1to2 | 37.82ms | 21.46ms | 37.71ms | 19.56ms | 48.45ms | 11.40ms |
| comp_1to4 | 23.59ms | 7.02ms | 18.15ms | 34.93ms | 45.11ms | 12.54ms |
| comp_1to8 | 24.83ms | 6.48ms | 21.20ms | 6.88ms | 45.18ms | 4.17ms |
| comp_1to1000 | 17.28ms | 4.15ms | 16.14ms | 5.96ms | 39.23ms | 3.32ms |
| update_1to1 | 16.89ms | 14.76ms | 26.46ms | 8.65ms | 5.76ms | 10.33ms |
| update_2to1 | 8.36ms | 5.68ms | 12.71ms | 4.28ms | 3.13ms | 2.30ms |
| update_4to1 | 4.22ms | 2.23ms | 6.60ms | 2.21ms | 1.46ms | 2.63ms |
| update_1000to1 | 42μs | 22μs | 70μs | 21μs | 15μs | 24μs |
| update_1to2 | 9.61ms | 4.49ms | 12.54ms | 4.61ms | 2.86ms | 5.09ms |
| update_1to4 | 4.23ms | 2.22ms | 6.53ms | 2.19ms | 1.49ms | 2.51ms |
| update_1to1000 | 173μs | 44μs | 303μs | 947μs | 407μs | 48μs |
| cellx1000 | 11.98ms | 11.93ms | 72.91ms | 9.83ms | 5.13ms | 7.31ms |
| cellx2500 | 36.99ms | 31.75ms | 255.07ms | 28.20ms | 24.71ms | 19.61ms |
| cellx5000 | 74.08ms | 62.74ms | 576.43ms | 71.70ms | 79.33ms | 52.09ms |
| 10x5 - 2 sources - read 20.0% (simple) | 353.05ms | 506.38ms | 2.05s | 443.21ms | 237.91ms | 231.00ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 242.03ms | 278.48ms | 1.54s | 269.44ms | 197.47ms | 171.96ms |
| 1000x12 - 4 sources - dynamic (large) | 465.45ms | 4.01s | 1.94s | 3.70s | 342.72ms | 280.68ms |
| 1000x5 - 25 sources (wide dense) | 588.24ms | 3.43s | 3.50s | 2.69s | 501.96ms | 409.47ms |
| 5x500 - 3 sources (deep) | 249.93ms | 220.76ms | 1.15s | 228.78ms | 204.25ms | 191.28ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 379.54ms | 473.54ms | 1.69s | 455.93ms | 261.30ms | 257.38ms |

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
