# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.31 | 100.0% | 35/35 | 5.28s |
| 🥉 | signals | 0.29 | 100.0% | 35/35 | 11.50s |
| 4 | preact_signals | 0.28 | 100.0% | 35/35 | 10.39s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.40s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.62s |

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
| Test Case | state_beacon | alien_signals | signals | solidart(2.0-dev) | mobx | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 147.75ms (fail) | 192.78ms | 213.39ms | 265.61ms | 2.31s | 200.82ms |
| broadPropagation | 6.78ms (fail) | 367.79ms | 464.53ms | 486.11ms | 4.35s | 463.75ms |
| deepPropagation | 141.85ms (fail) | 128.12ms | 183.12ms | 163.28ms | 1.53s | 175.96ms |
| diamond | 187.58ms (fail) | 238.55ms | 284.88ms | 351.08ms | 2.43s | 279.62ms |
| mux | 190.97ms (fail) | 376.33ms | 410.54ms | 437.81ms | 1.82s | 391.59ms |
| repeatedObservers | 52.49ms (fail) | 43.73ms | 46.44ms | 81.47ms | 227.96ms | 40.67ms |
| triangle | 81.15ms (fail) | 85.51ms | 103.12ms | 113.88ms | 762.49ms | 98.90ms |
| unstable | 339.90ms (fail) | 60.52ms | 76.14ms | 94.77ms | 339.04ms | 74.60ms |
| molBench | 1.03ms | 490.08ms | 486.09ms | 499.05ms | 581.45ms | 489.45ms |
| create_signals | 70.65ms | 28.79ms | 26.73ms | 98.98ms | 91.99ms | 4.74ms |
| comp_0to1 | 61.82ms | 11.34ms | 12.04ms | 36.00ms | 15.57ms | 17.89ms |
| comp_1to1 | 64.82ms | 8.39ms | 18.32ms | 53.83ms | 39.07ms | 12.70ms |
| comp_2to1 | 46.11ms | 19.49ms | 17.66ms | 24.35ms | 23.20ms | 17.46ms |
| comp_4to1 | 18.20ms | 1.61ms | 1.91ms | 14.35ms | 31.59ms | 12.01ms |
| comp_1000to1 | 46μs | 14μs | 5μs | 14μs | 27μs | 6μs |
| comp_1to2 | 49.63ms | 10.43ms | 18.22ms | 25.43ms | 31.55ms | 22.88ms |
| comp_1to4 | 48.07ms | 8.01ms | 9.74ms | 22.07ms | 22.54ms | 26.02ms |
| comp_1to8 | 46.76ms | 4.42ms | 7.82ms | 20.50ms | 23.28ms | 6.71ms |
| comp_1to1000 | 43.29ms | 3.58ms | 4.48ms | 14.28ms | 15.41ms | 7.11ms |
| update_1to1 | 7.56ms | 10.02ms | 10.28ms | 16.39ms | 23.73ms | 8.31ms |
| update_2to1 | 3.94ms | 2.70ms | 4.96ms | 8.05ms | 14.08ms | 4.36ms |
| update_4to1 | 1.89ms | 2.48ms | 2.55ms | 4.09ms | 7.10ms | 2.10ms |
| update_1000to1 | 16μs | 10μs | 26μs | 40μs | 68μs | 21μs |
| update_1to2 | 3.63ms | 5.04ms | 4.51ms | 8.40ms | 13.98ms | 4.08ms |
| update_1to4 | 1.92ms | 2.23ms | 2.57ms | 4.12ms | 5.98ms | 2.09ms |
| update_1to1000 | 413μs | 45μs | 42μs | 148μs | 174μs | 1.04ms |
| cellx1000 | 5.68ms | 7.36ms | 10.77ms | 12.00ms | 74.93ms | 9.98ms |
| cellx2500 | 28.57ms | 20.43ms | 34.47ms | 34.12ms | 279.90ms | 29.52ms |
| cellx5000 | 68.66ms | 46.54ms | 73.76ms | 78.38ms | 613.52ms | 87.54ms |
| 10x5 - 2 sources - read 20.0% (simple) | 251.17ms | 237.31ms | 513.88ms | 348.59ms | 2.05s | 442.21ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 216.76ms | 181.95ms | 288.96ms | 248.28ms | 1.52s | 274.17ms |
| 1000x12 - 4 sources - dynamic (large) | 375.30ms | 282.79ms | 3.99s | 460.97ms | 1.86s | 3.75s |
| 1000x5 - 25 sources (wide dense) | 572.76ms | 408.91ms | 3.48s | 604.31ms | 3.45s | 2.74s |
| 5x500 - 3 sources (deep) | 204.89ms | 198.97ms | 225.29ms | 261.41ms | 1.14s | 230.24ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 277.31ms | 261.68ms | 476.81ms | 387.41ms | 1.70s | 464.38ms |

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
