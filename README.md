# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.76s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.25s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.39s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.51s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.61s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.54s |

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
| Test Case | preact_signals | state_beacon | solidart(2.0-dev) | signals | alien_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 200.83ms | 167.35ms (fail) | 260.74ms | 217.23ms | 201.26ms | 2.37s |
| broadPropagation | 459.38ms | 6.70ms (fail) | 491.77ms | 455.45ms | 357.63ms | 4.43s |
| deepPropagation | 186.47ms | 138.94ms (fail) | 163.71ms | 175.62ms | 128.98ms | 1.53s |
| diamond | 281.74ms | 206.94ms (fail) | 349.64ms | 297.51ms | 240.26ms | 2.47s |
| mux | 386.98ms | 191.49ms (fail) | 432.07ms | 415.70ms | 378.76ms | 1.84s |
| repeatedObservers | 41.18ms | 52.65ms (fail) | 80.68ms | 44.48ms | 43.64ms | 234.03ms |
| triangle | 99.81ms | 86.19ms (fail) | 115.24ms | 104.06ms | 85.62ms | 773.43ms |
| unstable | 75.79ms | 376.00ms (fail) | 94.66ms | 72.71ms | 59.54ms | 348.42ms |
| molBench | 488.76ms | 953μs | 497.78ms | 485.74ms | 489.12ms | 584.04ms |
| create_signals | 5.24ms | 62.13ms | 76.40ms | 25.46ms | 28.15ms | 57.55ms |
| comp_0to1 | 17.41ms | 55.41ms | 26.50ms | 11.50ms | 6.28ms | 19.20ms |
| comp_1to1 | 11.99ms | 57.23ms | 45.64ms | 18.29ms | 4.17ms | 34.00ms |
| comp_2to1 | 20.32ms | 37.96ms | 36.58ms | 17.37ms | 2.32ms | 11.79ms |
| comp_4to1 | 12.10ms | 16.98ms | 12.80ms | 2.13ms | 8.52ms | 30.51ms |
| comp_1000to1 | 4μs | 44μs | 18μs | 5μs | 5μs | 16μs |
| comp_1to2 | 18.25ms | 48.54ms | 26.51ms | 15.83ms | 18.78ms | 37.80ms |
| comp_1to4 | 30.23ms | 46.45ms | 25.09ms | 19.98ms | 11.15ms | 25.19ms |
| comp_1to8 | 6.27ms | 46.00ms | 24.20ms | 9.62ms | 5.11ms | 21.36ms |
| comp_1to1000 | 7.21ms | 41.45ms | 14.14ms | 4.91ms | 3.53ms | 14.86ms |
| update_1to1 | 8.29ms | 6.03ms | 16.39ms | 10.19ms | 10.03ms | 25.88ms |
| update_2to1 | 4.39ms | 3.11ms | 8.78ms | 4.86ms | 2.18ms | 14.31ms |
| update_4to1 | 2.08ms | 1.53ms | 4.09ms | 3.47ms | 2.45ms | 6.28ms |
| update_1000to1 | 20μs | 17μs | 40μs | 25μs | 23μs | 70μs |
| update_1to2 | 4.06ms | 3.03ms | 8.36ms | 4.53ms | 4.99ms | 12.72ms |
| update_1to4 | 2.08ms | 1.55ms | 4.27ms | 2.57ms | 2.34ms | 6.68ms |
| update_1to1000 | 889μs | 409μs | 161μs | 57μs | 45μs | 181μs |
| cellx1000 | 9.82ms | 5.32ms | 11.89ms | 9.83ms | 7.85ms | 72.52ms |
| cellx2500 | 26.36ms | 27.02ms | 34.66ms | 26.67ms | 20.21ms | 254.52ms |
| cellx5000 | 70.36ms | 67.30ms | 76.38ms | 66.61ms | 44.84ms | 532.36ms |
| 10x5 - 2 sources - read 20.0% (simple) | 512.13ms | 254.53ms | 351.39ms | 504.30ms | 241.67ms | 2.04s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 293.42ms | 199.42ms | 253.56ms | 280.75ms | 181.30ms | 1.55s |
| 1000x12 - 4 sources - dynamic (large) | 3.76s | 350.43ms | 465.32ms | 3.96s | 284.07ms | 1.95s |
| 1000x5 - 25 sources (wide dense) | 2.74s | 515.45ms | 602.19ms | 3.43s | 417.35ms | 3.47s |
| 5x500 - 3 sources (deep) | 250.59ms | 208.93ms | 251.19ms | 221.18ms | 192.53ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 476.46ms | 261.50ms | 386.72ms | 472.78ms | 272.27ms | 1.72s |

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
