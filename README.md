# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.67s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.29s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.03s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.72s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.62s |
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
| Test Case | alien_signals | mobx | solidart | state_beacon | preact_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 185.82ms | 2.35s | 2.17s | 149.89ms (fail) | 205.73ms | 212.40ms |
| broadPropagation | 352.59ms | 4.27s | 5.40s | 6.42ms (fail) | 460.63ms | 457.39ms |
| deepPropagation | 121.65ms | 1.54s | 1.99s | 137.33ms (fail) | 179.10ms | 181.55ms |
| diamond | 232.10ms | 2.43s | 3.40s | 183.66ms (fail) | 279.15ms | 290.45ms |
| mux | 383.93ms | 1.82s | 2.08s | 190.27ms (fail) | 377.77ms | 409.61ms |
| repeatedObservers | 45.38ms | 237.12ms | 206.24ms | 52.04ms (fail) | 38.35ms | 47.17ms |
| triangle | 83.36ms | 773.13ms | 1.14s | 75.51ms (fail) | 98.79ms | 103.86ms |
| unstable | 59.42ms | 350.58ms | 346.95ms | 337.11ms (fail) | 70.21ms | 74.49ms |
| molBench | 491.59ms | 580.75ms | 1.71s | 1.27ms | 492.04ms | 484.55ms |
| create_signals | 27.09ms | 78.13ms | 49.96ms | 70.47ms | 4.84ms | 25.38ms |
| comp_0to1 | 8.81ms | 33.28ms | 34.33ms | 56.06ms | 18.14ms | 11.85ms |
| comp_1to1 | 4.24ms | 27.31ms | 48.50ms | 58.74ms | 11.87ms | 17.20ms |
| comp_2to1 | 2.35ms | 19.85ms | 20.51ms | 36.49ms | 9.80ms | 8.83ms |
| comp_4to1 | 7.69ms | 14.43ms | 17.45ms | 16.87ms | 17.92ms | 7.17ms |
| comp_1000to1 | 4μs | 15μs | 2.49ms | 43μs | 4μs | 8μs |
| comp_1to2 | 10.57ms | 35.97ms | 34.81ms | 45.85ms | 29.18ms | 16.24ms |
| comp_1to4 | 11.88ms | 24.89ms | 30.79ms | 44.81ms | 21.93ms | 19.15ms |
| comp_1to8 | 5.10ms | 24.25ms | 26.50ms | 43.60ms | 12.48ms | 11.30ms |
| comp_1to1000 | 3.67ms | 15.07ms | 18.09ms | 39.55ms | 10.62ms | 4.89ms |
| update_1to1 | 6.58ms | 26.67ms | 41.02ms | 5.73ms | 8.29ms | 9.85ms |
| update_2to1 | 5.11ms | 11.50ms | 20.60ms | 2.87ms | 4.11ms | 4.56ms |
| update_4to1 | 1.57ms | 6.33ms | 10.19ms | 1.43ms | 2.30ms | 2.38ms |
| update_1000to1 | 24μs | 69μs | 113μs | 15μs | 20μs | 23μs |
| update_1to2 | 3.83ms | 11.12ms | 20.62ms | 2.94ms | 4.17ms | 4.83ms |
| update_1to4 | 2.48ms | 5.22ms | 10.17ms | 1.43ms | 2.04ms | 2.29ms |
| update_1to1000 | 42μs | 171μs | 224μs | 397μs | 1.78ms | 62μs |
| cellx1000 | 7.34ms | 76.61ms | 161.16ms | 5.16ms | 9.96ms | 9.59ms |
| cellx2500 | 19.92ms | 247.23ms | 494.92ms | 24.86ms | 29.81ms | 25.89ms |
| cellx5000 | 44.90ms | 586.48ms | 1.22s | 68.31ms | 87.65ms | 70.16ms |
| 10x5 - 2 sources - read 20.0% (simple) | 229.73ms | 2.02s | 2.65s (partial) | 241.32ms | 440.24ms | 503.71ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 176.69ms | 1.57s | 2.44s (partial) | 203.53ms | 274.27ms | 278.65ms |
| 1000x12 - 4 sources - dynamic (large) | 279.02ms | 1.94s | 4.12s (partial) | 344.48ms | 3.55s | 3.79s |
| 1000x5 - 25 sources (wide dense) | 409.62ms | 3.66s | 4.92s (partial) | 503.66ms | 2.60s | 3.45s |
| 5x500 - 3 sources (deep) | 188.14ms | 1.19s | 2.00s (partial) | 203.02ms | 227.54ms | 228.40ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 262.08ms | 1.75s | 2.79s (partial) | 265.04ms | 453.06ms | 520.17ms |

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
