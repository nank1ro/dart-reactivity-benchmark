# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.28s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.00s |
| 4 | preact_signals | 0.27 | 100.0% | 35/35 | 9.99s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.33s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.48s |

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
| avoidablePropagation | 186.70ms | 2.30s | 275.69ms | 154.77ms (fail) | 205.05ms | 209.52ms |
| broadPropagation | 355.23ms | 4.32s | 508.40ms | 5.93ms (fail) | 453.93ms | 463.45ms |
| deepPropagation | 124.60ms | 1.54s | 178.35ms | 143.21ms (fail) | 175.94ms | 176.51ms |
| diamond | 236.78ms | 2.37s | 354.55ms | 191.91ms (fail) | 281.24ms | 286.01ms |
| mux | 370.45ms | 1.88s | 436.82ms | 190.31ms (fail) | 382.06ms | 415.74ms |
| repeatedObservers | 45.99ms | 225.98ms | 77.96ms | 52.24ms (fail) | 38.02ms | 46.67ms |
| triangle | 84.60ms | 777.30ms | 118.20ms | 79.98ms (fail) | 98.16ms | 102.55ms |
| unstable | 61.13ms | 352.25ms | 93.76ms | 337.64ms (fail) | 69.63ms | 74.98ms |
| molBench | 491.47ms | 577.89ms | 492.77ms | 1.13ms | 496.82ms | 486.29ms |
| create_signals | 23.19ms | 56.52ms | 72.67ms | 65.06ms | 4.68ms | 24.55ms |
| comp_0to1 | 7.67ms | 18.74ms | 25.52ms | 56.30ms | 17.48ms | 11.79ms |
| comp_1to1 | 4.25ms | 30.68ms | 37.02ms | 58.51ms | 11.02ms | 26.88ms |
| comp_2to1 | 2.28ms | 8.93ms | 29.32ms | 38.53ms | 22.81ms | 12.38ms |
| comp_4to1 | 10.73ms | 25.49ms | 14.64ms | 16.14ms | 8.99ms | 2.87ms |
| comp_1000to1 | 4μs | 15μs | 21μs | 42μs | 5μs | 5μs |
| comp_1to2 | 17.63ms | 33.17ms | 27.03ms | 47.26ms | 17.69ms | 13.34ms |
| comp_1to4 | 11.50ms | 30.03ms | 20.74ms | 42.96ms | 23.61ms | 11.70ms |
| comp_1to8 | 4.13ms | 19.40ms | 23.46ms | 42.04ms | 5.89ms | 6.88ms |
| comp_1to1000 | 3.44ms | 15.07ms | 14.76ms | 37.81ms | 6.66ms | 4.59ms |
| update_1to1 | 11.35ms | 25.67ms | 16.10ms | 5.73ms | 8.20ms | 9.24ms |
| update_2to1 | 5.05ms | 12.37ms | 7.91ms | 2.90ms | 4.05ms | 4.58ms |
| update_4to1 | 2.82ms | 6.21ms | 4.04ms | 1.48ms | 2.06ms | 2.33ms |
| update_1000to1 | 10μs | 63μs | 41μs | 15μs | 20μs | 22μs |
| update_1to2 | 5.65ms | 12.65ms | 8.14ms | 2.96ms | 4.07ms | 4.92ms |
| update_1to4 | 2.43ms | 6.06ms | 4.04ms | 1.48ms | 2.06ms | 2.32ms |
| update_1to1000 | 47μs | 160μs | 151μs | 365μs | 806μs | 43μs |
| cellx1000 | 7.25ms | 79.69ms | 12.80ms | 5.58ms | 9.54ms | 9.45ms |
| cellx2500 | 19.19ms | 236.66ms | 40.35ms | 26.91ms | 28.32ms | 32.56ms |
| cellx5000 | 42.53ms | 588.31ms | 91.15ms | 57.29ms | 69.34ms | 62.81ms |
| 10x5 - 2 sources - read 20.0% (simple) | 235.85ms | 2.03s | 353.64ms | 258.79ms | 440.79ms | 500.24ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 176.63ms | 1.55s | 243.76ms | 221.30ms | 271.34ms | 278.11ms |
| 1000x12 - 4 sources - dynamic (large) | 275.68ms | 1.78s | 465.07ms | 348.32ms | 3.53s | 3.76s |
| 1000x5 - 25 sources (wide dense) | 408.48ms | 3.56s | 593.26ms | 516.06ms | 2.62s | 3.24s |
| 5x500 - 3 sources (deep) | 192.39ms | 1.15s | 258.99ms | 207.25ms | 227.63ms | 229.10ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 260.36ms | 1.73s | 383.78ms | 262.99ms | 452.19ms | 485.57ms |

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
