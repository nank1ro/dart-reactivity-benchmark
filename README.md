# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.68s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.22s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.20s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.27s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 28.35s |
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
| Test Case | state_beacon | alien_signals | mobx | solidart(2.0-dev) | signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 180.46ms (fail) | 187.09ms | 2.41s | 274.93ms | 206.77ms | 203.70ms |
| broadPropagation | 6.38ms (fail) | 344.18ms | 4.57s | 501.70ms | 461.83ms | 464.41ms |
| deepPropagation | 149.81ms (fail) | 123.36ms | 1.62s | 169.34ms | 171.57ms | 178.35ms |
| diamond | 182.49ms (fail) | 232.40ms | 2.52s | 350.19ms | 281.21ms | 285.19ms |
| mux | 192.60ms (fail) | 369.92ms | 1.87s | 438.55ms | 452.09ms | 405.95ms |
| repeatedObservers | 52.18ms (fail) | 46.13ms | 238.40ms | 81.14ms | 45.83ms | 40.26ms |
| triangle | 75.94ms (fail) | 85.84ms | 798.23ms | 117.88ms | 101.92ms | 98.51ms |
| unstable | 337.45ms (fail) | 68.35ms | 354.27ms | 98.17ms | 81.04ms | 70.13ms |
| molBench | 867μs | 481.84ms | 581.48ms | 493.18ms | 486.79ms | 486.70ms |
| create_signals | 64.13ms | 30.14ms | 87.27ms | 53.58ms | 26.23ms | 5.22ms |
| comp_0to1 | 58.96ms | 7.95ms | 39.01ms | 27.12ms | 11.43ms | 17.53ms |
| comp_1to1 | 63.68ms | 4.23ms | 29.72ms | 27.82ms | 29.19ms | 13.58ms |
| comp_2to1 | 39.24ms | 2.38ms | 9.03ms | 35.59ms | 9.34ms | 11.36ms |
| comp_4to1 | 16.48ms | 10.23ms | 27.84ms | 5.16ms | 1.88ms | 8.54ms |
| comp_1000to1 | 41μs | 3μs | 18μs | 17μs | 4μs | 4μs |
| comp_1to2 | 46.44ms | 16.58ms | 39.26ms | 42.23ms | 27.77ms | 25.33ms |
| comp_1to4 | 44.67ms | 8.69ms | 24.06ms | 22.47ms | 10.58ms | 21.50ms |
| comp_1to8 | 44.20ms | 3.81ms | 24.92ms | 23.98ms | 14.88ms | 8.54ms |
| comp_1to1000 | 39.60ms | 3.51ms | 15.92ms | 17.28ms | 6.62ms | 10.36ms |
| update_1to1 | 5.67ms | 9.74ms | 25.13ms | 16.07ms | 8.99ms | 8.70ms |
| update_2to1 | 3.13ms | 2.36ms | 11.69ms | 7.80ms | 4.62ms | 4.25ms |
| update_4to1 | 1.44ms | 2.52ms | 7.03ms | 4.02ms | 2.22ms | 2.18ms |
| update_1000to1 | 14μs | 24μs | 68μs | 40μs | 22μs | 21μs |
| update_1to2 | 2.91ms | 5.13ms | 11.90ms | 8.02ms | 4.46ms | 4.64ms |
| update_1to4 | 1.45ms | 2.52ms | 5.68ms | 3.99ms | 2.23ms | 2.17ms |
| update_1to1000 | 405μs | 42μs | 174μs | 170μs | 43μs | 1.96ms |
| cellx1000 | 5.67ms | 9.44ms | 69.74ms | 11.97ms | 10.05ms | 10.00ms |
| cellx2500 | 25.79ms | 19.66ms | 257.21ms | 33.18ms | 34.78ms | 28.34ms |
| cellx5000 | 55.00ms | 45.98ms | 570.20ms | 70.73ms | 72.67ms | 81.83ms |
| 10x5 - 2 sources - read 20.0% (simple) | 239.15ms | 226.97ms | 2.08s | 350.40ms | 516.98ms | 444.61ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 197.61ms | 172.65ms | 1.61s | 241.88ms | 289.43ms | 270.68ms |
| 1000x12 - 4 sources - dynamic (large) | 331.62ms | 282.73ms | 1.96s | 461.81ms | 3.79s | 3.68s |
| 1000x5 - 25 sources (wide dense) | 493.10ms | 415.03ms | 3.55s | 593.85ms | 3.32s | 2.69s |
| 5x500 - 3 sources (deep) | 202.49ms | 192.93ms | 1.20s | 252.19ms | 225.38ms | 232.74ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 256.99ms | 266.58ms | 1.72s | 379.96ms | 495.54ms | 452.99ms |

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
