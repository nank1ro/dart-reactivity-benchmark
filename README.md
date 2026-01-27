# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.65s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.24s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.42s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.08s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.19s |
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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 230.22ms | 188.44ms | 144.53ms (fail) | 277.10ms | 207.27ms | 2.37s |
| broadPropagation | 466.33ms | 354.60ms | 6.13ms (fail) | 498.20ms | 465.24ms | 4.43s |
| deepPropagation | 176.80ms | 132.68ms | 140.52ms (fail) | 169.96ms | 179.05ms | 1.50s |
| diamond | 295.60ms | 232.50ms | 181.19ms (fail) | 356.26ms | 279.44ms | 2.37s |
| mux | 389.03ms | 354.68ms | 182.52ms (fail) | 424.38ms | 379.23ms | 1.86s |
| repeatedObservers | 47.86ms | 43.61ms | 52.49ms (fail) | 81.17ms | 40.79ms | 227.20ms |
| triangle | 105.56ms | 84.63ms | 76.99ms (fail) | 115.84ms | 105.99ms | 753.48ms |
| unstable | 79.78ms | 63.59ms | 335.19ms (fail) | 96.91ms | 70.28ms | 345.76ms |
| molBench | 495.60ms | 485.08ms | 923μs | 490.31ms | 488.70ms | 588.47ms |
| create_signals | 26.17ms | 23.43ms | 65.58ms | 76.70ms | 5.44ms | 69.95ms |
| comp_0to1 | 11.84ms | 10.53ms | 50.93ms | 26.27ms | 18.36ms | 28.42ms |
| comp_1to1 | 20.85ms | 4.33ms | 60.23ms | 43.59ms | 13.39ms | 37.35ms |
| comp_2to1 | 9.52ms | 2.42ms | 43.97ms | 16.42ms | 18.97ms | 39.51ms |
| comp_4to1 | 2.16ms | 7.90ms | 17.25ms | 8.98ms | 9.09ms | 15.16ms |
| comp_1000to1 | 6μs | 4μs | 40μs | 19μs | 7μs | 16μs |
| comp_1to2 | 14.62ms | 10.94ms | 45.31ms | 36.54ms | 30.91ms | 36.21ms |
| comp_1to4 | 7.39ms | 12.20ms | 49.86ms | 17.14ms | 30.99ms | 23.02ms |
| comp_1to8 | 7.09ms | 5.13ms | 42.42ms | 22.35ms | 8.47ms | 24.35ms |
| comp_1to1000 | 4.51ms | 3.75ms | 37.95ms | 14.59ms | 9.52ms | 15.66ms |
| update_1to1 | 9.35ms | 4.66ms | 6.12ms | 15.50ms | 8.88ms | 20.66ms |
| update_2to1 | 4.70ms | 2.41ms | 3.47ms | 7.78ms | 4.42ms | 10.24ms |
| update_4to1 | 2.36ms | 1.28ms | 1.52ms | 3.87ms | 2.20ms | 5.46ms |
| update_1000to1 | 23μs | 26μs | 16μs | 39μs | 22μs | 51μs |
| update_1to2 | 4.70ms | 2.28ms | 3.09ms | 7.92ms | 4.33ms | 10.16ms |
| update_1to4 | 2.55ms | 1.31ms | 1.63ms | 3.87ms | 2.28ms | 5.12ms |
| update_1to1000 | 45μs | 52μs | 366μs | 145μs | 1.38ms | 156μs |
| cellx1000 | 11.66ms | 7.32ms | 5.92ms | 14.87ms | 9.90ms | 79.39ms |
| cellx2500 | 34.17ms | 20.88ms | 26.33ms | 34.27ms | 25.69ms | 266.37ms |
| cellx5000 | 74.60ms | 44.29ms | 63.72ms | 83.05ms | 64.80ms | 603.01ms |
| 10x5 - 2 sources - read 20.0% (simple) | 501.38ms | 232.99ms | 241.70ms | 344.54ms | 446.58ms | 1.95s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 277.61ms | 178.03ms | 196.10ms | 249.96ms | 268.77ms | 1.47s |
| 1000x12 - 4 sources - dynamic (large) | 3.86s | 275.60ms | 339.38ms | 465.26ms | 3.66s | 1.83s |
| 1000x5 - 25 sources (wide dense) | 3.54s | 407.80ms | 523.09ms | 597.52ms | 2.55s | 3.45s |
| 5x500 - 3 sources (deep) | 227.53ms | 191.34ms | 205.17ms | 254.80ms | 227.20ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 475.81ms | 258.32ms | 252.19ms | 383.31ms | 442.36ms | 1.67s |

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
