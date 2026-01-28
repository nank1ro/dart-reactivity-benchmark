# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.66s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.28s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 9.97s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 10.91s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.93s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.45s |

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
| avoidablePropagation | 216.68ms | 190.25ms | 172.65ms (fail) | 276.51ms | 207.22ms | 2.39s |
| broadPropagation | 462.50ms | 353.65ms | 6.63ms (fail) | 497.03ms | 452.74ms | 4.38s |
| deepPropagation | 176.88ms | 132.19ms | 137.20ms (fail) | 172.98ms | 178.04ms | 1.48s |
| diamond | 290.71ms | 235.35ms | 213.66ms (fail) | 353.18ms | 285.04ms | 2.38s |
| mux | 391.53ms | 358.03ms | 184.09ms (fail) | 422.53ms | 371.52ms | 1.85s |
| repeatedObservers | 46.14ms | 44.28ms | 52.26ms (fail) | 80.27ms | 40.79ms | 231.08ms |
| triangle | 103.82ms | 85.51ms | 78.01ms (fail) | 115.24ms | 102.57ms | 739.14ms |
| unstable | 77.89ms | 62.31ms | 340.66ms (fail) | 95.81ms | 69.57ms | 348.99ms |
| molBench | 494.54ms | 484.88ms | 1.00ms | 490.94ms | 485.83ms | 590.12ms |
| create_signals | 25.43ms | 27.56ms | 57.21ms | 99.83ms | 4.66ms | 69.55ms |
| comp_0to1 | 11.18ms | 8.27ms | 51.98ms | 35.81ms | 22.23ms | 27.85ms |
| comp_1to1 | 24.41ms | 4.65ms | 53.99ms | 45.50ms | 14.47ms | 39.20ms |
| comp_2to1 | 11.83ms | 2.42ms | 36.26ms | 27.51ms | 16.58ms | 20.51ms |
| comp_4to1 | 5.56ms | 8.58ms | 16.48ms | 17.83ms | 15.56ms | 17.14ms |
| comp_1000to1 | 8μs | 6μs | 45μs | 19μs | 4μs | 20μs |
| comp_1to2 | 16.69ms | 14.02ms | 43.77ms | 36.25ms | 18.09ms | 34.98ms |
| comp_1to4 | 7.09ms | 8.84ms | 43.73ms | 21.12ms | 35.31ms | 31.09ms |
| comp_1to8 | 6.26ms | 5.52ms | 41.46ms | 25.52ms | 8.00ms | 23.39ms |
| comp_1to1000 | 4.14ms | 3.66ms | 37.70ms | 14.67ms | 5.16ms | 15.69ms |
| update_1to1 | 9.35ms | 4.67ms | 6.11ms | 15.47ms | 8.86ms | 22.74ms |
| update_2to1 | 4.82ms | 2.34ms | 3.12ms | 7.75ms | 4.38ms | 11.89ms |
| update_4to1 | 2.35ms | 1.23ms | 1.57ms | 3.84ms | 2.22ms | 6.34ms |
| update_1000to1 | 23μs | 11μs | 16μs | 38μs | 22μs | 69μs |
| update_1to2 | 4.82ms | 2.26ms | 3.12ms | 7.68ms | 4.39ms | 14.26ms |
| update_1to4 | 2.51ms | 1.20ms | 1.60ms | 3.83ms | 2.25ms | 6.98ms |
| update_1to1000 | 44μs | 49μs | 375μs | 155μs | 162μs | 172μs |
| cellx1000 | 9.56ms | 8.68ms | 5.14ms | 14.66ms | 9.64ms | 83.23ms |
| cellx2500 | 31.82ms | 19.68ms | 23.71ms | 35.28ms | 27.18ms | 229.48ms |
| cellx5000 | 71.56ms | 43.43ms | 65.38ms | 75.81ms | 83.24ms | 578.13ms |
| 10x5 - 2 sources - read 20.0% (simple) | 505.89ms | 236.47ms | 239.83ms | 347.44ms | 448.25ms | 1.93s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 277.76ms | 172.91ms | 203.30ms | 246.98ms | 267.60ms | 1.47s |
| 1000x12 - 4 sources - dynamic (large) | 3.55s | 272.71ms | 346.99ms | 466.42ms | 3.62s | 1.77s |
| 1000x5 - 25 sources (wide dense) | 3.36s | 413.80ms | 520.55ms | 593.33ms | 2.48s | 3.43s |
| 5x500 - 3 sources (deep) | 227.29ms | 188.62ms | 202.91ms | 255.96ms | 228.46ms | 1.08s |
| 100x15 - 6 sources - dynamic (very dynamic) | 475.33ms | 261.04ms | 257.99ms | 376.85ms | 444.21ms | 1.64s |

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
