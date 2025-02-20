# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.75s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 10.05s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.46s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.53s |
| 5 | solidart(2.0-dev) | 0.04 | 100.0% | 35/35 | 41.16s |
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
| Test Case | alien_signals | mobx | solidart(2.0-dev) | state_beacon | preact_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 191.23ms | 2.32s | 852.47ms | 153.32ms (fail) | 205.63ms | 212.82ms |
| broadPropagation | 351.55ms | 4.28s | 7.65s | 6.80ms (fail) | 459.36ms | 457.23ms |
| deepPropagation | 124.39ms | 1.53s | 936.22ms | 148.39ms (fail) | 181.33ms | 177.88ms |
| diamond | 240.26ms | 2.37s | 2.43s | 190.91ms (fail) | 282.39ms | 286.94ms |
| mux | 375.52ms | 1.87s | 1.18s | 188.78ms (fail) | 387.25ms | 411.47ms |
| repeatedObservers | 45.55ms | 230.79ms | 267.70ms | 52.48ms (fail) | 38.92ms | 46.05ms |
| triangle | 85.42ms | 768.98ms | 618.63ms | 77.08ms (fail) | 100.44ms | 104.61ms |
| unstable | 60.55ms | 347.69ms | 775.49ms | 339.63ms (fail) | 70.88ms | 73.85ms |
| molBench | 492.36ms | 578.83ms | 567.43ms | 1.19ms | 493.06ms | 489.22ms |
| create_signals | 24.63ms | 79.46ms | 51.62ms | 60.93ms | 4.74ms | 30.49ms |
| comp_0to1 | 7.73ms | 20.85ms | 37.78ms | 52.94ms | 24.50ms | 11.26ms |
| comp_1to1 | 4.25ms | 37.61ms | 34.33ms | 54.97ms | 14.38ms | 32.23ms |
| comp_2to1 | 2.41ms | 36.72ms | 16.90ms | 37.68ms | 28.75ms | 11.69ms |
| comp_4to1 | 9.31ms | 17.63ms | 29.51ms | 19.42ms | 14.01ms | 1.92ms |
| comp_1000to1 | 6μs | 67μs | 26μs | 43μs | 4μs | 8μs |
| comp_1to2 | 15.78ms | 36.45ms | 32.62ms | 47.20ms | 30.01ms | 20.16ms |
| comp_1to4 | 6.02ms | 21.76ms | 36.23ms | 48.79ms | 24.27ms | 9.57ms |
| comp_1to8 | 5.82ms | 24.93ms | 29.35ms | 45.04ms | 7.79ms | 6.67ms |
| comp_1to1000 | 3.83ms | 15.61ms | 16.32ms | 38.32ms | 4.39ms | 4.60ms |
| update_1to1 | 11.30ms | 23.73ms | 14.44ms | 5.72ms | 8.20ms | 9.18ms |
| update_2to1 | 3.54ms | 10.86ms | 7.68ms | 2.86ms | 4.87ms | 4.60ms |
| update_4to1 | 2.79ms | 7.08ms | 3.62ms | 1.43ms | 2.13ms | 2.32ms |
| update_1000to1 | 10μs | 65μs | 36μs | 14μs | 20μs | 23μs |
| update_1to2 | 5.63ms | 12.07ms | 7.22ms | 3.36ms | 4.15ms | 4.89ms |
| update_1to4 | 2.10ms | 5.51ms | 3.65ms | 1.45ms | 2.08ms | 2.34ms |
| update_1to1000 | 42μs | 170μs | 168μs | 370μs | 62μs | 44μs |
| cellx1000 | 7.38ms | 76.50ms | 38.13ms | 6.37ms | 12.14ms | 10.10ms |
| cellx2500 | 21.26ms | 296.25ms | 205.60ms | 33.54ms | 30.60ms | 36.03ms |
| cellx5000 | 58.03ms | 614.78ms | 495.44ms | 88.58ms | 92.34ms | 90.64ms |
| 10x5 - 2 sources - read 20.0% (simple) | 232.76ms | 2.02s | 2.59s | 243.68ms | 440.87ms | 530.48ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 179.74ms | 1.53s | 1.83s | 205.96ms | 273.04ms | 288.40ms |
| 1000x12 - 4 sources - dynamic (large) | 298.02ms | 1.88s | 5.32s | 351.55ms | 3.53s | 3.78s |
| 1000x5 - 25 sources (wide dense) | 419.17ms | 3.57s | 11.70s | 493.07ms | 2.59s | 3.61s |
| 5x500 - 3 sources (deep) | 194.87ms | 1.15s | 1.42s | 205.65ms | 232.19ms | 227.96ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 264.83ms | 1.74s | 1.97s | 264.26ms | 452.15ms | 480.80ms |

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
