# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.69s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.18s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.29s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.24s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 28.01s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.44s |

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
| avoidablePropagation | 154.46ms (fail) | 183.37ms | 2.36s | 273.11ms | 208.72ms | 202.90ms |
| broadPropagation | 6.29ms (fail) | 347.86ms | 4.46s | 505.87ms | 447.98ms | 448.44ms |
| deepPropagation | 139.54ms (fail) | 126.81ms | 1.60s | 171.11ms | 173.38ms | 175.38ms |
| diamond | 202.87ms (fail) | 240.03ms | 2.51s | 353.41ms | 278.74ms | 303.45ms |
| mux | 205.06ms (fail) | 370.98ms | 1.84s | 448.77ms | 405.62ms | 399.84ms |
| repeatedObservers | 53.02ms (fail) | 45.49ms | 241.15ms | 81.36ms | 44.65ms | 40.24ms |
| triangle | 87.91ms (fail) | 85.48ms | 786.32ms | 117.95ms | 102.00ms | 98.44ms |
| unstable | 336.15ms (fail) | 66.94ms | 360.04ms | 96.35ms | 81.51ms | 70.33ms |
| molBench | 920μs | 489.10ms | 574.24ms | 494.05ms | 487.56ms | 490.43ms |
| create_signals | 68.21ms | 27.82ms | 80.82ms | 75.90ms | 26.44ms | 5.59ms |
| comp_0to1 | 57.45ms | 7.55ms | 22.87ms | 28.23ms | 11.84ms | 19.00ms |
| comp_1to1 | 55.19ms | 4.55ms | 39.45ms | 40.57ms | 27.83ms | 13.74ms |
| comp_2to1 | 36.94ms | 2.57ms | 23.58ms | 26.74ms | 9.13ms | 18.16ms |
| comp_4to1 | 16.39ms | 8.90ms | 25.75ms | 15.64ms | 1.89ms | 17.69ms |
| comp_1000to1 | 61μs | 5μs | 17μs | 18μs | 5μs | 5μs |
| comp_1to2 | 44.84ms | 20.71ms | 36.14ms | 38.61ms | 13.74ms | 24.93ms |
| comp_1to4 | 44.73ms | 6.78ms | 30.43ms | 22.43ms | 10.26ms | 22.04ms |
| comp_1to8 | 42.72ms | 4.56ms | 20.70ms | 24.80ms | 8.55ms | 9.46ms |
| comp_1to1000 | 38.37ms | 3.38ms | 15.74ms | 17.15ms | 4.29ms | 6.49ms |
| update_1to1 | 5.67ms | 8.89ms | 27.04ms | 15.95ms | 9.04ms | 8.73ms |
| update_2to1 | 3.10ms | 2.46ms | 13.19ms | 7.81ms | 4.48ms | 4.25ms |
| update_4to1 | 1.44ms | 2.50ms | 7.96ms | 4.00ms | 2.23ms | 2.17ms |
| update_1000to1 | 14μs | 25μs | 67μs | 40μs | 22μs | 21μs |
| update_1to2 | 2.84ms | 3.53ms | 13.61ms | 8.05ms | 4.48ms | 4.62ms |
| update_1to4 | 1.45ms | 2.50ms | 6.85ms | 4.03ms | 2.25ms | 2.16ms |
| update_1to1000 | 377μs | 47μs | 351μs | 171μs | 43μs | 2.19ms |
| cellx1000 | 5.20ms | 7.44ms | 83.09ms | 11.97ms | 9.65ms | 9.76ms |
| cellx2500 | 23.17ms | 19.44ms | 245.98ms | 34.67ms | 31.37ms | 26.03ms |
| cellx5000 | 64.03ms | 42.98ms | 623.73ms | 75.19ms | 66.14ms | 69.27ms |
| 10x5 - 2 sources - read 20.0% (simple) | 244.41ms | 229.57ms | 2.08s | 357.88ms | 522.01ms | 445.97ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 198.67ms | 186.09ms | 1.54s | 244.29ms | 284.30ms | 270.57ms |
| 1000x12 - 4 sources - dynamic (large) | 347.23ms | 279.63ms | 1.79s | 458.27ms | 3.75s | 3.66s |
| 1000x5 - 25 sources (wide dense) | 486.82ms | 411.94ms | 3.67s | 599.16ms | 3.45s | 2.69s |
| 5x500 - 3 sources (deep) | 205.19ms | 186.94ms | 1.17s | 259.69ms | 224.19ms | 223.47ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 261.36ms | 261.96ms | 1.72s | 380.96ms | 480.71ms | 453.51ms |

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
