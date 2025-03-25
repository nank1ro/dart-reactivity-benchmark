# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.31 | 100.0% | 35/35 | 5.26s |
| 🥉 | preact_signals | 0.30 | 100.0% | 35/35 | 10.01s |
| 4 | signals | 0.28 | 100.0% | 35/35 | 11.32s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.17s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.59s |

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
| avoidablePropagation | 288.67ms | 205.09ms | 2.35s | 183.92ms | 209.88ms | 168.26ms (fail) |
| broadPropagation | 499.08ms | 452.37ms | 4.21s | 350.97ms | 459.67ms | 6.25ms (fail) |
| deepPropagation | 166.64ms | 177.72ms | 1.52s | 124.38ms | 175.44ms | 146.60ms (fail) |
| diamond | 352.98ms | 284.52ms | 2.46s | 233.89ms | 288.73ms | 193.10ms (fail) |
| mux | 443.50ms | 394.50ms | 1.81s | 374.92ms | 412.96ms | 193.42ms (fail) |
| repeatedObservers | 78.24ms | 38.45ms | 228.31ms | 45.51ms | 46.97ms | 53.34ms (fail) |
| triangle | 114.65ms | 108.90ms | 768.12ms | 84.64ms | 99.24ms | 82.55ms (fail) |
| unstable | 94.17ms | 70.97ms | 352.69ms | 59.94ms | 74.08ms | 338.10ms (fail) |
| molBench | 493.12ms | 491.44ms | 578.77ms | 491.18ms | 489.06ms | 1.36ms |
| create_signals | 78.93ms | 4.63ms | 79.03ms | 26.48ms | 24.79ms | 64.06ms |
| comp_0to1 | 32.72ms | 17.86ms | 36.98ms | 10.69ms | 11.82ms | 57.87ms |
| comp_1to1 | 34.31ms | 14.49ms | 30.30ms | 7.62ms | 27.41ms | 58.34ms |
| comp_2to1 | 39.12ms | 16.19ms | 11.52ms | 14.80ms | 14.47ms | 38.36ms |
| comp_4to1 | 5.24ms | 14.77ms | 18.72ms | 1.65ms | 8.15ms | 17.43ms |
| comp_1000to1 | 18μs | 4μs | 23μs | 5μs | 5μs | 46μs |
| comp_1to2 | 38.57ms | 17.87ms | 35.64ms | 9.18ms | 16.95ms | 49.66ms |
| comp_1to4 | 21.55ms | 38.51ms | 23.70ms | 8.15ms | 11.18ms | 49.17ms |
| comp_1to8 | 23.76ms | 7.85ms | 20.60ms | 8.05ms | 6.42ms | 48.36ms |
| comp_1to1000 | 16.50ms | 5.41ms | 15.21ms | 3.58ms | 4.43ms | 43.55ms |
| update_1to1 | 15.85ms | 8.20ms | 23.59ms | 11.25ms | 9.40ms | 5.73ms |
| update_2to1 | 7.93ms | 4.06ms | 11.19ms | 4.99ms | 4.59ms | 2.88ms |
| update_4to1 | 3.98ms | 2.04ms | 6.06ms | 2.76ms | 2.35ms | 1.48ms |
| update_1000to1 | 39μs | 20μs | 65μs | 24μs | 23μs | 15μs |
| update_1to2 | 8.06ms | 4.08ms | 11.97ms | 5.58ms | 4.91ms | 2.96ms |
| update_1to4 | 3.96ms | 2.02ms | 5.32ms | 2.46ms | 2.32ms | 1.48ms |
| update_1to1000 | 170μs | 141μs | 171μs | 48μs | 43μs | 453μs |
| cellx1000 | 11.29ms | 9.57ms | 68.39ms | 7.31ms | 9.49ms | 5.16ms |
| cellx2500 | 30.60ms | 26.55ms | 244.22ms | 19.26ms | 30.47ms | 26.53ms |
| cellx5000 | 66.85ms | 73.61ms | 538.46ms | 41.79ms | 58.81ms | 53.99ms |
| 10x5 - 2 sources - read 20.0% (simple) | 344.96ms | 447.72ms | 1.98s | 250.16ms | 535.72ms | 287.91ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 241.74ms | 275.83ms | 1.56s | 177.71ms | 287.82ms | 231.60ms |
| 1000x12 - 4 sources - dynamic (large) | 465.79ms | 3.52s | 1.80s | 284.30ms | 3.70s | 347.98ms |
| 1000x5 - 25 sources (wide dense) | 592.66ms | 2.59s | 3.56s | 413.94ms | 3.58s | 536.66ms |
| 5x500 - 3 sources (deep) | 254.04ms | 232.72ms | 1.12s | 193.22ms | 226.68ms | 205.90ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 385.68ms | 450.14ms | 1.69s | 267.23ms | 482.13ms | 270.97ms |

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
