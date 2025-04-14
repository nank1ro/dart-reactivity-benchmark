# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.27s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 9.92s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.15s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.34s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.39s |

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
| avoidablePropagation | 275.96ms | 199.29ms | 2.33s | 186.66ms | 211.22ms | 152.82ms (fail) |
| broadPropagation | 503.60ms | 456.35ms | 4.29s | 359.94ms | 460.21ms | 6.07ms (fail) |
| deepPropagation | 177.00ms | 177.14ms | 1.54s | 128.44ms | 178.11ms | 137.94ms (fail) |
| diamond | 351.57ms | 279.97ms | 2.42s | 233.64ms | 289.05ms | 182.11ms (fail) |
| mux | 443.71ms | 386.60ms | 1.84s | 378.48ms | 412.57ms | 192.95ms (fail) |
| repeatedObservers | 78.28ms | 38.38ms | 229.60ms | 45.06ms | 46.76ms | 52.36ms (fail) |
| triangle | 118.45ms | 98.04ms | 765.00ms | 86.57ms | 101.44ms | 77.28ms (fail) |
| unstable | 94.36ms | 70.41ms | 350.50ms | 60.12ms | 75.04ms | 339.49ms (fail) |
| molBench | 493.50ms | 490.74ms | 577.65ms | 489.53ms | 488.59ms | 1.25ms |
| create_signals | 52.80ms | 4.61ms | 80.83ms | 25.77ms | 25.60ms | 58.83ms |
| comp_0to1 | 26.71ms | 17.40ms | 43.77ms | 7.86ms | 12.09ms | 52.05ms |
| comp_1to1 | 26.92ms | 11.57ms | 17.17ms | 4.28ms | 33.97ms | 54.11ms |
| comp_2to1 | 36.82ms | 16.85ms | 24.48ms | 2.30ms | 20.03ms | 36.61ms |
| comp_4to1 | 13.08ms | 8.79ms | 14.28ms | 7.69ms | 3.78ms | 15.97ms |
| comp_1000to1 | 17μs | 6μs | 15μs | 4μs | 5μs | 41μs |
| comp_1to2 | 35.02ms | 21.73ms | 34.64ms | 13.36ms | 17.57ms | 44.70ms |
| comp_1to4 | 21.64ms | 22.91ms | 23.30ms | 16.34ms | 28.30ms | 43.30ms |
| comp_1to8 | 24.78ms | 6.40ms | 20.91ms | 4.90ms | 6.59ms | 42.92ms |
| comp_1to1000 | 15.27ms | 6.15ms | 14.63ms | 3.58ms | 5.81ms | 37.54ms |
| update_1to1 | 16.19ms | 8.21ms | 21.39ms | 11.27ms | 9.27ms | 5.73ms |
| update_2to1 | 7.95ms | 4.07ms | 10.61ms | 5.04ms | 4.65ms | 4.68ms |
| update_4to1 | 4.33ms | 2.06ms | 6.47ms | 2.81ms | 2.31ms | 1.47ms |
| update_1000to1 | 41μs | 20μs | 65μs | 10μs | 23μs | 15μs |
| update_1to2 | 8.18ms | 4.05ms | 10.65ms | 5.61ms | 4.85ms | 2.95ms |
| update_1to4 | 4.06ms | 2.08ms | 5.22ms | 2.46ms | 2.25ms | 1.49ms |
| update_1to1000 | 153μs | 881μs | 194μs | 35μs | 45μs | 390μs |
| cellx1000 | 11.71ms | 9.56ms | 71.24ms | 7.41ms | 9.87ms | 5.03ms |
| cellx2500 | 35.11ms | 25.77ms | 255.67ms | 19.67ms | 28.54ms | 21.15ms |
| cellx5000 | 81.39ms | 65.27ms | 545.32ms | 42.12ms | 71.81ms | 76.06ms |
| 10x5 - 2 sources - read 20.0% (simple) | 351.14ms | 443.52ms | 2.01s | 232.71ms | 511.06ms | 237.45ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 245.39ms | 273.22ms | 1.51s | 178.81ms | 278.14ms | 200.12ms |
| 1000x12 - 4 sources - dynamic (large) | 465.12ms | 3.50s | 1.89s | 280.99ms | 3.64s | 339.20ms |
| 1000x5 - 25 sources (wide dense) | 597.48ms | 2.59s | 3.56s | 416.21ms | 3.47s | 506.78ms |
| 5x500 - 3 sources (deep) | 262.70ms | 229.49ms | 1.14s | 192.18ms | 226.90ms | 202.01ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 389.47ms | 454.07ms | 1.69s | 261.15ms | 477.44ms | 258.11ms |

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
