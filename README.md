# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.73s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.46s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.25s |
| 4 | signals | 0.24 | 100.0% | 35/35 | 11.38s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.02s |
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
| Test Case | solidart(2.0-dev) | alien_signals | state_beacon | preact_signals | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 273.38ms | 201.96ms | 150.25ms (fail) | 208.85ms | 2.29s | 199.65ms |
| broadPropagation | 495.13ms | 354.27ms | 5.86ms (fail) | 457.97ms | 4.29s | 463.47ms |
| deepPropagation | 167.60ms | 129.85ms | 142.46ms (fail) | 176.56ms | 1.54s | 170.38ms |
| diamond | 355.48ms | 246.63ms | 189.27ms (fail) | 287.14ms | 2.37s | 284.89ms |
| mux | 417.18ms | 363.90ms | 181.67ms (fail) | 372.60ms | 1.78s | 397.04ms |
| repeatedObservers | 80.39ms | 46.55ms | 58.57ms (fail) | 42.58ms | 226.48ms | 45.71ms |
| triangle | 113.27ms | 88.56ms | 76.66ms (fail) | 100.56ms | 761.46ms | 101.29ms |
| unstable | 95.04ms | 62.38ms | 335.55ms (fail) | 72.02ms | 340.73ms | 75.27ms |
| molBench | 490.16ms | 480.70ms | 1.06ms | 495.97ms | 584.12ms | 494.15ms |
| create_signals | 75.75ms | 28.79ms | 60.33ms | 5.23ms | 88.47ms | 26.82ms |
| comp_0to1 | 25.72ms | 9.72ms | 57.55ms | 21.68ms | 15.27ms | 11.75ms |
| comp_1to1 | 30.30ms | 4.22ms | 56.08ms | 11.85ms | 51.97ms | 33.99ms |
| comp_2to1 | 26.73ms | 2.39ms | 36.85ms | 27.35ms | 23.63ms | 8.14ms |
| comp_4to1 | 4.63ms | 10.53ms | 16.73ms | 1.77ms | 26.19ms | 5.65ms |
| comp_1000to1 | 17μs | 6μs | 71μs | 4μs | 15μs | 5μs |
| comp_1to2 | 38.31ms | 23.52ms | 46.93ms | 11.98ms | 36.68ms | 14.28ms |
| comp_1to4 | 20.61ms | 4.96ms | 46.10ms | 22.47ms | 20.21ms | 12.29ms |
| comp_1to8 | 19.68ms | 4.94ms | 44.77ms | 5.76ms | 22.77ms | 9.06ms |
| comp_1to1000 | 13.93ms | 3.26ms | 40.68ms | 3.60ms | 15.15ms | 7.19ms |
| update_1to1 | 15.71ms | 4.66ms | 8.19ms | 9.18ms | 22.41ms | 9.06ms |
| update_2to1 | 7.85ms | 2.35ms | 7.61ms | 4.58ms | 11.44ms | 4.49ms |
| update_4to1 | 3.91ms | 1.22ms | 2.70ms | 2.30ms | 5.53ms | 3.71ms |
| update_1000to1 | 39μs | 11μs | 14μs | 23μs | 53μs | 22μs |
| update_1to2 | 8.13ms | 2.34ms | 4.59ms | 4.57ms | 11.16ms | 4.45ms |
| update_1to4 | 3.94ms | 1.24ms | 1.45ms | 2.43ms | 5.79ms | 2.46ms |
| update_1to1000 | 168μs | 46μs | 404μs | 56μs | 154μs | 42μs |
| cellx1000 | 12.41ms | 7.35ms | 5.79ms | 9.76ms | 70.74ms | 11.95ms |
| cellx2500 | 40.47ms | 19.77ms | 27.63ms | 27.23ms | 263.61ms | 37.88ms |
| cellx5000 | 104.85ms | 48.13ms | 69.72ms | 65.71ms | 543.39ms | 64.71ms |
| 10x5 - 2 sources - read 20.0% (simple) | 342.20ms | 229.77ms | 239.74ms | 457.96ms | 1.99s | 501.02ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 248.68ms | 177.24ms | 199.32ms | 277.60ms | 1.49s | 279.87ms |
| 1000x12 - 4 sources - dynamic (large) | 474.20ms | 293.80ms | 348.51ms | 3.80s | 1.94s | 3.90s |
| 1000x5 - 25 sources (wide dense) | 601.45ms | 413.02ms | 516.73ms | 2.78s | 3.36s | 3.50s |
| 5x500 - 3 sources (deep) | 258.21ms | 199.03ms | 206.78ms | 239.60ms | 1.13s | 222.04ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 379.74ms | 265.94ms | 259.92ms | 449.68ms | 1.70s | 480.38ms |

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
