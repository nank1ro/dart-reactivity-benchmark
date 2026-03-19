# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.27s |
| 🥉 | signals | 0.28 | 100.0% | 35/35 | 10.72s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.44s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.91s |
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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 203.13ms | 2.34s | 151.57ms (fail) | 194.60ms | 206.33ms | 274.46ms |
| broadPropagation | 461.37ms | 4.32s | 7.52ms (fail) | 353.44ms | 450.83ms | 505.55ms |
| deepPropagation | 171.90ms | 1.53s | 139.07ms (fail) | 125.10ms | 176.75ms | 167.28ms |
| diamond | 287.20ms | 2.42s | 204.04ms (fail) | 244.37ms | 285.12ms | 350.87ms |
| mux | 400.34ms | 1.77s | 188.05ms (fail) | 367.47ms | 376.98ms | 409.13ms |
| repeatedObservers | 46.23ms | 230.87ms | 55.33ms (fail) | 46.26ms | 41.63ms | 80.57ms |
| triangle | 100.77ms | 749.16ms | 94.83ms (fail) | 88.80ms | 99.35ms | 114.18ms |
| unstable | 76.38ms | 343.92ms | 333.58ms (fail) | 61.41ms | 71.41ms | 94.64ms |
| molBench | 493.16ms | 584.70ms | 1.24ms | 486.16ms | 495.48ms | 491.17ms |
| create_signals | 26.69ms | 71.05ms | 64.82ms | 28.49ms | 5.62ms | 74.56ms |
| comp_0to1 | 11.76ms | 27.53ms | 58.11ms | 8.02ms | 18.93ms | 30.02ms |
| comp_1to1 | 28.64ms | 42.25ms | 57.06ms | 4.22ms | 14.22ms | 37.53ms |
| comp_2to1 | 9.27ms | 29.75ms | 36.79ms | 2.29ms | 20.95ms | 24.13ms |
| comp_4to1 | 2.23ms | 22.98ms | 18.42ms | 7.77ms | 15.77ms | 13.52ms |
| comp_1000to1 | 5μs | 15μs | 43μs | 3μs | 4μs | 18μs |
| comp_1to2 | 21.72ms | 37.87ms | 45.83ms | 14.38ms | 19.29ms | 38.46ms |
| comp_1to4 | 10.92ms | 23.29ms | 45.30ms | 9.29ms | 34.15ms | 20.74ms |
| comp_1to8 | 6.74ms | 23.10ms | 45.43ms | 3.89ms | 6.69ms | 19.50ms |
| comp_1to1000 | 4.11ms | 14.76ms | 39.72ms | 3.56ms | 6.10ms | 14.09ms |
| update_1to1 | 8.84ms | 20.94ms | 9.94ms | 4.64ms | 8.95ms | 15.66ms |
| update_2to1 | 4.47ms | 10.37ms | 2.88ms | 3.80ms | 4.58ms | 7.84ms |
| update_4to1 | 2.29ms | 5.61ms | 2.50ms | 2.19ms | 2.21ms | 3.90ms |
| update_1000to1 | 22μs | 52μs | 15μs | 22μs | 22μs | 44μs |
| update_1to2 | 4.41ms | 10.44ms | 4.46ms | 4.43ms | 4.42ms | 7.99ms |
| update_1to4 | 2.27ms | 5.17ms | 1.48ms | 1.95ms | 2.30ms | 3.94ms |
| update_1to1000 | 51μs | 160μs | 382μs | 29μs | 1.10ms | 147μs |
| cellx1000 | 10.68ms | 71.55ms | 5.32ms | 7.38ms | 11.20ms | 14.24ms |
| cellx2500 | 36.62ms | 246.04ms | 28.33ms | 20.37ms | 31.14ms | 36.84ms |
| cellx5000 | 72.14ms | 548.91ms | 73.04ms | 44.63ms | 86.65ms | 99.59ms |
| 10x5 - 2 sources - read 20.0% (simple) | 500.16ms | 1.95s | 234.08ms | 239.06ms | 461.37ms | 347.77ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.28ms | 1.48s | 200.73ms | 178.77ms | 277.07ms | 253.07ms |
| 1000x12 - 4 sources - dynamic (large) | 3.49s | 1.87s | 339.50ms | 278.61ms | 3.74s | 459.04ms |
| 1000x5 - 25 sources (wide dense) | 3.25s | 3.34s | 514.97ms | 412.50ms | 2.78s | 603.59ms |
| 5x500 - 3 sources (deep) | 225.01ms | 1.11s | 205.91ms | 190.55ms | 237.73ms | 254.38ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 471.11ms | 1.64s | 257.59ms | 265.22ms | 453.50ms | 400.79ms |

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
