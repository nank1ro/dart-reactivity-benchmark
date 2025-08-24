# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.45s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.24s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.32s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.80s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.60s |

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
| Test Case | mobx | state_beacon | preact_signals | alien_signals | solidart(2.0-dev) | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.39s | 174.52ms (fail) | 200.12ms | 196.14ms | 264.20ms | 212.08ms |
| broadPropagation | 4.47s | 6.63ms (fail) | 463.72ms | 346.45ms | 498.56ms | 475.21ms |
| deepPropagation | 1.54s | 142.34ms (fail) | 179.23ms | 128.49ms | 164.11ms | 177.87ms |
| diamond | 2.43s | 202.32ms (fail) | 277.62ms | 234.46ms | 361.06ms | 285.98ms |
| mux | 1.86s | 200.32ms (fail) | 394.19ms | 375.80ms | 439.72ms | 407.90ms |
| repeatedObservers | 236.96ms | 52.67ms (fail) | 40.93ms | 43.69ms | 81.07ms | 46.28ms |
| triangle | 792.74ms | 80.97ms (fail) | 98.14ms | 85.30ms | 114.12ms | 101.91ms |
| unstable | 346.31ms | 342.70ms (fail) | 74.70ms | 60.68ms | 96.21ms | 75.79ms |
| molBench | 585.31ms | 1.44ms | 482.43ms | 489.01ms | 501.20ms | 484.40ms |
| create_signals | 83.36ms | 63.54ms | 5.21ms | 23.38ms | 95.33ms | 26.64ms |
| comp_0to1 | 16.05ms | 57.80ms | 17.93ms | 9.72ms | 38.14ms | 12.13ms |
| comp_1to1 | 40.61ms | 58.91ms | 11.02ms | 4.17ms | 48.18ms | 29.35ms |
| comp_2to1 | 23.76ms | 39.72ms | 18.58ms | 2.44ms | 49.95ms | 14.15ms |
| comp_4to1 | 17.63ms | 17.22ms | 16.36ms | 15.31ms | 17.63ms | 7.30ms |
| comp_1000to1 | 15μs | 45μs | 4μs | 3μs | 17μs | 7μs |
| comp_1to2 | 37.83ms | 49.05ms | 26.94ms | 16.25ms | 34.22ms | 14.57ms |
| comp_1to4 | 18.47ms | 47.20ms | 20.48ms | 10.28ms | 14.27ms | 9.68ms |
| comp_1to8 | 21.35ms | 46.49ms | 7.82ms | 4.56ms | 19.93ms | 8.62ms |
| comp_1to1000 | 15.37ms | 42.34ms | 6.49ms | 3.20ms | 14.00ms | 4.60ms |
| update_1to1 | 26.11ms | 6.04ms | 8.45ms | 9.97ms | 16.55ms | 10.36ms |
| update_2to1 | 14.31ms | 3.09ms | 4.42ms | 2.14ms | 8.06ms | 4.59ms |
| update_4to1 | 7.52ms | 1.55ms | 2.08ms | 2.59ms | 4.10ms | 2.56ms |
| update_1000to1 | 69μs | 15μs | 20μs | 15μs | 40μs | 25μs |
| update_1to2 | 12.40ms | 3.07ms | 4.09ms | 4.96ms | 8.38ms | 4.63ms |
| update_1to4 | 7.07ms | 1.54ms | 2.07ms | 2.59ms | 4.17ms | 2.51ms |
| update_1to1000 | 170μs | 418μs | 2.58ms | 45μs | 151μs | 45μs |
| cellx1000 | 86.28ms | 6.21ms | 10.66ms | 7.39ms | 15.90ms | 10.27ms |
| cellx2500 | 294.06ms | 32.86ms | 28.40ms | 20.06ms | 51.96ms | 37.67ms |
| cellx5000 | 577.32ms | 85.06ms | 98.78ms | 49.84ms | 157.22ms | 86.88ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.03s | 266.52ms | 449.38ms | 236.93ms | 350.46ms | 516.80ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.52s | 206.33ms | 273.83ms | 179.97ms | 250.16ms | 286.45ms |
| 1000x12 - 4 sources - dynamic (large) | 1.90s | 364.35ms | 3.67s | 287.27ms | 473.10ms | 3.76s |
| 1000x5 - 25 sources (wide dense) | 3.51s | 520.64ms | 2.73s | 401.55ms | 616.29ms | 3.43s |
| 5x500 - 3 sources (deep) | 1.16s | 206.22ms | 228.90ms | 191.91ms | 253.08ms | 223.81ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.72s | 266.51ms | 458.13ms | 271.48ms | 384.67ms | 470.17ms |

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
