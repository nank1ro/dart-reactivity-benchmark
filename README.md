# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.34s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 4.89s |
| 🥉 | signals | 0.28 | 100.0% | 35/35 | 9.17s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 8.75s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.26s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.07s |

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
| avoidablePropagation | 195.53ms | 167.28ms | 135.87ms (fail) | 246.78ms | 183.14ms | 2.25s |
| broadPropagation | 386.49ms | 302.85ms | 5.60ms (fail) | 456.17ms | 383.71ms | 4.13s |
| deepPropagation | 172.20ms | 107.93ms | 151.74ms (fail) | 150.12ms | 174.37ms | 1.43s |
| diamond | 257.75ms | 234.63ms | 176.81ms (fail) | 345.65ms | 252.81ms | 2.26s |
| mux | 328.87ms | 329.48ms | 161.92ms (fail) | 383.17ms | 327.60ms | 1.76s |
| repeatedObservers | 39.17ms | 40.74ms | 47.46ms (fail) | 72.55ms | 32.91ms | 221.59ms |
| triangle | 92.25ms | 80.73ms | 75.06ms (fail) | 112.94ms | 92.80ms | 733.18ms |
| unstable | 64.66ms | 58.94ms | 325.12ms (fail) | 97.19ms | 56.79ms | 320.47ms |
| molBench | 389.16ms | 364.64ms | 807μs | 396.12ms | 363.13ms | 479.76ms |
| create_signals | 25.91ms | 32.54ms | 60.45ms | 62.35ms | 6.76ms | 51.91ms |
| comp_0to1 | 12.34ms | 9.42ms | 51.31ms | 53.17ms | 20.94ms | 18.72ms |
| comp_1to1 | 33.36ms | 5.89ms | 53.63ms | 41.31ms | 17.30ms | 35.99ms |
| comp_2to1 | 12.72ms | 3.33ms | 35.47ms | 22.88ms | 19.91ms | 22.64ms |
| comp_4to1 | 4.00ms | 9.02ms | 16.28ms | 5.86ms | 22.66ms | 34.64ms |
| comp_1000to1 | 9μs | 6μs | 41μs | 16μs | 17μs | 19μs |
| comp_1to2 | 18.80ms | 12.77ms | 49.65ms | 42.14ms | 21.95ms | 40.31ms |
| comp_1to4 | 16.71ms | 8.15ms | 45.18ms | 23.68ms | 28.85ms | 32.38ms |
| comp_1to8 | 8.76ms | 6.75ms | 43.53ms | 24.47ms | 7.15ms | 25.08ms |
| comp_1to1000 | 5.69ms | 5.26ms | 38.61ms | 16.03ms | 7.11ms | 15.66ms |
| update_1to1 | 8.89ms | 4.01ms | 4.76ms | 14.42ms | 8.54ms | 20.26ms |
| update_2to1 | 4.53ms | 2.07ms | 2.63ms | 7.16ms | 4.24ms | 9.95ms |
| update_4to1 | 2.18ms | 1.06ms | 1.22ms | 3.61ms | 2.17ms | 5.24ms |
| update_1000to1 | 23μs | 17μs | 12μs | 37μs | 21μs | 51μs |
| update_1to2 | 4.47ms | 2.01ms | 2.43ms | 7.41ms | 4.29ms | 9.79ms |
| update_1to4 | 2.21ms | 1.03ms | 1.25ms | 3.62ms | 2.13ms | 5.11ms |
| update_1to1000 | 57μs | 49μs | 374μs | 171μs | 567μs | 170μs |
| cellx1000 | 11.22ms | 9.11ms | 8.49ms | 19.33ms | 12.02ms | 88.07ms |
| cellx2500 | 36.56ms | 30.86ms | 29.74ms | 47.33ms | 32.96ms | 254.95ms |
| cellx5000 | 84.73ms | 68.86ms | 74.61ms | 121.54ms | 76.47ms | 564.74ms |
| 10x5 - 2 sources - read 20.0% (simple) | 416.94ms | 226.40ms | 222.19ms | 361.49ms | 382.96ms | 2.03s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 236.52ms | 181.75ms | 172.82ms | 251.15ms | 234.31ms | 1.47s |
| 1000x12 - 4 sources - dynamic (large) | 3.11s | 251.91ms | 271.06ms | 370.36ms | 3.03s | 1.73s |
| 1000x5 - 25 sources (wide dense) | 2.58s | 354.92ms | 379.17ms | 544.33ms | 2.32s | 3.39s |
| 5x500 - 3 sources (deep) | 216.52ms | 204.59ms | 202.16ms | 276.44ms | 227.77ms | 1.16s |
| 100x15 - 6 sources - dynamic (very dynamic) | 399.57ms | 223.26ms | 218.24ms | 308.94ms | 389.79ms | 1.66s |

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
