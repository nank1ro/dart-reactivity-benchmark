# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.70s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.00s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.45s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.14s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.08s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| avoidablePropagation | 273.15ms | 206.65ms | 2.29s | 185.16ms | 211.41ms | 161.05ms (fail) |
| broadPropagation | 502.09ms | 455.91ms | 4.24s | 353.94ms | 458.01ms | 6.29ms (fail) |
| deepPropagation | 177.36ms | 177.39ms | 1.52s | 124.47ms | 179.76ms | 137.86ms (fail) |
| diamond | 362.42ms | 278.90ms | 2.38s | 234.88ms | 296.37ms | 185.46ms (fail) |
| mux | 437.27ms | 383.96ms | 1.82s | 373.42ms | 415.88ms | 191.78ms (fail) |
| repeatedObservers | 78.71ms | 38.24ms | 224.74ms | 44.87ms | 47.20ms | 52.03ms (fail) |
| triangle | 117.62ms | 103.68ms | 765.42ms | 86.47ms | 102.01ms | 76.89ms (fail) |
| unstable | 94.16ms | 70.53ms | 344.55ms | 60.84ms | 76.91ms | 341.62ms (fail) |
| molBench | 493.84ms | 497.10ms | 576.27ms | 490.88ms | 489.36ms | 990μs |
| create_signals | 102.91ms | 4.73ms | 54.36ms | 26.92ms | 25.86ms | 61.80ms |
| comp_0to1 | 34.20ms | 18.76ms | 15.22ms | 7.99ms | 12.20ms | 55.34ms |
| comp_1to1 | 48.13ms | 11.62ms | 40.27ms | 4.49ms | 25.81ms | 56.34ms |
| comp_2to1 | 33.79ms | 13.91ms | 34.52ms | 2.41ms | 19.40ms | 38.99ms |
| comp_4to1 | 4.48ms | 12.19ms | 18.07ms | 8.67ms | 5.20ms | 16.82ms |
| comp_1000to1 | 15μs | 4μs | 32μs | 6μs | 5μs | 45μs |
| comp_1to2 | 37.72ms | 29.19ms | 34.42ms | 13.82ms | 14.53ms | 48.22ms |
| comp_1to4 | 23.16ms | 21.05ms | 17.48ms | 6.76ms | 11.43ms | 46.53ms |
| comp_1to8 | 26.77ms | 9.85ms | 20.01ms | 7.34ms | 6.88ms | 45.74ms |
| comp_1to1000 | 18.07ms | 4.47ms | 15.21ms | 3.52ms | 4.48ms | 40.79ms |
| update_1to1 | 18.64ms | 8.18ms | 22.44ms | 11.32ms | 9.31ms | 5.78ms |
| update_2to1 | 7.94ms | 4.05ms | 11.10ms | 5.26ms | 4.58ms | 2.87ms |
| update_4to1 | 4.03ms | 2.10ms | 6.12ms | 2.84ms | 2.32ms | 1.45ms |
| update_1000to1 | 52μs | 20μs | 67μs | 10μs | 26μs | 15μs |
| update_1to2 | 8.14ms | 4.18ms | 11.59ms | 5.60ms | 4.92ms | 2.95ms |
| update_1to4 | 4.18ms | 2.08ms | 5.87ms | 2.58ms | 2.31ms | 1.45ms |
| update_1to1000 | 152μs | 78μs | 166μs | 48μs | 44μs | 404μs |
| cellx1000 | 13.71ms | 13.21ms | 72.74ms | 7.20ms | 9.75ms | 5.36ms |
| cellx2500 | 49.12ms | 34.95ms | 263.68ms | 19.75ms | 34.99ms | 23.61ms |
| cellx5000 | 164.72ms | 106.87ms | 571.09ms | 45.70ms | 72.03ms | 77.60ms |
| 10x5 - 2 sources - read 20.0% (simple) | 350.61ms | 442.78ms | 2.01s | 231.69ms | 538.60ms | 262.50ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 249.40ms | 268.92ms | 1.55s | 175.86ms | 284.79ms | 199.99ms |
| 1000x12 - 4 sources - dynamic (large) | 474.62ms | 3.51s | 1.82s | 289.24ms | 3.65s | 352.60ms |
| 1000x5 - 25 sources (wide dense) | 590.64ms | 2.58s | 3.50s | 412.58ms | 3.42s | 498.64ms |
| 5x500 - 3 sources (deep) | 259.93ms | 232.03ms | 1.14s | 192.40ms | 226.14ms | 205.01ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 388.67ms | 447.12ms | 1.70s | 263.88ms | 478.13ms | 254.82ms |

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
