# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.26s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.61s |
| 4 | preact_signals | 0.27 | 100.0% | 35/35 | 9.96s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.53s |
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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 278.20ms | 210.89ms | 2.38s | 190.96ms | 216.55ms | 159.57ms (fail) |
| broadPropagation | 498.99ms | 466.71ms | 4.23s | 359.26ms | 461.15ms | 6.05ms (fail) |
| deepPropagation | 169.34ms | 177.14ms | 1.52s | 124.60ms | 179.89ms | 139.78ms (fail) |
| diamond | 350.60ms | 293.47ms | 2.46s | 234.23ms | 289.09ms | 193.92ms (fail) |
| mux | 439.62ms | 386.42ms | 1.84s | 370.63ms | 399.24ms | 191.70ms (fail) |
| repeatedObservers | 79.32ms | 38.85ms | 239.38ms | 45.39ms | 46.43ms | 52.11ms (fail) |
| triangle | 119.83ms | 106.18ms | 780.27ms | 86.92ms | 104.59ms | 76.95ms (fail) |
| unstable | 97.74ms | 70.69ms | 353.46ms | 64.35ms | 74.11ms | 338.19ms (fail) |
| molBench | 492.43ms | 491.82ms | 580.08ms | 491.99ms | 488.34ms | 1.09ms |
| create_signals | 55.95ms | 5.01ms | 62.12ms | 27.35ms | 29.26ms | 65.73ms |
| comp_0to1 | 27.58ms | 19.66ms | 15.26ms | 10.57ms | 12.16ms | 57.57ms |
| comp_1to1 | 46.54ms | 11.61ms | 47.01ms | 8.15ms | 40.29ms | 59.05ms |
| comp_2to1 | 25.17ms | 22.98ms | 23.87ms | 19.90ms | 13.53ms | 40.88ms |
| comp_4to1 | 9.79ms | 13.47ms | 27.32ms | 1.66ms | 2.08ms | 18.92ms |
| comp_1000to1 | 15μs | 6μs | 15μs | 5μs | 7μs | 42μs |
| comp_1to2 | 31.51ms | 16.67ms | 34.52ms | 11.42ms | 20.20ms | 49.19ms |
| comp_1to4 | 20.70ms | 31.06ms | 17.74ms | 10.49ms | 10.68ms | 47.88ms |
| comp_1to8 | 23.44ms | 9.44ms | 20.48ms | 7.56ms | 7.20ms | 44.74ms |
| comp_1to1000 | 15.07ms | 9.94ms | 14.58ms | 3.50ms | 4.56ms | 39.51ms |
| update_1to1 | 16.14ms | 8.17ms | 25.09ms | 11.27ms | 9.22ms | 5.74ms |
| update_2to1 | 13.46ms | 4.17ms | 10.81ms | 5.02ms | 4.59ms | 2.87ms |
| update_4to1 | 4.08ms | 2.09ms | 6.51ms | 2.80ms | 2.32ms | 1.43ms |
| update_1000to1 | 40μs | 20μs | 55μs | 11μs | 23μs | 15μs |
| update_1to2 | 8.72ms | 4.08ms | 11.60ms | 5.48ms | 4.90ms | 2.93ms |
| update_1to4 | 4.04ms | 2.04ms | 5.29ms | 2.26ms | 2.35ms | 1.44ms |
| update_1to1000 | 152μs | 831μs | 157μs | 42μs | 44μs | 383μs |
| cellx1000 | 11.87ms | 10.31ms | 80.98ms | 7.58ms | 10.74ms | 5.26ms |
| cellx2500 | 37.99ms | 34.95ms | 269.42ms | 21.00ms | 39.79ms | 26.14ms |
| cellx5000 | 101.89ms | 86.50ms | 596.85ms | 47.77ms | 81.62ms | 83.86ms |
| 10x5 - 2 sources - read 20.0% (simple) | 346.64ms | 446.46ms | 2.04s | 234.72ms | 506.16ms | 247.20ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 241.38ms | 273.19ms | 1.55s | 175.52ms | 281.07ms | 202.68ms |
| 1000x12 - 4 sources - dynamic (large) | 472.00ms | 3.44s | 1.84s | 284.63ms | 3.99s | 347.31ms |
| 1000x5 - 25 sources (wide dense) | 593.16ms | 2.60s | 3.55s | 406.86ms | 3.58s | 505.73ms |
| 5x500 - 3 sources (deep) | 250.51ms | 232.07ms | 1.16s | 195.57ms | 229.06ms | 206.23ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 379.25ms | 442.99ms | 1.74s | 263.69ms | 476.15ms | 259.67ms |

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
