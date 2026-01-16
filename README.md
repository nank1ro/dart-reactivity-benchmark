# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.32s |
| 🥉 | signals | 0.28 | 100.0% | 35/35 | 11.20s |
| 4 | preact_signals | 0.28 | 100.0% | 35/35 | 10.12s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.36s |
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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 213.70ms | 188.81ms | 146.66ms (fail) | 278.96ms | 206.76ms | 2.41s |
| broadPropagation | 449.34ms | 352.05ms | 6.17ms (fail) | 508.48ms | 449.55ms | 4.40s |
| deepPropagation | 176.67ms | 126.98ms | 139.12ms (fail) | 167.92ms | 178.79ms | 1.52s |
| diamond | 283.84ms | 235.24ms | 194.95ms (fail) | 350.26ms | 286.06ms | 2.42s |
| mux | 386.25ms | 360.38ms | 180.00ms (fail) | 418.78ms | 385.31ms | 1.88s |
| repeatedObservers | 46.18ms | 44.35ms | 53.59ms (fail) | 81.16ms | 40.36ms | 241.94ms |
| triangle | 99.63ms | 86.48ms | 78.61ms (fail) | 120.74ms | 101.75ms | 760.90ms |
| unstable | 77.96ms | 63.58ms | 340.11ms (fail) | 96.27ms | 69.56ms | 352.51ms |
| molBench | 495.37ms | 485.07ms | 1.29ms | 490.18ms | 485.01ms | 591.55ms |
| create_signals | 25.90ms | 28.59ms | 64.92ms | 78.96ms | 5.32ms | 69.99ms |
| comp_0to1 | 11.94ms | 10.99ms | 53.68ms | 26.30ms | 18.17ms | 15.65ms |
| comp_1to1 | 19.23ms | 8.55ms | 55.43ms | 27.64ms | 14.58ms | 37.80ms |
| comp_2to1 | 10.91ms | 19.30ms | 37.99ms | 47.22ms | 13.59ms | 23.59ms |
| comp_4to1 | 3.33ms | 1.75ms | 16.34ms | 13.58ms | 14.83ms | 25.25ms |
| comp_1000to1 | 5μs | 3μs | 42μs | 16μs | 4μs | 15μs |
| comp_1to2 | 13.81ms | 18.44ms | 45.19ms | 34.92ms | 18.59ms | 38.52ms |
| comp_1to4 | 16.23ms | 12.57ms | 44.35ms | 14.99ms | 36.32ms | 17.65ms |
| comp_1to8 | 6.77ms | 4.17ms | 41.94ms | 22.18ms | 7.83ms | 20.93ms |
| comp_1to1000 | 4.26ms | 3.50ms | 38.31ms | 14.77ms | 4.87ms | 15.54ms |
| update_1to1 | 9.27ms | 5.01ms | 6.12ms | 15.46ms | 8.74ms | 25.61ms |
| update_2to1 | 4.70ms | 3.69ms | 3.16ms | 7.74ms | 4.34ms | 10.70ms |
| update_4to1 | 2.34ms | 1.23ms | 1.59ms | 3.89ms | 2.22ms | 7.46ms |
| update_1000to1 | 23μs | 23μs | 16μs | 39μs | 22μs | 69μs |
| update_1to2 | 4.62ms | 2.27ms | 3.12ms | 7.90ms | 4.34ms | 13.17ms |
| update_1to4 | 2.54ms | 1.22ms | 1.60ms | 3.90ms | 2.21ms | 6.95ms |
| update_1to1000 | 45μs | 49μs | 367μs | 162μs | 248μs | 162μs |
| cellx1000 | 10.25ms | 7.41ms | 6.66ms | 15.52ms | 10.29ms | 81.58ms |
| cellx2500 | 38.33ms | 22.81ms | 35.34ms | 46.38ms | 33.79ms | 265.75ms |
| cellx5000 | 95.95ms | 53.55ms | 81.92ms | 136.99ms | 98.94ms | 573.64ms |
| 10x5 - 2 sources - read 20.0% (simple) | 511.55ms | 239.13ms | 246.79ms | 342.19ms | 459.54ms | 1.98s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 282.05ms | 173.36ms | 205.15ms | 244.10ms | 263.90ms | 1.47s |
| 1000x12 - 4 sources - dynamic (large) | 3.91s | 284.17ms | 360.10ms | 470.79ms | 3.69s | 1.96s |
| 1000x5 - 25 sources (wide dense) | 3.27s | 417.37ms | 520.99ms | 590.19ms | 2.51s | 3.35s |
| 5x500 - 3 sources (deep) | 225.17ms | 198.26ms | 206.28ms | 256.35ms | 229.62ms | 1.11s |
| 100x15 - 6 sources - dynamic (very dynamic) | 486.63ms | 264.33ms | 259.43ms | 386.73ms | 463.34ms | 1.65s |

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
