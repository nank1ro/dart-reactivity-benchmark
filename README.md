# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.31s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.11s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.12s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.08s |
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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 212.41ms | 189.33ms | 143.75ms (fail) | 276.24ms | 206.86ms | 2.37s |
| broadPropagation | 461.94ms | 351.30ms | 6.80ms (fail) | 495.86ms | 453.65ms | 4.40s |
| deepPropagation | 177.44ms | 127.68ms | 139.05ms (fail) | 171.81ms | 177.78ms | 1.50s |
| diamond | 291.59ms | 229.92ms | 185.92ms (fail) | 352.59ms | 285.81ms | 2.38s |
| mux | 388.33ms | 360.43ms | 181.04ms (fail) | 424.52ms | 378.98ms | 1.86s |
| repeatedObservers | 46.48ms | 43.23ms | 54.10ms (fail) | 81.18ms | 40.74ms | 226.67ms |
| triangle | 104.23ms | 84.08ms | 76.40ms (fail) | 119.35ms | 104.11ms | 772.76ms |
| unstable | 78.47ms | 61.78ms | 338.08ms (fail) | 96.13ms | 69.28ms | 342.95ms |
| molBench | 495.62ms | 486.37ms | 1.29ms | 490.52ms | 483.18ms | 595.05ms |
| create_signals | 27.21ms | 28.48ms | 60.59ms | 99.42ms | 5.29ms | 70.79ms |
| comp_0to1 | 11.55ms | 8.67ms | 52.96ms | 36.11ms | 17.64ms | 28.82ms |
| comp_1to1 | 28.08ms | 4.23ms | 54.46ms | 40.46ms | 14.88ms | 44.45ms |
| comp_2to1 | 14.37ms | 2.34ms | 40.53ms | 28.62ms | 17.59ms | 24.94ms |
| comp_4to1 | 3.21ms | 8.83ms | 17.12ms | 8.89ms | 23.14ms | 20.97ms |
| comp_1000to1 | 5μs | 6μs | 42μs | 19μs | 4μs | 25μs |
| comp_1to2 | 13.62ms | 15.86ms | 48.42ms | 30.61ms | 33.40ms | 37.69ms |
| comp_1to4 | 12.40ms | 5.91ms | 46.69ms | 25.57ms | 22.75ms | 20.73ms |
| comp_1to8 | 6.72ms | 4.66ms | 43.38ms | 25.50ms | 9.32ms | 24.29ms |
| comp_1to1000 | 4.27ms | 3.60ms | 38.26ms | 14.66ms | 6.73ms | 15.60ms |
| update_1to1 | 9.28ms | 4.61ms | 6.10ms | 15.46ms | 8.89ms | 21.44ms |
| update_2to1 | 4.72ms | 2.31ms | 3.12ms | 8.16ms | 4.51ms | 10.60ms |
| update_4to1 | 2.33ms | 1.16ms | 1.58ms | 3.89ms | 2.20ms | 5.35ms |
| update_1000to1 | 24μs | 20μs | 16μs | 38μs | 22μs | 65μs |
| update_1to2 | 4.63ms | 3.31ms | 3.10ms | 7.69ms | 4.33ms | 10.69ms |
| update_1to4 | 2.59ms | 1.19ms | 1.62ms | 3.85ms | 2.23ms | 6.72ms |
| update_1to1000 | 41μs | 47μs | 371μs | 148μs | 586μs | 157μs |
| cellx1000 | 10.08ms | 7.65ms | 7.66ms | 12.56ms | 11.64ms | 80.17ms |
| cellx2500 | 35.44ms | 23.16ms | 29.15ms | 39.31ms | 43.03ms | 295.72ms |
| cellx5000 | 79.57ms | 55.72ms | 91.06ms | 96.26ms | 124.39ms | 609.08ms |
| 10x5 - 2 sources - read 20.0% (simple) | 500.91ms | 234.01ms | 232.96ms | 348.84ms | 431.88ms | 1.91s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 276.61ms | 176.82ms | 196.68ms | 246.52ms | 270.38ms | 1.46s |
| 1000x12 - 4 sources - dynamic (large) | 3.84s | 277.02ms | 343.31ms | 476.29ms | 3.67s | 1.78s |
| 1000x5 - 25 sources (wide dense) | 3.26s | 412.69ms | 519.88ms | 595.64ms | 2.52s | 3.40s |
| 5x500 - 3 sources (deep) | 224.88ms | 192.17ms | 201.68ms | 257.38ms | 226.42ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 471.94ms | 265.12ms | 255.91ms | 384.48ms | 446.22ms | 1.64s |

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
