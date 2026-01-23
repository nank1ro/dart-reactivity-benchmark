# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.21s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.06s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 10.97s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.08s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.44s |

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
| avoidablePropagation | 210.70ms | 188.56ms | 144.38ms (fail) | 281.14ms | 201.28ms | 2.36s |
| broadPropagation | 451.72ms | 351.71ms | 6.95ms (fail) | 496.14ms | 462.34ms | 4.44s |
| deepPropagation | 169.31ms | 124.86ms | 141.91ms (fail) | 165.63ms | 177.39ms | 1.51s |
| diamond | 283.15ms | 230.53ms | 179.84ms (fail) | 355.48ms | 285.13ms | 2.37s |
| mux | 390.73ms | 357.88ms | 180.24ms (fail) | 413.94ms | 373.74ms | 1.83s |
| repeatedObservers | 46.33ms | 43.46ms | 53.41ms (fail) | 80.88ms | 40.10ms | 227.63ms |
| triangle | 100.34ms | 82.34ms | 78.65ms (fail) | 115.02ms | 100.86ms | 734.07ms |
| unstable | 77.75ms | 61.97ms | 336.54ms (fail) | 95.61ms | 72.25ms | 341.67ms |
| molBench | 495.30ms | 486.02ms | 1.01ms | 490.32ms | 480.02ms | 589.03ms |
| create_signals | 25.44ms | 22.79ms | 70.67ms | 71.59ms | 5.30ms | 50.34ms |
| comp_0to1 | 11.16ms | 8.73ms | 63.79ms | 31.16ms | 17.60ms | 18.67ms |
| comp_1to1 | 24.31ms | 4.37ms | 63.34ms | 43.24ms | 12.74ms | 29.02ms |
| comp_2to1 | 16.43ms | 2.35ms | 42.93ms | 16.20ms | 17.13ms | 11.54ms |
| comp_4to1 | 3.14ms | 7.54ms | 17.59ms | 8.59ms | 12.64ms | 28.03ms |
| comp_1000to1 | 5μs | 4μs | 44μs | 18μs | 4μs | 15μs |
| comp_1to2 | 21.29ms | 10.88ms | 49.80ms | 36.38ms | 30.50ms | 35.33ms |
| comp_1to4 | 9.60ms | 11.94ms | 49.90ms | 17.19ms | 21.31ms | 18.91ms |
| comp_1to8 | 6.39ms | 5.08ms | 44.51ms | 21.79ms | 11.96ms | 20.92ms |
| comp_1to1000 | 4.25ms | 6.10ms | 41.36ms | 14.18ms | 7.71ms | 16.89ms |
| update_1to1 | 9.38ms | 9.28ms | 6.12ms | 15.46ms | 13.39ms | 25.91ms |
| update_2to1 | 4.92ms | 3.73ms | 3.07ms | 7.74ms | 4.30ms | 13.14ms |
| update_4to1 | 2.33ms | 2.31ms | 1.57ms | 3.87ms | 2.20ms | 7.36ms |
| update_1000to1 | 23μs | 23μs | 16μs | 38μs | 22μs | 65μs |
| update_1to2 | 4.64ms | 2.47ms | 3.07ms | 7.73ms | 4.39ms | 13.54ms |
| update_1to4 | 2.55ms | 1.21ms | 1.59ms | 3.98ms | 2.26ms | 10.56ms |
| update_1to1000 | 44μs | 47μs | 396μs | 147μs | 41μs | 160μs |
| cellx1000 | 9.73ms | 7.39ms | 5.52ms | 15.54ms | 10.01ms | 79.52ms |
| cellx2500 | 31.52ms | 20.18ms | 28.13ms | 35.17ms | 28.55ms | 244.85ms |
| cellx5000 | 66.38ms | 51.91ms | 67.92ms | 79.52ms | 77.68ms | 535.40ms |
| 10x5 - 2 sources - read 20.0% (simple) | 513.42ms | 241.56ms | 237.57ms | 347.69ms | 438.43ms | 1.93s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.35ms | 175.09ms | 200.88ms | 244.55ms | 264.43ms | 1.46s |
| 1000x12 - 4 sources - dynamic (large) | 3.58s | 279.52ms | 340.06ms | 468.05ms | 3.69s | 1.85s |
| 1000x5 - 25 sources (wide dense) | 3.41s | 413.62ms | 519.88ms | 594.94ms | 2.50s | 3.50s |
| 5x500 - 3 sources (deep) | 231.88ms | 191.13ms | 202.41ms | 257.43ms | 227.49ms | 1.09s |
| 100x15 - 6 sources - dynamic (very dynamic) | 479.47ms | 259.67ms | 255.14ms | 375.56ms | 469.55ms | 1.67s |

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
