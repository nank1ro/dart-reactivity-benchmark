# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.78s |
| 🥈 | solidart(2.0-dev) | 0.31 | 100.0% | 35/35 | 5.34s |
| 🥉 | signals | 0.28 | 100.0% | 35/35 | 11.31s |
| 4 | preact_signals | 0.27 | 100.0% | 35/35 | 10.44s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.67s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.57s |

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
| Test Case | preact_signals | state_beacon | solidart(2.0-dev) | signals | alien_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 201.01ms | 160.07ms (fail) | 260.24ms | 217.47ms | 195.71ms | 2.31s |
| broadPropagation | 460.86ms | 6.66ms (fail) | 492.40ms | 459.53ms | 355.08ms | 4.34s |
| deepPropagation | 178.48ms | 141.54ms (fail) | 165.74ms | 177.51ms | 131.04ms | 1.54s |
| diamond | 283.84ms | 185.59ms (fail) | 369.04ms | 284.63ms | 233.43ms | 2.42s |
| mux | 393.92ms | 194.66ms (fail) | 435.07ms | 410.41ms | 380.35ms | 1.83s |
| repeatedObservers | 40.09ms | 52.51ms (fail) | 80.64ms | 46.16ms | 43.69ms | 231.42ms |
| triangle | 98.67ms | 77.89ms (fail) | 114.49ms | 100.13ms | 85.20ms | 767.07ms |
| unstable | 74.52ms | 375.34ms (fail) | 96.19ms | 76.29ms | 61.73ms | 344.76ms |
| molBench | 482.98ms | 956μs | 501.15ms | 487.29ms | 493.03ms | 585.15ms |
| create_signals | 4.87ms | 67.72ms | 82.57ms | 26.26ms | 28.29ms | 68.96ms |
| comp_0to1 | 18.13ms | 59.62ms | 54.39ms | 12.19ms | 10.10ms | 27.41ms |
| comp_1to1 | 11.41ms | 57.25ms | 42.59ms | 25.26ms | 11.14ms | 40.11ms |
| comp_2to1 | 11.76ms | 44.85ms | 44.38ms | 12.71ms | 5.96ms | 35.47ms |
| comp_4to1 | 10.62ms | 17.80ms | 4.35ms | 9.06ms | 15.19ms | 25.52ms |
| comp_1000to1 | 9μs | 45μs | 18μs | 8μs | 4μs | 15μs |
| comp_1to2 | 18.97ms | 50.52ms | 27.61ms | 18.29ms | 12.66ms | 36.69ms |
| comp_1to4 | 32.83ms | 51.50ms | 20.47ms | 7.47ms | 7.25ms | 17.74ms |
| comp_1to8 | 8.04ms | 46.53ms | 22.23ms | 6.93ms | 6.85ms | 20.08ms |
| comp_1to1000 | 7.57ms | 41.15ms | 13.87ms | 4.43ms | 3.70ms | 15.03ms |
| update_1to1 | 8.30ms | 6.02ms | 16.32ms | 10.34ms | 8.94ms | 28.37ms |
| update_2to1 | 7.22ms | 3.10ms | 8.13ms | 4.69ms | 2.15ms | 14.04ms |
| update_4to1 | 2.30ms | 1.54ms | 4.12ms | 2.60ms | 2.55ms | 6.60ms |
| update_1000to1 | 37μs | 16μs | 40μs | 26μs | 20μs | 69μs |
| update_1to2 | 4.10ms | 3.04ms | 8.43ms | 4.79ms | 5.01ms | 14.13ms |
| update_1to4 | 2.11ms | 1.55ms | 4.11ms | 2.86ms | 2.39ms | 6.86ms |
| update_1to1000 | 792μs | 429μs | 148μs | 44μs | 47μs | 168μs |
| cellx1000 | 10.23ms | 5.45ms | 12.68ms | 9.96ms | 9.16ms | 87.01ms |
| cellx2500 | 34.30ms | 25.46ms | 40.25ms | 36.91ms | 26.19ms | 286.05ms |
| cellx5000 | 90.66ms | 70.25ms | 108.41ms | 75.52ms | 50.42ms | 603.63ms |
| 10x5 - 2 sources - read 20.0% (simple) | 452.75ms | 266.65ms | 352.79ms | 510.16ms | 239.10ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 274.45ms | 204.36ms | 248.65ms | 281.05ms | 181.80ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 3.75s | 359.46ms | 471.26ms | 3.78s | 292.93ms | 2.01s |
| 1000x5 - 25 sources (wide dense) | 2.77s | 516.54ms | 602.61ms | 3.50s | 412.04ms | 3.51s |
| 5x500 - 3 sources (deep) | 232.54ms | 210.37ms | 251.51ms | 223.78ms | 198.79ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 462.17ms | 267.65ms | 380.68ms | 481.13ms | 268.96ms | 1.76s |

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
