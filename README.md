# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.68s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.25s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.31s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.47s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.25s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.60s |

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
| Test Case | mobx | state_beacon | preact_signals | alien_signals | solidart(2.0-dev) | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.34s | 147.62ms (fail) | 201.14ms | 195.41ms | 266.14ms | 213.84ms |
| broadPropagation | 4.35s | 6.39ms (fail) | 468.94ms | 351.91ms | 501.49ms | 462.66ms |
| deepPropagation | 1.52s | 142.81ms (fail) | 176.56ms | 133.27ms | 164.85ms | 175.31ms |
| diamond | 2.38s | 210.86ms (fail) | 281.34ms | 236.42ms | 356.94ms | 283.66ms |
| mux | 1.81s | 199.39ms (fail) | 388.97ms | 377.35ms | 453.32ms | 407.57ms |
| repeatedObservers | 229.31ms | 52.38ms (fail) | 41.36ms | 43.77ms | 80.71ms | 45.98ms |
| triangle | 767.43ms | 83.30ms (fail) | 98.64ms | 86.06ms | 116.58ms | 104.03ms |
| unstable | 341.10ms | 341.19ms (fail) | 75.16ms | 60.08ms | 96.58ms | 75.69ms |
| molBench | 580.32ms | 1.12ms | 486.54ms | 486.20ms | 492.18ms | 486.19ms |
| create_signals | 80.94ms | 60.32ms | 5.71ms | 27.78ms | 51.60ms | 25.12ms |
| comp_0to1 | 15.91ms | 56.48ms | 17.26ms | 6.28ms | 24.82ms | 11.63ms |
| comp_1to1 | 52.23ms | 58.78ms | 10.85ms | 4.12ms | 33.60ms | 26.87ms |
| comp_2to1 | 22.52ms | 40.01ms | 19.81ms | 2.24ms | 23.47ms | 9.49ms |
| comp_4to1 | 27.10ms | 16.68ms | 13.11ms | 7.48ms | 28.07ms | 2.20ms |
| comp_1000to1 | 15μs | 46μs | 9μs | 3μs | 26μs | 5μs |
| comp_1to2 | 35.95ms | 49.56ms | 18.64ms | 10.36ms | 27.78ms | 20.05ms |
| comp_1to4 | 21.39ms | 48.28ms | 28.96ms | 11.46ms | 26.57ms | 9.45ms |
| comp_1to8 | 23.73ms | 47.84ms | 7.95ms | 5.98ms | 24.79ms | 6.25ms |
| comp_1to1000 | 15.36ms | 43.31ms | 7.36ms | 3.42ms | 14.89ms | 4.35ms |
| update_1to1 | 24.81ms | 7.54ms | 8.31ms | 9.96ms | 17.97ms | 10.14ms |
| update_2to1 | 13.25ms | 4.01ms | 4.46ms | 2.15ms | 9.30ms | 4.55ms |
| update_4to1 | 6.57ms | 1.92ms | 2.14ms | 2.47ms | 4.47ms | 2.54ms |
| update_1000to1 | 70μs | 16μs | 20μs | 26μs | 46μs | 25μs |
| update_1to2 | 12.63ms | 3.68ms | 4.11ms | 4.92ms | 9.12ms | 4.51ms |
| update_1to4 | 7.06ms | 1.93ms | 2.12ms | 2.42ms | 4.50ms | 2.58ms |
| update_1to1000 | 172μs | 425μs | 738μs | 47μs | 155μs | 72μs |
| cellx1000 | 79.23ms | 5.37ms | 9.57ms | 7.16ms | 12.03ms | 9.49ms |
| cellx2500 | 262.05ms | 25.71ms | 25.27ms | 19.19ms | 32.35ms | 30.64ms |
| cellx5000 | 570.06ms | 63.62ms | 62.17ms | 40.38ms | 72.47ms | 58.56ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.01s | 260.83ms | 521.13ms | 234.92ms | 347.89ms | 514.15ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.51s | 214.71ms | 337.35ms | 179.11ms | 250.30ms | 281.46ms |
| 1000x12 - 4 sources - dynamic (large) | 1.80s | 362.90ms | 3.70s | 278.57ms | 454.02ms | 3.74s |
| 1000x5 - 25 sources (wide dense) | 3.47s | 556.58ms | 2.73s | 401.84ms | 609.14ms | 3.57s |
| 5x500 - 3 sources (deep) | 1.14s | 204.27ms | 245.76ms | 190.49ms | 254.74ms | 223.55ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.72s | 276.92ms | 469.71ms | 259.25ms | 383.10ms | 483.24ms |

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
