# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.29s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.36s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.39s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.07s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.57s |

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
| Test Case | preact_signals | state_beacon | solidart(2.0-dev) | signals | alien_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 210.58ms | 163.82ms (fail) | 264.37ms | 217.75ms | 196.82ms | 2.33s |
| broadPropagation | 459.62ms | 7.16ms (fail) | 493.93ms | 463.49ms | 354.20ms | 4.26s |
| deepPropagation | 182.73ms | 146.43ms (fail) | 165.84ms | 182.17ms | 129.15ms | 1.52s |
| diamond | 282.90ms | 206.60ms (fail) | 357.66ms | 285.81ms | 237.90ms | 2.42s |
| mux | 395.61ms | 191.24ms (fail) | 436.05ms | 410.79ms | 374.68ms | 1.82s |
| repeatedObservers | 41.01ms | 53.53ms (fail) | 81.63ms | 46.34ms | 43.72ms | 232.20ms |
| triangle | 99.54ms | 81.52ms (fail) | 113.64ms | 104.06ms | 90.64ms | 758.76ms |
| unstable | 73.79ms | 372.55ms (fail) | 95.11ms | 76.01ms | 60.56ms | 344.41ms |
| molBench | 487.68ms | 970μs | 500.27ms | 487.78ms | 489.52ms | 581.52ms |
| create_signals | 5.21ms | 70.33ms | 75.15ms | 26.31ms | 21.80ms | 50.54ms |
| comp_0to1 | 17.75ms | 59.96ms | 25.42ms | 11.77ms | 7.63ms | 19.11ms |
| comp_1to1 | 12.75ms | 63.53ms | 52.13ms | 26.86ms | 4.14ms | 31.16ms |
| comp_2to1 | 10.11ms | 38.41ms | 22.75ms | 8.67ms | 2.27ms | 11.68ms |
| comp_4to1 | 7.91ms | 16.73ms | 8.80ms | 1.90ms | 8.68ms | 20.02ms |
| comp_1000to1 | 10μs | 44μs | 27μs | 5μs | 3μs | 22μs |
| comp_1to2 | 24.74ms | 47.81ms | 39.88ms | 20.14ms | 16.10ms | 41.10ms |
| comp_1to4 | 33.91ms | 45.92ms | 19.77ms | 12.85ms | 6.41ms | 24.83ms |
| comp_1to8 | 8.06ms | 45.45ms | 23.25ms | 6.47ms | 6.29ms | 24.45ms |
| comp_1to1000 | 7.11ms | 41.52ms | 14.38ms | 4.30ms | 3.38ms | 15.44ms |
| update_1to1 | 8.65ms | 6.01ms | 16.57ms | 11.31ms | 10.12ms | 27.06ms |
| update_2to1 | 4.54ms | 3.12ms | 8.10ms | 5.08ms | 2.13ms | 13.66ms |
| update_4to1 | 2.19ms | 1.54ms | 4.09ms | 2.78ms | 2.52ms | 7.13ms |
| update_1000to1 | 27μs | 15μs | 40μs | 29μs | 16μs | 70μs |
| update_1to2 | 4.29ms | 3.01ms | 8.27ms | 4.99ms | 4.97ms | 14.16ms |
| update_1to4 | 2.17ms | 1.56ms | 4.17ms | 3.05ms | 2.10ms | 6.98ms |
| update_1to1000 | 857μs | 422μs | 150μs | 67μs | 35μs | 180μs |
| cellx1000 | 9.66ms | 5.79ms | 12.01ms | 9.69ms | 7.24ms | 68.89ms |
| cellx2500 | 26.20ms | 32.29ms | 32.39ms | 34.88ms | 19.53ms | 245.47ms |
| cellx5000 | 78.24ms | 78.47ms | 84.58ms | 67.50ms | 42.76ms | 548.44ms |
| 10x5 - 2 sources - read 20.0% (simple) | 440.85ms | 260.88ms | 359.54ms | 509.35ms | 236.32ms | 1.99s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 274.72ms | 201.38ms | 253.83ms | 286.51ms | 180.55ms | 1.49s |
| 1000x12 - 4 sources - dynamic (large) | 3.77s | 341.68ms | 467.08ms | 3.79s | 287.44ms | 1.88s |
| 1000x5 - 25 sources (wide dense) | 2.72s | 513.32ms | 609.28ms | 3.53s | 413.86ms | 3.46s |
| 5x500 - 3 sources (deep) | 229.68ms | 206.56ms | 251.53ms | 224.14ms | 195.86ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 458.23ms | 263.19ms | 389.92ms | 484.14ms | 263.51ms | 1.66s |

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
