# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.35s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 10.75s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.51s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.18s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| avoidablePropagation | 199.07ms | 2.23s | 143.40ms (fail) | 194.43ms | 225.34ms | 273.58ms |
| broadPropagation | 451.92ms | 4.29s | 6.39ms (fail) | 359.56ms | 450.18ms | 508.34ms |
| deepPropagation | 172.53ms | 1.53s | 141.75ms (fail) | 126.78ms | 174.67ms | 169.66ms |
| diamond | 286.52ms | 2.42s | 185.60ms (fail) | 245.48ms | 285.49ms | 348.89ms |
| mux | 398.92ms | 1.78s | 185.04ms (fail) | 361.75ms | 375.59ms | 419.10ms |
| repeatedObservers | 45.77ms | 225.32ms | 55.20ms (fail) | 46.41ms | 42.09ms | 80.54ms |
| triangle | 102.40ms | 768.89ms | 75.90ms (fail) | 88.24ms | 98.86ms | 128.78ms |
| unstable | 75.55ms | 336.90ms | 336.65ms (fail) | 62.23ms | 71.42ms | 95.78ms |
| molBench | 490.29ms | 584.35ms | 978μs | 483.53ms | 495.88ms | 494.80ms |
| create_signals | 27.90ms | 94.19ms | 73.32ms | 28.46ms | 5.65ms | 57.78ms |
| comp_0to1 | 12.29ms | 22.56ms | 60.30ms | 7.93ms | 18.91ms | 26.62ms |
| comp_1to1 | 27.32ms | 43.09ms | 60.99ms | 4.32ms | 11.57ms | 40.09ms |
| comp_2to1 | 10.00ms | 35.23ms | 44.95ms | 2.38ms | 12.04ms | 38.11ms |
| comp_4to1 | 2.09ms | 25.34ms | 20.20ms | 7.71ms | 12.72ms | 13.94ms |
| comp_1000to1 | 5μs | 15μs | 47μs | 3μs | 5μs | 15μs |
| comp_1to2 | 23.71ms | 38.70ms | 53.66ms | 9.76ms | 24.94ms | 25.35ms |
| comp_1to4 | 13.96ms | 20.82ms | 50.01ms | 13.08ms | 32.55ms | 20.96ms |
| comp_1to8 | 6.92ms | 23.52ms | 49.55ms | 5.05ms | 12.35ms | 22.99ms |
| comp_1to1000 | 4.39ms | 15.15ms | 44.26ms | 3.50ms | 7.97ms | 14.38ms |
| update_1to1 | 8.99ms | 21.34ms | 9.36ms | 4.69ms | 9.13ms | 15.73ms |
| update_2to1 | 4.50ms | 10.52ms | 2.83ms | 2.33ms | 4.59ms | 7.84ms |
| update_4to1 | 2.27ms | 5.35ms | 2.37ms | 1.16ms | 2.30ms | 3.89ms |
| update_1000to1 | 22μs | 55μs | 15μs | 24μs | 39μs | 39μs |
| update_1to2 | 4.50ms | 10.36ms | 3.33ms | 2.38ms | 4.43ms | 8.03ms |
| update_1to4 | 2.27ms | 5.20ms | 1.42ms | 1.23ms | 2.38ms | 3.95ms |
| update_1to1000 | 43μs | 158μs | 430μs | 48μs | 457μs | 148μs |
| cellx1000 | 11.87ms | 83.53ms | 5.37ms | 8.72ms | 11.68ms | 14.99ms |
| cellx2500 | 47.55ms | 304.03ms | 25.70ms | 19.55ms | 35.84ms | 46.25ms |
| cellx5000 | 115.75ms | 634.91ms | 71.31ms | 40.65ms | 96.34ms | 148.86ms |
| 10x5 - 2 sources - read 20.0% (simple) | 496.25ms | 2.01s | 237.56ms | 240.25ms | 462.47ms | 347.73ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.31ms | 1.47s | 199.22ms | 189.70ms | 279.31ms | 251.79ms |
| 1000x12 - 4 sources - dynamic (large) | 3.47s | 1.90s | 345.88ms | 278.79ms | 3.77s | 466.03ms |
| 1000x5 - 25 sources (wide dense) | 3.26s | 3.44s | 503.36ms | 407.12ms | 2.78s | 604.68ms |
| 5x500 - 3 sources (deep) | 224.01ms | 1.15s | 208.31ms | 193.63ms | 229.68ms | 257.96ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 472.46ms | 1.65s | 258.54ms | 275.09ms | 453.22ms | 393.00ms |

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
