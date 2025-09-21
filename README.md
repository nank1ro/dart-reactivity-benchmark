# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.36s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.56s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.68s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.53s |
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
| Test Case | preact_signals | state_beacon | solidart(2.0-dev) | signals | alien_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 201.83ms | 155.09ms (fail) | 260.78ms | 215.64ms | 194.51ms | 2.32s |
| broadPropagation | 463.86ms | 6.70ms (fail) | 486.48ms | 462.39ms | 355.39ms | 4.36s |
| deepPropagation | 180.86ms | 140.27ms (fail) | 160.25ms | 172.88ms | 128.59ms | 1.56s |
| diamond | 283.14ms | 188.26ms (fail) | 351.71ms | 287.47ms | 236.36ms | 2.45s |
| mux | 392.46ms | 200.04ms (fail) | 430.63ms | 407.44ms | 379.29ms | 1.82s |
| repeatedObservers | 40.59ms | 52.68ms (fail) | 80.75ms | 46.42ms | 43.56ms | 229.02ms |
| triangle | 100.47ms | 80.51ms (fail) | 114.85ms | 99.80ms | 85.97ms | 768.62ms |
| unstable | 74.91ms | 343.04ms (fail) | 94.48ms | 76.48ms | 61.24ms | 339.35ms |
| molBench | 482.62ms | 989μs | 495.63ms | 486.43ms | 490.70ms | 583.04ms |
| create_signals | 4.74ms | 67.70ms | 58.90ms | 26.03ms | 22.23ms | 61.65ms |
| comp_0to1 | 18.36ms | 59.99ms | 25.23ms | 12.01ms | 7.75ms | 19.42ms |
| comp_1to1 | 13.02ms | 59.38ms | 49.29ms | 32.30ms | 4.29ms | 29.44ms |
| comp_2to1 | 18.14ms | 40.28ms | 37.95ms | 9.14ms | 2.41ms | 8.90ms |
| comp_4to1 | 8.37ms | 17.30ms | 13.77ms | 2.01ms | 8.22ms | 27.35ms |
| comp_1000to1 | 5μs | 46μs | 15μs | 9μs | 3μs | 16μs |
| comp_1to2 | 17.40ms | 48.99ms | 31.05ms | 20.53ms | 11.66ms | 37.29ms |
| comp_1to4 | 32.66ms | 47.51ms | 20.58ms | 12.64ms | 9.43ms | 26.11ms |
| comp_1to8 | 7.90ms | 46.49ms | 28.16ms | 6.72ms | 5.38ms | 25.23ms |
| comp_1to1000 | 6.83ms | 42.52ms | 17.73ms | 4.39ms | 3.55ms | 15.46ms |
| update_1to1 | 8.27ms | 6.06ms | 17.52ms | 10.25ms | 10.22ms | 28.27ms |
| update_2to1 | 4.47ms | 3.14ms | 8.01ms | 4.53ms | 2.14ms | 14.20ms |
| update_4to1 | 2.09ms | 1.57ms | 4.13ms | 2.54ms | 2.49ms | 7.35ms |
| update_1000to1 | 20μs | 15μs | 40μs | 25μs | 10μs | 68μs |
| update_1to2 | 4.09ms | 3.06ms | 8.37ms | 4.49ms | 4.96ms | 13.28ms |
| update_1to4 | 2.09ms | 1.54ms | 4.09ms | 2.56ms | 2.50ms | 7.01ms |
| update_1to1000 | 176μs | 414μs | 149μs | 89μs | 44μs | 175μs |
| cellx1000 | 10.82ms | 7.68ms | 17.00ms | 10.85ms | 7.63ms | 86.71ms |
| cellx2500 | 32.06ms | 34.63ms | 57.25ms | 45.95ms | 23.21ms | 283.81ms |
| cellx5000 | 96.67ms | 85.94ms | 144.01ms | 100.53ms | 62.14ms | 634.68ms |
| 10x5 - 2 sources - read 20.0% (simple) | 513.59ms | 239.55ms | 351.71ms | 515.88ms | 235.85ms | 2.00s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 299.04ms | 197.02ms | 249.52ms | 282.25ms | 180.34ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 3.76s | 375.61ms | 473.20ms | 4.04s | 289.95ms | 1.90s |
| 1000x5 - 25 sources (wide dense) | 2.75s | 519.03ms | 612.88ms | 3.56s | 420.55ms | 3.48s |
| 5x500 - 3 sources (deep) | 248.93ms | 210.03ms | 259.67ms | 226.11ms | 191.80ms | 1.15s |
| 100x15 - 6 sources - dynamic (very dynamic) | 473.44ms | 263.25ms | 393.98ms | 488.49ms | 269.34ms | 1.72s |

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
