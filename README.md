# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.70s |
| 🥈 | signals | 0.28 | 100.0% | 35/35 | 11.41s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.28s |
| 4 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.44s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.99s |
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
| Test Case | state_beacon | mobx | solidart(2.0-dev) | preact_signals | signals | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 196.87ms (fail) | 2.33s | 277.93ms | 200.79ms | 210.21ms | 183.63ms |
| broadPropagation | 5.94ms (fail) | 4.44s | 502.88ms | 445.38ms | 450.87ms | 343.49ms |
| deepPropagation | 140.27ms (fail) | 1.54s | 170.99ms | 178.23ms | 171.18ms | 124.85ms |
| diamond | 188.87ms (fail) | 2.45s | 360.95ms | 282.06ms | 288.49ms | 232.38ms |
| mux | 191.69ms (fail) | 1.84s | 445.68ms | 408.67ms | 410.52ms | 368.92ms |
| repeatedObservers | 52.28ms (fail) | 230.50ms | 82.12ms | 39.64ms | 45.02ms | 45.58ms |
| triangle | 76.15ms (fail) | 767.37ms | 120.48ms | 96.82ms | 105.06ms | 85.31ms |
| unstable | 335.73ms (fail) | 346.98ms | 99.34ms | 77.11ms | 79.50ms | 67.70ms |
| molBench | 932μs | 569.88ms | 495.00ms | 486.36ms | 486.29ms | 486.60ms |
| create_signals | 66.00ms | 73.58ms | 96.91ms | 4.78ms | 25.00ms | 27.60ms |
| comp_0to1 | 59.39ms | 26.02ms | 37.57ms | 17.33ms | 11.19ms | 11.27ms |
| comp_1to1 | 63.06ms | 18.33ms | 58.15ms | 14.45ms | 27.53ms | 9.67ms |
| comp_2to1 | 43.99ms | 11.60ms | 27.68ms | 16.57ms | 8.11ms | 14.47ms |
| comp_4to1 | 18.72ms | 23.48ms | 16.60ms | 14.05ms | 1.84ms | 1.83ms |
| comp_1000to1 | 42μs | 23μs | 20μs | 4μs | 5μs | 5μs |
| comp_1to2 | 48.25ms | 38.29ms | 36.60ms | 18.58ms | 17.35ms | 11.66ms |
| comp_1to4 | 46.89ms | 26.15ms | 21.90ms | 31.30ms | 11.19ms | 15.72ms |
| comp_1to8 | 44.36ms | 22.33ms | 29.60ms | 6.48ms | 6.14ms | 4.87ms |
| comp_1to1000 | 38.77ms | 16.22ms | 17.31ms | 5.77ms | 4.18ms | 3.46ms |
| update_1to1 | 5.64ms | 24.81ms | 16.02ms | 8.62ms | 8.95ms | 10.47ms |
| update_2to1 | 3.11ms | 12.08ms | 7.87ms | 4.28ms | 4.48ms | 2.29ms |
| update_4to1 | 1.41ms | 6.38ms | 4.01ms | 2.17ms | 2.25ms | 2.59ms |
| update_1000to1 | 15μs | 68μs | 40μs | 21μs | 33μs | 24μs |
| update_1to2 | 2.83ms | 11.84ms | 7.82ms | 4.62ms | 4.46ms | 5.33ms |
| update_1to4 | 1.42ms | 5.66ms | 3.98ms | 2.19ms | 2.27ms | 2.52ms |
| update_1to1000 | 378μs | 173μs | 170μs | 904μs | 42μs | 41μs |
| cellx1000 | 5.43ms | 86.69ms | 13.32ms | 9.80ms | 9.81ms | 8.82ms |
| cellx2500 | 29.43ms | 279.31ms | 43.95ms | 26.70ms | 31.81ms | 20.31ms |
| cellx5000 | 83.90ms | 617.86ms | 147.86ms | 88.31ms | 66.77ms | 45.29ms |
| 10x5 - 2 sources - read 20.0% (simple) | 244.26ms | 2.03s | 356.84ms | 436.43ms | 529.43ms | 229.01ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 198.96ms | 1.58s | 242.27ms | 281.15ms | 303.35ms | 176.95ms |
| 1000x12 - 4 sources - dynamic (large) | 343.70ms | 2.03s | 471.31ms | 3.69s | 3.91s | 285.38ms |
| 1000x5 - 25 sources (wide dense) | 483.21ms | 3.60s | 588.16ms | 2.70s | 3.45s | 417.05ms |
| 5x500 - 3 sources (deep) | 206.13ms | 1.16s | 257.88ms | 231.47ms | 228.17ms | 190.35ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 260.73ms | 1.77s | 376.89ms | 451.40ms | 496.79ms | 268.81ms |

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
