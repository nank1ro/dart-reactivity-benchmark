# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.67s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.12s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 9.77s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.51s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.64s |
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
| avoidablePropagation | 2.20s | 2.29s | 172.07ms (fail) | 211.22ms | 188.20ms | 209.22ms |
| broadPropagation | 5.48s | 4.38s | 6.56ms (fail) | 457.88ms | 340.80ms | 452.91ms |
| deepPropagation | 2.01s | 1.56s | 140.72ms (fail) | 175.98ms | 122.52ms | 173.67ms |
| diamond | 3.48s | 2.44s | 218.80ms (fail) | 287.00ms | 231.94ms | 279.16ms |
| mux | 2.07s | 1.83s | 195.65ms (fail) | 411.82ms | 378.25ms | 387.82ms |
| repeatedObservers | 211.19ms | 232.97ms | 55.60ms (fail) | 45.07ms | 44.42ms | 40.75ms |
| triangle | 1.13s | 762.85ms | 85.34ms (fail) | 99.71ms | 84.97ms | 97.49ms |
| unstable | 345.63ms | 348.77ms | 338.87ms (fail) | 77.95ms | 61.14ms | 69.93ms |
| molBench | 1.75s | 591.54ms | 929μs | 486.89ms | 485.81ms | 484.78ms |
| create_signals | 67.02ms | 62.41ms | 72.34ms | 30.48ms | 20.59ms | 4.66ms |
| comp_0to1 | 32.40ms | 25.81ms | 49.73ms | 11.21ms | 4.99ms | 16.96ms |
| comp_1to1 | 42.38ms | 31.15ms | 52.38ms | 21.39ms | 11.22ms | 14.98ms |
| comp_2to1 | 20.90ms | 23.61ms | 34.33ms | 12.07ms | 7.11ms | 16.13ms |
| comp_4to1 | 13.20ms | 20.80ms | 18.04ms | 2.83ms | 8.49ms | 10.58ms |
| comp_1000to1 | 2.84ms | 15μs | 46μs | 5μs | 3μs | 6μs |
| comp_1to2 | 27.40ms | 33.38ms | 45.83ms | 19.75ms | 14.32ms | 25.53ms |
| comp_1to4 | 27.82ms | 20.03ms | 43.53ms | 9.72ms | 8.50ms | 27.33ms |
| comp_1to8 | 22.75ms | 23.29ms | 43.66ms | 6.79ms | 3.75ms | 6.11ms |
| comp_1to1000 | 18.31ms | 15.66ms | 40.31ms | 4.75ms | 3.51ms | 5.89ms |
| update_1to1 | 43.01ms | 25.23ms | 9.04ms | 9.38ms | 4.37ms | 8.78ms |
| update_2to1 | 21.63ms | 10.55ms | 2.91ms | 4.67ms | 3.00ms | 4.36ms |
| update_4to1 | 10.75ms | 7.60ms | 2.46ms | 2.36ms | 1.13ms | 2.21ms |
| update_1000to1 | 115μs | 69μs | 15μs | 23μs | 11μs | 21μs |
| update_1to2 | 21.74ms | 14.09ms | 3.43ms | 5.04ms | 2.20ms | 4.37ms |
| update_1to4 | 10.89ms | 7.01ms | 1.52ms | 2.38ms | 1.17ms | 2.19ms |
| update_1to1000 | 220μs | 169μs | 393μs | 45μs | 47μs | 811μs |
| cellx1000 | 160.14ms | 73.38ms | 6.04ms | 9.99ms | 7.60ms | 9.76ms |
| cellx2500 | 505.72ms | 257.92ms | 25.13ms | 36.29ms | 21.26ms | 25.99ms |
| cellx5000 | 1.08s | 553.22ms | 70.54ms | 72.01ms | 46.06ms | 67.47ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.69s (partial) | 2.02s | 275.83ms | 500.93ms | 228.10ms | 426.57ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.33s (partial) | 1.51s | 209.58ms | 276.86ms | 174.86ms | 273.77ms |
| 1000x12 - 4 sources - dynamic (large) | 4.07s (partial) | 1.87s | 346.30ms | 3.69s | 283.60ms | 3.41s |
| 1000x5 - 25 sources (wide dense) | 4.95s (partial) | 3.61s | 529.18ms | 3.44s | 405.49ms | 2.53s |
| 5x500 - 3 sources (deep) | 2.01s (partial) | 1.14s | 235.26ms | 233.94ms | 200.91ms | 226.66ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.79s (partial) | 1.73s | 268.65ms | 474.88ms | 264.80ms | 454.25ms |

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
