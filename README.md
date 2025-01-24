# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.70s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 9.72s |
| 🥉 | signals | 0.23 | 100.0% | 35/35 | 11.29s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 28.03s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.94s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.56s |

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
| avoidablePropagation | 2.21s | 2.31s | 165.60ms (fail) | 207.76ms | 194.52ms | 201.49ms |
| broadPropagation | 5.55s | 4.49s | 7.24ms (fail) | 459.00ms | 347.06ms | 459.89ms |
| deepPropagation | 2.03s | 1.61s | 140.33ms (fail) | 178.01ms | 121.78ms | 171.32ms |
| diamond | 3.50s | 2.44s | 187.66ms (fail) | 283.52ms | 236.17ms | 272.77ms |
| mux | 2.05s | 1.88s | 191.10ms (fail) | 408.77ms | 380.93ms | 384.40ms |
| repeatedObservers | 213.04ms | 232.39ms | 54.34ms (fail) | 45.76ms | 44.58ms | 40.81ms |
| triangle | 1.14s | 783.26ms | 78.84ms (fail) | 100.53ms | 85.03ms | 98.86ms |
| unstable | 347.19ms | 355.46ms | 336.92ms (fail) | 78.04ms | 60.90ms | 68.15ms |
| molBench | 1.75s | 591.44ms | 902μs | 488.03ms | 482.90ms | 483.72ms |
| create_signals | 77.75ms | 59.69ms | 76.72ms | 30.85ms | 20.85ms | 4.79ms |
| comp_0to1 | 33.91ms | 21.71ms | 56.70ms | 19.12ms | 5.10ms | 17.63ms |
| comp_1to1 | 57.76ms | 39.44ms | 54.11ms | 36.62ms | 11.63ms | 18.38ms |
| comp_2to1 | 38.71ms | 22.94ms | 34.78ms | 38.80ms | 14.64ms | 9.92ms |
| comp_4to1 | 14.12ms | 19.17ms | 18.55ms | 30.16ms | 1.83ms | 13.63ms |
| comp_1000to1 | 2.90ms | 18μs | 47μs | 8μs | 6μs | 4μs |
| comp_1to2 | 34.47ms | 38.17ms | 47.12ms | 17.71ms | 10.66ms | 20.34ms |
| comp_1to4 | 24.79ms | 18.02ms | 44.03ms | 15.43ms | 7.54ms | 22.13ms |
| comp_1to8 | 25.63ms | 21.20ms | 46.28ms | 7.49ms | 3.80ms | 8.58ms |
| comp_1to1000 | 19.24ms | 15.96ms | 40.77ms | 6.18ms | 3.71ms | 6.50ms |
| update_1to1 | 43.57ms | 25.10ms | 9.67ms | 9.40ms | 4.39ms | 8.85ms |
| update_2to1 | 21.55ms | 12.88ms | 2.91ms | 4.67ms | 3.26ms | 4.35ms |
| update_4to1 | 10.66ms | 6.26ms | 3.07ms | 2.33ms | 1.11ms | 2.19ms |
| update_1000to1 | 129μs | 57μs | 15μs | 24μs | 11μs | 22μs |
| update_1to2 | 21.70ms | 12.52ms | 3.17ms | 4.74ms | 2.22ms | 4.36ms |
| update_1to4 | 10.88ms | 6.29ms | 1.84ms | 2.34ms | 1.60ms | 2.19ms |
| update_1to1000 | 216μs | 173μs | 417μs | 46μs | 41μs | 535μs |
| cellx1000 | 187.07ms | 91.77ms | 5.80ms | 11.42ms | 8.36ms | 10.08ms |
| cellx2500 | 550.80ms | 311.95ms | 23.93ms | 40.85ms | 21.10ms | 32.66ms |
| cellx5000 | 1.23s | 641.92ms | 77.93ms | 92.25ms | 50.84ms | 76.64ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.65s (partial) | 2.05s | 252.73ms | 511.55ms | 237.50ms | 442.26ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.37s (partial) | 1.55s | 205.99ms | 278.78ms | 182.77ms | 273.94ms |
| 1000x12 - 4 sources - dynamic (large) | 4.07s (partial) | 1.85s | 356.36ms | 3.68s | 291.23ms | 3.36s |
| 1000x5 - 25 sources (wide dense) | 4.90s (partial) | 3.58s | 525.72ms | 3.50s | 403.16ms | 2.52s |
| 5x500 - 3 sources (deep) | 1.98s (partial) | 1.21s | 235.54ms | 227.46ms | 197.48ms | 224.38ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.76s (partial) | 1.73s | 276.68ms | 475.05ms | 266.18ms | 449.90ms |

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
