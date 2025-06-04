# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.30s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.40s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.25s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.13s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.42s |

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
| Test Case | state_beacon | alien_signals | mobx | solidart(2.0-dev) | signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 160.59ms (fail) | 183.98ms | 2.35s | 273.83ms | 207.64ms | 201.84ms |
| broadPropagation | 7.16ms (fail) | 346.31ms | 4.59s | 509.17ms | 452.90ms | 464.10ms |
| deepPropagation | 137.93ms (fail) | 122.64ms | 1.57s | 167.98ms | 169.53ms | 176.12ms |
| diamond | 196.84ms (fail) | 230.84ms | 2.50s | 356.38ms | 277.61ms | 280.22ms |
| mux | 197.21ms (fail) | 374.86ms | 1.89s | 444.87ms | 449.54ms | 402.57ms |
| repeatedObservers | 52.77ms (fail) | 45.18ms | 235.53ms | 81.65ms | 44.84ms | 39.78ms |
| triangle | 78.61ms (fail) | 81.67ms | 770.44ms | 119.28ms | 101.81ms | 97.60ms |
| unstable | 336.21ms (fail) | 66.61ms | 353.84ms | 97.59ms | 79.12ms | 69.72ms |
| molBench | 937μs | 485.75ms | 572.11ms | 493.63ms | 486.39ms | 486.52ms |
| create_signals | 67.08ms | 27.40ms | 52.17ms | 77.39ms | 25.40ms | 5.20ms |
| comp_0to1 | 53.18ms | 7.80ms | 19.50ms | 28.48ms | 11.47ms | 17.46ms |
| comp_1to1 | 55.09ms | 4.27ms | 18.85ms | 47.37ms | 26.03ms | 14.43ms |
| comp_2to1 | 36.11ms | 2.37ms | 19.05ms | 38.72ms | 18.57ms | 15.96ms |
| comp_4to1 | 16.10ms | 7.62ms | 28.18ms | 5.08ms | 1.94ms | 14.50ms |
| comp_1000to1 | 45μs | 4μs | 17μs | 21μs | 4μs | 4μs |
| comp_1to2 | 46.47ms | 10.18ms | 37.26ms | 37.65ms | 19.18ms | 15.53ms |
| comp_1to4 | 43.79ms | 15.85ms | 25.29ms | 17.36ms | 11.13ms | 27.11ms |
| comp_1to8 | 42.56ms | 5.08ms | 22.35ms | 22.13ms | 8.48ms | 7.16ms |
| comp_1to1000 | 38.76ms | 3.44ms | 16.02ms | 17.01ms | 4.17ms | 5.86ms |
| update_1to1 | 5.68ms | 10.49ms | 27.73ms | 15.97ms | 9.01ms | 8.69ms |
| update_2to1 | 3.11ms | 2.30ms | 13.28ms | 7.79ms | 4.47ms | 4.26ms |
| update_4to1 | 1.45ms | 2.53ms | 6.62ms | 4.05ms | 2.23ms | 2.38ms |
| update_1000to1 | 15μs | 27μs | 70μs | 39μs | 22μs | 21μs |
| update_1to2 | 2.87ms | 3.78ms | 11.17ms | 8.02ms | 4.47ms | 4.66ms |
| update_1to4 | 1.46ms | 2.48ms | 5.91ms | 3.99ms | 2.21ms | 2.16ms |
| update_1to1000 | 375μs | 30μs | 173μs | 170μs | 43μs | 906μs |
| cellx1000 | 6.54ms | 8.56ms | 72.50ms | 12.17ms | 9.54ms | 9.73ms |
| cellx2500 | 24.85ms | 19.32ms | 263.81ms | 34.51ms | 31.70ms | 26.18ms |
| cellx5000 | 58.44ms | 42.47ms | 583.73ms | 74.47ms | 63.59ms | 66.83ms |
| 10x5 - 2 sources - read 20.0% (simple) | 253.60ms | 290.14ms | 2.05s | 375.42ms | 510.40ms | 444.67ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 201.77ms | 177.61ms | 1.54s | 249.46ms | 281.76ms | 269.54ms |
| 1000x12 - 4 sources - dynamic (large) | 330.74ms | 271.97ms | 1.94s | 457.94ms | 3.96s | 3.68s |
| 1000x5 - 25 sources (wide dense) | 500.56ms | 404.20ms | 3.59s | 592.75ms | 3.42s | 2.72s |
| 5x500 - 3 sources (deep) | 203.68ms | 188.48ms | 1.16s | 251.55ms | 223.98ms | 222.77ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 257.56ms | 263.10ms | 1.79s | 379.57ms | 483.81ms | 448.37ms |

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
