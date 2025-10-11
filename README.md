# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.72s |
| 🥈 | preact_signals | 0.26 | 100.0% | 35/35 | 10.41s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.40s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.36s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.57s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.59s |

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
| avoidablePropagation | 216.51ms | 194.69ms | 175.31ms (fail) | 263.42ms | 201.76ms | 2.36s |
| broadPropagation | 455.62ms | 355.37ms | 6.40ms (fail) | 496.38ms | 459.08ms | 4.41s |
| deepPropagation | 185.22ms | 126.41ms | 139.73ms (fail) | 168.71ms | 182.19ms | 1.56s |
| diamond | 285.54ms | 240.90ms | 202.29ms (fail) | 353.17ms | 279.96ms | 2.42s |
| mux | 407.65ms | 382.87ms | 199.08ms (fail) | 429.92ms | 391.69ms | 1.84s |
| repeatedObservers | 46.91ms | 43.85ms | 53.66ms (fail) | 80.58ms | 41.55ms | 226.50ms |
| triangle | 101.80ms | 84.82ms | 82.77ms (fail) | 114.29ms | 103.94ms | 775.29ms |
| unstable | 75.75ms | 60.32ms | 343.62ms (fail) | 95.87ms | 75.28ms | 345.10ms |
| molBench | 486.01ms | 489.19ms | 981μs | 493.94ms | 483.27ms | 583.43ms |
| create_signals | 25.20ms | 21.15ms | 68.59ms | 96.05ms | 5.29ms | 64.71ms |
| comp_0to1 | 11.25ms | 8.36ms | 60.27ms | 33.73ms | 18.00ms | 15.82ms |
| comp_1to1 | 27.49ms | 4.07ms | 63.45ms | 49.44ms | 14.76ms | 34.23ms |
| comp_2to1 | 9.54ms | 2.28ms | 42.85ms | 44.81ms | 16.40ms | 22.96ms |
| comp_4to1 | 2.29ms | 9.96ms | 18.07ms | 4.44ms | 14.85ms | 14.10ms |
| comp_1000to1 | 5μs | 3μs | 44μs | 24μs | 5μs | 15μs |
| comp_1to2 | 18.25ms | 12.65ms | 49.95ms | 33.39ms | 18.33ms | 34.35ms |
| comp_1to4 | 10.99ms | 14.16ms | 50.65ms | 21.22ms | 34.44ms | 22.73ms |
| comp_1to8 | 10.21ms | 4.25ms | 45.87ms | 23.77ms | 7.12ms | 26.74ms |
| comp_1to1000 | 5.44ms | 3.21ms | 41.10ms | 14.33ms | 5.86ms | 15.42ms |
| update_1to1 | 11.76ms | 9.82ms | 6.01ms | 16.34ms | 8.33ms | 23.06ms |
| update_2to1 | 4.55ms | 2.18ms | 5.21ms | 8.03ms | 4.40ms | 11.06ms |
| update_4to1 | 2.54ms | 2.47ms | 1.50ms | 4.10ms | 2.08ms | 5.73ms |
| update_1000to1 | 25μs | 17μs | 15μs | 56μs | 20μs | 60μs |
| update_1to2 | 4.84ms | 4.95ms | 3.02ms | 8.61ms | 4.08ms | 11.03ms |
| update_1to4 | 2.67ms | 2.50ms | 1.50ms | 4.10ms | 2.08ms | 5.57ms |
| update_1to1000 | 42μs | 49μs | 405μs | 151μs | 147μs | 169μs |
| cellx1000 | 9.73ms | 7.37ms | 5.36ms | 12.80ms | 10.01ms | 98.73ms |
| cellx2500 | 26.54ms | 20.36ms | 23.45ms | 47.33ms | 28.71ms | 308.33ms |
| cellx5000 | 64.82ms | 48.72ms | 82.47ms | 157.22ms | 86.60ms | 599.01ms |
| 10x5 - 2 sources - read 20.0% (simple) | 511.97ms | 237.06ms | 273.94ms | 355.56ms | 458.03ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 284.89ms | 184.99ms | 203.91ms | 247.82ms | 274.59ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 3.76s | 278.69ms | 350.07ms | 464.73ms | 3.78s | 1.91s |
| 1000x5 - 25 sources (wide dense) | 3.59s | 404.88ms | 515.60ms | 613.81ms | 2.71s | 3.44s |
| 5x500 - 3 sources (deep) | 225.00ms | 191.14ms | 211.92ms | 250.56ms | 228.47ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 477.20ms | 263.08ms | 261.47ms | 388.01ms | 460.69ms | 1.71s |

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
