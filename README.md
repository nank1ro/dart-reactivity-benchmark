# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.74s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.50s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.78s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.58s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.76s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.47s |

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
| Test Case | solidart(2.0-dev) | state_beacon | preact_signals | signals | mobx | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 281.47ms | 151.04ms (fail) | 202.78ms | 213.66ms | 2.34s | 184.13ms |
| broadPropagation | 509.85ms | 6.23ms (fail) | 455.40ms | 461.25ms | 4.61s | 345.36ms |
| deepPropagation | 172.29ms | 139.18ms (fail) | 177.35ms | 178.52ms | 1.59s | 123.64ms |
| diamond | 362.85ms | 214.31ms (fail) | 283.01ms | 280.09ms | 2.43s | 232.86ms |
| mux | 449.90ms | 191.30ms (fail) | 410.05ms | 411.11ms | 1.90s | 378.45ms |
| repeatedObservers | 81.75ms | 52.95ms (fail) | 40.58ms | 44.73ms | 232.36ms | 45.59ms |
| triangle | 126.19ms | 80.67ms (fail) | 98.84ms | 101.01ms | 768.25ms | 85.69ms |
| unstable | 98.41ms | 340.81ms (fail) | 70.92ms | 80.65ms | 353.73ms | 67.90ms |
| molBench | 492.94ms | 983μs | 488.25ms | 486.62ms | 576.89ms | 487.04ms |
| create_signals | 95.62ms | 62.87ms | 5.62ms | 27.52ms | 62.10ms | 29.57ms |
| comp_0to1 | 41.17ms | 55.49ms | 19.20ms | 12.34ms | 16.64ms | 9.21ms |
| comp_1to1 | 49.09ms | 57.61ms | 14.83ms | 23.03ms | 58.31ms | 4.88ms |
| comp_2to1 | 42.21ms | 36.85ms | 12.40ms | 18.36ms | 38.15ms | 2.66ms |
| comp_4to1 | 21.96ms | 16.28ms | 26.45ms | 7.72ms | 34.13ms | 8.87ms |
| comp_1000to1 | 18μs | 42μs | 9μs | 8μs | 18μs | 4μs |
| comp_1to2 | 43.40ms | 46.29ms | 25.89ms | 18.29ms | 35.54ms | 12.25ms |
| comp_1to4 | 24.44ms | 44.60ms | 36.22ms | 11.27ms | 19.23ms | 13.72ms |
| comp_1to8 | 24.84ms | 43.81ms | 9.69ms | 10.45ms | 22.73ms | 5.30ms |
| comp_1to1000 | 17.26ms | 39.96ms | 7.08ms | 7.36ms | 16.67ms | 3.75ms |
| update_1to1 | 16.11ms | 5.65ms | 8.69ms | 8.95ms | 26.12ms | 10.37ms |
| update_2to1 | 7.90ms | 3.14ms | 4.38ms | 4.54ms | 11.11ms | 2.26ms |
| update_4to1 | 4.00ms | 1.45ms | 2.16ms | 2.31ms | 6.38ms | 2.58ms |
| update_1000to1 | 40μs | 14μs | 21μs | 22μs | 70μs | 24μs |
| update_1to2 | 8.05ms | 2.86ms | 4.62ms | 4.51ms | 12.28ms | 5.07ms |
| update_1to4 | 4.06ms | 1.44ms | 2.20ms | 2.21ms | 6.25ms | 2.45ms |
| update_1to1000 | 172μs | 395μs | 1.05ms | 43μs | 177μs | 47μs |
| cellx1000 | 16.73ms | 6.30ms | 16.31ms | 12.89ms | 114.76ms | 7.97ms |
| cellx2500 | 70.00ms | 30.41ms | 80.36ms | 59.83ms | 363.57ms | 27.79ms |
| cellx5000 | 142.02ms | 88.48ms | 204.01ms | 130.92ms | 724.01ms | 84.90ms |
| 10x5 - 2 sources - read 20.0% (simple) | 358.95ms | 244.21ms | 438.95ms | 565.22ms | 2.04s | 231.65ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 245.71ms | 201.10ms | 273.04ms | 296.73ms | 1.55s | 177.84ms |
| 1000x12 - 4 sources - dynamic (large) | 471.31ms | 334.05ms | 3.73s | 3.83s | 1.99s | 287.65ms |
| 1000x5 - 25 sources (wide dense) | 584.44ms | 499.91ms | 2.74s | 3.76s | 3.70s | 415.72ms |
| 5x500 - 3 sources (deep) | 251.28ms | 203.40ms | 230.61ms | 227.06ms | 1.35s | 188.81ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 381.52ms | 261.65ms | 453.27ms | 484.71ms | 1.77s | 256.10ms |

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
