# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.69s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.26s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 9.75s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.36s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.94s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.60s |

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
| Test Case | solidart | mobx | state_beacon | signals | alien_signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.21s | 2.39s | 168.36ms (fail) | 208.14ms | 191.67ms | 210.82ms |
| broadPropagation | 5.51s | 4.34s | 6.58ms (fail) | 475.82ms | 344.71ms | 454.24ms |
| deepPropagation | 2.03s | 1.55s | 140.67ms (fail) | 171.94ms | 120.81ms | 174.24ms |
| diamond | 3.49s | 2.45s | 211.20ms (fail) | 286.61ms | 235.02ms | 287.19ms |
| mux | 2.05s | 1.80s | 191.55ms (fail) | 413.18ms | 378.73ms | 382.49ms |
| repeatedObservers | 213.67ms | 248.70ms | 53.67ms (fail) | 45.77ms | 44.40ms | 40.87ms |
| triangle | 1.13s | 773.01ms | 82.54ms (fail) | 100.89ms | 84.94ms | 97.03ms |
| unstable | 343.75ms | 356.38ms | 338.19ms (fail) | 77.56ms | 59.28ms | 69.71ms |
| molBench | 1.76s | 588.38ms | 1.12ms | 485.63ms | 487.78ms | 483.65ms |
| create_signals | 69.90ms | 70.02ms | 72.34ms | 29.52ms | 20.65ms | 4.63ms |
| comp_0to1 | 51.72ms | 20.01ms | 49.48ms | 14.94ms | 4.99ms | 17.05ms |
| comp_1to1 | 51.03ms | 34.13ms | 52.68ms | 20.67ms | 11.11ms | 14.99ms |
| comp_2to1 | 26.13ms | 9.73ms | 33.40ms | 8.31ms | 14.71ms | 15.05ms |
| comp_4to1 | 14.34ms | 14.43ms | 17.38ms | 2.01ms | 1.64ms | 9.23ms |
| comp_1000to1 | 2.17ms | 17μs | 45μs | 12μs | 5μs | 9μs |
| comp_1to2 | 29.38ms | 33.22ms | 46.44ms | 22.83ms | 9.88ms | 24.99ms |
| comp_1to4 | 27.28ms | 19.68ms | 45.97ms | 8.49ms | 10.88ms | 27.73ms |
| comp_1to8 | 24.25ms | 21.46ms | 43.75ms | 7.26ms | 8.72ms | 5.34ms |
| comp_1to1000 | 18.43ms | 16.15ms | 40.23ms | 4.61ms | 3.63ms | 6.02ms |
| update_1to1 | 44.62ms | 27.74ms | 8.72ms | 9.39ms | 4.46ms | 8.79ms |
| update_2to1 | 40.96ms | 14.07ms | 2.91ms | 4.68ms | 2.42ms | 4.76ms |
| update_4to1 | 11.04ms | 6.94ms | 1.75ms | 2.37ms | 1.16ms | 3.61ms |
| update_1000to1 | 120μs | 90μs | 15μs | 23μs | 11μs | 21μs |
| update_1to2 | 22.14ms | 13.78ms | 4.01ms | 4.73ms | 2.22ms | 4.40ms |
| update_1to4 | 11.07ms | 6.86ms | 1.48ms | 2.36ms | 1.15ms | 2.22ms |
| update_1to1000 | 216μs | 183μs | 400μs | 45μs | 49μs | 1.06ms |
| cellx1000 | 154.59ms | 67.58ms | 7.25ms | 9.83ms | 7.59ms | 10.01ms |
| cellx2500 | 485.86ms | 241.60ms | 25.78ms | 32.25ms | 22.37ms | 28.57ms |
| cellx5000 | 1.08s | 532.51ms | 69.55ms | 69.80ms | 47.44ms | 68.25ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.65s (partial) | 2.00s | 274.30ms | 503.44ms | 233.97ms | 437.49ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.38s (partial) | 1.51s | 206.85ms | 286.55ms | 181.16ms | 283.95ms |
| 1000x12 - 4 sources - dynamic (large) | 4.12s (partial) | 1.89s | 376.59ms | 3.74s | 284.30ms | 3.38s |
| 1000x5 - 25 sources (wide dense) | 4.95s (partial) | 3.51s | 528.84ms | 3.50s | 405.01ms | 2.52s |
| 5x500 - 3 sources (deep) | 2.11s (partial) | 1.12s | 233.84ms | 231.88ms | 199.55ms | 225.56ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.82s (partial) | 1.70s | 266.59ms | 479.15ms | 263.55ms | 450.08ms |

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
