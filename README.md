# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.68s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.40s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.34s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.26s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.18s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.48s |

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
| Test Case | solidart(2.0-dev) | signals | mobx | preact_signals | state_beacon | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 283.41ms | 206.69ms | 2.38s | 201.31ms | 193.72ms (fail) | 184.51ms |
| broadPropagation | 515.35ms | 446.64ms | 4.58s | 452.00ms | 6.59ms (fail) | 342.53ms |
| deepPropagation | 166.72ms | 169.16ms | 1.58s | 176.90ms | 147.82ms (fail) | 123.31ms |
| diamond | 351.75ms | 281.17ms | 2.51s | 282.93ms | 190.10ms (fail) | 230.95ms |
| mux | 441.32ms | 440.70ms | 1.84s | 399.71ms | 191.89ms (fail) | 375.43ms |
| repeatedObservers | 81.61ms | 44.43ms | 235.55ms | 40.43ms | 53.00ms (fail) | 45.45ms |
| triangle | 121.62ms | 100.00ms | 763.84ms | 98.49ms | 81.64ms (fail) | 84.41ms |
| unstable | 97.46ms | 78.66ms | 351.32ms | 70.34ms | 334.55ms (fail) | 66.78ms |
| molBench | 493.69ms | 490.27ms | 584.77ms | 488.92ms | 875μs | 487.91ms |
| create_signals | 100.14ms | 25.60ms | 68.84ms | 5.30ms | 60.11ms | 28.81ms |
| comp_0to1 | 38.98ms | 11.07ms | 16.53ms | 17.69ms | 54.91ms | 7.88ms |
| comp_1to1 | 50.87ms | 28.00ms | 40.53ms | 13.74ms | 56.55ms | 4.27ms |
| comp_2to1 | 47.83ms | 9.60ms | 29.16ms | 21.37ms | 36.90ms | 2.32ms |
| comp_4to1 | 5.01ms | 2.19ms | 24.45ms | 11.99ms | 16.86ms | 8.56ms |
| comp_1000to1 | 17μs | 5μs | 18μs | 6μs | 65μs | 3μs |
| comp_1to2 | 34.86ms | 13.16ms | 41.90ms | 33.56ms | 53.93ms | 16.12ms |
| comp_1to4 | 22.74ms | 9.56ms | 18.34ms | 26.23ms | 44.59ms | 5.26ms |
| comp_1to8 | 24.90ms | 6.41ms | 20.80ms | 6.91ms | 48.67ms | 4.51ms |
| comp_1to1000 | 16.97ms | 4.27ms | 16.10ms | 4.94ms | 39.95ms | 3.51ms |
| update_1to1 | 16.00ms | 8.97ms | 25.32ms | 8.59ms | 5.64ms | 10.14ms |
| update_2to1 | 7.79ms | 4.55ms | 12.66ms | 4.28ms | 3.12ms | 2.35ms |
| update_4to1 | 4.00ms | 2.28ms | 7.13ms | 2.16ms | 1.47ms | 2.54ms |
| update_1000to1 | 39μs | 22μs | 71μs | 21μs | 15μs | 24μs |
| update_1to2 | 8.00ms | 4.47ms | 12.86ms | 4.66ms | 2.84ms | 5.14ms |
| update_1to4 | 4.02ms | 2.26ms | 5.90ms | 2.18ms | 1.47ms | 2.48ms |
| update_1to1000 | 169μs | 42μs | 173μs | 161μs | 396μs | 47μs |
| cellx1000 | 12.11ms | 9.96ms | 73.25ms | 9.76ms | 7.36ms | 7.21ms |
| cellx2500 | 34.29ms | 33.41ms | 273.13ms | 26.13ms | 30.83ms | 19.58ms |
| cellx5000 | 75.26ms | 65.52ms | 552.93ms | 68.58ms | 64.63ms | 46.35ms |
| 10x5 - 2 sources - read 20.0% (simple) | 355.99ms | 509.71ms | 2.08s | 437.88ms | 251.25ms | 233.09ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 243.81ms | 280.58ms | 1.55s | 266.97ms | 201.97ms | 178.66ms |
| 1000x12 - 4 sources - dynamic (large) | 461.01ms | 3.81s | 1.92s | 3.68s | 347.43ms | 280.29ms |
| 1000x5 - 25 sources (wide dense) | 589.53ms | 3.59s | 3.62s | 2.71s | 481.99ms | 411.70ms |
| 5x500 - 3 sources (deep) | 255.10ms | 226.68ms | 1.19s | 232.75ms | 210.08ms | 189.18ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 380.37ms | 480.79ms | 1.76s | 453.00ms | 258.49ms | 266.88ms |

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
