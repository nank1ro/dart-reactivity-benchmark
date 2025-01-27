# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.69s |
| 🥈 | preact_signals | 0.26 | 100.0% | 35/35 | 9.76s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.11s |
| 4 | mobx | 0.04 | 100.0% | 35/35 | 27.63s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.56s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.55s |

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
| avoidablePropagation | 2.22s | 2.32s | 166.28ms (fail) | 212.44ms | 191.20ms | 209.71ms |
| broadPropagation | 5.54s | 4.41s | 7.14ms (fail) | 457.82ms | 350.46ms | 457.73ms |
| deepPropagation | 2.01s | 1.57s | 140.17ms (fail) | 170.52ms | 124.33ms | 173.84ms |
| diamond | 3.50s | 2.44s | 198.75ms (fail) | 287.56ms | 240.62ms | 274.10ms |
| mux | 2.05s | 1.83s | 190.86ms (fail) | 414.41ms | 377.09ms | 383.59ms |
| repeatedObservers | 213.25ms | 234.84ms | 55.39ms (fail) | 45.24ms | 44.23ms | 41.39ms |
| triangle | 1.15s | 764.70ms | 79.22ms (fail) | 106.35ms | 89.44ms | 98.80ms |
| unstable | 345.83ms | 353.07ms | 341.24ms (fail) | 77.45ms | 60.74ms | 70.05ms |
| molBench | 1.75s | 586.71ms | 928μs | 486.66ms | 485.71ms | 483.43ms |
| create_signals | 75.92ms | 71.95ms | 70.73ms | 29.57ms | 20.46ms | 4.64ms |
| comp_0to1 | 38.49ms | 20.03ms | 50.72ms | 14.90ms | 5.08ms | 17.13ms |
| comp_1to1 | 46.89ms | 34.97ms | 53.60ms | 18.71ms | 9.01ms | 14.48ms |
| comp_2to1 | 31.34ms | 31.18ms | 34.42ms | 8.20ms | 4.40ms | 15.45ms |
| comp_4to1 | 12.86ms | 18.88ms | 17.84ms | 2.00ms | 7.20ms | 10.96ms |
| comp_1000to1 | 2.05ms | 20μs | 44μs | 5μs | 3μs | 4μs |
| comp_1to2 | 31.41ms | 38.57ms | 46.63ms | 18.80ms | 14.06ms | 24.85ms |
| comp_1to4 | 27.32ms | 26.29ms | 44.17ms | 16.96ms | 8.42ms | 24.17ms |
| comp_1to8 | 23.56ms | 22.19ms | 46.09ms | 8.76ms | 3.67ms | 6.54ms |
| comp_1to1000 | 18.69ms | 15.57ms | 41.07ms | 6.36ms | 3.53ms | 5.44ms |
| update_1to1 | 42.72ms | 27.98ms | 6.46ms | 9.52ms | 4.38ms | 8.76ms |
| update_2to1 | 21.07ms | 13.85ms | 2.93ms | 4.66ms | 2.73ms | 4.36ms |
| update_4to1 | 10.97ms | 7.06ms | 2.55ms | 2.36ms | 1.09ms | 2.21ms |
| update_1000to1 | 115μs | 84μs | 15μs | 23μs | 11μs | 21μs |
| update_1to2 | 21.44ms | 13.89ms | 4.01ms | 4.74ms | 2.19ms | 4.37ms |
| update_1to4 | 10.87ms | 6.93ms | 1.45ms | 3.34ms | 1.20ms | 2.21ms |
| update_1to1000 | 214μs | 166μs | 405μs | 47μs | 29μs | 701μs |
| cellx1000 | 151.73ms | 77.76ms | 5.58ms | 9.91ms | 7.46ms | 9.95ms |
| cellx2500 | 476.87ms | 274.98ms | 24.05ms | 36.48ms | 20.87ms | 25.68ms |
| cellx5000 | 1.06s | 580.95ms | 72.10ms | 80.57ms | 51.25ms | 70.19ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.66s (partial) | 2.04s | 265.77ms | 509.94ms | 232.29ms | 437.27ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.34s (partial) | 1.53s | 208.34ms | 280.06ms | 181.27ms | 275.09ms |
| 1000x12 - 4 sources - dynamic (large) | 4.09s (partial) | 1.90s | 349.09ms | 3.65s | 284.33ms | 3.40s |
| 1000x5 - 25 sources (wide dense) | 4.86s (partial) | 3.50s | 525.38ms | 3.43s | 399.25ms | 2.53s |
| 5x500 - 3 sources (deep) | 1.99s (partial) | 1.16s | 232.31ms | 228.21ms | 206.02ms | 225.84ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.73s (partial) | 1.71s | 264.03ms | 477.78ms | 260.41ms | 444.32ms |

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
