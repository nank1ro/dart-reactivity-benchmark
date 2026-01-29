# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.66s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.21s |
| 🥉 | preact_signals | 0.25 | 100.0% | 35/35 | 9.99s |
| 4 | signals | 0.24 | 100.0% | 35/35 | 11.22s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 26.91s |
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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 209.30ms | 187.85ms | 151.90ms (fail) | 276.00ms | 207.22ms | 2.35s |
| broadPropagation | 451.80ms | 353.84ms | 6.38ms (fail) | 510.51ms | 446.95ms | 4.39s |
| deepPropagation | 175.28ms | 126.59ms | 140.28ms (fail) | 170.18ms | 175.37ms | 1.49s |
| diamond | 288.66ms | 229.59ms | 198.87ms (fail) | 353.29ms | 291.82ms | 2.36s |
| mux | 395.69ms | 363.06ms | 180.40ms (fail) | 418.47ms | 375.23ms | 1.86s |
| repeatedObservers | 46.15ms | 43.80ms | 52.39ms (fail) | 81.05ms | 40.47ms | 226.79ms |
| triangle | 105.67ms | 83.51ms | 76.14ms (fail) | 114.82ms | 101.26ms | 745.11ms |
| unstable | 77.94ms | 62.30ms | 336.58ms (fail) | 96.39ms | 70.08ms | 345.56ms |
| molBench | 495.68ms | 485.05ms | 968μs | 490.30ms | 486.90ms | 589.10ms |
| create_signals | 30.38ms | 28.61ms | 61.37ms | 54.09ms | 5.32ms | 67.65ms |
| comp_0to1 | 13.62ms | 6.98ms | 51.42ms | 25.06ms | 17.70ms | 15.69ms |
| comp_1to1 | 32.64ms | 4.10ms | 52.93ms | 35.32ms | 12.56ms | 40.10ms |
| comp_2to1 | 12.48ms | 2.28ms | 41.39ms | 24.33ms | 16.00ms | 32.01ms |
| comp_4to1 | 2.00ms | 8.31ms | 15.92ms | 12.02ms | 14.40ms | 24.78ms |
| comp_1000to1 | 8μs | 3μs | 41μs | 18μs | 4μs | 19μs |
| comp_1to2 | 22.78ms | 19.40ms | 44.29ms | 37.63ms | 18.17ms | 30.17ms |
| comp_1to4 | 12.58ms | 5.16ms | 44.11ms | 21.22ms | 36.29ms | 29.29ms |
| comp_1to8 | 6.55ms | 4.80ms | 41.97ms | 20.75ms | 8.79ms | 21.23ms |
| comp_1to1000 | 4.25ms | 3.31ms | 38.27ms | 14.57ms | 5.04ms | 15.53ms |
| update_1to1 | 9.29ms | 4.62ms | 6.10ms | 15.47ms | 8.68ms | 25.72ms |
| update_2to1 | 4.69ms | 2.36ms | 3.10ms | 7.74ms | 4.30ms | 13.69ms |
| update_4to1 | 2.39ms | 1.23ms | 1.54ms | 3.87ms | 2.22ms | 6.96ms |
| update_1000to1 | 23μs | 11μs | 16μs | 38μs | 22μs | 68μs |
| update_1to2 | 4.66ms | 2.28ms | 3.05ms | 7.91ms | 4.36ms | 14.16ms |
| update_1to4 | 2.55ms | 1.21ms | 1.58ms | 3.84ms | 2.26ms | 6.76ms |
| update_1to1000 | 43μs | 48μs | 364μs | 145μs | 157μs | 159μs |
| cellx1000 | 9.47ms | 9.29ms | 5.34ms | 14.24ms | 9.43ms | 78.64ms |
| cellx2500 | 30.98ms | 20.41ms | 22.23ms | 32.95ms | 25.91ms | 238.42ms |
| cellx5000 | 59.10ms | 44.06ms | 56.54ms | 96.00ms | 68.05ms | 579.12ms |
| 10x5 - 2 sources - read 20.0% (simple) | 505.45ms | 235.41ms | 234.47ms | 343.39ms | 433.93ms | 1.95s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 276.44ms | 173.59ms | 195.86ms | 243.91ms | 266.24ms | 1.45s |
| 1000x12 - 4 sources - dynamic (large) | 3.83s | 278.07ms | 340.81ms | 463.33ms | 3.65s | 1.73s |
| 1000x5 - 25 sources (wide dense) | 3.41s | 409.97ms | 518.55ms | 588.38ms | 2.50s | 3.44s |
| 5x500 - 3 sources (deep) | 225.27ms | 196.37ms | 201.37ms | 253.29ms | 226.33ms | 1.08s |
| 100x15 - 6 sources - dynamic (very dynamic) | 474.65ms | 263.03ms | 260.08ms | 377.68ms | 456.43ms | 1.68s |

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
