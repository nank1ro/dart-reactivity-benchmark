# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.22s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.45s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.62s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.78s |
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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 212.89ms | 194.48ms | 150.88ms (fail) | 260.63ms | 201.58ms | 2.36s |
| broadPropagation | 454.70ms | 355.07ms | 6.31ms (fail) | 490.96ms | 466.56ms | 4.43s |
| deepPropagation | 177.11ms | 126.45ms | 140.69ms (fail) | 163.39ms | 179.25ms | 1.56s |
| diamond | 281.16ms | 235.98ms | 203.85ms (fail) | 349.74ms | 278.35ms | 2.45s |
| mux | 407.66ms | 377.97ms | 195.71ms (fail) | 427.78ms | 384.45ms | 1.82s |
| repeatedObservers | 46.66ms | 44.13ms | 53.09ms (fail) | 80.73ms | 40.49ms | 232.84ms |
| triangle | 104.70ms | 85.15ms | 77.43ms (fail) | 114.04ms | 98.90ms | 779.68ms |
| unstable | 76.38ms | 59.63ms | 339.02ms (fail) | 94.76ms | 74.10ms | 343.42ms |
| molBench | 487.11ms | 489.51ms | 944μs | 493.21ms | 487.79ms | 585.27ms |
| create_signals | 26.11ms | 24.05ms | 64.65ms | 57.36ms | 5.31ms | 74.67ms |
| comp_0to1 | 12.14ms | 7.51ms | 60.83ms | 23.93ms | 18.47ms | 25.39ms |
| comp_1to1 | 27.60ms | 4.20ms | 63.80ms | 40.80ms | 12.92ms | 19.12ms |
| comp_2to1 | 14.95ms | 2.31ms | 39.77ms | 24.18ms | 17.67ms | 12.43ms |
| comp_4to1 | 3.46ms | 8.91ms | 16.77ms | 13.18ms | 12.42ms | 14.93ms |
| comp_1000to1 | 7μs | 5μs | 64μs | 15μs | 6μs | 17μs |
| comp_1to2 | 22.77ms | 14.06ms | 48.55ms | 41.85ms | 14.38ms | 37.61ms |
| comp_1to4 | 8.16ms | 9.30ms | 46.48ms | 27.85ms | 25.95ms | 26.48ms |
| comp_1to8 | 7.47ms | 5.19ms | 45.55ms | 18.88ms | 6.84ms | 26.66ms |
| comp_1to1000 | 4.39ms | 3.58ms | 41.70ms | 13.83ms | 5.60ms | 16.47ms |
| update_1to1 | 10.30ms | 10.27ms | 6.01ms | 16.36ms | 8.34ms | 25.43ms |
| update_2to1 | 4.60ms | 2.21ms | 3.09ms | 8.02ms | 4.41ms | 12.59ms |
| update_4to1 | 2.57ms | 2.53ms | 1.53ms | 4.14ms | 2.10ms | 6.33ms |
| update_1000to1 | 25μs | 10μs | 16μs | 40μs | 20μs | 62μs |
| update_1to2 | 4.63ms | 5.18ms | 3.01ms | 8.41ms | 4.31ms | 12.47ms |
| update_1to4 | 2.58ms | 2.33ms | 1.52ms | 7.03ms | 2.10ms | 6.23ms |
| update_1to1000 | 43μs | 45μs | 428μs | 262μs | 151μs | 172μs |
| cellx1000 | 10.88ms | 8.97ms | 5.08ms | 11.68ms | 9.60ms | 77.67ms |
| cellx2500 | 35.24ms | 19.95ms | 23.21ms | 31.86ms | 26.92ms | 261.07ms |
| cellx5000 | 81.96ms | 42.67ms | 62.77ms | 88.62ms | 69.36ms | 584.98ms |
| 10x5 - 2 sources - read 20.0% (simple) | 509.27ms | 237.77ms | 234.53ms | 359.95ms | 513.92ms | 2.06s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.00ms | 181.74ms | 196.24ms | 254.18ms | 296.57ms | 1.57s |
| 1000x12 - 4 sources - dynamic (large) | 4.03s | 285.49ms | 337.30ms | 456.32ms | 3.73s | 1.93s |
| 1000x5 - 25 sources (wide dense) | 3.57s | 421.14ms | 511.32ms | 601.09ms | 2.73s | 3.51s |
| 5x500 - 3 sources (deep) | 223.66ms | 196.48ms | 204.80ms | 251.75ms | 244.35ms | 1.15s |
| 100x15 - 6 sources - dynamic (very dynamic) | 480.66ms | 262.07ms | 257.88ms | 383.40ms | 471.06ms | 1.75s |

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
