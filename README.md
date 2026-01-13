# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.68s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 9.98s |
| 🥉 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.27s |
| 4 | signals | 0.24 | 100.0% | 35/35 | 11.33s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.09s |
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
| avoidablePropagation | 215.10ms | 188.50ms | 148.61ms (fail) | 279.71ms | 202.27ms | 2.34s |
| broadPropagation | 456.69ms | 353.27ms | 5.91ms (fail) | 509.73ms | 454.61ms | 4.39s |
| deepPropagation | 177.26ms | 130.36ms | 143.33ms (fail) | 170.25ms | 175.98ms | 1.50s |
| diamond | 287.21ms | 231.34ms | 179.12ms (fail) | 357.82ms | 282.97ms | 2.37s |
| mux | 413.28ms | 359.03ms | 179.17ms (fail) | 421.65ms | 375.29ms | 1.87s |
| repeatedObservers | 46.26ms | 44.17ms | 53.58ms (fail) | 79.92ms | 40.68ms | 226.45ms |
| triangle | 101.89ms | 85.69ms | 76.57ms (fail) | 114.97ms | 100.48ms | 727.48ms |
| unstable | 77.98ms | 63.24ms | 338.33ms (fail) | 95.87ms | 69.17ms | 339.27ms |
| molBench | 495.59ms | 485.44ms | 971μs | 494.65ms | 484.49ms | 588.26ms |
| create_signals | 26.10ms | 28.91ms | 57.54ms | 54.42ms | 4.92ms | 52.45ms |
| comp_0to1 | 12.01ms | 6.98ms | 51.95ms | 25.41ms | 18.03ms | 19.15ms |
| comp_1to1 | 28.24ms | 4.27ms | 53.42ms | 38.44ms | 13.17ms | 31.61ms |
| comp_2to1 | 15.51ms | 2.34ms | 36.08ms | 37.79ms | 10.44ms | 9.29ms |
| comp_4to1 | 9.33ms | 8.62ms | 16.64ms | 11.44ms | 8.14ms | 28.73ms |
| comp_1000to1 | 5μs | 4μs | 40μs | 19μs | 6μs | 20μs |
| comp_1to2 | 23.01ms | 11.20ms | 44.06ms | 27.33ms | 16.82ms | 39.39ms |
| comp_1to4 | 14.85ms | 15.36ms | 44.57ms | 25.54ms | 25.58ms | 27.38ms |
| comp_1to8 | 6.38ms | 4.01ms | 42.05ms | 25.11ms | 6.90ms | 25.76ms |
| comp_1to1000 | 4.34ms | 3.30ms | 38.22ms | 14.59ms | 5.21ms | 15.42ms |
| update_1to1 | 10.93ms | 4.62ms | 6.10ms | 15.55ms | 8.81ms | 27.20ms |
| update_2to1 | 5.53ms | 2.34ms | 3.49ms | 7.75ms | 4.33ms | 12.15ms |
| update_4to1 | 2.79ms | 1.41ms | 1.56ms | 4.18ms | 2.21ms | 7.45ms |
| update_1000to1 | 26μs | 21μs | 16μs | 38μs | 22μs | 69μs |
| update_1to2 | 5.46ms | 2.85ms | 3.07ms | 7.91ms | 4.38ms | 12.47ms |
| update_1to4 | 2.58ms | 1.23ms | 1.59ms | 3.86ms | 2.33ms | 6.45ms |
| update_1to1000 | 45μs | 50μs | 370μs | 143μs | 163μs | 163μs |
| cellx1000 | 10.18ms | 7.23ms | 5.59ms | 11.84ms | 9.79ms | 89.95ms |
| cellx2500 | 36.77ms | 19.47ms | 24.01ms | 35.65ms | 26.82ms | 305.73ms |
| cellx5000 | 82.28ms | 43.29ms | 64.29ms | 81.17ms | 71.75ms | 581.08ms |
| 10x5 - 2 sources - read 20.0% (simple) | 507.46ms | 231.11ms | 236.58ms | 355.21ms | 428.51ms | 1.96s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.64ms | 176.69ms | 201.43ms | 246.67ms | 270.06ms | 1.44s |
| 1000x12 - 4 sources - dynamic (large) | 3.95s | 278.94ms | 349.29ms | 466.60ms | 3.66s | 1.88s |
| 1000x5 - 25 sources (wide dense) | 3.32s | 420.73ms | 524.66ms | 596.41ms | 2.51s | 3.42s |
| 5x500 - 3 sources (deep) | 226.38ms | 197.36ms | 202.72ms | 262.75ms | 233.71ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 474.58ms | 269.19ms | 257.85ms | 386.56ms | 456.13ms | 1.63s |

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
