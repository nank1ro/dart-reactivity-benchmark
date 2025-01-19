# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.65s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.18s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 9.71s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.35s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.58s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.48s |

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
| Test Case | alien_signals | signals | preact_signals | solidart | state_beacon | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 186.96ms | 209.81ms | 211.32ms | 2.20s | 160.48ms (fail) | 2.30s |
| broadPropagation | 345.64ms | 472.41ms | 455.18ms | 5.51s | 6.63ms (fail) | 4.34s |
| deepPropagation | 118.65ms | 175.09ms | 174.98ms | 2.02s | 138.76ms (fail) | 1.55s |
| diamond | 246.93ms | 291.23ms | 273.64ms | 3.47s | 188.30ms (fail) | 2.42s |
| mux | 380.66ms | 411.42ms | 382.05ms | 2.04s | 194.71ms (fail) | 1.79s |
| repeatedObservers | 44.44ms | 45.03ms | 40.99ms | 212.42ms | 55.57ms (fail) | 234.25ms |
| triangle | 85.85ms | 102.02ms | 99.00ms | 1.15s | 76.26ms (fail) | 766.68ms |
| unstable | 60.42ms | 77.81ms | 70.07ms | 343.85ms | 335.33ms (fail) | 357.02ms |
| molBench | 476.99ms | 486.67ms | 483.48ms | 1.77s | 1.23ms | 597.27ms |
| create_signals | 20.29ms | 29.48ms | 4.57ms | 59.54ms | 72.19ms | 77.64ms |
| comp_0to1 | 4.98ms | 14.66ms | 16.99ms | 39.69ms | 53.59ms | 15.49ms |
| comp_1to1 | 8.80ms | 22.30ms | 18.48ms | 41.04ms | 52.24ms | 37.61ms |
| comp_2to1 | 4.20ms | 8.57ms | 15.89ms | 32.32ms | 33.84ms | 33.28ms |
| comp_4to1 | 8.35ms | 2.21ms | 10.88ms | 12.79ms | 17.27ms | 20.52ms |
| comp_1000to1 | 4μs | 5μs | 4μs | 2.13ms | 43μs | 15μs |
| comp_1to2 | 13.96ms | 24.74ms | 17.39ms | 31.34ms | 47.47ms | 32.85ms |
| comp_1to4 | 8.98ms | 7.41ms | 21.73ms | 28.64ms | 43.92ms | 17.91ms |
| comp_1to8 | 3.99ms | 6.70ms | 9.04ms | 22.78ms | 44.08ms | 20.57ms |
| comp_1to1000 | 3.63ms | 4.59ms | 5.87ms | 18.54ms | 40.63ms | 15.60ms |
| update_1to1 | 4.38ms | 9.36ms | 8.85ms | 42.67ms | 9.15ms | 27.40ms |
| update_2to1 | 2.80ms | 4.66ms | 4.36ms | 22.82ms | 2.91ms | 14.17ms |
| update_4to1 | 1.09ms | 2.37ms | 2.20ms | 10.70ms | 2.47ms | 7.23ms |
| update_1000to1 | 10μs | 23μs | 32μs | 128μs | 15μs | 71μs |
| update_1to2 | 2.17ms | 4.73ms | 5.65ms | 21.69ms | 3.23ms | 14.07ms |
| update_1to4 | 1.09ms | 2.36ms | 2.23ms | 10.85ms | 1.50ms | 6.99ms |
| update_1to1000 | 60μs | 45μs | 500μs | 233μs | 408μs | 160μs |
| cellx1000 | 8.70ms | 9.65ms | 10.11ms | 151.25ms | 5.28ms | 72.71ms |
| cellx2500 | 20.04ms | 30.98ms | 28.33ms | 476.02ms | 19.93ms | 250.71ms |
| cellx5000 | 42.10ms | 62.39ms | 72.23ms | 1.08s | 60.84ms | 569.62ms |
| 10x5 - 2 sources - read 20.0% (simple) | 230.29ms | 501.59ms | 424.64ms | 2.64s (partial) | 275.63ms | 2.03s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 175.21ms | 276.52ms | 274.31ms | 2.38s (partial) | 205.71ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 279.20ms | 3.68s | 3.38s | 4.02s (partial) | 333.52ms | 1.84s |
| 1000x5 - 25 sources (wide dense) | 399.39ms | 3.50s | 2.51s | 4.92s (partial) | 512.87ms | 3.49s |
| 5x500 - 3 sources (deep) | 202.18ms | 231.10ms | 230.10ms | 2.00s (partial) | 229.64ms | 1.16s |
| 100x15 - 6 sources - dynamic (very dynamic) | 262.45ms | 485.50ms | 446.26ms | 2.79s (partial) | 256.88ms | 1.72s |

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
