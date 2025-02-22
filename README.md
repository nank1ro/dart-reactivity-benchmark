# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.72s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 9.98s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.51s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.39s |
| 5 | solidart(2.0-dev) | 0.04 | 100.0% | 35/35 | 39.93s |
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
| Test Case | alien_signals | mobx | solidart(2.0-dev) | state_beacon | preact_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 185.65ms | 2.31s | 832.96ms | 154.87ms (fail) | 204.91ms | 210.96ms |
| broadPropagation | 359.45ms | 4.21s | 7.21s | 6.51ms (fail) | 452.56ms | 459.62ms |
| deepPropagation | 123.13ms | 1.53s | 876.90ms | 140.00ms (fail) | 177.49ms | 176.06ms |
| diamond | 236.91ms | 2.39s | 2.20s | 201.56ms (fail) | 280.50ms | 290.30ms |
| mux | 372.82ms | 1.83s | 1.13s | 190.94ms (fail) | 388.43ms | 407.27ms |
| repeatedObservers | 45.22ms | 225.63ms | 246.84ms | 52.16ms (fail) | 40.16ms | 46.97ms |
| triangle | 87.93ms | 766.17ms | 565.48ms | 84.72ms (fail) | 99.05ms | 101.34ms |
| unstable | 61.16ms | 347.84ms | 698.13ms | 335.89ms (fail) | 70.91ms | 74.40ms |
| molBench | 492.10ms | 578.23ms | 561.27ms | 1.26ms | 492.56ms | 488.30ms |
| create_signals | 26.47ms | 50.10ms | 67.65ms | 65.58ms | 4.76ms | 25.29ms |
| comp_0to1 | 8.22ms | 19.17ms | 30.29ms | 58.39ms | 18.00ms | 11.62ms |
| comp_1to1 | 4.54ms | 17.59ms | 27.84ms | 55.91ms | 11.18ms | 27.79ms |
| comp_2to1 | 2.30ms | 23.26ms | 39.72ms | 36.51ms | 11.67ms | 17.31ms |
| comp_4to1 | 7.96ms | 18.38ms | 41.62ms | 16.81ms | 11.51ms | 10.35ms |
| comp_1000to1 | 4μs | 32μs | 16μs | 43μs | 4μs | 5μs |
| comp_1to2 | 11.50ms | 31.92ms | 26.70ms | 45.48ms | 22.57ms | 21.64ms |
| comp_1to4 | 13.87ms | 22.18ms | 36.33ms | 44.09ms | 26.80ms | 13.25ms |
| comp_1to8 | 3.94ms | 23.84ms | 23.99ms | 43.54ms | 12.25ms | 12.26ms |
| comp_1to1000 | 3.15ms | 14.72ms | 15.91ms | 38.52ms | 8.14ms | 4.45ms |
| update_1to1 | 11.44ms | 22.57ms | 14.42ms | 5.74ms | 8.36ms | 9.20ms |
| update_2to1 | 5.20ms | 10.55ms | 7.25ms | 2.88ms | 4.06ms | 4.59ms |
| update_4to1 | 2.82ms | 5.81ms | 3.64ms | 1.47ms | 2.07ms | 2.32ms |
| update_1000to1 | 18μs | 56μs | 36μs | 15μs | 21μs | 23μs |
| update_1to2 | 5.70ms | 10.46ms | 7.40ms | 2.93ms | 4.07ms | 4.97ms |
| update_1to4 | 1.99ms | 6.04ms | 3.61ms | 1.47ms | 2.06ms | 2.32ms |
| update_1to1000 | 36μs | 182μs | 164μs | 390μs | 322μs | 43μs |
| cellx1000 | 7.51ms | 69.71ms | 84.17ms | 5.40ms | 9.29ms | 9.47ms |
| cellx2500 | 22.04ms | 243.51ms | 109.08ms | 28.99ms | 24.30ms | 30.75ms |
| cellx5000 | 49.02ms | 560.03ms | 305.45ms | 70.56ms | 66.07ms | 58.58ms |
| 10x5 - 2 sources - read 20.0% (simple) | 232.54ms | 2.07s | 2.62s | 249.71ms | 441.84ms | 503.79ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 177.33ms | 1.54s | 2.41s | 201.67ms | 278.29ms | 280.71ms |
| 1000x12 - 4 sources - dynamic (large) | 288.82ms | 1.90s | 5.30s | 345.09ms | 3.51s | 3.93s |
| 1000x5 - 25 sources (wide dense) | 415.16ms | 3.62s | 10.43s | 501.05ms | 2.62s | 3.56s |
| 5x500 - 3 sources (deep) | 187.51ms | 1.17s | 948.58ms | 207.04ms | 228.73ms | 226.54ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 262.35ms | 1.76s | 3.05s | 259.22ms | 448.12ms | 486.13ms |

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
