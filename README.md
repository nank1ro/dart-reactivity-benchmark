# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.66s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.24s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.24s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.01s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.84s |
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
| avoidablePropagation | 208.84ms | 191.22ms | 160.43ms (fail) | 281.19ms | 208.70ms | 2.39s |
| broadPropagation | 448.09ms | 349.53ms | 6.92ms (fail) | 494.04ms | 449.05ms | 4.56s |
| deepPropagation | 171.75ms | 123.13ms | 139.69ms (fail) | 167.75ms | 177.21ms | 1.54s |
| diamond | 280.25ms | 229.01ms | 200.11ms (fail) | 346.93ms | 284.10ms | 2.45s |
| mux | 398.69ms | 355.31ms | 181.77ms (fail) | 416.15ms | 374.93ms | 1.89s |
| repeatedObservers | 46.19ms | 45.19ms | 52.48ms (fail) | 80.64ms | 41.31ms | 230.22ms |
| triangle | 103.35ms | 86.74ms | 85.19ms (fail) | 113.21ms | 100.28ms | 766.57ms |
| unstable | 77.70ms | 63.41ms | 336.00ms (fail) | 96.12ms | 69.54ms | 348.59ms |
| molBench | 496.31ms | 484.19ms | 926μs | 491.18ms | 488.07ms | 590.36ms |
| create_signals | 28.35ms | 21.50ms | 66.00ms | 77.23ms | 5.60ms | 75.40ms |
| comp_0to1 | 12.01ms | 8.78ms | 55.24ms | 26.77ms | 22.02ms | 25.83ms |
| comp_1to1 | 19.43ms | 4.52ms | 63.16ms | 27.76ms | 13.22ms | 32.76ms |
| comp_2to1 | 18.63ms | 2.31ms | 44.19ms | 32.43ms | 20.67ms | 29.57ms |
| comp_4to1 | 2.19ms | 10.32ms | 17.22ms | 12.29ms | 15.45ms | 19.80ms |
| comp_1000to1 | 5μs | 4μs | 43μs | 20μs | 5μs | 19μs |
| comp_1to2 | 18.14ms | 16.61ms | 48.88ms | 32.93ms | 16.36ms | 39.40ms |
| comp_1to4 | 9.86ms | 8.92ms | 45.64ms | 15.15ms | 23.97ms | 27.27ms |
| comp_1to8 | 6.40ms | 6.30ms | 46.16ms | 20.49ms | 8.97ms | 24.55ms |
| comp_1to1000 | 4.34ms | 3.61ms | 40.84ms | 14.83ms | 6.66ms | 15.32ms |
| update_1to1 | 9.42ms | 5.16ms | 6.16ms | 15.53ms | 8.85ms | 25.92ms |
| update_2to1 | 4.76ms | 2.41ms | 3.11ms | 7.73ms | 4.42ms | 10.89ms |
| update_4to1 | 2.35ms | 1.16ms | 1.60ms | 3.88ms | 2.23ms | 7.43ms |
| update_1000to1 | 23μs | 20μs | 16μs | 38μs | 22μs | 67μs |
| update_1to2 | 4.64ms | 3.02ms | 3.09ms | 7.96ms | 4.34ms | 13.14ms |
| update_1to4 | 2.54ms | 1.22ms | 1.61ms | 3.89ms | 2.23ms | 6.91ms |
| update_1to1000 | 44μs | 48μs | 384μs | 144μs | 1.20ms | 191μs |
| cellx1000 | 12.01ms | 7.38ms | 5.41ms | 13.73ms | 9.70ms | 92.46ms |
| cellx2500 | 35.67ms | 20.06ms | 28.96ms | 34.20ms | 26.61ms | 274.71ms |
| cellx5000 | 80.59ms | 46.98ms | 97.02ms | 85.83ms | 74.78ms | 605.27ms |
| 10x5 - 2 sources - read 20.0% (simple) | 499.75ms | 238.84ms | 250.40ms | 354.67ms | 431.44ms | 1.99s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 276.67ms | 176.75ms | 198.58ms | 247.02ms | 270.99ms | 1.50s |
| 1000x12 - 4 sources - dynamic (large) | 3.93s | 277.64ms | 353.69ms | 468.66ms | 3.67s | 2.02s |
| 1000x5 - 25 sources (wide dense) | 3.33s | 405.99ms | 523.99ms | 607.83ms | 2.50s | 3.46s |
| 5x500 - 3 sources (deep) | 226.07ms | 192.22ms | 207.32ms | 255.99ms | 226.74ms | 1.12s |
| 100x15 - 6 sources - dynamic (very dynamic) | 473.64ms | 265.86ms | 261.14ms | 382.18ms | 451.20ms | 1.66s |

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
