# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.68s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.26s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 9.97s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 10.98s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.79s |
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
| avoidablePropagation | 212.22ms | 189.40ms | 160.52ms (fail) | 278.78ms | 203.84ms | 2.39s |
| broadPropagation | 455.65ms | 354.14ms | 6.43ms (fail) | 511.04ms | 451.50ms | 4.33s |
| deepPropagation | 175.80ms | 145.81ms | 139.11ms (fail) | 168.66ms | 175.89ms | 1.47s |
| diamond | 280.70ms | 232.37ms | 182.10ms (fail) | 352.50ms | 284.62ms | 2.38s |
| mux | 385.10ms | 357.70ms | 179.03ms (fail) | 416.72ms | 370.90ms | 1.85s |
| repeatedObservers | 46.34ms | 43.55ms | 52.78ms (fail) | 80.63ms | 40.78ms | 232.92ms |
| triangle | 101.47ms | 85.97ms | 77.69ms (fail) | 115.09ms | 102.10ms | 750.65ms |
| unstable | 76.81ms | 62.82ms | 334.19ms (fail) | 96.20ms | 72.27ms | 353.64ms |
| molBench | 494.88ms | 484.96ms | 1.01ms | 490.22ms | 483.43ms | 589.71ms |
| create_signals | 25.07ms | 27.41ms | 62.33ms | 103.44ms | 4.80ms | 49.67ms |
| comp_0to1 | 10.97ms | 7.44ms | 63.48ms | 33.68ms | 17.67ms | 18.47ms |
| comp_1to1 | 27.90ms | 4.11ms | 62.05ms | 50.74ms | 13.02ms | 30.29ms |
| comp_2to1 | 8.03ms | 2.28ms | 44.45ms | 49.81ms | 17.16ms | 11.66ms |
| comp_4to1 | 2.94ms | 10.08ms | 16.73ms | 4.34ms | 12.38ms | 27.81ms |
| comp_1000to1 | 8μs | 3μs | 40μs | 16μs | 4μs | 16μs |
| comp_1to2 | 22.05ms | 17.41ms | 48.90ms | 28.19ms | 30.16ms | 35.06ms |
| comp_1to4 | 13.70ms | 7.31ms | 49.12ms | 14.77ms | 21.83ms | 18.99ms |
| comp_1to8 | 6.14ms | 4.30ms | 45.93ms | 19.28ms | 11.07ms | 21.25ms |
| comp_1to1000 | 4.18ms | 3.51ms | 41.71ms | 14.43ms | 6.61ms | 14.65ms |
| update_1to1 | 9.27ms | 5.36ms | 6.26ms | 15.55ms | 8.89ms | 25.85ms |
| update_2to1 | 4.86ms | 2.35ms | 3.08ms | 7.79ms | 4.43ms | 13.64ms |
| update_4to1 | 2.39ms | 1.26ms | 1.57ms | 3.88ms | 2.21ms | 7.19ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 69μs |
| update_1to2 | 4.79ms | 2.77ms | 3.06ms | 7.93ms | 4.39ms | 13.90ms |
| update_1to4 | 2.50ms | 1.29ms | 1.60ms | 3.91ms | 2.83ms | 6.93ms |
| update_1to1000 | 44μs | 30μs | 364μs | 147μs | 41μs | 162μs |
| cellx1000 | 9.65ms | 7.37ms | 7.18ms | 12.54ms | 9.70ms | 68.25ms |
| cellx2500 | 30.96ms | 19.36ms | 27.28ms | 32.64ms | 25.42ms | 244.57ms |
| cellx5000 | 60.45ms | 41.39ms | 78.73ms | 68.33ms | 70.33ms | 537.33ms |
| 10x5 - 2 sources - read 20.0% (simple) | 498.60ms | 237.76ms | 230.47ms | 345.03ms | 432.57ms | 1.89s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 277.40ms | 175.28ms | 196.29ms | 243.90ms | 264.01ms | 1.45s |
| 1000x12 - 4 sources - dynamic (large) | 3.78s | 273.02ms | 337.28ms | 456.07ms | 3.64s | 1.86s |
| 1000x5 - 25 sources (wide dense) | 3.26s | 403.87ms | 520.81ms | 596.29ms | 2.51s | 3.39s |
| 5x500 - 3 sources (deep) | 224.86ms | 189.09ms | 201.93ms | 255.45ms | 228.83ms | 1.09s |
| 100x15 - 6 sources - dynamic (very dynamic) | 462.01ms | 279.66ms | 256.02ms | 381.18ms | 446.31ms | 1.63s |

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
