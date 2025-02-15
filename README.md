# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.70s |
| 🥈 | preact_signals | 0.26 | 100.0% | 35/35 | 10.02s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.28s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.35s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.54s |
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
| Test Case | alien_signals | mobx | solidart | state_beacon | preact_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 185.47ms | 2.29s | 2.22s | 150.41ms (fail) | 211.17ms | 210.76ms |
| broadPropagation | 361.86ms | 4.26s | 5.45s | 6.17ms (fail) | 454.23ms | 464.85ms |
| deepPropagation | 126.68ms | 1.55s | 2.00s | 138.00ms (fail) | 181.97ms | 175.93ms |
| diamond | 232.84ms | 2.44s | 3.45s | 186.29ms (fail) | 283.86ms | 314.28ms |
| mux | 390.13ms | 1.82s | 2.02s | 189.34ms (fail) | 386.90ms | 413.75ms |
| repeatedObservers | 45.33ms | 230.63ms | 213.81ms | 52.17ms (fail) | 38.85ms | 46.78ms |
| triangle | 83.94ms | 780.18ms | 1.13s | 76.97ms (fail) | 99.58ms | 102.77ms |
| unstable | 60.88ms | 349.42ms | 345.98ms | 336.59ms (fail) | 71.03ms | 76.92ms |
| molBench | 492.55ms | 488.19ms | 1.71s | 924μs | 490.81ms | 489.34ms |
| create_signals | 36.64ms | 83.34ms | 79.69ms | 62.25ms | 4.65ms | 25.16ms |
| comp_0to1 | 10.29ms | 37.45ms | 34.98ms | 51.82ms | 17.58ms | 11.46ms |
| comp_1to1 | 4.42ms | 27.71ms | 31.76ms | 53.85ms | 11.20ms | 17.85ms |
| comp_2to1 | 2.42ms | 8.71ms | 30.53ms | 42.19ms | 11.54ms | 19.12ms |
| comp_4to1 | 8.51ms | 25.69ms | 12.52ms | 18.04ms | 15.03ms | 1.81ms |
| comp_1000to1 | 4μs | 15μs | 2.26ms | 45μs | 4μs | 5μs |
| comp_1to2 | 23.93ms | 33.45ms | 25.66ms | 44.71ms | 19.08ms | 19.79ms |
| comp_1to4 | 5.44ms | 24.12ms | 27.73ms | 44.12ms | 33.43ms | 14.94ms |
| comp_1to8 | 5.17ms | 21.23ms | 25.15ms | 43.23ms | 7.18ms | 7.08ms |
| comp_1to1000 | 3.28ms | 15.89ms | 17.91ms | 38.07ms | 6.79ms | 4.54ms |
| update_1to1 | 8.51ms | 21.72ms | 64.00ms | 5.73ms | 8.26ms | 9.19ms |
| update_2to1 | 4.71ms | 10.87ms | 28.66ms | 2.91ms | 4.05ms | 4.59ms |
| update_4to1 | 2.27ms | 5.81ms | 11.92ms | 1.49ms | 2.03ms | 2.34ms |
| update_1000to1 | 24μs | 67μs | 188μs | 15μs | 20μs | 23μs |
| update_1to2 | 3.64ms | 11.05ms | 28.45ms | 3.23ms | 4.05ms | 4.90ms |
| update_1to4 | 1.61ms | 5.50ms | 14.72ms | 2.20ms | 2.02ms | 2.32ms |
| update_1to1000 | 34μs | 172μs | 221μs | 375μs | 812μs | 44μs |
| cellx1000 | 8.42ms | 70.41ms | 183.25ms | 5.34ms | 9.52ms | 9.73ms |
| cellx2500 | 20.91ms | 255.57ms | 470.34ms | 27.16ms | 25.73ms | 31.21ms |
| cellx5000 | 42.82ms | 546.44ms | 1.16s | 65.33ms | 68.90ms | 60.78ms |
| 10x5 - 2 sources - read 20.0% (simple) | 227.48ms | 2.05s | 2.63s (partial) | 234.98ms | 453.13ms | 515.69ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 174.23ms | 1.55s | 2.42s (partial) | 199.38ms | 274.81ms | 292.30ms |
| 1000x12 - 4 sources - dynamic (large) | 277.61ms | 1.88s | 4.00s (partial) | 338.03ms | 3.54s | 3.75s |
| 1000x5 - 25 sources (wide dense) | 398.79ms | 3.55s | 4.94s (partial) | 499.96ms | 2.60s | 3.46s |
| 5x500 - 3 sources (deep) | 191.75ms | 1.15s | 1.98s (partial) | 204.28ms | 230.26ms | 235.20ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 260.10ms | 1.75s | 2.76s (partial) | 260.94ms | 453.30ms | 483.74ms |

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
