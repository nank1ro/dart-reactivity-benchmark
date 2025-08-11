# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.66s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.27s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.32s |
| 4 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.31s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.71s |
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
| Test Case | mobx | state_beacon | preact_signals | alien_signals | solidart(2.0-dev) | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.35s | 179.83ms (fail) | 202.47ms | 184.56ms | 280.58ms | 212.70ms |
| broadPropagation | 4.41s | 5.96ms (fail) | 458.19ms | 344.31ms | 514.41ms | 463.06ms |
| deepPropagation | 1.57s | 140.47ms (fail) | 177.52ms | 121.21ms | 168.55ms | 177.46ms |
| diamond | 2.43s | 185.33ms (fail) | 279.04ms | 231.86ms | 345.95ms | 278.03ms |
| mux | 1.82s | 192.68ms (fail) | 405.08ms | 370.67ms | 441.44ms | 414.26ms |
| repeatedObservers | 234.47ms | 52.56ms (fail) | 40.74ms | 45.36ms | 81.04ms | 44.40ms |
| triangle | 760.15ms | 76.55ms (fail) | 99.52ms | 84.79ms | 116.72ms | 101.53ms |
| unstable | 358.11ms | 333.55ms (fail) | 63.99ms | 67.42ms | 97.47ms | 78.90ms |
| molBench | 572.60ms | 930μs | 488.67ms | 487.38ms | 492.72ms | 485.44ms |
| create_signals | 53.65ms | 60.74ms | 15.62ms | 25.35ms | 81.68ms | 25.62ms |
| comp_0to1 | 16.25ms | 53.99ms | 15.94ms | 7.46ms | 46.52ms | 11.25ms |
| comp_1to1 | 42.53ms | 55.38ms | 7.18ms | 4.15ms | 49.45ms | 27.08ms |
| comp_2to1 | 35.06ms | 35.71ms | 22.89ms | 2.30ms | 45.22ms | 8.82ms |
| comp_4to1 | 23.43ms | 16.08ms | 8.30ms | 7.66ms | 23.20ms | 1.84ms |
| comp_1000to1 | 17μs | 43μs | 6μs | 3μs | 18μs | 5μs |
| comp_1to2 | 30.19ms | 45.42ms | 32.17ms | 9.96ms | 37.57ms | 13.16ms |
| comp_1to4 | 23.63ms | 44.51ms | 23.09ms | 11.81ms | 17.43ms | 9.39ms |
| comp_1to8 | 23.24ms | 43.22ms | 8.35ms | 4.87ms | 22.57ms | 7.68ms |
| comp_1to1000 | 15.88ms | 39.04ms | 3.57ms | 3.52ms | 17.13ms | 4.20ms |
| update_1to1 | 27.77ms | 5.63ms | 8.64ms | 10.35ms | 16.08ms | 8.95ms |
| update_2to1 | 12.09ms | 3.11ms | 4.21ms | 2.33ms | 7.78ms | 4.52ms |
| update_4to1 | 7.25ms | 1.44ms | 2.17ms | 2.58ms | 4.01ms | 2.27ms |
| update_1000to1 | 69μs | 14μs | 21μs | 26μs | 39μs | 22μs |
| update_1to2 | 11.04ms | 2.83ms | 5.19ms | 5.20ms | 8.03ms | 4.47ms |
| update_1to4 | 7.26ms | 1.44ms | 2.16ms | 2.54ms | 4.02ms | 2.28ms |
| update_1to1000 | 175μs | 379μs | 48μs | 43μs | 170μs | 42μs |
| cellx1000 | 70.31ms | 5.54ms | 16.23ms | 7.09ms | 11.95ms | 9.44ms |
| cellx2500 | 251.05ms | 29.78ms | 30.42ms | 19.64ms | 32.88ms | 30.46ms |
| cellx5000 | 577.31ms | 69.33ms | 76.27ms | 42.16ms | 70.93ms | 56.81ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.04s | 245.26ms | 435.67ms | 232.24ms | 352.60ms | 520.29ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.53s | 198.07ms | 272.70ms | 176.27ms | 241.59ms | 282.59ms |
| 1000x12 - 4 sources - dynamic (large) | 1.95s | 340.16ms | 3.69s | 276.79ms | 458.60ms | 3.79s |
| 1000x5 - 25 sources (wide dense) | 3.57s | 485.56ms | 2.74s | 410.24ms | 590.39ms | 3.47s |
| 5x500 - 3 sources (deep) | 1.16s | 205.24ms | 229.54ms | 190.71ms | 252.11ms | 228.82ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.73s | 259.40ms | 453.91ms | 264.06ms | 379.86ms | 487.54ms |

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
