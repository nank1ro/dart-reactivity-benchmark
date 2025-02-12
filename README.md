# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.71s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 9.73s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.11s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.47s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 40.91s |
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
| Test Case | solidart | mobx | state_beacon | signals | alien_signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.27s | 2.37s | 150.15ms (fail) | 207.63ms | 185.03ms | 210.51ms |
| broadPropagation | 5.68s | 4.34s | 6.27ms (fail) | 468.10ms | 350.70ms | 457.07ms |
| deepPropagation | 2.07s | 1.55s | 140.67ms (fail) | 179.96ms | 120.33ms | 178.26ms |
| diamond | 3.58s | 2.47s | 199.03ms (fail) | 293.62ms | 245.25ms | 275.19ms |
| mux | 2.11s | 1.79s | 195.10ms (fail) | 415.81ms | 384.58ms | 391.10ms |
| repeatedObservers | 218.47ms | 241.40ms | 50.63ms (fail) | 45.51ms | 43.68ms | 41.22ms |
| triangle | 1.20s | 806.83ms | 77.85ms (fail) | 101.67ms | 85.77ms | 98.24ms |
| unstable | 356.60ms | 351.05ms | 338.73ms (fail) | 78.48ms | 59.91ms | 69.99ms |
| molBench | 1.77s | 589.78ms | 882μs | 487.13ms | 482.43ms | 485.68ms |
| create_signals | 75.86ms | 55.92ms | 62.90ms | 29.83ms | 20.23ms | 4.63ms |
| comp_0to1 | 28.84ms | 20.35ms | 49.94ms | 15.53ms | 5.07ms | 17.30ms |
| comp_1to1 | 43.14ms | 41.19ms | 55.01ms | 18.92ms | 9.03ms | 14.78ms |
| comp_2to1 | 23.05ms | 23.45ms | 39.27ms | 12.38ms | 3.46ms | 17.12ms |
| comp_4to1 | 14.78ms | 23.50ms | 17.58ms | 2.00ms | 14.79ms | 11.66ms |
| comp_1000to1 | 2.31ms | 16μs | 46μs | 5μs | 4μs | 5μs |
| comp_1to2 | 38.30ms | 34.04ms | 49.57ms | 16.72ms | 12.33ms | 12.61ms |
| comp_1to4 | 23.60ms | 17.60ms | 43.80ms | 13.28ms | 6.91ms | 25.40ms |
| comp_1to8 | 23.44ms | 20.69ms | 43.75ms | 7.40ms | 6.30ms | 6.92ms |
| comp_1to1000 | 18.66ms | 15.47ms | 39.94ms | 5.34ms | 3.52ms | 4.54ms |
| update_1to1 | 44.04ms | 28.01ms | 11.00ms | 9.39ms | 4.35ms | 8.80ms |
| update_2to1 | 22.09ms | 13.93ms | 2.89ms | 4.67ms | 2.21ms | 4.37ms |
| update_4to1 | 10.96ms | 7.30ms | 1.68ms | 2.36ms | 1.17ms | 2.19ms |
| update_1000to1 | 121μs | 67μs | 15μs | 23μs | 11μs | 21μs |
| update_1to2 | 22.25ms | 14.06ms | 3.77ms | 4.72ms | 2.22ms | 4.39ms |
| update_1to4 | 11.11ms | 6.89ms | 1.45ms | 2.35ms | 2.51ms | 2.19ms |
| update_1to1000 | 234μs | 181μs | 404μs | 44μs | 49μs | 154μs |
| cellx1000 | 182.04ms | 79.92ms | 5.78ms | 10.16ms | 7.46ms | 9.74ms |
| cellx2500 | 518.33ms | 273.89ms | 26.60ms | 40.34ms | 22.08ms | 39.36ms |
| cellx5000 | 1.16s | 578.27ms | 85.88ms | 82.12ms | 61.17ms | 79.08ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.73s (partial) | 2.00s | 246.12ms | 501.38ms | 234.90ms | 424.52ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.46s (partial) | 1.54s | 205.12ms | 277.60ms | 181.96ms | 272.33ms |
| 1000x12 - 4 sources - dynamic (large) | 4.19s (partial) | 1.81s | 351.88ms | 3.70s | 290.11ms | 3.38s |
| 1000x5 - 25 sources (wide dense) | 5.03s (partial) | 3.52s | 515.13ms | 3.36s | 406.75ms | 2.51s |
| 5x500 - 3 sources (deep) | 2.13s (partial) | 1.14s | 234.76ms | 231.33ms | 198.63ms | 223.61ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.86s (partial) | 1.71s | 263.83ms | 478.19ms | 259.68ms | 451.15ms |

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
