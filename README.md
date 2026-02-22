# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.39s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.65s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.26s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.98s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.61s |

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
| avoidablePropagation | 200.31ms | 196.39ms | 148.85ms (fail) | 282.49ms | 208.74ms | 2.25s |
| broadPropagation | 477.33ms | 359.76ms | 6.63ms (fail) | 519.66ms | 456.38ms | 4.34s |
| deepPropagation | 181.34ms | 130.56ms | 144.01ms (fail) | 167.55ms | 174.72ms | 1.53s |
| diamond | 294.79ms | 246.59ms | 189.79ms (fail) | 351.50ms | 286.93ms | 2.32s |
| mux | 412.79ms | 363.73ms | 186.78ms (fail) | 423.18ms | 372.18ms | 1.76s |
| repeatedObservers | 47.62ms | 45.78ms | 58.67ms (fail) | 80.42ms | 41.64ms | 224.55ms |
| triangle | 105.34ms | 89.65ms | 80.90ms (fail) | 111.76ms | 100.93ms | 742.97ms |
| unstable | 78.37ms | 62.11ms | 358.45ms (fail) | 95.56ms | 70.81ms | 338.65ms |
| molBench | 505.98ms | 488.87ms | 1.39ms | 492.20ms | 497.73ms | 582.96ms |
| create_signals | 29.53ms | 24.17ms | 74.98ms | 76.38ms | 5.03ms | 68.78ms |
| comp_0to1 | 13.06ms | 8.10ms | 59.99ms | 27.20ms | 18.20ms | 26.74ms |
| comp_1to1 | 34.52ms | 4.35ms | 59.50ms | 48.18ms | 12.63ms | 37.57ms |
| comp_2to1 | 13.31ms | 2.56ms | 39.83ms | 37.20ms | 12.14ms | 30.20ms |
| comp_4to1 | 1.96ms | 8.27ms | 18.00ms | 12.57ms | 23.56ms | 23.34ms |
| comp_1000to1 | 4μs | 5μs | 44μs | 15μs | 6μs | 16μs |
| comp_1to2 | 23.57ms | 20.49ms | 50.09ms | 31.41ms | 21.54ms | 37.49ms |
| comp_1to4 | 15.60ms | 5.86ms | 48.20ms | 21.78ms | 22.83ms | 24.43ms |
| comp_1to8 | 7.12ms | 6.45ms | 46.88ms | 25.46ms | 7.27ms | 23.73ms |
| comp_1to1000 | 4.35ms | 4.53ms | 42.70ms | 14.29ms | 4.61ms | 15.39ms |
| update_1to1 | 9.33ms | 4.65ms | 6.65ms | 15.81ms | 9.10ms | 21.60ms |
| update_2to1 | 4.66ms | 2.39ms | 2.95ms | 7.85ms | 4.59ms | 10.97ms |
| update_4to1 | 2.37ms | 1.20ms | 1.70ms | 3.90ms | 2.29ms | 5.47ms |
| update_1000to1 | 22μs | 11μs | 17μs | 39μs | 25μs | 56μs |
| update_1to2 | 4.64ms | 2.33ms | 3.39ms | 8.01ms | 4.48ms | 10.42ms |
| update_1to4 | 2.31ms | 1.20ms | 1.52ms | 3.94ms | 2.38ms | 5.64ms |
| update_1to1000 | 67μs | 48μs | 401μs | 148μs | 188μs | 157μs |
| cellx1000 | 12.28ms | 7.73ms | 6.60ms | 12.36ms | 10.64ms | 74.08ms |
| cellx2500 | 49.35ms | 24.65ms | 30.91ms | 41.60ms | 32.02ms | 259.13ms |
| cellx5000 | 120.45ms | 66.64ms | 83.46ms | 138.58ms | 88.61ms | 567.83ms |
| 10x5 - 2 sources - read 20.0% (simple) | 522.43ms | 239.05ms | 277.21ms | 345.24ms | 457.16ms | 1.91s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 296.91ms | 183.17ms | 210.62ms | 256.26ms | 298.21ms | 1.46s |
| 1000x12 - 4 sources - dynamic (large) | 3.61s | 283.94ms | 364.13ms | 472.05ms | 3.90s | 1.91s |
| 1000x5 - 25 sources (wide dense) | 3.46s | 409.09ms | 509.56ms | 622.10ms | 2.80s | 3.39s |
| 5x500 - 3 sources (deep) | 230.20ms | 193.43ms | 220.20ms | 255.63ms | 234.73ms | 1.16s |
| 100x15 - 6 sources - dynamic (very dynamic) | 485.06ms | 266.30ms | 274.09ms | 385.78ms | 461.31ms | 1.80s |

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
