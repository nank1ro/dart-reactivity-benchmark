# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.73s |
| 🥈 | preact_signals | 0.31 | 100.0% | 35/35 | 9.93s |
| 🥉 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.28s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.46s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.31s |
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
| Test Case | solidart(2.0-dev) | preact_signals | alien_signals | state_beacon | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 275.37ms | 205.95ms | 186.34ms | 155.87ms (fail) | 2.33s | 207.82ms |
| broadPropagation | 510.86ms | 454.10ms | 359.88ms | 6.34ms (fail) | 4.23s | 454.74ms |
| deepPropagation | 171.61ms | 176.90ms | 128.03ms | 138.05ms (fail) | 1.51s | 173.51ms |
| diamond | 357.13ms | 284.31ms | 237.10ms | 199.36ms (fail) | 2.40s | 289.05ms |
| mux | 443.62ms | 385.67ms | 376.41ms | 189.96ms (fail) | 1.81s | 407.82ms |
| repeatedObservers | 78.23ms | 39.07ms | 45.12ms | 53.16ms (fail) | 230.85ms | 46.35ms |
| triangle | 117.71ms | 100.87ms | 85.44ms | 78.72ms (fail) | 775.31ms | 101.68ms |
| unstable | 95.06ms | 70.67ms | 60.34ms | 339.08ms (fail) | 343.48ms | 74.77ms |
| molBench | 493.46ms | 492.03ms | 491.98ms | 1.19ms | 576.57ms | 486.15ms |
| create_signals | 79.18ms | 5.31ms | 26.78ms | 69.61ms | 68.99ms | 26.10ms |
| comp_0to1 | 45.71ms | 17.60ms | 6.03ms | 55.08ms | 26.17ms | 12.54ms |
| comp_1to1 | 38.70ms | 11.75ms | 4.22ms | 63.01ms | 45.50ms | 28.23ms |
| comp_2to1 | 23.97ms | 16.85ms | 2.26ms | 39.56ms | 38.19ms | 16.79ms |
| comp_4to1 | 15.70ms | 8.45ms | 7.76ms | 17.39ms | 31.05ms | 6.45ms |
| comp_1000to1 | 15μs | 4μs | 4μs | 54μs | 27μs | 8μs |
| comp_1to2 | 30.78ms | 15.56ms | 17.03ms | 51.02ms | 32.48ms | 17.38ms |
| comp_1to4 | 14.65ms | 19.42ms | 8.70ms | 46.83ms | 20.56ms | 7.53ms |
| comp_1to8 | 19.77ms | 6.55ms | 7.06ms | 46.90ms | 23.14ms | 6.72ms |
| comp_1to1000 | 14.41ms | 4.77ms | 3.56ms | 40.92ms | 15.29ms | 4.52ms |
| update_1to1 | 16.18ms | 8.20ms | 11.48ms | 5.73ms | 24.87ms | 9.20ms |
| update_2to1 | 7.94ms | 4.08ms | 4.80ms | 2.94ms | 11.97ms | 4.61ms |
| update_4to1 | 4.04ms | 2.03ms | 2.31ms | 1.47ms | 6.11ms | 2.30ms |
| update_1000to1 | 40μs | 34μs | 10μs | 15μs | 53μs | 22μs |
| update_1to2 | 8.06ms | 4.34ms | 5.63ms | 2.94ms | 12.24ms | 4.96ms |
| update_1to4 | 4.05ms | 2.22ms | 2.46ms | 1.47ms | 5.96ms | 2.33ms |
| update_1to1000 | 152μs | 39μs | 46μs | 408μs | 167μs | 44μs |
| cellx1000 | 13.20ms | 9.64ms | 7.51ms | 6.15ms | 71.63ms | 9.71ms |
| cellx2500 | 30.86ms | 26.27ms | 20.31ms | 27.44ms | 249.53ms | 32.98ms |
| cellx5000 | 65.19ms | 67.41ms | 43.69ms | 86.66ms | 573.16ms | 75.71ms |
| 10x5 - 2 sources - read 20.0% (simple) | 354.50ms | 437.51ms | 243.19ms | 245.90ms | 2.04s | 510.46ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 248.83ms | 273.27ms | 182.37ms | 203.17ms | 1.53s | 278.85ms |
| 1000x12 - 4 sources - dynamic (large) | 463.50ms | 3.51s | 285.86ms | 341.08ms | 1.90s | 4.03s |
| 1000x5 - 25 sources (wide dense) | 597.83ms | 2.59s | 411.21ms | 499.15ms | 3.51s | 3.42s |
| 5x500 - 3 sources (deep) | 257.02ms | 228.10ms | 189.52ms | 205.45ms | 1.14s | 225.38ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 381.28ms | 446.73ms | 263.77ms | 257.18ms | 1.72s | 481.06ms |

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
