# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.67s |
| 🥈 | signals | 0.25 | 100.0% | 35/35 | 10.96s |
| 🥉 | solidart(2.0-dev) | 0.24 | 100.0% | 35/35 | 5.45s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.20s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 27.31s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.39s |

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
| avoidablePropagation | 210.40ms | 187.21ms | 146.54ms (fail) | 284.71ms | 206.18ms | 2.44s |
| broadPropagation | 458.26ms | 353.83ms | 6.76ms (fail) | 503.60ms | 454.88ms | 4.43s |
| deepPropagation | 173.02ms | 137.87ms | 139.78ms (fail) | 169.31ms | 179.01ms | 1.49s |
| diamond | 288.45ms | 232.65ms | 189.78ms (fail) | 371.78ms | 289.72ms | 2.38s |
| mux | 396.56ms | 360.91ms | 180.39ms (fail) | 429.58ms | 370.72ms | 1.86s |
| repeatedObservers | 46.22ms | 44.31ms | 54.05ms (fail) | 80.45ms | 40.86ms | 231.76ms |
| triangle | 101.98ms | 84.86ms | 76.81ms (fail) | 115.27ms | 100.76ms | 744.00ms |
| unstable | 73.57ms | 63.19ms | 342.19ms (fail) | 96.50ms | 69.95ms | 343.30ms |
| molBench | 495.40ms | 485.25ms | 1.01ms | 490.12ms | 484.89ms | 590.08ms |
| create_signals | 26.50ms | 23.96ms | 57.48ms | 81.58ms | 5.37ms | 81.23ms |
| comp_0to1 | 11.89ms | 9.41ms | 51.44ms | 29.19ms | 23.10ms | 45.48ms |
| comp_1to1 | 27.02ms | 4.30ms | 52.77ms | 48.24ms | 13.12ms | 25.57ms |
| comp_2to1 | 11.64ms | 2.29ms | 36.76ms | 18.65ms | 17.76ms | 25.97ms |
| comp_4to1 | 2.07ms | 10.47ms | 15.68ms | 10.54ms | 21.74ms | 19.85ms |
| comp_1000to1 | 8μs | 4μs | 41μs | 31μs | 4μs | 20μs |
| comp_1to2 | 22.53ms | 18.98ms | 43.55ms | 31.53ms | 32.18ms | 42.44ms |
| comp_1to4 | 7.84ms | 5.18ms | 43.37ms | 23.69ms | 22.44ms | 27.58ms |
| comp_1to8 | 7.10ms | 4.99ms | 41.79ms | 33.31ms | 9.10ms | 29.96ms |
| comp_1to1000 | 4.56ms | 3.40ms | 38.18ms | 15.11ms | 6.65ms | 15.38ms |
| update_1to1 | 9.27ms | 4.62ms | 6.10ms | 15.58ms | 8.85ms | 26.88ms |
| update_2to1 | 4.70ms | 2.33ms | 3.09ms | 7.75ms | 4.39ms | 13.65ms |
| update_4to1 | 2.33ms | 1.20ms | 1.56ms | 3.88ms | 2.23ms | 7.06ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 69μs |
| update_1to2 | 4.63ms | 2.26ms | 3.06ms | 7.72ms | 4.35ms | 11.55ms |
| update_1to4 | 2.49ms | 1.20ms | 1.61ms | 3.88ms | 2.24ms | 5.11ms |
| update_1to1000 | 44μs | 37μs | 364μs | 152μs | 588μs | 163μs |
| cellx1000 | 12.38ms | 9.96ms | 5.36ms | 19.02ms | 9.77ms | 92.07ms |
| cellx2500 | 33.50ms | 21.86ms | 31.64ms | 69.34ms | 37.12ms | 296.46ms |
| cellx5000 | 67.93ms | 45.60ms | 70.90ms | 171.51ms | 101.35ms | 599.44ms |
| 10x5 - 2 sources - read 20.0% (simple) | 503.96ms | 225.94ms | 241.18ms | 362.74ms | 431.13ms | 1.92s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 276.19ms | 172.10ms | 204.83ms | 248.42ms | 270.15ms | 1.46s |
| 1000x12 - 4 sources - dynamic (large) | 3.69s | 281.84ms | 353.39ms | 472.84ms | 3.74s | 1.84s |
| 1000x5 - 25 sources (wide dense) | 3.29s | 404.77ms | 489.49ms | 587.28ms | 2.54s | 3.43s |
| 5x500 - 3 sources (deep) | 227.21ms | 197.55ms | 205.69ms | 258.95ms | 235.97ms | 1.11s |
| 100x15 - 6 sources - dynamic (very dynamic) | 476.40ms | 264.33ms | 257.81ms | 390.10ms | 458.82ms | 1.67s |

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
