# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.27s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.36s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.18s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.45s |
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
| Test Case | preact_signals | state_beacon | solidart(2.0-dev) | signals | alien_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 205.51ms | 165.74ms (fail) | 264.14ms | 215.21ms | 192.08ms | 2.35s |
| broadPropagation | 465.39ms | 6.35ms (fail) | 513.61ms | 460.96ms | 355.06ms | 4.32s |
| deepPropagation | 185.23ms | 141.63ms (fail) | 163.65ms | 177.50ms | 131.12ms | 1.54s |
| diamond | 283.56ms | 187.44ms (fail) | 350.58ms | 283.95ms | 235.88ms | 2.43s |
| mux | 386.28ms | 192.51ms (fail) | 448.41ms | 411.90ms | 381.95ms | 1.86s |
| repeatedObservers | 40.72ms | 52.79ms (fail) | 80.47ms | 46.50ms | 43.61ms | 239.45ms |
| triangle | 98.75ms | 78.36ms (fail) | 112.75ms | 103.56ms | 85.30ms | 772.20ms |
| unstable | 74.53ms | 342.10ms (fail) | 94.16ms | 76.07ms | 59.51ms | 343.81ms |
| molBench | 488.65ms | 1.10ms | 499.56ms | 485.61ms | 490.01ms | 583.49ms |
| create_signals | 4.72ms | 71.57ms | 80.25ms | 26.15ms | 23.58ms | 51.02ms |
| comp_0to1 | 17.88ms | 64.46ms | 28.87ms | 11.61ms | 7.42ms | 15.72ms |
| comp_1to1 | 15.19ms | 60.20ms | 26.97ms | 28.53ms | 4.25ms | 43.70ms |
| comp_2to1 | 16.83ms | 43.48ms | 25.48ms | 18.58ms | 2.29ms | 21.61ms |
| comp_4to1 | 14.17ms | 17.67ms | 12.81ms | 6.71ms | 10.45ms | 21.57ms |
| comp_1000to1 | 5μs | 46μs | 16μs | 9μs | 3μs | 15μs |
| comp_1to2 | 18.26ms | 51.24ms | 26.20ms | 14.64ms | 20.22ms | 35.60ms |
| comp_1to4 | 35.78ms | 50.27ms | 25.20ms | 7.15ms | 9.55ms | 17.78ms |
| comp_1to8 | 6.93ms | 47.95ms | 22.95ms | 6.91ms | 4.10ms | 20.04ms |
| comp_1to1000 | 6.08ms | 42.89ms | 14.05ms | 4.42ms | 3.43ms | 15.21ms |
| update_1to1 | 8.42ms | 6.00ms | 16.33ms | 10.21ms | 10.09ms | 27.29ms |
| update_2to1 | 4.43ms | 3.09ms | 8.23ms | 4.51ms | 2.12ms | 13.03ms |
| update_4to1 | 2.11ms | 1.50ms | 4.07ms | 2.55ms | 2.49ms | 6.83ms |
| update_1000to1 | 20μs | 15μs | 40μs | 25μs | 18μs | 79μs |
| update_1to2 | 4.07ms | 3.02ms | 8.37ms | 4.52ms | 5.01ms | 13.42ms |
| update_1to4 | 2.09ms | 1.50ms | 4.11ms | 2.59ms | 2.31ms | 6.99ms |
| update_1to1000 | 162μs | 422μs | 161μs | 62μs | 34μs | 171μs |
| cellx1000 | 9.73ms | 7.46ms | 13.97ms | 10.10ms | 7.16ms | 73.97ms |
| cellx2500 | 26.79ms | 25.45ms | 35.89ms | 32.92ms | 20.14ms | 252.29ms |
| cellx5000 | 70.58ms | 82.85ms | 84.58ms | 63.70ms | 42.27ms | 587.48ms |
| 10x5 - 2 sources - read 20.0% (simple) | 449.71ms | 241.70ms | 352.87ms | 504.57ms | 240.59ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 283.04ms | 196.28ms | 247.80ms | 284.12ms | 180.52ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 3.71s | 342.76ms | 461.85ms | 3.78s | 285.14ms | 1.96s |
| 1000x5 - 25 sources (wide dense) | 2.73s | 514.70ms | 605.42ms | 3.39s | 404.36ms | 3.45s |
| 5x500 - 3 sources (deep) | 230.56ms | 209.20ms | 256.60ms | 225.08ms | 189.15ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 464.43ms | 263.40ms | 382.72ms | 480.06ms | 264.94ms | 1.72s |

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
