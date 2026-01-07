# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.65s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.25s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 10.76s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 9.98s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.21s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.37s |

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
| avoidablePropagation | 209.17ms | 186.37ms | 148.94ms (fail) | 277.29ms | 206.69ms | 2.41s |
| broadPropagation | 455.25ms | 351.69ms | 5.88ms (fail) | 506.75ms | 449.03ms | 4.42s |
| deepPropagation | 174.50ms | 124.45ms | 138.02ms (fail) | 170.12ms | 178.75ms | 1.50s |
| diamond | 286.32ms | 230.48ms | 179.15ms (fail) | 360.39ms | 282.90ms | 2.39s |
| mux | 394.73ms | 360.03ms | 183.18ms (fail) | 418.20ms | 376.01ms | 1.87s |
| repeatedObservers | 46.39ms | 44.21ms | 52.76ms (fail) | 81.38ms | 40.23ms | 230.30ms |
| triangle | 102.77ms | 87.96ms | 77.54ms (fail) | 115.66ms | 101.52ms | 768.81ms |
| unstable | 78.07ms | 61.67ms | 342.25ms (fail) | 97.00ms | 69.78ms | 347.46ms |
| molBench | 494.73ms | 485.27ms | 971μs | 489.81ms | 481.71ms | 590.33ms |
| create_signals | 25.85ms | 28.02ms | 56.23ms | 76.54ms | 5.31ms | 50.29ms |
| comp_0to1 | 11.69ms | 7.14ms | 50.99ms | 25.60ms | 17.89ms | 15.18ms |
| comp_1to1 | 27.43ms | 4.23ms | 52.24ms | 46.66ms | 13.91ms | 40.75ms |
| comp_2to1 | 12.71ms | 2.35ms | 34.99ms | 44.31ms | 19.95ms | 31.39ms |
| comp_4to1 | 2.64ms | 8.57ms | 15.69ms | 6.76ms | 14.86ms | 22.71ms |
| comp_1000to1 | 5μs | 4μs | 41μs | 18μs | 4μs | 31μs |
| comp_1to2 | 16.21ms | 19.38ms | 43.40ms | 35.48ms | 18.71ms | 38.12ms |
| comp_1to4 | 10.53ms | 8.88ms | 46.27ms | 20.60ms | 32.38ms | 23.24ms |
| comp_1to8 | 6.14ms | 6.59ms | 43.03ms | 22.08ms | 6.31ms | 23.75ms |
| comp_1to1000 | 4.24ms | 3.51ms | 38.26ms | 14.74ms | 5.95ms | 15.61ms |
| update_1to1 | 9.41ms | 4.68ms | 6.11ms | 15.57ms | 8.82ms | 25.27ms |
| update_2to1 | 4.70ms | 2.31ms | 3.10ms | 7.75ms | 4.36ms | 13.75ms |
| update_4to1 | 2.37ms | 1.66ms | 1.59ms | 3.85ms | 2.23ms | 7.06ms |
| update_1000to1 | 24μs | 22μs | 17μs | 38μs | 22μs | 68μs |
| update_1to2 | 4.64ms | 2.89ms | 3.09ms | 7.91ms | 4.35ms | 13.78ms |
| update_1to4 | 2.56ms | 1.20ms | 1.61ms | 3.87ms | 2.24ms | 6.22ms |
| update_1to1000 | 43μs | 48μs | 383μs | 144μs | 935μs | 162μs |
| cellx1000 | 9.51ms | 7.40ms | 5.12ms | 11.96ms | 9.62ms | 69.69ms |
| cellx2500 | 30.52ms | 19.61ms | 21.16ms | 31.55ms | 25.58ms | 237.25ms |
| cellx5000 | 59.03ms | 40.94ms | 71.74ms | 68.89ms | 73.11ms | 580.52ms |
| 10x5 - 2 sources - read 20.0% (simple) | 512.27ms | 236.25ms | 233.49ms | 349.86ms | 431.53ms | 1.94s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 281.00ms | 173.93ms | 196.25ms | 247.99ms | 268.20ms | 1.46s |
| 1000x12 - 4 sources - dynamic (large) | 3.53s | 274.43ms | 339.57ms | 463.58ms | 3.65s | 1.86s |
| 1000x5 - 25 sources (wide dense) | 3.26s | 405.31ms | 517.92ms | 591.51ms | 2.50s | 3.43s |
| 5x500 - 3 sources (deep) | 224.79ms | 191.42ms | 204.00ms | 253.63ms | 225.30ms | 1.11s |
| 100x15 - 6 sources - dynamic (very dynamic) | 470.90ms | 266.26ms | 255.51ms | 385.36ms | 454.07ms | 1.65s |

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
