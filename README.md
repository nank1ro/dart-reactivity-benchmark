# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.64s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 10.21s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.31s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.57s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.72s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.49s |

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
| avoidablePropagation | 163.20ms (fail) | 183.56ms | 2.31s | 282.49ms | 206.56ms | 201.78ms |
| broadPropagation | 6.08ms (fail) | 345.66ms | 4.50s | 506.09ms | 459.89ms | 447.87ms |
| deepPropagation | 140.58ms (fail) | 125.91ms | 1.59s | 170.00ms | 168.31ms | 177.54ms |
| diamond | 182.29ms (fail) | 231.41ms | 2.51s | 357.02ms | 285.69ms | 278.71ms |
| mux | 192.36ms (fail) | 370.96ms | 1.88s | 443.87ms | 448.40ms | 404.40ms |
| repeatedObservers | 53.06ms (fail) | 46.29ms | 233.61ms | 80.97ms | 44.46ms | 40.37ms |
| triangle | 75.97ms (fail) | 84.88ms | 786.43ms | 118.51ms | 98.63ms | 97.19ms |
| unstable | 341.26ms (fail) | 68.36ms | 356.70ms | 97.33ms | 79.50ms | 69.86ms |
| molBench | 1.18ms | 486.42ms | 579.14ms | 492.26ms | 487.99ms | 488.29ms |
| create_signals | 63.84ms | 27.09ms | 50.78ms | 91.17ms | 24.25ms | 4.58ms |
| comp_0to1 | 52.84ms | 7.51ms | 16.24ms | 41.49ms | 10.62ms | 17.02ms |
| comp_1to1 | 62.04ms | 4.17ms | 37.22ms | 28.84ms | 27.98ms | 11.94ms |
| comp_2to1 | 39.48ms | 2.27ms | 22.41ms | 32.99ms | 14.70ms | 12.21ms |
| comp_4to1 | 16.80ms | 7.92ms | 21.23ms | 5.18ms | 2.05ms | 8.16ms |
| comp_1000to1 | 40μs | 3μs | 16μs | 21μs | 5μs | 6μs |
| comp_1to2 | 48.42ms | 10.16ms | 34.62ms | 36.45ms | 17.36ms | 21.49ms |
| comp_1to4 | 44.32ms | 11.01ms | 17.80ms | 22.65ms | 7.01ms | 22.97ms |
| comp_1to8 | 43.77ms | 4.87ms | 21.17ms | 24.12ms | 6.41ms | 7.11ms |
| comp_1to1000 | 39.70ms | 3.28ms | 15.80ms | 16.86ms | 4.11ms | 4.66ms |
| update_1to1 | 5.63ms | 9.97ms | 25.84ms | 15.97ms | 8.90ms | 8.75ms |
| update_2to1 | 3.13ms | 2.29ms | 12.94ms | 7.80ms | 4.48ms | 4.25ms |
| update_4to1 | 1.47ms | 2.53ms | 6.34ms | 4.00ms | 2.24ms | 2.17ms |
| update_1000to1 | 14μs | 26μs | 71μs | 40μs | 22μs | 21μs |
| update_1to2 | 2.88ms | 3.30ms | 10.84ms | 8.34ms | 4.53ms | 4.61ms |
| update_1to4 | 1.49ms | 2.26ms | 5.67ms | 3.99ms | 2.25ms | 2.20ms |
| update_1to1000 | 381μs | 46μs | 172μs | 170μs | 41μs | 152μs |
| cellx1000 | 5.11ms | 7.58ms | 70.64ms | 11.81ms | 10.25ms | 9.66ms |
| cellx2500 | 22.34ms | 19.16ms | 256.38ms | 32.12ms | 30.89ms | 26.25ms |
| cellx5000 | 77.09ms | 41.78ms | 571.31ms | 81.58ms | 63.57ms | 66.50ms |
| 10x5 - 2 sources - read 20.0% (simple) | 263.02ms | 223.06ms | 2.03s | 365.38ms | 507.13ms | 437.13ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 224.18ms | 172.28ms | 1.53s | 246.14ms | 284.75ms | 270.24ms |
| 1000x12 - 4 sources - dynamic (large) | 341.32ms | 275.25ms | 1.88s | 460.62ms | 3.97s | 3.69s |
| 1000x5 - 25 sources (wide dense) | 505.55ms | 406.26ms | 3.49s | 582.78ms | 3.58s | 2.70s |
| 5x500 - 3 sources (deep) | 205.80ms | 190.16ms | 1.14s | 257.98ms | 222.37ms | 229.28ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 266.96ms | 258.31ms | 1.70s | 378.26ms | 481.27ms | 445.88ms |

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
