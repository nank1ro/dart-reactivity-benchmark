# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 2.95s |
| 🥈 | preact_signals | 0.26 | 100.0% | 35/35 | 7.94s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 9.01s |
| 4 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 4.23s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 20.85s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 2.58s |

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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 1.73s | 166.19ms | 144.34ms | 170.47ms | 208.19ms | 118.25ms (fail) |
| broadPropagation | 3.24s | 373.36ms | 275.76ms | 411.14ms | 380.89ms | 5.02ms (fail) |
| deepPropagation | 1.16s | 142.08ms | 92.41ms | 156.28ms | 124.97ms | 115.06ms (fail) |
| diamond | 1.74s | 220.58ms | 202.38ms | 223.05ms | 291.18ms | 147.39ms (fail) |
| mux | 1.33s | 296.14ms | 283.49ms | 300.08ms | 330.16ms | 143.41ms (fail) |
| repeatedObservers | 175.88ms | 36.06ms | 34.31ms | 32.62ms | 67.88ms | 42.72ms (fail) |
| triangle | 555.84ms | 82.33ms | 71.33ms | 81.41ms | 95.77ms | 65.07ms (fail) |
| unstable | 264.09ms | 60.61ms | 46.58ms | 56.78ms | 84.09ms | 263.79ms (fail) |
| molBench | 495.57ms | 424.63ms | 434.69ms | 424.65ms | 441.19ms | 779μs |
| create_signals | 63.70ms | 23.21ms | 22.57ms | 3.98ms | 79.39ms | 46.85ms |
| comp_0to1 | 26.36ms | 10.16ms | 8.47ms | 16.25ms | 33.02ms | 41.34ms |
| comp_1to1 | 41.46ms | 20.02ms | 3.25ms | 10.32ms | 43.27ms | 42.67ms |
| comp_2to1 | 21.68ms | 7.01ms | 1.76ms | 10.27ms | 18.74ms | 29.53ms |
| comp_4to1 | 23.28ms | 2.46ms | 7.34ms | 8.63ms | 7.92ms | 13.46ms |
| comp_1000to1 | 17μs | 5μs | 3μs | 4μs | 15μs | 54μs |
| comp_1to2 | 24.13ms | 14.38ms | 8.63ms | 22.54ms | 33.48ms | 33.93ms |
| comp_1to4 | 19.60ms | 11.75ms | 10.59ms | 19.90ms | 19.09ms | 33.50ms |
| comp_1to8 | 17.77ms | 4.75ms | 2.96ms | 6.85ms | 19.79ms | 32.27ms |
| comp_1to1000 | 11.44ms | 3.12ms | 2.28ms | 2.90ms | 11.71ms | 28.40ms |
| update_1to1 | 18.17ms | 7.34ms | 3.68ms | 7.50ms | 12.99ms | 4.63ms |
| update_2to1 | 8.88ms | 3.64ms | 1.85ms | 3.75ms | 6.55ms | 2.37ms |
| update_4to1 | 4.54ms | 1.84ms | 955μs | 1.86ms | 3.26ms | 1.20ms |
| update_1000to1 | 44μs | 18μs | 8μs | 18μs | 32μs | 12μs |
| update_1to2 | 8.87ms | 3.63ms | 1.85ms | 3.66ms | 6.46ms | 2.33ms |
| update_1to4 | 4.38ms | 1.84ms | 969μs | 1.84ms | 3.25ms | 1.19ms |
| update_1to1000 | 121μs | 30μs | 33μs | 41μs | 116μs | 288μs |
| cellx1000 | 58.51ms | 7.39ms | 5.36ms | 7.76ms | 9.04ms | 4.68ms |
| cellx2500 | 222.28ms | 28.11ms | 15.68ms | 21.28ms | 40.79ms | 21.45ms |
| cellx5000 | 522.46ms | 59.22ms | 46.82ms | 78.99ms | 71.27ms | 55.06ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.62s | 388.68ms | 191.01ms | 350.49ms | 286.24ms | 193.97ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.11s | 210.77ms | 162.26ms | 205.44ms | 208.24ms | 158.82ms |
| 1000x12 - 4 sources - dynamic (large) | 1.43s | 3.14s | 209.24ms | 2.66s | 330.14ms | 232.03ms |
| 1000x5 - 25 sources (wide dense) | 2.70s | 2.73s | 318.88ms | 2.12s | 496.18ms | 359.72ms |
| 5x500 - 3 sources (deep) | 902.00ms | 177.26ms | 157.03ms | 181.25ms | 203.46ms | 154.80ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.30s | 359.86ms | 183.82ms | 340.01ms | 265.07ms | 183.96ms |

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
