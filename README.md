# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.71s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 10.34s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.37s |
| 4 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.43s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.08s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.43s |

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
| Test Case | state_beacon | mobx | solidart(2.0-dev) | preact_signals | signals | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 168.03ms (fail) | 2.36s | 292.01ms | 199.93ms | 204.80ms | 184.54ms |
| broadPropagation | 6.56ms (fail) | 4.46s | 511.32ms | 451.82ms | 452.52ms | 344.79ms |
| deepPropagation | 146.14ms (fail) | 1.57s | 168.94ms | 176.96ms | 179.00ms | 123.78ms |
| diamond | 193.21ms (fail) | 2.46s | 350.64ms | 278.63ms | 276.49ms | 232.16ms |
| mux | 194.57ms (fail) | 1.84s | 450.75ms | 409.07ms | 407.08ms | 372.94ms |
| repeatedObservers | 52.51ms (fail) | 236.98ms | 81.31ms | 39.27ms | 44.85ms | 45.48ms |
| triangle | 77.31ms (fail) | 768.54ms | 116.38ms | 101.11ms | 107.71ms | 85.50ms |
| unstable | 338.24ms (fail) | 352.95ms | 98.45ms | 70.33ms | 79.13ms | 67.59ms |
| molBench | 1.29ms | 569.97ms | 493.28ms | 489.06ms | 486.89ms | 488.28ms |
| create_signals | 60.66ms | 73.26ms | 100.77ms | 5.30ms | 27.69ms | 24.46ms |
| comp_0to1 | 53.51ms | 25.79ms | 35.93ms | 22.42ms | 12.01ms | 8.93ms |
| comp_1to1 | 56.75ms | 18.53ms | 50.46ms | 11.28ms | 28.17ms | 4.24ms |
| comp_2to1 | 37.29ms | 17.86ms | 24.33ms | 11.08ms | 11.70ms | 2.33ms |
| comp_4to1 | 16.75ms | 15.35ms | 19.02ms | 15.07ms | 4.29ms | 7.77ms |
| comp_1000to1 | 42μs | 17μs | 22μs | 4μs | 4μs | 4μs |
| comp_1to2 | 45.80ms | 36.01ms | 39.18ms | 18.11ms | 21.38ms | 9.32ms |
| comp_1to4 | 44.06ms | 25.64ms | 25.30ms | 37.40ms | 9.95ms | 12.02ms |
| comp_1to8 | 43.45ms | 22.22ms | 29.19ms | 8.08ms | 8.24ms | 4.85ms |
| comp_1to1000 | 38.68ms | 16.07ms | 19.32ms | 5.09ms | 4.33ms | 3.51ms |
| update_1to1 | 5.75ms | 24.57ms | 15.96ms | 8.62ms | 8.95ms | 10.35ms |
| update_2to1 | 3.18ms | 11.84ms | 7.81ms | 4.36ms | 4.49ms | 2.28ms |
| update_4to1 | 1.49ms | 6.80ms | 4.02ms | 2.19ms | 2.23ms | 2.58ms |
| update_1000to1 | 15μs | 70μs | 40μs | 22μs | 22μs | 26μs |
| update_1to2 | 2.90ms | 10.93ms | 7.87ms | 4.60ms | 4.47ms | 5.12ms |
| update_1to4 | 1.47ms | 5.73ms | 4.02ms | 2.17ms | 2.23ms | 2.53ms |
| update_1to1000 | 390μs | 174μs | 306μs | 170μs | 44μs | 46μs |
| cellx1000 | 5.50ms | 76.21ms | 14.66ms | 10.39ms | 10.38ms | 7.63ms |
| cellx2500 | 24.60ms | 273.90ms | 46.91ms | 36.54ms | 39.89ms | 21.36ms |
| cellx5000 | 77.40ms | 559.75ms | 125.77ms | 114.31ms | 87.17ms | 51.17ms |
| 10x5 - 2 sources - read 20.0% (simple) | 248.36ms | 2.06s | 355.03ms | 438.20ms | 521.23ms | 242.06ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 197.94ms | 1.58s | 251.07ms | 268.10ms | 281.78ms | 180.98ms |
| 1000x12 - 4 sources - dynamic (large) | 350.82ms | 1.99s | 463.82ms | 3.70s | 3.76s | 291.99ms |
| 1000x5 - 25 sources (wide dense) | 475.75ms | 3.68s | 589.06ms | 2.70s | 3.58s | 414.71ms |
| 5x500 - 3 sources (deep) | 204.88ms | 1.19s | 257.69ms | 235.55ms | 226.41ms | 190.74ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 257.55ms | 1.74s | 379.04ms | 453.86ms | 483.11ms | 263.50ms |

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
