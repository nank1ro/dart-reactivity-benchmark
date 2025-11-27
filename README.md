# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.31s |
| 🥈 | signals | 0.28 | 100.0% | 35/35 | 9.14s |
| 🥉 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 4.81s |
| 4 | preact_signals | 0.27 | 100.0% | 35/35 | 8.58s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.09s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.11s |

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
| avoidablePropagation | 197.51ms | 168.01ms | 136.01ms (fail) | 246.58ms | 183.37ms | 2.24s |
| broadPropagation | 385.40ms | 302.36ms | 5.87ms (fail) | 455.06ms | 397.69ms | 4.11s |
| deepPropagation | 170.72ms | 107.80ms | 150.62ms (fail) | 150.46ms | 174.89ms | 1.45s |
| diamond | 258.01ms | 234.75ms | 176.44ms (fail) | 348.18ms | 253.82ms | 2.28s |
| mux | 338.37ms | 330.78ms | 158.27ms (fail) | 380.71ms | 326.67ms | 1.73s |
| repeatedObservers | 39.09ms | 40.80ms | 48.21ms (fail) | 72.55ms | 32.73ms | 216.00ms |
| triangle | 92.82ms | 80.05ms | 74.72ms (fail) | 114.67ms | 92.61ms | 744.21ms |
| unstable | 64.68ms | 58.91ms | 326.26ms (fail) | 97.31ms | 56.82ms | 321.30ms |
| molBench | 390.10ms | 364.33ms | 851μs | 397.00ms | 363.13ms | 477.01ms |
| create_signals | 23.88ms | 34.40ms | 59.48ms | 75.66ms | 6.64ms | 45.12ms |
| comp_0to1 | 11.62ms | 11.62ms | 50.70ms | 26.43ms | 19.25ms | 15.27ms |
| comp_1to1 | 29.50ms | 5.52ms | 53.60ms | 37.87ms | 17.73ms | 41.06ms |
| comp_2to1 | 12.94ms | 2.99ms | 35.28ms | 13.64ms | 19.23ms | 24.87ms |
| comp_4to1 | 2.74ms | 8.38ms | 16.14ms | 12.62ms | 9.89ms | 15.94ms |
| comp_1000to1 | 5μs | 5μs | 47μs | 28μs | 8μs | 16μs |
| comp_1to2 | 18.40ms | 11.92ms | 45.72ms | 38.85ms | 25.94ms | 40.38ms |
| comp_1to4 | 11.91ms | 7.34ms | 45.02ms | 24.35ms | 25.46ms | 17.34ms |
| comp_1to8 | 9.64ms | 6.01ms | 43.56ms | 23.90ms | 7.32ms | 21.10ms |
| comp_1to1000 | 6.25ms | 4.46ms | 38.63ms | 15.60ms | 7.03ms | 14.40ms |
| update_1to1 | 8.55ms | 3.87ms | 4.68ms | 14.31ms | 8.17ms | 19.14ms |
| update_2to1 | 4.58ms | 2.13ms | 2.58ms | 7.17ms | 4.22ms | 9.99ms |
| update_4to1 | 2.18ms | 1.09ms | 1.21ms | 3.62ms | 2.17ms | 5.45ms |
| update_1000to1 | 22μs | 9μs | 12μs | 37μs | 19μs | 48μs |
| update_1to2 | 4.27ms | 2.01ms | 2.33ms | 7.22ms | 4.14ms | 9.71ms |
| update_1to4 | 2.21ms | 1.05ms | 1.20ms | 3.62ms | 1.83ms | 4.98ms |
| update_1to1000 | 80μs | 39μs | 392μs | 152μs | 607μs | 164μs |
| cellx1000 | 11.23ms | 8.48ms | 9.38ms | 16.12ms | 9.92ms | 84.30ms |
| cellx2500 | 34.21ms | 24.70ms | 29.80ms | 43.65ms | 24.82ms | 250.35ms |
| cellx5000 | 73.71ms | 54.00ms | 111.94ms | 91.38ms | 69.17ms | 565.28ms |
| 10x5 - 2 sources - read 20.0% (simple) | 419.49ms | 228.09ms | 227.05ms | 359.23ms | 384.79ms | 1.99s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 237.68ms | 172.39ms | 174.49ms | 251.95ms | 233.42ms | 1.48s |
| 1000x12 - 4 sources - dynamic (large) | 3.10s | 251.78ms | 274.38ms | 367.14ms | 2.96s | 1.70s |
| 1000x5 - 25 sources (wide dense) | 2.57s | 354.55ms | 379.55ms | 539.59ms | 2.26s | 3.36s |
| 5x500 - 3 sources (deep) | 212.53ms | 204.76ms | 205.84ms | 271.44ms | 219.41ms | 1.16s |
| 100x15 - 6 sources - dynamic (very dynamic) | 392.60ms | 223.03ms | 217.43ms | 303.40ms | 374.39ms | 1.64s |

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
