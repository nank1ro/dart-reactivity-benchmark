# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.40s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.21s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.50s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.57s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.60s |

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
| avoidablePropagation | 211.66ms | 195.27ms | 153.49ms (fail) | 264.36ms | 209.71ms | 2.36s |
| broadPropagation | 455.47ms | 351.69ms | 6.53ms (fail) | 493.54ms | 478.82ms | 4.39s |
| deepPropagation | 174.79ms | 126.28ms | 144.19ms (fail) | 163.26ms | 177.60ms | 1.54s |
| diamond | 308.49ms | 233.84ms | 202.54ms (fail) | 356.73ms | 303.32ms | 2.41s |
| mux | 414.85ms | 384.36ms | 192.72ms (fail) | 437.22ms | 401.13ms | 1.82s |
| repeatedObservers | 46.47ms | 43.88ms | 52.77ms (fail) | 80.90ms | 40.12ms | 232.42ms |
| triangle | 99.23ms | 87.18ms | 80.94ms (fail) | 113.71ms | 99.59ms | 764.47ms |
| unstable | 78.27ms | 59.83ms | 339.17ms (fail) | 95.22ms | 74.14ms | 339.38ms |
| molBench | 486.60ms | 490.20ms | 1.30ms | 495.00ms | 487.55ms | 581.15ms |
| create_signals | 28.02ms | 28.94ms | 61.69ms | 60.09ms | 4.71ms | 80.77ms |
| comp_0to1 | 12.49ms | 7.95ms | 55.65ms | 25.66ms | 18.57ms | 20.21ms |
| comp_1to1 | 27.12ms | 4.25ms | 57.49ms | 42.91ms | 15.20ms | 22.86ms |
| comp_2to1 | 11.49ms | 2.34ms | 37.83ms | 25.66ms | 16.89ms | 8.57ms |
| comp_4to1 | 2.58ms | 10.20ms | 16.97ms | 14.22ms | 14.95ms | 30.77ms |
| comp_1000to1 | 5μs | 3μs | 44μs | 15μs | 4μs | 15μs |
| comp_1to2 | 20.17ms | 20.73ms | 48.50ms | 35.04ms | 16.62ms | 36.76ms |
| comp_1to4 | 9.75ms | 11.64ms | 47.07ms | 14.63ms | 33.40ms | 22.18ms |
| comp_1to8 | 6.71ms | 3.92ms | 46.63ms | 20.84ms | 7.45ms | 25.24ms |
| comp_1to1000 | 4.46ms | 3.88ms | 42.33ms | 13.92ms | 6.77ms | 15.17ms |
| update_1to1 | 10.01ms | 10.04ms | 7.74ms | 19.80ms | 8.34ms | 27.16ms |
| update_2to1 | 4.55ms | 2.17ms | 3.94ms | 8.09ms | 4.43ms | 13.93ms |
| update_4to1 | 2.55ms | 2.43ms | 1.91ms | 4.10ms | 2.10ms | 6.58ms |
| update_1000to1 | 37μs | 19μs | 17μs | 40μs | 32μs | 69μs |
| update_1to2 | 4.53ms | 5.02ms | 3.81ms | 8.39ms | 4.07ms | 13.49ms |
| update_1to4 | 2.56ms | 2.36ms | 1.93ms | 4.12ms | 2.09ms | 6.96ms |
| update_1to1000 | 44μs | 35μs | 406μs | 148μs | 948μs | 172μs |
| cellx1000 | 11.72ms | 7.89ms | 5.03ms | 16.24ms | 11.85ms | 70.70ms |
| cellx2500 | 54.66ms | 24.35ms | 23.71ms | 61.93ms | 41.75ms | 251.27ms |
| cellx5000 | 127.00ms | 65.38ms | 57.49ms | 182.96ms | 118.14ms | 566.25ms |
| 10x5 - 2 sources - read 20.0% (simple) | 514.62ms | 236.35ms | 277.79ms | 350.91ms | 456.22ms | 2.01s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 281.71ms | 181.00ms | 209.57ms | 248.99ms | 277.49ms | 1.51s |
| 1000x12 - 4 sources - dynamic (large) | 3.71s | 283.43ms | 360.58ms | 474.01ms | 3.76s | 1.98s |
| 1000x5 - 25 sources (wide dense) | 3.39s | 406.63ms | 569.28ms | 617.03ms | 2.72s | 3.49s |
| 5x500 - 3 sources (deep) | 222.61ms | 191.26ms | 210.17ms | 255.73ms | 236.37ms | 1.17s |
| 100x15 - 6 sources - dynamic (very dynamic) | 480.18ms | 265.64ms | 278.35ms | 392.53ms | 461.01ms | 1.74s |

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
