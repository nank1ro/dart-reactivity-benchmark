# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.68s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 9.72s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.44s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.41s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.65s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.53s |

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
| avoidablePropagation | 2.19s | 2.33s | 159.50ms (fail) | 206.18ms | 187.81ms | 210.48ms |
| broadPropagation | 5.51s | 4.35s | 6.08ms (fail) | 473.09ms | 345.41ms | 451.18ms |
| deepPropagation | 2.03s | 1.56s | 166.72ms (fail) | 173.92ms | 123.20ms | 175.94ms |
| diamond | 3.47s | 2.43s | 208.46ms (fail) | 285.47ms | 237.22ms | 284.95ms |
| mux | 2.09s | 1.83s | 195.19ms (fail) | 415.81ms | 376.91ms | 387.61ms |
| repeatedObservers | 212.45ms | 241.20ms | 53.47ms (fail) | 45.41ms | 43.59ms | 41.40ms |
| triangle | 1.14s | 775.81ms | 82.13ms (fail) | 100.83ms | 85.90ms | 98.99ms |
| unstable | 343.57ms | 351.83ms | 333.87ms (fail) | 76.60ms | 60.13ms | 70.14ms |
| molBench | 1.75s | 587.51ms | 1.01ms | 486.79ms | 480.77ms | 483.58ms |
| create_signals | 61.83ms | 72.41ms | 72.59ms | 28.68ms | 20.17ms | 4.73ms |
| comp_0to1 | 29.72ms | 15.64ms | 56.59ms | 14.14ms | 4.95ms | 17.86ms |
| comp_1to1 | 45.85ms | 49.11ms | 51.93ms | 24.41ms | 11.32ms | 20.36ms |
| comp_2to1 | 21.02ms | 21.82ms | 33.17ms | 11.05ms | 5.59ms | 19.06ms |
| comp_4to1 | 20.26ms | 23.16ms | 19.05ms | 2.02ms | 8.94ms | 12.29ms |
| comp_1000to1 | 2.20ms | 15μs | 43μs | 5μs | 3μs | 6μs |
| comp_1to2 | 32.28ms | 32.69ms | 45.99ms | 17.35ms | 18.06ms | 24.78ms |
| comp_1to4 | 28.93ms | 18.11ms | 43.26ms | 7.41ms | 4.94ms | 25.97ms |
| comp_1to8 | 23.24ms | 20.60ms | 43.34ms | 6.56ms | 4.90ms | 6.83ms |
| comp_1to1000 | 19.29ms | 15.38ms | 39.94ms | 4.67ms | 3.40ms | 4.43ms |
| update_1to1 | 43.10ms | 26.47ms | 8.56ms | 9.96ms | 4.94ms | 8.81ms |
| update_2to1 | 21.77ms | 13.20ms | 2.89ms | 4.67ms | 2.20ms | 4.39ms |
| update_4to1 | 10.75ms | 7.13ms | 2.55ms | 2.36ms | 1.74ms | 2.21ms |
| update_1000to1 | 115μs | 70μs | 15μs | 23μs | 11μs | 21μs |
| update_1to2 | 21.57ms | 13.84ms | 3.83ms | 4.72ms | 2.23ms | 4.36ms |
| update_1to4 | 10.96ms | 6.53ms | 1.46ms | 2.36ms | 1.15ms | 2.21ms |
| update_1to1000 | 219μs | 161μs | 403μs | 46μs | 48μs | 160μs |
| cellx1000 | 154.44ms | 72.69ms | 5.22ms | 9.86ms | 7.47ms | 9.47ms |
| cellx2500 | 471.68ms | 254.58ms | 19.90ms | 32.75ms | 20.12ms | 26.18ms |
| cellx5000 | 1.09s | 553.96ms | 59.14ms | 64.39ms | 44.20ms | 75.63ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.64s (partial) | 1.98s | 253.99ms | 511.25ms | 234.79ms | 423.61ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.38s (partial) | 1.52s | 205.09ms | 278.36ms | 180.98ms | 271.27ms |
| 1000x12 - 4 sources - dynamic (large) | 4.06s (partial) | 1.79s | 344.27ms | 3.93s | 291.00ms | 3.36s |
| 1000x5 - 25 sources (wide dense) | 4.96s (partial) | 3.55s | 508.62ms | 3.50s | 404.73ms | 2.52s |
| 5x500 - 3 sources (deep) | 2.01s (partial) | 1.17s | 232.47ms | 233.46ms | 197.92ms | 225.88ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.77s (partial) | 1.72s | 264.30ms | 476.54ms | 261.38ms | 447.09ms |

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
