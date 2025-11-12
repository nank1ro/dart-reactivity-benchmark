# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.21s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.19s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.38s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.79s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.55s |

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
| avoidablePropagation | 211.95ms | 197.45ms | 153.31ms (fail) | 262.76ms | 200.91ms | 2.37s |
| broadPropagation | 457.50ms | 355.00ms | 6.91ms (fail) | 486.78ms | 463.33ms | 4.40s |
| deepPropagation | 175.76ms | 126.60ms | 142.18ms (fail) | 163.54ms | 179.30ms | 1.55s |
| diamond | 285.39ms | 235.82ms | 185.73ms (fail) | 346.15ms | 278.91ms | 2.41s |
| mux | 406.05ms | 381.15ms | 197.20ms (fail) | 424.93ms | 399.21ms | 1.85s |
| repeatedObservers | 46.33ms | 43.72ms | 52.45ms (fail) | 80.57ms | 39.92ms | 234.43ms |
| triangle | 100.46ms | 85.48ms | 77.44ms (fail) | 113.98ms | 98.78ms | 769.92ms |
| unstable | 76.06ms | 59.93ms | 339.89ms (fail) | 95.32ms | 75.37ms | 345.84ms |
| molBench | 485.69ms | 489.95ms | 971μs | 494.58ms | 489.09ms | 584.65ms |
| create_signals | 26.03ms | 21.27ms | 68.97ms | 77.43ms | 5.49ms | 73.25ms |
| comp_0to1 | 12.11ms | 7.82ms | 59.61ms | 26.25ms | 18.28ms | 30.64ms |
| comp_1to1 | 28.70ms | 4.40ms | 69.43ms | 40.24ms | 14.93ms | 39.17ms |
| comp_2to1 | 11.76ms | 2.39ms | 40.70ms | 24.41ms | 18.41ms | 34.55ms |
| comp_4to1 | 1.95ms | 9.84ms | 18.18ms | 12.04ms | 9.33ms | 26.03ms |
| comp_1000to1 | 5μs | 5μs | 45μs | 18μs | 5μs | 15μs |
| comp_1to2 | 21.95ms | 19.83ms | 51.12ms | 28.04ms | 28.20ms | 38.94ms |
| comp_1to4 | 10.42ms | 7.99ms | 49.31ms | 21.56ms | 21.15ms | 21.84ms |
| comp_1to8 | 9.76ms | 6.91ms | 48.57ms | 20.20ms | 8.90ms | 24.25ms |
| comp_1to1000 | 7.38ms | 3.23ms | 43.41ms | 14.77ms | 8.30ms | 15.27ms |
| update_1to1 | 10.29ms | 10.07ms | 6.19ms | 16.35ms | 8.47ms | 25.16ms |
| update_2to1 | 4.54ms | 2.18ms | 3.11ms | 8.02ms | 4.36ms | 12.63ms |
| update_4to1 | 2.55ms | 2.46ms | 1.55ms | 4.10ms | 2.09ms | 6.02ms |
| update_1000to1 | 25μs | 22μs | 15μs | 40μs | 20μs | 69μs |
| update_1to2 | 4.50ms | 5.13ms | 3.02ms | 8.45ms | 4.08ms | 11.03ms |
| update_1to4 | 2.56ms | 2.39ms | 1.54ms | 4.08ms | 2.08ms | 6.38ms |
| update_1to1000 | 44μs | 46μs | 425μs | 157μs | 638μs | 172μs |
| cellx1000 | 9.78ms | 7.27ms | 6.41ms | 13.93ms | 9.85ms | 81.33ms |
| cellx2500 | 31.86ms | 19.83ms | 33.81ms | 33.60ms | 26.73ms | 266.10ms |
| cellx5000 | 68.48ms | 51.16ms | 80.31ms | 85.64ms | 73.76ms | 594.34ms |
| 10x5 - 2 sources - read 20.0% (simple) | 507.77ms | 241.26ms | 253.84ms | 350.51ms | 450.11ms | 2.08s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.67ms | 177.80ms | 204.10ms | 247.75ms | 274.44ms | 1.56s |
| 1000x12 - 4 sources - dynamic (large) | 3.77s | 287.81ms | 357.34ms | 456.36ms | 3.76s | 1.93s |
| 1000x5 - 25 sources (wide dense) | 3.43s | 406.48ms | 516.11ms | 610.48ms | 2.72s | 3.51s |
| 5x500 - 3 sources (deep) | 221.73ms | 198.92ms | 208.09ms | 248.94ms | 231.09ms | 1.15s |
| 100x15 - 6 sources - dynamic (very dynamic) | 473.05ms | 261.63ms | 265.19ms | 383.79ms | 461.93ms | 1.73s |

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
