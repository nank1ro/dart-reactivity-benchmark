# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.69s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.55s |
| 🥉 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.41s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.29s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.62s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| avoidablePropagation | 274.51ms | 147.69ms (fail) | 202.35ms | 210.55ms | 2.34s | 185.19ms |
| broadPropagation | 510.05ms | 6.07ms (fail) | 448.36ms | 455.19ms | 4.41s | 345.70ms |
| deepPropagation | 171.17ms | 138.29ms (fail) | 175.69ms | 177.32ms | 1.57s | 120.23ms |
| diamond | 357.21ms | 188.88ms (fail) | 279.22ms | 280.87ms | 2.43s | 230.18ms |
| mux | 439.45ms | 193.56ms (fail) | 402.71ms | 407.23ms | 1.83s | 372.17ms |
| repeatedObservers | 81.69ms | 52.74ms (fail) | 40.63ms | 44.48ms | 228.05ms | 45.46ms |
| triangle | 117.83ms | 86.73ms (fail) | 99.23ms | 102.39ms | 771.29ms | 84.90ms |
| unstable | 98.65ms | 341.45ms (fail) | 73.40ms | 79.44ms | 347.23ms | 67.53ms |
| molBench | 493.79ms | 947μs | 484.62ms | 485.58ms | 572.28ms | 484.31ms |
| create_signals | 98.45ms | 60.69ms | 5.25ms | 26.20ms | 73.85ms | 30.01ms |
| comp_0to1 | 38.06ms | 53.98ms | 22.23ms | 11.43ms | 25.54ms | 8.42ms |
| comp_1to1 | 51.20ms | 62.75ms | 12.16ms | 28.49ms | 18.82ms | 5.26ms |
| comp_2to1 | 43.01ms | 44.09ms | 11.33ms | 9.25ms | 17.95ms | 2.33ms |
| comp_4to1 | 18.36ms | 17.58ms | 11.47ms | 1.94ms | 23.88ms | 8.61ms |
| comp_1000to1 | 20μs | 41μs | 9μs | 5μs | 16μs | 4μs |
| comp_1to2 | 39.92ms | 45.58ms | 21.03ms | 15.56ms | 38.36ms | 10.81ms |
| comp_1to4 | 22.65ms | 44.09ms | 34.58ms | 7.85ms | 23.71ms | 8.77ms |
| comp_1to8 | 23.28ms | 42.76ms | 7.78ms | 10.47ms | 22.63ms | 5.75ms |
| comp_1to1000 | 17.20ms | 39.06ms | 6.12ms | 6.13ms | 16.12ms | 3.52ms |
| update_1to1 | 16.08ms | 5.65ms | 8.70ms | 9.10ms | 25.97ms | 10.29ms |
| update_2to1 | 7.79ms | 3.13ms | 4.24ms | 4.54ms | 12.88ms | 2.25ms |
| update_4to1 | 3.99ms | 1.43ms | 2.27ms | 2.23ms | 6.56ms | 2.52ms |
| update_1000to1 | 40μs | 14μs | 21μs | 22μs | 71μs | 25μs |
| update_1to2 | 8.07ms | 2.85ms | 4.66ms | 4.47ms | 14.19ms | 5.06ms |
| update_1to4 | 4.00ms | 1.43ms | 2.17ms | 2.24ms | 6.57ms | 2.30ms |
| update_1to1000 | 171μs | 384μs | 874μs | 42μs | 172μs | 29μs |
| cellx1000 | 12.59ms | 6.00ms | 10.08ms | 9.60ms | 76.23ms | 8.14ms |
| cellx2500 | 41.07ms | 30.93ms | 32.55ms | 35.37ms | 278.15ms | 21.17ms |
| cellx5000 | 117.89ms | 81.36ms | 93.12ms | 93.36ms | 573.82ms | 52.77ms |
| 10x5 - 2 sources - read 20.0% (simple) | 360.23ms | 244.19ms | 439.69ms | 507.79ms | 2.04s | 235.99ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 248.58ms | 201.29ms | 270.63ms | 284.89ms | 1.54s | 179.17ms |
| 1000x12 - 4 sources - dynamic (large) | 461.69ms | 349.55ms | 3.71s | 3.97s | 1.90s | 283.89ms |
| 1000x5 - 25 sources (wide dense) | 592.85ms | 503.39ms | 2.68s | 3.57s | 3.57s | 413.76ms |
| 5x500 - 3 sources (deep) | 251.28ms | 202.91ms | 230.53ms | 222.61ms | 1.14s | 186.94ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 383.77ms | 256.69ms | 452.68ms | 478.33ms | 1.68s | 263.92ms |

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
