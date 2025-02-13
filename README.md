# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.70s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 9.99s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.17s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.60s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.20s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.54s |

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
| Test Case | alien_signals | mobx | solidart | state_beacon | preact_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 185.35ms | 2.29s | 2.14s | 151.49ms (fail) | 206.57ms | 210.75ms |
| broadPropagation | 352.87ms | 4.25s | 5.32s | 6.17ms (fail) | 454.31ms | 459.52ms |
| deepPropagation | 122.75ms | 1.53s | 1.99s | 141.21ms (fail) | 177.31ms | 177.87ms |
| diamond | 233.55ms | 2.39s | 3.39s | 194.28ms (fail) | 282.39ms | 295.19ms |
| mux | 385.51ms | 1.86s | 2.03s | 190.85ms (fail) | 384.91ms | 412.67ms |
| repeatedObservers | 45.10ms | 224.68ms | 202.65ms | 52.10ms (fail) | 38.42ms | 46.39ms |
| triangle | 84.82ms | 780.18ms | 1.13s | 81.37ms (fail) | 98.68ms | 107.93ms |
| unstable | 60.24ms | 344.64ms | 336.67ms | 338.69ms (fail) | 70.69ms | 74.14ms |
| molBench | 489.86ms | 579.68ms | 1.70s | 1.19ms | 493.73ms | 486.48ms |
| create_signals | 28.32ms | 88.23ms | 79.70ms | 62.54ms | 4.62ms | 26.11ms |
| comp_0to1 | 8.08ms | 26.28ms | 32.56ms | 52.81ms | 17.52ms | 12.18ms |
| comp_1to1 | 4.25ms | 46.68ms | 47.67ms | 59.59ms | 11.74ms | 19.11ms |
| comp_2to1 | 2.34ms | 40.29ms | 32.62ms | 38.27ms | 17.23ms | 17.25ms |
| comp_4to1 | 10.78ms | 14.53ms | 12.03ms | 17.99ms | 11.50ms | 8.24ms |
| comp_1000to1 | 3μs | 15μs | 4.48ms | 57μs | 5μs | 6μs |
| comp_1to2 | 16.70ms | 34.75ms | 27.57ms | 49.25ms | 26.47ms | 20.95ms |
| comp_1to4 | 7.15ms | 17.52ms | 30.78ms | 44.37ms | 26.56ms | 12.03ms |
| comp_1to8 | 4.55ms | 20.53ms | 27.50ms | 50.64ms | 6.06ms | 7.00ms |
| comp_1to1000 | 3.60ms | 14.95ms | 20.04ms | 38.35ms | 6.23ms | 4.64ms |
| update_1to1 | 8.29ms | 25.21ms | 40.65ms | 5.92ms | 8.21ms | 9.23ms |
| update_2to1 | 5.05ms | 10.76ms | 20.82ms | 2.93ms | 4.05ms | 4.60ms |
| update_4to1 | 1.19ms | 6.64ms | 10.17ms | 1.48ms | 2.07ms | 2.31ms |
| update_1000to1 | 25μs | 65μs | 110μs | 15μs | 22μs | 22μs |
| update_1to2 | 5.16ms | 11.29ms | 20.50ms | 2.95ms | 4.10ms | 4.51ms |
| update_1to4 | 1.31ms | 7.09ms | 10.25ms | 1.47ms | 2.06ms | 2.27ms |
| update_1to1000 | 50μs | 169μs | 236μs | 375μs | 864μs | 44μs |
| cellx1000 | 7.46ms | 91.52ms | 175.20ms | 6.07ms | 10.22ms | 9.94ms |
| cellx2500 | 21.21ms | 280.68ms | 489.81ms | 26.64ms | 31.59ms | 41.40ms |
| cellx5000 | 46.20ms | 579.75ms | 1.22s | 80.19ms | 92.82ms | 96.45ms |
| 10x5 - 2 sources - read 20.0% (simple) | 226.34ms | 2.01s | 2.65s (partial) | 284.83ms | 438.84ms | 516.89ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 175.68ms | 1.54s | 2.41s (partial) | 227.58ms | 269.69ms | 281.33ms |
| 1000x12 - 4 sources - dynamic (large) | 282.95ms | 1.92s | 4.01s (partial) | 349.30ms | 3.54s | 3.74s |
| 1000x5 - 25 sources (wide dense) | 420.17ms | 3.64s | 4.85s (partial) | 499.56ms | 2.58s | 3.35s |
| 5x500 - 3 sources (deep) | 191.16ms | 1.15s | 1.98s (partial) | 203.66ms | 225.89ms | 225.56ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 263.35ms | 1.75s | 2.75s (partial) | 276.96ms | 442.91ms | 485.29ms |

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
