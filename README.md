# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.70s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 10.54s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.44s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 11.34s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.80s |
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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 217.34ms | 192.45ms | 161.26ms (fail) | 263.52ms | 201.95ms | 2.37s |
| broadPropagation | 456.21ms | 354.06ms | 6.54ms (fail) | 504.45ms | 468.75ms | 4.38s |
| deepPropagation | 173.01ms | 128.29ms | 142.66ms (fail) | 165.26ms | 177.10ms | 1.57s |
| diamond | 281.13ms | 236.51ms | 203.96ms (fail) | 352.50ms | 279.33ms | 2.41s |
| mux | 406.67ms | 378.34ms | 197.39ms (fail) | 437.82ms | 395.95ms | 1.86s |
| repeatedObservers | 46.40ms | 43.57ms | 53.38ms (fail) | 80.65ms | 40.01ms | 233.00ms |
| triangle | 102.30ms | 85.28ms | 80.20ms (fail) | 121.32ms | 99.19ms | 786.19ms |
| unstable | 78.13ms | 59.91ms | 347.64ms (fail) | 96.48ms | 74.49ms | 354.14ms |
| molBench | 485.61ms | 491.09ms | 954μs | 497.71ms | 486.99ms | 584.65ms |
| create_signals | 26.40ms | 26.39ms | 71.94ms | 61.15ms | 4.73ms | 78.53ms |
| comp_0to1 | 12.21ms | 8.47ms | 61.06ms | 26.70ms | 22.36ms | 20.61ms |
| comp_1to1 | 21.80ms | 4.21ms | 62.00ms | 42.53ms | 13.10ms | 24.72ms |
| comp_2to1 | 9.34ms | 2.31ms | 39.48ms | 25.91ms | 19.47ms | 8.66ms |
| comp_4to1 | 8.90ms | 7.93ms | 17.50ms | 10.18ms | 8.35ms | 35.75ms |
| comp_1000to1 | 5μs | 5μs | 46μs | 19μs | 4μs | 27μs |
| comp_1to2 | 14.01ms | 9.73ms | 48.86ms | 40.07ms | 26.63ms | 38.42ms |
| comp_1to4 | 17.25ms | 12.13ms | 47.78ms | 22.01ms | 30.20ms | 24.02ms |
| comp_1to8 | 8.07ms | 4.94ms | 47.26ms | 22.54ms | 6.03ms | 25.28ms |
| comp_1to1000 | 4.15ms | 3.57ms | 42.39ms | 14.86ms | 6.68ms | 15.35ms |
| update_1to1 | 10.25ms | 10.04ms | 6.06ms | 17.64ms | 8.41ms | 22.70ms |
| update_2to1 | 4.84ms | 2.18ms | 3.10ms | 8.51ms | 4.38ms | 11.08ms |
| update_4to1 | 2.54ms | 2.49ms | 1.55ms | 4.38ms | 2.08ms | 5.66ms |
| update_1000to1 | 26μs | 19μs | 15μs | 41μs | 31μs | 56μs |
| update_1to2 | 4.50ms | 5.07ms | 3.04ms | 8.94ms | 4.10ms | 10.91ms |
| update_1to4 | 2.60ms | 2.38ms | 1.54ms | 4.35ms | 2.06ms | 5.48ms |
| update_1to1000 | 43μs | 47μs | 426μs | 153μs | 40μs | 164μs |
| cellx1000 | 10.02ms | 7.12ms | 5.92ms | 16.44ms | 13.51ms | 94.89ms |
| cellx2500 | 28.42ms | 20.30ms | 29.34ms | 71.79ms | 48.77ms | 309.94ms |
| cellx5000 | 75.31ms | 45.55ms | 74.13ms | 186.44ms | 125.14ms | 655.44ms |
| 10x5 - 2 sources - read 20.0% (simple) | 518.28ms | 238.39ms | 247.48ms | 349.35ms | 459.81ms | 2.03s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 281.19ms | 181.23ms | 199.04ms | 248.41ms | 272.73ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 3.74s | 283.01ms | 351.37ms | 470.88ms | 3.77s | 1.96s |
| 1000x5 - 25 sources (wide dense) | 3.58s | 407.81ms | 515.48ms | 611.11ms | 2.77s | 3.48s |
| 5x500 - 3 sources (deep) | 226.01ms | 188.11ms | 206.90ms | 259.08ms | 230.58ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 489.82ms | 259.06ms | 259.04ms | 395.56ms | 467.81ms | 1.72s |

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
