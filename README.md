# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.73s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 9.95s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.26s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.52s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.37s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.43s |

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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 271.09ms | 206.79ms | 2.29s | 189.91ms | 208.10ms | 151.18ms (fail) |
| broadPropagation | 498.29ms | 455.47ms | 4.25s | 351.14ms | 457.18ms | 5.83ms (fail) |
| deepPropagation | 168.99ms | 179.83ms | 1.53s | 124.04ms | 177.77ms | 138.93ms (fail) |
| diamond | 354.86ms | 281.10ms | 2.37s | 235.32ms | 288.30ms | 185.40ms (fail) |
| mux | 437.26ms | 388.67ms | 1.82s | 372.82ms | 410.02ms | 189.45ms (fail) |
| repeatedObservers | 81.58ms | 39.40ms | 234.89ms | 45.61ms | 46.50ms | 53.22ms (fail) |
| triangle | 116.18ms | 98.87ms | 779.24ms | 83.98ms | 100.32ms | 76.52ms (fail) |
| unstable | 94.22ms | 70.20ms | 347.54ms | 61.01ms | 72.29ms | 339.17ms (fail) |
| molBench | 493.54ms | 491.57ms | 577.74ms | 490.50ms | 484.59ms | 1.23ms |
| create_signals | 87.56ms | 4.61ms | 68.99ms | 27.73ms | 24.88ms | 68.58ms |
| comp_0to1 | 33.00ms | 18.37ms | 23.93ms | 7.88ms | 11.50ms | 62.30ms |
| comp_1to1 | 44.68ms | 14.02ms | 23.66ms | 4.16ms | 27.86ms | 54.52ms |
| comp_2to1 | 45.44ms | 15.54ms | 23.06ms | 2.29ms | 9.67ms | 43.11ms |
| comp_4to1 | 15.98ms | 14.15ms | 14.75ms | 7.77ms | 2.20ms | 18.50ms |
| comp_1000to1 | 15μs | 4μs | 16μs | 4μs | 5μs | 41μs |
| comp_1to2 | 30.64ms | 17.77ms | 30.87ms | 10.40ms | 13.41ms | 47.25ms |
| comp_1to4 | 21.64ms | 32.01ms | 23.46ms | 11.67ms | 18.75ms | 46.27ms |
| comp_1to8 | 22.57ms | 8.58ms | 22.82ms | 4.92ms | 8.93ms | 42.23ms |
| comp_1to1000 | 15.37ms | 5.45ms | 14.84ms | 3.50ms | 4.74ms | 37.30ms |
| update_1to1 | 16.15ms | 8.15ms | 22.51ms | 11.22ms | 9.40ms | 5.74ms |
| update_2to1 | 7.93ms | 4.05ms | 10.59ms | 5.14ms | 4.60ms | 2.89ms |
| update_4to1 | 4.03ms | 2.03ms | 5.97ms | 2.78ms | 2.33ms | 1.47ms |
| update_1000to1 | 41μs | 20μs | 61μs | 10μs | 22μs | 15μs |
| update_1to2 | 8.09ms | 4.06ms | 10.55ms | 5.61ms | 4.89ms | 2.95ms |
| update_1to4 | 4.03ms | 2.06ms | 6.17ms | 2.45ms | 2.34ms | 1.48ms |
| update_1to1000 | 154μs | 165μs | 163μs | 49μs | 43μs | 368μs |
| cellx1000 | 11.30ms | 9.50ms | 68.55ms | 7.08ms | 9.58ms | 5.21ms |
| cellx2500 | 30.35ms | 25.35ms | 241.39ms | 19.19ms | 31.31ms | 24.79ms |
| cellx5000 | 65.15ms | 65.10ms | 560.35ms | 41.81ms | 60.86ms | 69.31ms |
| 10x5 - 2 sources - read 20.0% (simple) | 347.49ms | 456.51ms | 2.01s | 275.77ms | 631.63ms | 239.60ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 243.28ms | 274.23ms | 1.57s | 175.91ms | 318.48ms | 204.75ms |
| 1000x12 - 4 sources - dynamic (large) | 466.16ms | 3.49s | 1.92s | 281.27ms | 3.87s | 342.51ms |
| 1000x5 - 25 sources (wide dense) | 587.42ms | 2.59s | 3.56s | 413.61ms | 3.47s | 495.61ms |
| 5x500 - 3 sources (deep) | 259.17ms | 226.33ms | 1.18s | 189.42ms | 230.19ms | 203.74ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 380.54ms | 445.34ms | 1.77s | 263.39ms | 504.22ms | 267.76ms |

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
