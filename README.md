# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.26s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.52s |
| 4 | signals | 0.24 | 100.0% | 35/35 | 11.29s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.45s |
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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 213.15ms | 193.74ms | 161.29ms (fail) | 265.04ms | 205.34ms | 2.31s |
| broadPropagation | 475.50ms | 352.98ms | 6.33ms (fail) | 500.01ms | 455.43ms | 4.32s |
| deepPropagation | 178.80ms | 126.33ms | 157.30ms (fail) | 164.29ms | 178.15ms | 1.57s |
| diamond | 284.85ms | 233.67ms | 209.35ms (fail) | 355.12ms | 281.22ms | 2.41s |
| mux | 412.26ms | 373.26ms | 193.96ms (fail) | 431.26ms | 392.13ms | 1.84s |
| repeatedObservers | 46.10ms | 43.97ms | 52.73ms (fail) | 80.92ms | 41.19ms | 228.72ms |
| triangle | 103.84ms | 93.28ms | 81.12ms (fail) | 114.07ms | 100.13ms | 770.36ms |
| unstable | 75.42ms | 60.09ms | 342.15ms (fail) | 94.55ms | 75.33ms | 346.36ms |
| molBench | 486.95ms | 489.28ms | 962μs | 498.70ms | 489.82ms | 581.20ms |
| create_signals | 45.71ms | 27.37ms | 67.20ms | 78.18ms | 4.72ms | 74.98ms |
| comp_0to1 | 14.17ms | 7.88ms | 59.16ms | 25.18ms | 17.87ms | 20.27ms |
| comp_1to1 | 33.72ms | 4.30ms | 63.95ms | 49.84ms | 13.11ms | 36.22ms |
| comp_2to1 | 16.84ms | 2.23ms | 45.46ms | 24.22ms | 13.30ms | 8.64ms |
| comp_4to1 | 12.02ms | 7.58ms | 17.37ms | 11.18ms | 12.71ms | 26.77ms |
| comp_1000to1 | 7μs | 3μs | 44μs | 15μs | 4μs | 18μs |
| comp_1to2 | 25.36ms | 11.59ms | 49.94ms | 31.55ms | 31.26ms | 41.45ms |
| comp_1to4 | 11.17ms | 13.33ms | 45.83ms | 21.35ms | 33.01ms | 22.48ms |
| comp_1to8 | 11.55ms | 5.02ms | 45.38ms | 19.36ms | 8.06ms | 24.92ms |
| comp_1to1000 | 4.86ms | 3.40ms | 40.96ms | 14.23ms | 6.89ms | 15.39ms |
| update_1to1 | 10.35ms | 9.98ms | 6.02ms | 16.42ms | 8.73ms | 27.27ms |
| update_2to1 | 4.60ms | 2.57ms | 3.63ms | 8.92ms | 4.59ms | 12.46ms |
| update_4to1 | 2.61ms | 2.36ms | 1.66ms | 4.09ms | 2.23ms | 7.04ms |
| update_1000to1 | 25μs | 26μs | 15μs | 40μs | 20μs | 68μs |
| update_1to2 | 4.55ms | 5.06ms | 3.02ms | 8.36ms | 4.29ms | 11.72ms |
| update_1to4 | 2.57ms | 2.40ms | 1.51ms | 4.08ms | 2.17ms | 7.08ms |
| update_1to1000 | 42μs | 47μs | 419μs | 149μs | 158μs | 183μs |
| cellx1000 | 9.75ms | 7.22ms | 5.19ms | 15.86ms | 9.62ms | 76.08ms |
| cellx2500 | 32.98ms | 19.51ms | 23.47ms | 36.87ms | 29.63ms | 273.57ms |
| cellx5000 | 71.70ms | 45.79ms | 58.04ms | 74.74ms | 96.44ms | 594.15ms |
| 10x5 - 2 sources - read 20.0% (simple) | 508.94ms | 240.80ms | 259.80ms | 353.87ms | 509.63ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.22ms | 176.50ms | 199.47ms | 251.56ms | 288.02ms | 1.56s |
| 1000x12 - 4 sources - dynamic (large) | 3.76s | 280.35ms | 346.83ms | 462.10ms | 3.74s | 1.89s |
| 1000x5 - 25 sources (wide dense) | 3.44s | 405.26ms | 514.54ms | 611.52ms | 2.75s | 3.49s |
| 5x500 - 3 sources (deep) | 224.30ms | 194.21ms | 204.33ms | 252.52ms | 248.35ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 486.08ms | 265.16ms | 264.46ms | 381.84ms | 468.41ms | 1.71s |

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
