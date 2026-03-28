# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.28s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.24s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.34s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.82s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.41s |

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
| Test Case | solidart(2.0-dev) | alien_signals | state_beacon | preact_signals | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 275.17ms | 202.34ms | 148.18ms (fail) | 209.19ms | 2.26s | 199.06ms |
| broadPropagation | 498.25ms | 357.63ms | 5.90ms (fail) | 473.37ms | 4.33s | 466.41ms |
| deepPropagation | 166.83ms | 128.41ms | 140.38ms (fail) | 174.36ms | 1.55s | 173.45ms |
| diamond | 347.46ms | 246.15ms | 181.07ms (fail) | 283.75ms | 2.31s | 288.80ms |
| mux | 416.99ms | 361.51ms | 184.06ms (fail) | 369.11ms | 1.78s | 403.31ms |
| repeatedObservers | 80.93ms | 46.42ms | 58.37ms (fail) | 42.28ms | 226.94ms | 45.71ms |
| triangle | 114.14ms | 88.99ms | 76.96ms (fail) | 99.78ms | 744.81ms | 104.02ms |
| unstable | 95.45ms | 62.48ms | 336.81ms (fail) | 71.85ms | 343.16ms | 75.86ms |
| molBench | 489.09ms | 480.78ms | 1.05ms | 496.14ms | 586.05ms | 493.82ms |
| create_signals | 100.11ms | 26.57ms | 61.94ms | 5.43ms | 67.00ms | 25.26ms |
| comp_0to1 | 32.66ms | 7.90ms | 58.27ms | 18.02ms | 26.44ms | 10.79ms |
| comp_1to1 | 26.66ms | 4.21ms | 53.67ms | 12.39ms | 36.05ms | 24.20ms |
| comp_2to1 | 29.14ms | 2.31ms | 36.02ms | 21.35ms | 31.75ms | 11.10ms |
| comp_4to1 | 4.72ms | 8.79ms | 16.18ms | 17.49ms | 25.23ms | 3.49ms |
| comp_1000to1 | 15μs | 5μs | 59μs | 4μs | 17μs | 5μs |
| comp_1to2 | 30.90ms | 15.83ms | 47.84ms | 22.98ms | 38.25ms | 15.42ms |
| comp_1to4 | 14.78ms | 10.04ms | 45.20ms | 20.84ms | 17.60ms | 10.02ms |
| comp_1to8 | 19.44ms | 3.73ms | 44.18ms | 7.60ms | 19.79ms | 6.03ms |
| comp_1to1000 | 14.26ms | 3.47ms | 39.63ms | 6.22ms | 14.94ms | 4.04ms |
| update_1to1 | 15.75ms | 4.65ms | 10.66ms | 9.20ms | 21.71ms | 9.03ms |
| update_2to1 | 7.83ms | 2.33ms | 2.82ms | 4.61ms | 11.57ms | 4.51ms |
| update_4to1 | 3.91ms | 1.21ms | 2.51ms | 2.31ms | 5.48ms | 2.27ms |
| update_1000to1 | 39μs | 11μs | 14μs | 23μs | 52μs | 22μs |
| update_1to2 | 8.03ms | 2.34ms | 4.68ms | 4.58ms | 10.89ms | 4.47ms |
| update_1to4 | 3.94ms | 1.22ms | 1.49ms | 2.46ms | 5.96ms | 2.28ms |
| update_1to1000 | 146μs | 47μs | 378μs | 461μs | 152μs | 41μs |
| cellx1000 | 12.12ms | 7.38ms | 5.14ms | 9.81ms | 68.75ms | 9.78ms |
| cellx2500 | 32.70ms | 19.44ms | 25.12ms | 25.76ms | 262.81ms | 31.39ms |
| cellx5000 | 68.91ms | 42.76ms | 59.13ms | 62.93ms | 571.63ms | 60.66ms |
| 10x5 - 2 sources - read 20.0% (simple) | 385.59ms | 241.38ms | 234.06ms | 450.62ms | 1.97s | 496.55ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 265.11ms | 178.96ms | 198.93ms | 273.04ms | 1.50s | 278.04ms |
| 1000x12 - 4 sources - dynamic (large) | 465.46ms | 280.30ms | 341.00ms | 3.68s | 1.86s | 3.80s |
| 1000x5 - 25 sources (wide dense) | 605.37ms | 407.62ms | 517.11ms | 2.78s | 3.34s | 3.48s |
| 5x500 - 3 sources (deep) | 262.82ms | 191.53ms | 206.32ms | 231.03ms | 1.11s | 223.06ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 386.59ms | 266.19ms | 264.23ms | 445.14ms | 1.67s | 479.85ms |

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
