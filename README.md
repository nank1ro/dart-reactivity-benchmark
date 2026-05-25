# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.35s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 8.72s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 9.28s |
| 4 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 4.97s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 25.72s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.09s |

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
| Test Case | preact_signals | solidart(2.0-dev) | mobx | alien_signals | state_beacon | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 192.17ms | 247.37ms | 2.28s | 168.30ms | 132.40ms (fail) | 200.86ms |
| broadPropagation | 381.90ms | 461.62ms | 4.07s | 307.58ms | 5.50ms (fail) | 424.26ms |
| deepPropagation | 180.48ms | 149.99ms | 1.43s | 107.51ms | 154.44ms (fail) | 174.46ms |
| diamond | 258.14ms | 349.72ms | 2.25s | 234.22ms | 175.77ms (fail) | 261.97ms |
| mux | 330.76ms | 393.78ms | 1.70s | 327.20ms | 157.97ms (fail) | 338.16ms |
| repeatedObservers | 33.96ms | 73.30ms | 216.68ms | 40.60ms | 45.74ms (fail) | 39.17ms |
| triangle | 93.73ms | 114.45ms | 717.14ms | 79.99ms | 76.07ms (fail) | 91.24ms |
| unstable | 58.39ms | 96.66ms | 324.18ms | 57.99ms | 319.67ms (fail) | 65.86ms |
| molBench | 364.40ms | 370.67ms | 476.49ms | 363.20ms | 884μs | 389.51ms |
| create_signals | 6.87ms | 90.78ms | 85.83ms | 34.05ms | 61.84ms | 26.11ms |
| comp_0to1 | 18.81ms | 59.00ms | 30.31ms | 10.49ms | 54.25ms | 12.35ms |
| comp_1to1 | 22.11ms | 27.63ms | 49.81ms | 6.02ms | 55.15ms | 32.83ms |
| comp_2to1 | 21.62ms | 51.44ms | 21.24ms | 3.57ms | 37.75ms | 11.31ms |
| comp_4to1 | 11.52ms | 20.66ms | 34.58ms | 15.52ms | 15.86ms | 9.32ms |
| comp_1000to1 | 6μs | 16μs | 17μs | 6μs | 39μs | 7μs |
| comp_1to2 | 30.37ms | 36.67ms | 35.91ms | 15.86ms | 45.37ms | 20.90ms |
| comp_1to4 | 29.37ms | 23.27ms | 20.23ms | 18.60ms | 45.42ms | 9.28ms |
| comp_1to8 | 8.36ms | 25.06ms | 24.99ms | 6.32ms | 43.54ms | 8.79ms |
| comp_1to1000 | 7.58ms | 15.33ms | 15.40ms | 4.53ms | 39.14ms | 5.82ms |
| update_1to1 | 8.06ms | 14.92ms | 19.79ms | 3.83ms | 5.41ms | 9.97ms |
| update_2to1 | 4.09ms | 7.11ms | 9.68ms | 1.97ms | 2.41ms | 5.04ms |
| update_4to1 | 2.04ms | 3.65ms | 5.03ms | 1.04ms | 1.24ms | 2.43ms |
| update_1000to1 | 20μs | 36μs | 48μs | 10μs | 11μs | 34μs |
| update_1to2 | 4.16ms | 7.32ms | 9.69ms | 2.06ms | 2.21ms | 4.87ms |
| update_1to4 | 2.04ms | 3.65ms | 4.99ms | 1.03ms | 1.18ms | 2.55ms |
| update_1to1000 | 364μs | 166μs | 159μs | 45μs | 365μs | 70μs |
| cellx1000 | 10.93ms | 18.82ms | 76.42ms | 8.72ms | 9.64ms | 12.00ms |
| cellx2500 | 26.24ms | 57.44ms | 247.07ms | 27.32ms | 31.58ms | 39.26ms |
| cellx5000 | 68.79ms | 129.46ms | 543.37ms | 69.92ms | 68.74ms | 88.17ms |
| 10x5 - 2 sources - read 20.0% (simple) | 402.55ms | 366.44ms | 1.96s | 229.69ms | 227.44ms | 422.30ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 234.23ms | 252.59ms | 1.42s | 173.73ms | 177.49ms | 238.79ms |
| 1000x12 - 4 sources - dynamic (large) | 3.04s | 374.96ms | 1.61s | 251.24ms | 279.27ms | 3.15s |
| 1000x5 - 25 sources (wide dense) | 2.25s | 543.81ms | 3.27s | 356.64ms | 392.85ms | 2.59s |
| 5x500 - 3 sources (deep) | 225.60ms | 271.43ms | 1.13s | 196.06ms | 208.29ms | 209.35ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 390.77ms | 310.48ms | 1.62s | 225.81ms | 219.91ms | 392.29ms |

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
