# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.22s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 10.73s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.50s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.08s |
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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.25s | 204.81ms | 198.12ms | 207.51ms | 278.98ms | 148.11ms (fail) |
| broadPropagation | 4.34s | 469.84ms | 358.64ms | 465.15ms | 503.08ms | 5.89ms (fail) |
| deepPropagation | 1.56s | 167.46ms | 127.57ms | 179.15ms | 166.04ms | 138.85ms (fail) |
| diamond | 2.36s | 283.65ms | 246.32ms | 286.67ms | 340.15ms | 179.79ms (fail) |
| mux | 1.78s | 399.54ms | 361.06ms | 372.08ms | 422.01ms | 179.90ms (fail) |
| repeatedObservers | 227.26ms | 45.54ms | 44.74ms | 44.35ms | 80.81ms | 55.73ms (fail) |
| triangle | 758.38ms | 101.73ms | 87.99ms | 99.90ms | 114.94ms | 78.72ms (fail) |
| unstable | 342.35ms | 76.58ms | 61.81ms | 71.53ms | 95.41ms | 335.43ms (fail) |
| molBench | 585.83ms | 495.91ms | 482.74ms | 497.26ms | 490.20ms | 1.06ms |
| create_signals | 86.97ms | 25.89ms | 27.03ms | 5.52ms | 54.31ms | 64.69ms |
| comp_0to1 | 15.00ms | 12.90ms | 8.09ms | 17.92ms | 25.64ms | 59.96ms |
| comp_1to1 | 43.23ms | 27.39ms | 4.44ms | 14.06ms | 42.07ms | 60.94ms |
| comp_2to1 | 23.44ms | 8.96ms | 2.39ms | 18.45ms | 24.66ms | 39.84ms |
| comp_4to1 | 20.54ms | 3.74ms | 7.77ms | 17.01ms | 12.36ms | 18.75ms |
| comp_1000to1 | 15μs | 5μs | 6μs | 5μs | 18μs | 48μs |
| comp_1to2 | 39.07ms | 20.86ms | 11.54ms | 20.38ms | 33.26ms | 52.01ms |
| comp_1to4 | 28.02ms | 10.26ms | 9.29ms | 28.46ms | 19.58ms | 51.38ms |
| comp_1to8 | 22.98ms | 6.11ms | 4.95ms | 5.97ms | 19.73ms | 49.69ms |
| comp_1to1000 | 14.78ms | 4.04ms | 3.52ms | 5.19ms | 14.27ms | 45.63ms |
| update_1to1 | 21.15ms | 8.98ms | 4.65ms | 9.33ms | 15.97ms | 7.48ms |
| update_2to1 | 10.39ms | 4.45ms | 2.34ms | 4.60ms | 7.91ms | 2.84ms |
| update_4to1 | 5.39ms | 2.26ms | 1.20ms | 2.34ms | 3.97ms | 2.76ms |
| update_1000to1 | 60μs | 48μs | 11μs | 23μs | 40μs | 14μs |
| update_1to2 | 11.42ms | 4.41ms | 2.34ms | 4.54ms | 8.07ms | 4.07ms |
| update_1to4 | 5.22ms | 2.26ms | 1.20ms | 2.44ms | 4.00ms | 1.44ms |
| update_1to1000 | 155μs | 40μs | 29μs | 196μs | 147μs | 436μs |
| cellx1000 | 84.38ms | 9.86ms | 7.88ms | 10.14ms | 11.53ms | 5.75ms |
| cellx2500 | 242.13ms | 34.72ms | 24.40ms | 29.69ms | 49.73ms | 25.92ms |
| cellx5000 | 588.54ms | 87.99ms | 55.42ms | 80.12ms | 96.01ms | 72.61ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.01s | 499.68ms | 231.84ms | 452.36ms | 344.44ms | 254.77ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.51s | 281.79ms | 176.57ms | 275.00ms | 248.41ms | 201.84ms |
| 1000x12 - 4 sources - dynamic (large) | 1.77s | 3.47s | 282.57ms | 3.78s | 466.23ms | 341.61ms |
| 1000x5 - 25 sources (wide dense) | 3.50s | 3.25s | 414.11ms | 2.80s | 597.37ms | 517.14ms |
| 5x500 - 3 sources (deep) | 1.14s | 225.53ms | 195.71ms | 234.27ms | 253.22ms | 212.25ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.68s | 475.62ms | 264.25ms | 452.10ms | 379.80ms | 259.58ms |

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
