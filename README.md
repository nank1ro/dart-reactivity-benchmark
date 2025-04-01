# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.76s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.38s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.21s |
| 4 | preact_signals | 0.27 | 100.0% | 35/35 | 10.07s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.90s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.52s |

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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 271.68ms | 206.16ms | 2.35s | 189.15ms | 211.08ms | 150.38ms (fail) |
| broadPropagation | 502.07ms | 453.09ms | 4.25s | 361.34ms | 454.36ms | 5.89ms (fail) |
| deepPropagation | 168.58ms | 179.75ms | 1.50s | 126.12ms | 171.21ms | 139.53ms (fail) |
| diamond | 350.98ms | 285.08ms | 2.41s | 239.18ms | 289.13ms | 189.92ms (fail) |
| mux | 446.99ms | 382.44ms | 1.85s | 372.55ms | 408.16ms | 191.24ms (fail) |
| repeatedObservers | 78.49ms | 38.46ms | 229.00ms | 44.93ms | 46.76ms | 52.19ms (fail) |
| triangle | 121.04ms | 99.14ms | 768.91ms | 84.39ms | 100.03ms | 76.19ms (fail) |
| unstable | 94.56ms | 71.11ms | 352.87ms | 59.97ms | 75.20ms | 335.64ms (fail) |
| molBench | 493.41ms | 492.29ms | 579.33ms | 492.83ms | 490.31ms | 1.03ms |
| create_signals | 76.94ms | 4.69ms | 70.76ms | 24.92ms | 30.34ms | 71.73ms |
| comp_0to1 | 28.52ms | 24.48ms | 29.36ms | 9.28ms | 12.88ms | 59.16ms |
| comp_1to1 | 51.73ms | 11.75ms | 41.20ms | 4.51ms | 30.48ms | 62.96ms |
| comp_2to1 | 31.75ms | 16.87ms | 36.00ms | 3.42ms | 11.11ms | 43.55ms |
| comp_4to1 | 16.85ms | 9.92ms | 17.85ms | 8.90ms | 2.13ms | 19.91ms |
| comp_1000to1 | 15μs | 6μs | 20μs | 6μs | 5μs | 44μs |
| comp_1to2 | 26.00ms | 27.35ms | 35.41ms | 20.12ms | 17.59ms | 49.31ms |
| comp_1to4 | 14.75ms | 28.23ms | 24.60ms | 7.76ms | 15.80ms | 48.73ms |
| comp_1to8 | 20.68ms | 6.38ms | 24.34ms | 6.19ms | 7.49ms | 45.00ms |
| comp_1to1000 | 14.72ms | 6.60ms | 15.27ms | 3.75ms | 6.61ms | 39.16ms |
| update_1to1 | 16.44ms | 8.21ms | 23.39ms | 11.26ms | 9.37ms | 5.73ms |
| update_2to1 | 7.99ms | 4.10ms | 11.79ms | 3.31ms | 4.66ms | 5.41ms |
| update_4to1 | 4.07ms | 2.04ms | 5.86ms | 2.95ms | 2.34ms | 1.47ms |
| update_1000to1 | 41μs | 20μs | 53μs | 10μs | 23μs | 15μs |
| update_1to2 | 8.16ms | 4.05ms | 11.60ms | 5.37ms | 5.06ms | 2.92ms |
| update_1to4 | 4.08ms | 2.23ms | 5.33ms | 1.88ms | 2.37ms | 1.46ms |
| update_1to1000 | 148μs | 877μs | 168μs | 48μs | 44μs | 415μs |
| cellx1000 | 12.70ms | 10.74ms | 88.77ms | 8.09ms | 10.22ms | 6.14ms |
| cellx2500 | 53.68ms | 38.17ms | 314.38ms | 22.48ms | 41.86ms | 35.35ms |
| cellx5000 | 133.81ms | 109.67ms | 679.93ms | 61.34ms | 107.46ms | 103.85ms |
| 10x5 - 2 sources - read 20.0% (simple) | 358.65ms | 443.94ms | 2.01s | 236.42ms | 505.55ms | 244.32ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 243.95ms | 274.45ms | 1.57s | 175.86ms | 280.91ms | 200.10ms |
| 1000x12 - 4 sources - dynamic (large) | 486.54ms | 3.55s | 2.01s | 290.72ms | 3.74s | 360.23ms |
| 1000x5 - 25 sources (wide dense) | 597.02ms | 2.59s | 3.64s | 417.76ms | 3.42s | 504.34ms |
| 5x500 - 3 sources (deep) | 256.18ms | 228.50ms | 1.19s | 196.12ms | 228.56ms | 207.44ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 386.64ms | 453.57ms | 1.75s | 265.90ms | 476.87ms | 263.13ms |

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
