# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.35s |
| 🥈 | signals | 0.29 | 100.0% | 35/35 | 9.31s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 8.84s |
| 4 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 4.93s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.51s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.12s |

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
| avoidablePropagation | 242.16ms | 170.81ms | 135.47ms (fail) | 189.56ms | 2.29s | 198.97ms |
| broadPropagation | 461.55ms | 301.54ms | 6.02ms (fail) | 383.43ms | 4.07s | 383.96ms |
| deepPropagation | 151.48ms | 107.25ms | 153.62ms (fail) | 180.41ms | 1.44s | 176.94ms |
| diamond | 343.23ms | 233.09ms | 177.62ms (fail) | 253.60ms | 2.28s | 258.90ms |
| mux | 389.23ms | 332.11ms | 160.39ms (fail) | 329.30ms | 1.80s | 328.63ms |
| repeatedObservers | 72.64ms | 39.66ms | 45.69ms (fail) | 34.66ms | 223.44ms | 39.39ms |
| triangle | 111.83ms | 79.69ms | 75.40ms (fail) | 91.98ms | 730.60ms | 93.02ms |
| unstable | 96.49ms | 59.65ms | 323.02ms (fail) | 59.09ms | 321.71ms | 66.52ms |
| molBench | 370.72ms | 364.40ms | 871μs | 388.67ms | 454.68ms | 367.70ms |
| create_signals | 78.64ms | 28.30ms | 65.53ms | 6.92ms | 70.31ms | 28.36ms |
| comp_0to1 | 26.82ms | 8.63ms | 53.22ms | 19.62ms | 25.76ms | 11.91ms |
| comp_1to1 | 54.84ms | 6.08ms | 56.27ms | 15.49ms | 40.35ms | 16.53ms |
| comp_2to1 | 23.98ms | 3.57ms | 37.48ms | 19.23ms | 22.17ms | 8.82ms |
| comp_4to1 | 18.74ms | 10.82ms | 17.93ms | 23.77ms | 31.17ms | 5.10ms |
| comp_1000to1 | 49μs | 5μs | 43μs | 5μs | 17μs | 6μs |
| comp_1to2 | 42.87ms | 14.45ms | 47.42ms | 16.63ms | 38.44ms | 31.88ms |
| comp_1to4 | 32.40ms | 11.40ms | 46.05ms | 22.10ms | 24.27ms | 13.97ms |
| comp_1to8 | 25.30ms | 6.54ms | 46.21ms | 9.67ms | 24.35ms | 11.57ms |
| comp_1to1000 | 15.22ms | 5.22ms | 40.58ms | 7.84ms | 16.05ms | 5.49ms |
| update_1to1 | 14.38ms | 3.88ms | 4.69ms | 8.16ms | 19.75ms | 8.51ms |
| update_2to1 | 7.18ms | 1.89ms | 2.44ms | 3.60ms | 10.24ms | 4.32ms |
| update_4to1 | 3.60ms | 972μs | 1.19ms | 1.95ms | 5.38ms | 2.17ms |
| update_1000to1 | 37μs | 10μs | 11μs | 19μs | 50μs | 20μs |
| update_1to2 | 7.20ms | 2.09ms | 2.48ms | 3.75ms | 9.78ms | 4.09ms |
| update_1to4 | 3.62ms | 1.00ms | 1.16ms | 1.90ms | 5.16ms | 2.18ms |
| update_1to1000 | 148μs | 45μs | 390μs | 476μs | 166μs | 60μs |
| cellx1000 | 20.39ms | 9.50ms | 9.61ms | 10.91ms | 92.52ms | 11.69ms |
| cellx2500 | 65.29ms | 30.18ms | 32.96ms | 28.82ms | 278.31ms | 35.43ms |
| cellx5000 | 134.80ms | 84.25ms | 78.16ms | 81.55ms | 600.44ms | 83.98ms |
| 10x5 - 2 sources - read 20.0% (simple) | 363.71ms | 230.39ms | 239.06ms | 396.03ms | 2.06s | 431.43ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 251.20ms | 171.97ms | 172.64ms | 238.19ms | 1.48s | 237.81ms |
| 1000x12 - 4 sources - dynamic (large) | 370.44ms | 248.99ms | 274.80ms | 3.07s | 1.73s | 3.19s |
| 1000x5 - 25 sources (wide dense) | 540.96ms | 353.45ms | 381.55ms | 2.31s | 3.41s | 2.63s |
| 5x500 - 3 sources (deep) | 281.97ms | 204.80ms | 201.35ms | 230.19ms | 1.19s | 217.38ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 307.77ms | 224.34ms | 224.65ms | 400.22ms | 1.71s | 404.52ms |

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
