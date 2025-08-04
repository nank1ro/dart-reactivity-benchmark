# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.68s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.40s |
| 🥉 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.39s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.37s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.23s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.43s |

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
| Test Case | state_beacon | mobx | solidart(2.0-dev) | preact_signals | signals | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 165.05ms (fail) | 2.35s | 271.83ms | 201.42ms | 209.72ms | 183.28ms |
| broadPropagation | 6.25ms (fail) | 4.47s | 508.18ms | 498.04ms | 451.06ms | 347.73ms |
| deepPropagation | 140.52ms (fail) | 1.57s | 169.04ms | 178.03ms | 171.44ms | 120.06ms |
| diamond | 189.04ms (fail) | 2.49s | 354.78ms | 299.97ms | 280.77ms | 229.62ms |
| mux | 200.65ms (fail) | 1.87s | 447.89ms | 404.96ms | 408.37ms | 369.15ms |
| repeatedObservers | 52.39ms (fail) | 240.56ms | 82.76ms | 41.39ms | 43.78ms | 45.26ms |
| triangle | 77.20ms (fail) | 781.48ms | 120.26ms | 100.81ms | 100.83ms | 83.62ms |
| unstable | 343.54ms (fail) | 355.08ms | 97.86ms | 72.85ms | 79.60ms | 67.78ms |
| molBench | 925μs | 584.83ms | 495.14ms | 488.39ms | 485.51ms | 483.81ms |
| create_signals | 58.62ms | 81.85ms | 99.15ms | 5.32ms | 27.76ms | 29.14ms |
| comp_0to1 | 52.68ms | 22.89ms | 39.67ms | 17.43ms | 11.83ms | 7.31ms |
| comp_1to1 | 55.59ms | 32.67ms | 55.43ms | 11.19ms | 29.29ms | 4.16ms |
| comp_2to1 | 35.81ms | 12.35ms | 47.39ms | 11.46ms | 9.76ms | 2.26ms |
| comp_4to1 | 16.06ms | 19.90ms | 13.84ms | 11.34ms | 1.97ms | 9.97ms |
| comp_1000to1 | 42μs | 35μs | 20μs | 5μs | 4μs | 6μs |
| comp_1to2 | 44.94ms | 33.52ms | 41.79ms | 22.42ms | 21.90ms | 17.56ms |
| comp_1to4 | 43.82ms | 29.80ms | 22.83ms | 34.09ms | 15.11ms | 7.75ms |
| comp_1to8 | 42.38ms | 23.97ms | 22.22ms | 5.97ms | 6.62ms | 7.38ms |
| comp_1to1000 | 38.62ms | 16.14ms | 19.08ms | 5.31ms | 4.12ms | 3.47ms |
| update_1to1 | 5.67ms | 23.54ms | 16.21ms | 8.61ms | 9.05ms | 10.22ms |
| update_2to1 | 3.12ms | 11.36ms | 7.86ms | 4.30ms | 4.48ms | 2.27ms |
| update_4to1 | 1.47ms | 6.24ms | 4.05ms | 2.17ms | 2.21ms | 2.52ms |
| update_1000to1 | 14μs | 71μs | 40μs | 21μs | 22μs | 24μs |
| update_1to2 | 2.86ms | 11.74ms | 7.99ms | 4.60ms | 4.47ms | 5.04ms |
| update_1to4 | 1.49ms | 5.77ms | 4.03ms | 2.20ms | 2.20ms | 2.45ms |
| update_1to1000 | 379μs | 186μs | 170μs | 856μs | 42μs | 46μs |
| cellx1000 | 6.09ms | 82.54ms | 12.01ms | 9.85ms | 9.73ms | 6.97ms |
| cellx2500 | 31.10ms | 293.87ms | 33.08ms | 30.03ms | 39.94ms | 18.90ms |
| cellx5000 | 74.62ms | 611.68ms | 92.74ms | 79.85ms | 80.44ms | 45.71ms |
| 10x5 - 2 sources - read 20.0% (simple) | 241.83ms | 2.07s | 363.05ms | 438.63ms | 516.52ms | 230.71ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 199.09ms | 1.57s | 251.32ms | 268.32ms | 279.80ms | 178.68ms |
| 1000x12 - 4 sources - dynamic (large) | 349.80ms | 2.01s | 457.06ms | 3.73s | 3.77s | 286.24ms |
| 1000x5 - 25 sources (wide dense) | 477.89ms | 3.65s | 593.17ms | 2.70s | 3.61s | 415.17ms |
| 5x500 - 3 sources (deep) | 204.58ms | 1.17s | 252.95ms | 228.96ms | 226.49ms | 192.27ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 266.73ms | 1.72s | 382.54ms | 453.11ms | 477.75ms | 266.03ms |

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
