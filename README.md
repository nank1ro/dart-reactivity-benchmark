# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.29s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 10.98s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.04s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.27s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.49s |

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
| avoidablePropagation | 219.37ms | 190.55ms | 145.42ms (fail) | 274.39ms | 200.22ms | 2.37s |
| broadPropagation | 459.25ms | 355.57ms | 6.48ms (fail) | 505.96ms | 447.46ms | 4.37s |
| deepPropagation | 182.49ms | 144.57ms | 139.06ms (fail) | 167.65ms | 176.47ms | 1.48s |
| diamond | 291.31ms | 240.57ms | 195.67ms (fail) | 355.83ms | 284.78ms | 2.36s |
| mux | 395.07ms | 354.99ms | 185.66ms (fail) | 420.28ms | 379.02ms | 1.88s |
| repeatedObservers | 46.28ms | 43.49ms | 53.00ms (fail) | 80.26ms | 40.88ms | 229.66ms |
| triangle | 104.11ms | 85.63ms | 77.53ms (fail) | 114.04ms | 100.39ms | 745.08ms |
| unstable | 78.10ms | 62.74ms | 342.42ms (fail) | 95.12ms | 71.14ms | 341.97ms |
| molBench | 494.69ms | 485.45ms | 1.50ms | 490.40ms | 480.01ms | 590.09ms |
| create_signals | 27.23ms | 28.05ms | 66.79ms | 61.16ms | 5.56ms | 68.16ms |
| comp_0to1 | 12.04ms | 8.72ms | 60.44ms | 26.20ms | 17.95ms | 15.59ms |
| comp_1to1 | 27.67ms | 4.32ms | 59.57ms | 45.96ms | 14.54ms | 46.13ms |
| comp_2to1 | 9.40ms | 2.29ms | 36.60ms | 38.36ms | 21.76ms | 29.25ms |
| comp_4to1 | 2.08ms | 8.28ms | 16.44ms | 20.68ms | 14.07ms | 28.46ms |
| comp_1000to1 | 4μs | 3μs | 40μs | 15μs | 4μs | 17μs |
| comp_1to2 | 19.85ms | 14.87ms | 44.06ms | 34.40ms | 18.26ms | 38.11ms |
| comp_1to4 | 11.82ms | 8.43ms | 44.05ms | 15.23ms | 26.27ms | 17.85ms |
| comp_1to8 | 9.25ms | 7.29ms | 41.65ms | 21.36ms | 6.59ms | 21.67ms |
| comp_1to1000 | 4.33ms | 3.72ms | 37.66ms | 15.75ms | 5.79ms | 15.49ms |
| update_1to1 | 9.41ms | 4.80ms | 6.10ms | 15.54ms | 8.79ms | 26.75ms |
| update_2to1 | 4.75ms | 2.58ms | 3.06ms | 7.79ms | 4.32ms | 12.01ms |
| update_4to1 | 2.37ms | 1.27ms | 1.56ms | 3.87ms | 2.27ms | 7.02ms |
| update_1000to1 | 23μs | 11μs | 16μs | 38μs | 22μs | 67μs |
| update_1to2 | 4.66ms | 2.31ms | 3.09ms | 7.93ms | 4.38ms | 13.88ms |
| update_1to4 | 2.49ms | 1.62ms | 1.60ms | 3.89ms | 2.20ms | 6.93ms |
| update_1to1000 | 43μs | 56μs | 364μs | 144μs | 903μs | 173μs |
| cellx1000 | 10.05ms | 7.82ms | 6.18ms | 14.32ms | 10.48ms | 85.25ms |
| cellx2500 | 37.56ms | 21.59ms | 33.30ms | 39.15ms | 32.47ms | 291.18ms |
| cellx5000 | 82.72ms | 48.65ms | 81.55ms | 129.65ms | 85.79ms | 673.27ms |
| 10x5 - 2 sources - read 20.0% (simple) | 499.09ms | 237.47ms | 237.65ms | 347.87ms | 443.16ms | 1.92s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.17ms | 174.66ms | 198.04ms | 242.61ms | 266.90ms | 1.48s |
| 1000x12 - 4 sources - dynamic (large) | 3.58s | 278.55ms | 363.27ms | 468.07ms | 3.66s | 1.86s |
| 1000x5 - 25 sources (wide dense) | 3.36s | 405.33ms | 524.23ms | 590.17ms | 2.53s | 3.44s |
| 5x500 - 3 sources (deep) | 227.85ms | 198.96ms | 212.85ms | 257.90ms | 229.27ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 478.44ms | 268.47ms | 259.02ms | 380.51ms | 451.38ms | 1.68s |

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
