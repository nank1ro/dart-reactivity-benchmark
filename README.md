# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.90s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 10.52s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.59s |
| 4 | signals | 0.22 | 100.0% | 35/35 | 11.76s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.22s |
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
| Test Case | preact_signals | solidart(2.0-dev) | mobx | alien_signals | state_beacon | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 221.33ms | 272.29ms | 2.28s | 184.91ms | 152.07ms (fail) | 214.62ms |
| broadPropagation | 541.52ms | 500.03ms | 4.17s | 353.54ms | 6.20ms (fail) | 485.62ms |
| deepPropagation | 204.42ms | 167.40ms | 1.50s | 121.44ms | 152.34ms (fail) | 179.63ms |
| diamond | 289.06ms | 367.83ms | 2.23s | 267.08ms | 190.68ms (fail) | 284.63ms |
| mux | 388.96ms | 436.27ms | 1.74s | 364.89ms | 189.19ms (fail) | 383.16ms |
| repeatedObservers | 46.39ms | 88.15ms | 228.46ms | 44.27ms | 54.99ms (fail) | 52.23ms |
| triangle | 105.25ms | 122.71ms | 730.47ms | 90.08ms | 81.39ms (fail) | 105.22ms |
| unstable | 72.89ms | 110.26ms | 340.32ms | 60.56ms | 345.16ms (fail) | 78.42ms |
| molBench | 548.39ms | 568.95ms | 640.62ms | 560.85ms | 999μs | 545.07ms |
| create_signals | 5.84ms | 88.78ms | 80.57ms | 31.10ms | 61.67ms | 31.69ms |
| comp_0to1 | 20.52ms | 28.05ms | 29.08ms | 8.05ms | 53.65ms | 14.50ms |
| comp_1to1 | 15.74ms | 40.56ms | 34.44ms | 4.22ms | 55.61ms | 42.09ms |
| comp_2to1 | 22.09ms | 43.02ms | 39.93ms | 2.28ms | 38.91ms | 35.40ms |
| comp_4to1 | 26.98ms | 15.45ms | 24.26ms | 10.11ms | 17.11ms | 24.68ms |
| comp_1000to1 | 5μs | 15μs | 15μs | 4μs | 40μs | 7μs |
| comp_1to2 | 20.73ms | 30.22ms | 42.42ms | 19.22ms | 44.15ms | 17.95ms |
| comp_1to4 | 12.96ms | 21.77ms | 25.14ms | 10.17ms | 43.16ms | 24.57ms |
| comp_1to8 | 7.60ms | 26.48ms | 25.27ms | 6.74ms | 41.12ms | 12.37ms |
| comp_1to1000 | 3.95ms | 14.48ms | 14.75ms | 3.41ms | 36.32ms | 4.79ms |
| update_1to1 | 9.64ms | 16.74ms | 23.20ms | 4.73ms | 6.01ms | 9.45ms |
| update_2to1 | 4.94ms | 8.34ms | 11.54ms | 2.35ms | 3.05ms | 4.69ms |
| update_4to1 | 2.41ms | 4.24ms | 6.25ms | 1.22ms | 1.54ms | 2.39ms |
| update_1000to1 | 23μs | 54μs | 58μs | 11μs | 15μs | 22μs |
| update_1to2 | 4.76ms | 8.56ms | 11.50ms | 2.45ms | 3.04ms | 4.71ms |
| update_1to4 | 2.42ms | 4.18ms | 5.79ms | 1.20ms | 1.51ms | 2.35ms |
| update_1to1000 | 44μs | 145μs | 157μs | 41μs | 365μs | 50μs |
| cellx1000 | 11.51ms | 14.96ms | 113.41ms | 7.45ms | 6.92ms | 11.85ms |
| cellx2500 | 65.86ms | 73.57ms | 379.94ms | 28.41ms | 33.09ms | 54.13ms |
| cellx5000 | 176.09ms | 190.33ms | 750.39ms | 94.31ms | 102.24ms | 159.84ms |
| 10x5 - 2 sources - read 20.0% (simple) | 425.63ms | 372.41ms | 2.05s | 247.70ms | 253.42ms | 500.46ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 270.18ms | 270.71ms | 1.43s | 192.24ms | 202.04ms | 273.27ms |
| 1000x12 - 4 sources - dynamic (large) | 3.55s | 432.93ms | 1.86s | 275.35ms | 305.71ms | 3.90s |
| 1000x5 - 25 sources (wide dense) | 2.78s | 642.48ms | 3.48s | 459.66ms | 462.41ms | 3.60s |
| 5x500 - 3 sources (deep) | 231.53ms | 268.14ms | 1.19s | 197.44ms | 203.52ms | 230.11ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 437.94ms | 339.81ms | 1.73s | 240.56ms | 241.01ms | 467.42ms |

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
