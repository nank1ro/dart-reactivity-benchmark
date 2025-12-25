# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.24s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.05s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.13s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.99s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.49s |

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
| avoidablePropagation | 215.54ms | 189.22ms | 155.65ms (fail) | 277.91ms | 206.65ms | 2.35s |
| broadPropagation | 457.66ms | 352.97ms | 6.84ms (fail) | 506.49ms | 450.88ms | 4.35s |
| deepPropagation | 180.39ms | 129.25ms | 138.21ms (fail) | 169.53ms | 175.83ms | 1.48s |
| diamond | 290.61ms | 229.47ms | 204.16ms (fail) | 349.18ms | 284.21ms | 2.37s |
| mux | 392.25ms | 357.46ms | 183.21ms (fail) | 419.66ms | 371.30ms | 1.86s |
| repeatedObservers | 47.90ms | 43.37ms | 54.04ms (fail) | 80.88ms | 40.60ms | 225.01ms |
| triangle | 101.94ms | 85.07ms | 77.79ms (fail) | 113.82ms | 103.85ms | 729.30ms |
| unstable | 78.04ms | 62.20ms | 337.41ms (fail) | 95.44ms | 70.45ms | 341.90ms |
| molBench | 495.03ms | 485.08ms | 1.02ms | 489.89ms | 486.46ms | 588.90ms |
| create_signals | 26.22ms | 24.95ms | 66.13ms | 75.99ms | 5.34ms | 59.60ms |
| comp_0to1 | 11.60ms | 7.57ms | 60.92ms | 25.95ms | 17.84ms | 19.22ms |
| comp_1to1 | 18.80ms | 4.34ms | 61.24ms | 30.86ms | 13.11ms | 30.82ms |
| comp_2to1 | 18.14ms | 2.27ms | 39.89ms | 35.27ms | 17.62ms | 21.04ms |
| comp_4to1 | 5.83ms | 10.36ms | 16.69ms | 11.76ms | 11.30ms | 29.91ms |
| comp_1000to1 | 4μs | 3μs | 41μs | 15μs | 4μs | 22μs |
| comp_1to2 | 18.07ms | 23.84ms | 47.43ms | 30.88ms | 27.75ms | 32.11ms |
| comp_1to4 | 9.95ms | 5.18ms | 47.27ms | 21.35ms | 19.51ms | 24.60ms |
| comp_1to8 | 6.13ms | 4.88ms | 43.77ms | 23.85ms | 7.84ms | 25.18ms |
| comp_1to1000 | 4.41ms | 3.40ms | 38.33ms | 14.80ms | 4.72ms | 15.72ms |
| update_1to1 | 9.75ms | 4.67ms | 6.11ms | 15.46ms | 8.83ms | 24.81ms |
| update_2to1 | 4.69ms | 2.32ms | 3.08ms | 7.74ms | 4.34ms | 11.43ms |
| update_4to1 | 2.31ms | 1.21ms | 1.52ms | 3.86ms | 2.21ms | 7.12ms |
| update_1000to1 | 23μs | 11μs | 16μs | 38μs | 22μs | 69μs |
| update_1to2 | 4.64ms | 2.28ms | 3.09ms | 7.95ms | 4.35ms | 13.70ms |
| update_1to4 | 2.53ms | 1.15ms | 1.56ms | 3.85ms | 2.23ms | 5.14ms |
| update_1to1000 | 43μs | 30μs | 379μs | 150μs | 41μs | 161μs |
| cellx1000 | 9.59ms | 10.14ms | 5.42ms | 12.56ms | 12.85ms | 89.06ms |
| cellx2500 | 31.19ms | 20.37ms | 26.61ms | 32.06ms | 32.38ms | 309.20ms |
| cellx5000 | 68.63ms | 44.72ms | 94.78ms | 93.99ms | 91.30ms | 617.31ms |
| 10x5 - 2 sources - read 20.0% (simple) | 499.09ms | 235.75ms | 253.07ms | 347.66ms | 435.92ms | 1.89s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.22ms | 174.16ms | 195.69ms | 243.04ms | 269.54ms | 1.43s |
| 1000x12 - 4 sources - dynamic (large) | 3.75s | 281.53ms | 343.43ms | 470.57ms | 3.68s | 1.87s |
| 1000x5 - 25 sources (wide dense) | 3.39s | 411.50ms | 514.77ms | 593.30ms | 2.50s | 3.43s |
| 5x500 - 3 sources (deep) | 225.16ms | 193.75ms | 202.19ms | 254.88ms | 228.62ms | 1.09s |
| 100x15 - 6 sources - dynamic (very dynamic) | 477.36ms | 264.04ms | 254.57ms | 380.64ms | 454.75ms | 1.65s |

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
