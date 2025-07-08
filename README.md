# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.65s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.28s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.51s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.19s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.60s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.49s |

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
| Test Case | solidart(2.0-dev) | state_beacon | preact_signals | signals | mobx | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 273.93ms | 148.58ms (fail) | 201.09ms | 209.16ms | 2.34s | 182.49ms |
| broadPropagation | 500.24ms | 6.02ms (fail) | 447.57ms | 465.09ms | 4.40s | 343.81ms |
| deepPropagation | 171.29ms | 141.56ms (fail) | 178.50ms | 171.91ms | 1.58s | 120.93ms |
| diamond | 351.56ms | 192.96ms (fail) | 277.93ms | 281.12ms | 2.44s | 231.19ms |
| mux | 443.17ms | 195.43ms (fail) | 402.23ms | 457.29ms | 1.86s | 373.61ms |
| repeatedObservers | 81.47ms | 52.29ms (fail) | 40.00ms | 44.60ms | 230.28ms | 45.23ms |
| triangle | 117.36ms | 76.46ms (fail) | 97.38ms | 102.18ms | 772.01ms | 87.57ms |
| unstable | 97.92ms | 336.97ms (fail) | 69.66ms | 79.26ms | 351.97ms | 67.93ms |
| molBench | 492.84ms | 933μs | 483.08ms | 486.28ms | 570.70ms | 485.20ms |
| create_signals | 76.81ms | 70.31ms | 5.16ms | 25.85ms | 74.38ms | 22.06ms |
| comp_0to1 | 27.13ms | 62.95ms | 23.03ms | 11.38ms | 26.43ms | 9.36ms |
| comp_1to1 | 51.94ms | 64.38ms | 13.85ms | 32.54ms | 28.54ms | 4.35ms |
| comp_2to1 | 43.73ms | 40.02ms | 17.98ms | 9.01ms | 9.48ms | 2.34ms |
| comp_4to1 | 20.37ms | 17.14ms | 10.57ms | 2.85ms | 29.38ms | 7.59ms |
| comp_1000to1 | 17μs | 42μs | 8μs | 7μs | 18μs | 5μs |
| comp_1to2 | 34.35ms | 45.72ms | 18.21ms | 21.43ms | 41.64ms | 9.84ms |
| comp_1to4 | 17.54ms | 44.02ms | 30.54ms | 7.47ms | 24.48ms | 15.70ms |
| comp_1to8 | 22.20ms | 44.27ms | 8.08ms | 7.34ms | 25.85ms | 4.77ms |
| comp_1to1000 | 18.75ms | 39.01ms | 6.11ms | 4.18ms | 16.32ms | 3.44ms |
| update_1to1 | 15.94ms | 5.65ms | 8.74ms | 9.02ms | 25.10ms | 10.38ms |
| update_2to1 | 7.81ms | 3.14ms | 4.22ms | 4.47ms | 12.51ms | 2.30ms |
| update_4to1 | 3.98ms | 1.46ms | 2.30ms | 2.25ms | 7.30ms | 2.59ms |
| update_1000to1 | 40μs | 15μs | 21μs | 22μs | 68μs | 26μs |
| update_1to2 | 7.99ms | 2.89ms | 4.62ms | 4.48ms | 12.91ms | 5.17ms |
| update_1to4 | 3.99ms | 1.47ms | 2.17ms | 2.21ms | 6.08ms | 2.56ms |
| update_1to1000 | 171μs | 380μs | 840μs | 43μs | 173μs | 47μs |
| cellx1000 | 11.92ms | 8.23ms | 9.93ms | 13.58ms | 79.48ms | 8.24ms |
| cellx2500 | 34.77ms | 42.20ms | 27.62ms | 41.02ms | 302.66ms | 19.73ms |
| cellx5000 | 77.10ms | 107.72ms | 78.01ms | 69.63ms | 612.93ms | 41.61ms |
| 10x5 - 2 sources - read 20.0% (simple) | 363.25ms | 246.81ms | 437.80ms | 557.15ms | 2.04s | 230.80ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 243.93ms | 199.18ms | 271.79ms | 294.30ms | 1.49s | 173.14ms |
| 1000x12 - 4 sources - dynamic (large) | 457.23ms | 347.19ms | 3.61s | 3.84s | 1.85s | 276.21ms |
| 1000x5 - 25 sources (wide dense) | 584.70ms | 481.39ms | 2.72s | 3.54s | 3.50s | 404.54ms |
| 5x500 - 3 sources (deep) | 245.00ms | 208.01ms | 229.28ms | 225.38ms | 1.17s | 187.82ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 378.97ms | 256.46ms | 453.12ms | 486.89ms | 1.68s | 265.18ms |

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
