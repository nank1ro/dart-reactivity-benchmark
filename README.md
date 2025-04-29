# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.65 | 100.0% | 35/35 | 3.74s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.00s |
| 🥉 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.28s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.20s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.76s |
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
| Test Case | solidart(2.0-dev) | preact_signals | alien_signals | state_beacon | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 273.81ms | 205.38ms | 187.59ms | 161.87ms (fail) | 2.34s | 216.51ms |
| broadPropagation | 504.39ms | 460.41ms | 359.58ms | 6.37ms (fail) | 4.25s | 462.01ms |
| deepPropagation | 175.89ms | 178.40ms | 125.99ms | 141.76ms (fail) | 1.54s | 169.54ms |
| diamond | 350.65ms | 279.30ms | 233.56ms | 193.95ms (fail) | 2.43s | 284.76ms |
| mux | 441.82ms | 386.25ms | 376.66ms | 190.89ms (fail) | 1.85s | 408.80ms |
| repeatedObservers | 78.67ms | 38.40ms | 45.41ms | 53.25ms (fail) | 230.16ms | 46.42ms |
| triangle | 129.59ms | 99.10ms | 85.79ms | 77.75ms (fail) | 769.06ms | 103.14ms |
| unstable | 94.29ms | 70.66ms | 59.77ms | 338.63ms (fail) | 356.45ms | 73.07ms |
| molBench | 493.42ms | 491.70ms | 490.58ms | 1.07ms | 580.33ms | 488.81ms |
| create_signals | 56.23ms | 4.63ms | 28.08ms | 59.48ms | 68.08ms | 25.22ms |
| comp_0to1 | 25.19ms | 17.66ms | 7.90ms | 52.10ms | 26.73ms | 12.44ms |
| comp_1to1 | 44.67ms | 10.99ms | 4.18ms | 53.20ms | 39.54ms | 26.52ms |
| comp_2to1 | 24.91ms | 13.45ms | 2.29ms | 43.18ms | 35.92ms | 9.85ms |
| comp_4to1 | 10.59ms | 12.04ms | 10.77ms | 15.72ms | 17.40ms | 1.92ms |
| comp_1000to1 | 15μs | 5μs | 3μs | 41μs | 15μs | 5μs |
| comp_1to2 | 30.97ms | 29.76ms | 11.42ms | 44.61ms | 36.53ms | 20.22ms |
| comp_1to4 | 20.07ms | 20.13ms | 11.60ms | 43.38ms | 20.81ms | 11.02ms |
| comp_1to8 | 21.98ms | 9.86ms | 5.22ms | 42.58ms | 22.17ms | 9.05ms |
| comp_1to1000 | 14.73ms | 4.37ms | 3.50ms | 37.89ms | 15.00ms | 6.11ms |
| update_1to1 | 16.19ms | 8.18ms | 11.41ms | 5.73ms | 24.47ms | 9.91ms |
| update_2to1 | 7.94ms | 4.10ms | 5.05ms | 2.89ms | 10.68ms | 4.58ms |
| update_4to1 | 4.03ms | 2.19ms | 2.78ms | 1.43ms | 6.31ms | 2.32ms |
| update_1000to1 | 40μs | 20μs | 10μs | 15μs | 68μs | 22μs |
| update_1to2 | 8.11ms | 4.07ms | 5.34ms | 2.94ms | 12.64ms | 4.89ms |
| update_1to4 | 4.05ms | 2.07ms | 2.46ms | 1.43ms | 5.55ms | 2.31ms |
| update_1to1000 | 153μs | 63μs | 48μs | 382μs | 168μs | 44μs |
| cellx1000 | 11.88ms | 12.12ms | 8.50ms | 5.14ms | 72.13ms | 9.51ms |
| cellx2500 | 38.16ms | 26.41ms | 22.46ms | 23.79ms | 272.89ms | 30.85ms |
| cellx5000 | 91.30ms | 68.08ms | 56.49ms | 58.27ms | 611.59ms | 60.92ms |
| 10x5 - 2 sources - read 20.0% (simple) | 356.89ms | 444.06ms | 237.39ms | 244.06ms | 2.00s | 506.97ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 242.88ms | 271.13ms | 177.17ms | 200.66ms | 1.58s | 278.14ms |
| 1000x12 - 4 sources - dynamic (large) | 466.10ms | 3.54s | 285.69ms | 328.96ms | 1.94s | 3.74s |
| 1000x5 - 25 sources (wide dense) | 596.05ms | 2.61s | 418.36ms | 489.69ms | 3.62s | 3.47s |
| 5x500 - 3 sources (deep) | 256.18ms | 228.97ms | 191.79ms | 205.82ms | 1.20s | 227.37ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 384.26ms | 448.09ms | 263.70ms | 258.27ms | 1.79s | 473.03ms |

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
