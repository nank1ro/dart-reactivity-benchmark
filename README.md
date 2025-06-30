# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.29s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.54s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.31s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 29.05s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.39s |

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
| avoidablePropagation | 273.52ms | 148.19ms (fail) | 201.18ms | 209.50ms | 2.41s | 185.63ms |
| broadPropagation | 502.22ms | 6.33ms (fail) | 448.84ms | 447.24ms | 4.56s | 346.29ms |
| deepPropagation | 169.85ms | 142.80ms (fail) | 177.37ms | 169.46ms | 1.62s | 125.51ms |
| diamond | 347.97ms | 190.47ms (fail) | 285.82ms | 280.60ms | 2.59s | 229.73ms |
| mux | 447.33ms | 192.25ms (fail) | 404.78ms | 412.54ms | 1.91s | 372.22ms |
| repeatedObservers | 80.94ms | 52.77ms (fail) | 40.11ms | 44.67ms | 244.18ms | 45.48ms |
| triangle | 117.75ms | 77.11ms (fail) | 97.95ms | 100.01ms | 817.22ms | 85.41ms |
| unstable | 98.56ms | 335.78ms (fail) | 70.08ms | 79.39ms | 365.89ms | 67.34ms |
| molBench | 494.20ms | 890μs | 488.71ms | 484.77ms | 583.07ms | 482.06ms |
| create_signals | 75.83ms | 59.70ms | 5.18ms | 25.20ms | 75.00ms | 28.47ms |
| comp_0to1 | 28.03ms | 52.49ms | 17.72ms | 11.22ms | 22.53ms | 7.81ms |
| comp_1to1 | 44.38ms | 54.70ms | 12.55ms | 27.30ms | 24.30ms | 4.39ms |
| comp_2to1 | 43.31ms | 35.94ms | 17.41ms | 13.51ms | 21.04ms | 2.30ms |
| comp_4to1 | 10.88ms | 16.15ms | 8.53ms | 2.26ms | 14.44ms | 9.81ms |
| comp_1000to1 | 18μs | 51μs | 6μs | 5μs | 17μs | 6μs |
| comp_1to2 | 29.95ms | 44.92ms | 13.54ms | 18.48ms | 36.66ms | 16.42ms |
| comp_1to4 | 22.05ms | 43.36ms | 20.29ms | 12.16ms | 25.05ms | 6.23ms |
| comp_1to8 | 24.87ms | 42.81ms | 11.95ms | 5.98ms | 22.73ms | 6.21ms |
| comp_1to1000 | 18.39ms | 38.69ms | 5.96ms | 4.16ms | 16.15ms | 3.35ms |
| update_1to1 | 16.24ms | 5.74ms | 8.64ms | 9.04ms | 25.23ms | 8.89ms |
| update_2to1 | 8.00ms | 3.12ms | 4.32ms | 4.50ms | 12.44ms | 2.28ms |
| update_4to1 | 4.04ms | 1.45ms | 2.20ms | 2.21ms | 7.30ms | 2.58ms |
| update_1000to1 | 40μs | 17μs | 21μs | 32μs | 69μs | 24μs |
| update_1to2 | 8.45ms | 2.89ms | 4.63ms | 4.48ms | 11.11ms | 5.25ms |
| update_1to4 | 4.06ms | 1.48ms | 2.15ms | 2.24ms | 7.17ms | 2.47ms |
| update_1to1000 | 171μs | 387μs | 431μs | 42μs | 184μs | 47μs |
| cellx1000 | 12.54ms | 5.61ms | 10.01ms | 9.55ms | 72.93ms | 7.66ms |
| cellx2500 | 33.09ms | 23.80ms | 30.79ms | 33.29ms | 257.56ms | 19.29ms |
| cellx5000 | 84.33ms | 67.28ms | 98.88ms | 67.06ms | 580.26ms | 43.39ms |
| 10x5 - 2 sources - read 20.0% (simple) | 353.53ms | 246.03ms | 437.63ms | 515.72ms | 2.15s | 231.31ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 248.38ms | 197.48ms | 270.77ms | 286.87ms | 1.65s | 176.16ms |
| 1000x12 - 4 sources - dynamic (large) | 460.50ms | 334.96ms | 3.70s | 3.96s | 1.99s | 282.65ms |
| 1000x5 - 25 sources (wide dense) | 590.08ms | 498.53ms | 2.72s | 3.58s | 3.88s | 411.68ms |
| 5x500 - 3 sources (deep) | 251.12ms | 204.94ms | 229.55ms | 223.82ms | 1.21s | 191.57ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 385.93ms | 258.88ms | 456.46ms | 489.81ms | 1.82s | 261.88ms |

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
