# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.35s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 10.96s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.05s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 27.87s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.45s |

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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 218.45ms | 186.85ms | 144.18ms (fail) | 276.70ms | 207.75ms | 2.46s |
| broadPropagation | 473.05ms | 353.71ms | 5.96ms (fail) | 500.67ms | 452.61ms | 4.55s |
| deepPropagation | 170.30ms | 124.42ms | 139.45ms (fail) | 168.14ms | 179.90ms | 1.55s |
| diamond | 291.62ms | 231.16ms | 180.12ms (fail) | 353.63ms | 284.37ms | 2.46s |
| mux | 391.91ms | 360.45ms | 185.83ms (fail) | 427.76ms | 371.61ms | 1.85s |
| repeatedObservers | 46.41ms | 43.66ms | 53.62ms (fail) | 81.18ms | 41.27ms | 236.99ms |
| triangle | 104.06ms | 83.05ms | 77.73ms (fail) | 113.73ms | 100.04ms | 796.67ms |
| unstable | 78.23ms | 63.75ms | 334.49ms (fail) | 98.66ms | 75.76ms | 356.95ms |
| molBench | 496.01ms | 486.58ms | 988μs | 491.13ms | 486.43ms | 496.67ms |
| create_signals | 27.12ms | 27.44ms | 69.24ms | 83.61ms | 5.85ms | 69.18ms |
| comp_0to1 | 12.21ms | 8.60ms | 55.58ms | 30.48ms | 18.37ms | 35.02ms |
| comp_1to1 | 25.05ms | 4.37ms | 54.43ms | 39.90ms | 13.91ms | 54.55ms |
| comp_2to1 | 17.84ms | 2.36ms | 37.68ms | 25.90ms | 17.98ms | 23.78ms |
| comp_4to1 | 2.09ms | 8.75ms | 16.15ms | 10.40ms | 20.42ms | 28.84ms |
| comp_1000to1 | 5μs | 6μs | 41μs | 20μs | 4μs | 15μs |
| comp_1to2 | 18.20ms | 19.77ms | 44.80ms | 33.09ms | 31.29ms | 42.93ms |
| comp_1to4 | 11.48ms | 11.68ms | 44.87ms | 26.93ms | 23.48ms | 22.66ms |
| comp_1to8 | 7.64ms | 5.22ms | 43.45ms | 21.70ms | 9.26ms | 24.45ms |
| comp_1to1000 | 4.52ms | 3.62ms | 38.77ms | 15.19ms | 6.77ms | 15.63ms |
| update_1to1 | 9.32ms | 5.30ms | 6.10ms | 15.49ms | 8.83ms | 25.13ms |
| update_2to1 | 4.78ms | 2.38ms | 3.08ms | 7.75ms | 4.36ms | 11.76ms |
| update_4to1 | 2.38ms | 1.23ms | 1.58ms | 3.86ms | 2.22ms | 7.38ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 69μs |
| update_1to2 | 4.85ms | 2.87ms | 3.09ms | 8.02ms | 4.33ms | 13.87ms |
| update_1to4 | 2.55ms | 1.19ms | 1.61ms | 3.87ms | 2.23ms | 6.94ms |
| update_1to1000 | 50μs | 44μs | 381μs | 156μs | 555μs | 302μs |
| cellx1000 | 11.88ms | 8.36ms | 5.99ms | 17.43ms | 10.43ms | 88.85ms |
| cellx2500 | 47.68ms | 24.84ms | 31.23ms | 49.48ms | 29.47ms | 280.26ms |
| cellx5000 | 113.31ms | 65.18ms | 83.13ms | 131.74ms | 80.38ms | 625.04ms |
| 10x5 - 2 sources - read 20.0% (simple) | 499.38ms | 234.64ms | 245.31ms | 348.77ms | 434.62ms | 1.98s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 277.48ms | 175.31ms | 204.34ms | 244.59ms | 265.08ms | 1.46s |
| 1000x12 - 4 sources - dynamic (large) | 3.63s | 281.32ms | 355.02ms | 470.11ms | 3.66s | 2.01s |
| 1000x5 - 25 sources (wide dense) | 3.26s | 413.43ms | 522.59ms | 597.32ms | 2.51s | 3.44s |
| 5x500 - 3 sources (deep) | 226.39ms | 203.45ms | 204.84ms | 260.97ms | 227.90ms | 1.15s |
| 100x15 - 6 sources - dynamic (very dynamic) | 476.25ms | 267.87ms | 258.31ms | 386.87ms | 461.16ms | 1.69s |

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
