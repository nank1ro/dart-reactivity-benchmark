# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.32s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 10.41s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.55s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.58s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.55s |

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
| avoidablePropagation | 211.08ms | 195.38ms | 164.18ms (fail) | 264.86ms | 200.96ms | 2.35s |
| broadPropagation | 463.26ms | 354.87ms | 6.45ms (fail) | 502.82ms | 471.27ms | 4.32s |
| deepPropagation | 176.79ms | 126.16ms | 139.50ms (fail) | 163.54ms | 183.09ms | 1.55s |
| diamond | 283.46ms | 234.65ms | 204.73ms (fail) | 354.43ms | 281.98ms | 2.44s |
| mux | 410.10ms | 376.75ms | 194.78ms (fail) | 441.92ms | 392.46ms | 1.84s |
| repeatedObservers | 46.10ms | 43.85ms | 52.79ms (fail) | 81.27ms | 40.29ms | 229.40ms |
| triangle | 101.86ms | 86.06ms | 79.76ms (fail) | 114.51ms | 100.14ms | 760.51ms |
| unstable | 76.27ms | 60.28ms | 340.26ms (fail) | 96.13ms | 76.25ms | 338.26ms |
| molBench | 485.35ms | 489.18ms | 1.05ms | 501.19ms | 488.96ms | 587.33ms |
| create_signals | 26.10ms | 27.79ms | 67.85ms | 78.16ms | 4.94ms | 68.82ms |
| comp_0to1 | 11.88ms | 8.87ms | 66.83ms | 25.67ms | 18.78ms | 15.69ms |
| comp_1to1 | 28.80ms | 9.11ms | 60.70ms | 42.72ms | 12.89ms | 44.47ms |
| comp_2to1 | 16.90ms | 4.45ms | 40.77ms | 24.11ms | 13.22ms | 35.08ms |
| comp_4to1 | 2.28ms | 17.05ms | 17.29ms | 15.02ms | 8.84ms | 17.23ms |
| comp_1000to1 | 5μs | 4μs | 46μs | 15μs | 5μs | 32μs |
| comp_1to2 | 13.70ms | 12.88ms | 50.40ms | 37.45ms | 27.30ms | 34.61ms |
| comp_1to4 | 12.96ms | 6.97ms | 48.23ms | 21.08ms | 23.00ms | 21.46ms |
| comp_1to8 | 6.81ms | 6.61ms | 47.76ms | 22.89ms | 9.61ms | 24.67ms |
| comp_1to1000 | 4.40ms | 3.51ms | 42.15ms | 14.36ms | 9.40ms | 15.58ms |
| update_1to1 | 10.24ms | 4.27ms | 6.00ms | 19.66ms | 8.41ms | 28.62ms |
| update_2to1 | 4.55ms | 2.18ms | 3.09ms | 8.07ms | 4.39ms | 14.10ms |
| update_4to1 | 2.54ms | 1.14ms | 1.56ms | 4.11ms | 2.10ms | 7.04ms |
| update_1000to1 | 25μs | 19μs | 15μs | 40μs | 20μs | 79μs |
| update_1to2 | 4.54ms | 2.69ms | 3.02ms | 8.35ms | 4.38ms | 13.71ms |
| update_1to4 | 2.58ms | 1.09ms | 1.54ms | 4.08ms | 2.09ms | 6.96ms |
| update_1to1000 | 45μs | 47μs | 425μs | 152μs | 43μs | 186μs |
| cellx1000 | 10.03ms | 13.13ms | 5.84ms | 13.02ms | 10.39ms | 94.56ms |
| cellx2500 | 35.05ms | 20.74ms | 27.91ms | 40.37ms | 32.86ms | 289.46ms |
| cellx5000 | 82.18ms | 46.85ms | 71.57ms | 94.92ms | 90.03ms | 659.01ms |
| 10x5 - 2 sources - read 20.0% (simple) | 512.11ms | 239.06ms | 246.53ms | 350.74ms | 465.80ms | 2.01s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 281.00ms | 181.60ms | 198.72ms | 248.99ms | 282.06ms | 1.50s |
| 1000x12 - 4 sources - dynamic (large) | 4.01s | 292.06ms | 370.75ms | 468.91ms | 3.72s | 1.95s |
| 1000x5 - 25 sources (wide dense) | 3.52s | 414.23ms | 514.49ms | 608.89ms | 2.73s | 3.47s |
| 5x500 - 3 sources (deep) | 222.24ms | 200.84ms | 208.41ms | 262.46ms | 228.49ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 475.98ms | 261.19ms | 266.55ms | 387.87ms | 465.76ms | 1.70s |

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
