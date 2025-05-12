# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.73s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 10.05s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.28s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.18s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.33s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.40s |

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
| Test Case | preact_signals | mobx | state_beacon | solidart(2.0-dev) | alien_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 206.06ms | 2.33s | 148.68ms (fail) | 277.63ms | 193.83ms | 211.69ms |
| broadPropagation | 455.92ms | 4.22s | 6.04ms (fail) | 506.37ms | 358.09ms | 450.19ms |
| deepPropagation | 177.14ms | 1.50s | 140.02ms (fail) | 175.94ms | 125.04ms | 174.67ms |
| diamond | 281.98ms | 2.42s | 180.28ms (fail) | 357.21ms | 237.74ms | 285.80ms |
| mux | 385.68ms | 1.84s | 193.10ms (fail) | 444.30ms | 374.73ms | 402.41ms |
| repeatedObservers | 38.62ms | 225.90ms | 53.09ms (fail) | 78.58ms | 45.02ms | 45.76ms |
| triangle | 100.47ms | 762.80ms | 75.46ms (fail) | 122.47ms | 85.03ms | 101.85ms |
| unstable | 70.84ms | 349.05ms | 337.62ms (fail) | 94.56ms | 60.19ms | 72.23ms |
| molBench | 491.35ms | 580.69ms | 1.07ms | 402.13ms | 487.44ms | 487.78ms |
| create_signals | 4.62ms | 69.61ms | 59.72ms | 87.20ms | 28.15ms | 25.63ms |
| comp_0to1 | 23.38ms | 26.83ms | 52.89ms | 32.58ms | 6.88ms | 11.88ms |
| comp_1to1 | 11.51ms | 37.08ms | 55.06ms | 49.35ms | 4.31ms | 26.88ms |
| comp_2to1 | 17.28ms | 34.06ms | 36.02ms | 25.01ms | 2.29ms | 18.68ms |
| comp_4to1 | 15.45ms | 15.00ms | 17.26ms | 15.46ms | 10.93ms | 6.96ms |
| comp_1000to1 | 4μs | 22μs | 42μs | 18μs | 5μs | 5μs |
| comp_1to2 | 28.88ms | 35.18ms | 44.85ms | 29.48ms | 27.44ms | 24.07ms |
| comp_1to4 | 20.74ms | 19.68ms | 44.23ms | 33.72ms | 5.58ms | 9.95ms |
| comp_1to8 | 7.89ms | 22.50ms | 43.26ms | 25.61ms | 6.06ms | 8.90ms |
| comp_1to1000 | 7.44ms | 14.84ms | 38.65ms | 15.46ms | 3.27ms | 4.54ms |
| update_1to1 | 8.21ms | 23.90ms | 5.73ms | 16.25ms | 10.91ms | 9.27ms |
| update_2to1 | 4.15ms | 10.95ms | 2.91ms | 8.30ms | 4.95ms | 4.59ms |
| update_4to1 | 2.06ms | 6.24ms | 1.43ms | 4.37ms | 2.77ms | 2.30ms |
| update_1000to1 | 20μs | 63μs | 15μs | 40μs | 20μs | 23μs |
| update_1to2 | 4.16ms | 11.88ms | 2.94ms | 8.48ms | 5.60ms | 4.97ms |
| update_1to4 | 2.06ms | 5.83ms | 1.43ms | 4.03ms | 2.46ms | 2.29ms |
| update_1to1000 | 50μs | 165μs | 389μs | 160μs | 47μs | 43μs |
| cellx1000 | 9.65ms | 72.66ms | 5.59ms | 11.96ms | 8.48ms | 9.92ms |
| cellx2500 | 27.10ms | 266.17ms | 28.87ms | 35.59ms | 19.96ms | 32.73ms |
| cellx5000 | 80.73ms | 581.26ms | 59.97ms | 92.15ms | 48.55ms | 69.40ms |
| 10x5 - 2 sources - read 20.0% (simple) | 438.21ms | 2.00s | 261.34ms | 358.33ms | 234.20ms | 507.97ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 271.51ms | 1.53s | 200.30ms | 247.03ms | 177.16ms | 278.67ms |
| 1000x12 - 4 sources - dynamic (large) | 3.59s | 1.81s | 346.14ms | 478.00ms | 287.95ms | 3.75s |
| 1000x5 - 25 sources (wide dense) | 2.59s | 3.59s | 494.94ms | 597.50ms | 405.09ms | 3.42s |
| 5x500 - 3 sources (deep) | 227.44ms | 1.14s | 208.17ms | 257.44ms | 193.02ms | 226.84ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 452.49ms | 1.77s | 257.06ms | 389.27ms | 265.82ms | 489.16ms |

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
