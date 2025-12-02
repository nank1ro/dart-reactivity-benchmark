# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.25s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 10.79s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.00s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 27.11s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.40s |

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
| avoidablePropagation | 210.22ms | 187.34ms | 149.65ms (fail) | 277.12ms | 207.61ms | 2.36s |
| broadPropagation | 462.62ms | 353.07ms | 6.55ms (fail) | 511.41ms | 465.18ms | 4.38s |
| deepPropagation | 178.63ms | 124.09ms | 137.84ms (fail) | 165.29ms | 176.24ms | 1.51s |
| diamond | 299.31ms | 229.56ms | 182.22ms (fail) | 353.00ms | 291.20ms | 2.39s |
| mux | 395.25ms | 358.31ms | 183.61ms (fail) | 415.12ms | 370.29ms | 1.86s |
| repeatedObservers | 46.14ms | 44.27ms | 53.60ms (fail) | 80.70ms | 40.55ms | 225.32ms |
| triangle | 101.96ms | 87.96ms | 77.18ms (fail) | 117.36ms | 101.13ms | 758.99ms |
| unstable | 78.13ms | 62.61ms | 334.74ms (fail) | 95.25ms | 71.66ms | 338.21ms |
| molBench | 496.16ms | 485.70ms | 1.00ms | 490.01ms | 483.92ms | 590.34ms |
| create_signals | 25.99ms | 27.50ms | 62.61ms | 76.89ms | 5.32ms | 67.20ms |
| comp_0to1 | 11.52ms | 7.95ms | 57.53ms | 26.09ms | 17.62ms | 22.93ms |
| comp_1to1 | 27.66ms | 4.19ms | 55.86ms | 33.00ms | 13.01ms | 43.76ms |
| comp_2to1 | 9.79ms | 2.27ms | 37.70ms | 43.62ms | 17.50ms | 18.57ms |
| comp_4to1 | 2.19ms | 10.13ms | 18.70ms | 4.37ms | 8.85ms | 30.59ms |
| comp_1000to1 | 5μs | 4μs | 42μs | 15μs | 6μs | 22μs |
| comp_1to2 | 22.47ms | 14.87ms | 45.97ms | 41.22ms | 28.95ms | 34.22ms |
| comp_1to4 | 9.99ms | 5.52ms | 45.99ms | 20.99ms | 33.13ms | 33.48ms |
| comp_1to8 | 6.33ms | 4.45ms | 44.21ms | 20.43ms | 10.78ms | 24.02ms |
| comp_1to1000 | 4.32ms | 3.36ms | 40.64ms | 14.43ms | 7.79ms | 15.14ms |
| update_1to1 | 9.46ms | 4.61ms | 6.52ms | 15.43ms | 8.81ms | 25.64ms |
| update_2to1 | 5.06ms | 2.32ms | 3.08ms | 7.77ms | 4.40ms | 12.83ms |
| update_4to1 | 2.31ms | 1.15ms | 1.56ms | 3.88ms | 2.23ms | 7.15ms |
| update_1000to1 | 23μs | 20μs | 16μs | 52μs | 22μs | 71μs |
| update_1to2 | 4.62ms | 3.00ms | 3.07ms | 7.90ms | 4.36ms | 13.77ms |
| update_1to4 | 2.53ms | 1.86ms | 1.59ms | 3.85ms | 2.22ms | 6.97ms |
| update_1to1000 | 42μs | 48μs | 389μs | 156μs | 946μs | 161μs |
| cellx1000 | 9.87ms | 8.06ms | 5.96ms | 12.02ms | 9.53ms | 76.76ms |
| cellx2500 | 34.59ms | 20.86ms | 27.30ms | 33.14ms | 26.22ms | 265.97ms |
| cellx5000 | 73.25ms | 47.35ms | 64.53ms | 74.37ms | 77.17ms | 582.55ms |
| 10x5 - 2 sources - read 20.0% (simple) | 496.55ms | 276.61ms | 242.10ms | 349.76ms | 441.73ms | 1.91s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 276.51ms | 174.75ms | 196.47ms | 242.08ms | 276.89ms | 1.47s |
| 1000x12 - 4 sources - dynamic (large) | 3.54s | 279.79ms | 340.39ms | 466.79ms | 3.63s | 1.86s |
| 1000x5 - 25 sources (wide dense) | 3.25s | 407.17ms | 512.72ms | 599.77ms | 2.49s | 3.43s |
| 5x500 - 3 sources (deep) | 228.88ms | 188.66ms | 202.96ms | 251.89ms | 224.59ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 472.47ms | 260.33ms | 257.09ms | 391.64ms | 444.19ms | 1.64s |

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
