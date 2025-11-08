# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.32s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.22s |
| 4 | preact_signals | 0.27 | 100.0% | 35/35 | 10.52s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.52s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.42s |

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
| avoidablePropagation | 217.80ms | 194.44ms | 169.22ms (fail) | 263.01ms | 202.44ms | 2.37s |
| broadPropagation | 460.62ms | 358.02ms | 6.45ms (fail) | 503.44ms | 458.59ms | 4.37s |
| deepPropagation | 176.42ms | 126.47ms | 141.36ms (fail) | 163.21ms | 181.30ms | 1.55s |
| diamond | 286.94ms | 237.54ms | 189.02ms (fail) | 370.38ms | 284.24ms | 2.42s |
| mux | 410.82ms | 377.90ms | 193.31ms (fail) | 439.57ms | 387.02ms | 1.84s |
| repeatedObservers | 46.51ms | 43.78ms | 52.63ms (fail) | 81.64ms | 40.31ms | 236.81ms |
| triangle | 105.62ms | 85.53ms | 77.48ms (fail) | 114.98ms | 99.03ms | 783.05ms |
| unstable | 76.59ms | 62.44ms | 338.76ms (fail) | 96.50ms | 74.67ms | 348.06ms |
| molBench | 488.10ms | 491.13ms | 951μs | 500.59ms | 489.69ms | 581.78ms |
| create_signals | 25.16ms | 21.81ms | 67.47ms | 77.00ms | 18.95ms | 66.98ms |
| comp_0to1 | 11.41ms | 8.24ms | 58.90ms | 26.11ms | 21.19ms | 27.23ms |
| comp_1to1 | 27.64ms | 4.16ms | 57.11ms | 47.87ms | 7.13ms | 45.51ms |
| comp_2to1 | 13.35ms | 2.29ms | 38.05ms | 17.26ms | 11.55ms | 33.78ms |
| comp_4to1 | 3.11ms | 7.70ms | 16.88ms | 11.82ms | 12.25ms | 21.70ms |
| comp_1000to1 | 5μs | 3μs | 43μs | 19μs | 8μs | 33μs |
| comp_1to2 | 13.00ms | 10.74ms | 47.90ms | 31.62ms | 20.31ms | 28.86ms |
| comp_1to4 | 12.00ms | 11.61ms | 45.99ms | 18.98ms | 33.86ms | 24.23ms |
| comp_1to8 | 6.70ms | 4.44ms | 45.41ms | 24.19ms | 8.62ms | 26.35ms |
| comp_1to1000 | 4.40ms | 3.46ms | 41.52ms | 14.94ms | 7.33ms | 15.23ms |
| update_1to1 | 10.29ms | 10.04ms | 6.00ms | 17.46ms | 8.64ms | 28.18ms |
| update_2to1 | 4.54ms | 2.16ms | 3.44ms | 11.44ms | 4.36ms | 14.04ms |
| update_4to1 | 2.57ms | 2.49ms | 1.50ms | 4.41ms | 2.11ms | 7.12ms |
| update_1000to1 | 26μs | 19μs | 33μs | 41μs | 20μs | 69μs |
| update_1to2 | 4.49ms | 4.74ms | 3.02ms | 8.85ms | 4.10ms | 13.87ms |
| update_1to4 | 2.55ms | 2.42ms | 1.50ms | 4.40ms | 2.11ms | 5.33ms |
| update_1to1000 | 43μs | 47μs | 428μs | 153μs | 51μs | 187μs |
| cellx1000 | 9.66ms | 7.49ms | 5.20ms | 11.87ms | 9.83ms | 74.33ms |
| cellx2500 | 31.75ms | 20.24ms | 21.75ms | 33.20ms | 26.93ms | 253.44ms |
| cellx5000 | 64.78ms | 44.50ms | 62.84ms | 79.26ms | 76.75ms | 548.85ms |
| 10x5 - 2 sources - read 20.0% (simple) | 505.35ms | 234.04ms | 234.82ms | 357.80ms | 523.09ms | 2.01s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 281.06ms | 181.16ms | 196.50ms | 251.22ms | 293.44ms | 1.55s |
| 1000x12 - 4 sources - dynamic (large) | 3.77s | 290.27ms | 338.99ms | 468.59ms | 3.76s | 1.88s |
| 1000x5 - 25 sources (wide dense) | 3.43s | 404.51ms | 490.75ms | 613.50ms | 2.73s | 3.51s |
| 5x500 - 3 sources (deep) | 223.98ms | 190.06ms | 203.52ms | 259.99ms | 248.97ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 488.06ms | 264.27ms | 263.82ms | 390.70ms | 470.82ms | 1.71s |

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
