# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.74s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.31s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.47s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.37s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.71s |
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
| Test Case | mobx | state_beacon | preact_signals | alien_signals | solidart(2.0-dev) | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.35s | 147.38ms (fail) | 201.63ms | 197.63ms | 261.88ms | 211.56ms |
| broadPropagation | 4.43s | 6.32ms (fail) | 457.29ms | 354.29ms | 485.42ms | 454.39ms |
| deepPropagation | 1.55s | 144.37ms (fail) | 175.52ms | 131.25ms | 162.43ms | 175.63ms |
| diamond | 2.44s | 185.02ms (fail) | 280.53ms | 235.26ms | 348.22ms | 283.91ms |
| mux | 1.80s | 195.13ms (fail) | 390.85ms | 375.58ms | 435.68ms | 410.74ms |
| repeatedObservers | 234.34ms | 52.61ms (fail) | 40.34ms | 43.66ms | 80.76ms | 46.33ms |
| triangle | 768.41ms | 75.71ms (fail) | 98.59ms | 85.30ms | 113.98ms | 101.91ms |
| unstable | 344.46ms | 339.86ms (fail) | 73.75ms | 60.08ms | 94.39ms | 75.27ms |
| molBench | 582.92ms | 1.21ms | 485.25ms | 489.54ms | 500.49ms | 489.55ms |
| create_signals | 66.16ms | 64.44ms | 5.23ms | 25.43ms | 76.17ms | 26.43ms |
| comp_0to1 | 15.78ms | 58.70ms | 17.32ms | 8.56ms | 30.07ms | 11.79ms |
| comp_1to1 | 47.17ms | 59.34ms | 15.05ms | 4.25ms | 39.60ms | 27.83ms |
| comp_2to1 | 31.20ms | 38.95ms | 16.52ms | 2.33ms | 24.52ms | 9.28ms |
| comp_4to1 | 17.45ms | 17.47ms | 14.41ms | 8.74ms | 12.36ms | 1.97ms |
| comp_1000to1 | 19μs | 48μs | 4μs | 5μs | 18μs | 5μs |
| comp_1to2 | 35.97ms | 50.10ms | 18.56ms | 14.18ms | 31.35ms | 22.88ms |
| comp_1to4 | 23.07ms | 48.15ms | 35.40ms | 6.11ms | 21.81ms | 9.46ms |
| comp_1to8 | 24.17ms | 48.07ms | 8.55ms | 6.95ms | 25.79ms | 13.02ms |
| comp_1to1000 | 15.44ms | 42.51ms | 6.29ms | 3.49ms | 14.32ms | 6.52ms |
| update_1to1 | 26.03ms | 6.01ms | 8.28ms | 10.12ms | 16.37ms | 10.25ms |
| update_2to1 | 12.37ms | 3.11ms | 4.46ms | 2.71ms | 8.05ms | 4.55ms |
| update_4to1 | 7.09ms | 1.55ms | 2.13ms | 2.50ms | 4.14ms | 2.65ms |
| update_1000to1 | 69μs | 15μs | 20μs | 14μs | 40μs | 25μs |
| update_1to2 | 13.87ms | 3.03ms | 4.07ms | 5.17ms | 8.32ms | 4.48ms |
| update_1to4 | 6.88ms | 1.55ms | 2.14ms | 2.35ms | 4.13ms | 2.54ms |
| update_1to1000 | 172μs | 424μs | 165μs | 48μs | 149μs | 44μs |
| cellx1000 | 78.44ms | 5.55ms | 10.45ms | 7.28ms | 12.61ms | 9.95ms |
| cellx2500 | 272.04ms | 27.52ms | 27.94ms | 19.50ms | 38.28ms | 34.56ms |
| cellx5000 | 596.45ms | 73.69ms | 85.60ms | 45.75ms | 102.29ms | 71.27ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.05s | 252.06ms | 510.14ms | 240.75ms | 369.44ms | 511.35ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.55s | 203.04ms | 292.74ms | 181.28ms | 252.71ms | 280.14ms |
| 1000x12 - 4 sources - dynamic (large) | 1.88s | 350.91ms | 3.72s | 284.85ms | 469.70ms | 3.78s |
| 1000x5 - 25 sources (wide dense) | 3.49s | 512.61ms | 2.74s | 419.44ms | 621.85ms | 3.59s |
| 5x500 - 3 sources (deep) | 1.21s | 203.46ms | 247.66ms | 197.08ms | 257.59ms | 218.67ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.74s | 260.97ms | 473.03ms | 264.84ms | 385.56ms | 479.51ms |

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
