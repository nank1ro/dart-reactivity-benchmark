# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.39s |
| 🥈 | preact_signals | 0.31 | 100.0% | 35/35 | 8.71s |
| 🥉 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 4.88s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 9.33s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.07s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.10s |

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
| Test Case | preact_signals | state_beacon | signals | alien_signals | mobx | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 192.77ms | 133.10ms (fail) | 203.67ms | 167.35ms | 2.26s | 247.16ms |
| broadPropagation | 381.77ms | 5.46ms (fail) | 423.04ms | 304.79ms | 4.03s | 463.17ms |
| deepPropagation | 176.71ms | 154.71ms (fail) | 173.86ms | 107.38ms | 1.42s | 150.78ms |
| diamond | 256.80ms | 175.00ms (fail) | 263.98ms | 232.87ms | 2.24s | 347.56ms |
| mux | 332.09ms | 160.50ms (fail) | 338.04ms | 329.15ms | 1.79s | 394.07ms |
| repeatedObservers | 34.30ms | 45.67ms (fail) | 39.30ms | 40.32ms | 222.65ms | 72.91ms |
| triangle | 93.83ms | 77.63ms (fail) | 92.04ms | 79.97ms | 739.99ms | 114.66ms |
| unstable | 58.57ms | 320.56ms (fail) | 65.87ms | 58.10ms | 321.98ms | 96.83ms |
| molBench | 364.90ms | 832μs | 390.13ms | 363.39ms | 483.47ms | 370.64ms |
| create_signals | 6.98ms | 67.67ms | 25.36ms | 38.96ms | 48.02ms | 48.10ms |
| comp_0to1 | 19.77ms | 52.76ms | 12.39ms | 12.55ms | 16.28ms | 24.81ms |
| comp_1to1 | 23.11ms | 61.73ms | 34.12ms | 6.65ms | 30.82ms | 44.21ms |
| comp_2to1 | 3.90ms | 44.40ms | 11.56ms | 3.57ms | 37.38ms | 39.90ms |
| comp_4to1 | 37.89ms | 16.72ms | 12.11ms | 13.29ms | 16.59ms | 20.12ms |
| comp_1000to1 | 5μs | 40μs | 6μs | 5μs | 17μs | 16μs |
| comp_1to2 | 18.95ms | 48.81ms | 26.82ms | 15.68ms | 38.07ms | 38.91ms |
| comp_1to4 | 18.77ms | 47.26ms | 15.17ms | 11.40ms | 25.51ms | 23.86ms |
| comp_1to8 | 9.91ms | 44.18ms | 8.98ms | 6.12ms | 26.18ms | 26.15ms |
| comp_1to1000 | 5.86ms | 37.60ms | 5.93ms | 5.31ms | 16.30ms | 15.33ms |
| update_1to1 | 8.08ms | 4.28ms | 10.03ms | 3.83ms | 19.80ms | 14.42ms |
| update_2to1 | 4.31ms | 2.43ms | 5.00ms | 2.08ms | 10.15ms | 7.33ms |
| update_4to1 | 2.12ms | 1.12ms | 2.50ms | 978μs | 5.58ms | 3.66ms |
| update_1000to1 | 34μs | 11μs | 28μs | 9μs | 50μs | 38μs |
| update_1to2 | 4.15ms | 2.27ms | 5.15ms | 2.14ms | 9.99ms | 7.33ms |
| update_1to4 | 2.25ms | 1.18ms | 2.50ms | 964μs | 4.98ms | 3.70ms |
| update_1to1000 | 56μs | 366μs | 62μs | 68μs | 159μs | 157μs |
| cellx1000 | 11.35ms | 9.36ms | 12.31ms | 9.34ms | 90.91ms | 18.08ms |
| cellx2500 | 29.65ms | 33.92ms | 39.36ms | 32.13ms | 266.92ms | 53.94ms |
| cellx5000 | 80.66ms | 73.78ms | 94.70ms | 94.94ms | 580.88ms | 112.65ms |
| 10x5 - 2 sources - read 20.0% (simple) | 397.16ms | 224.75ms | 427.10ms | 226.63ms | 2.03s | 359.81ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 236.78ms | 173.38ms | 239.19ms | 172.36ms | 1.43s | 251.84ms |
| 1000x12 - 4 sources - dynamic (large) | 3.04s | 274.93ms | 3.14s | 252.54ms | 1.65s | 372.68ms |
| 1000x5 - 25 sources (wide dense) | 2.24s | 383.25ms | 2.60s | 367.12ms | 3.37s | 543.31ms |
| 5x500 - 3 sources (deep) | 225.93ms | 199.61ms | 210.35ms | 200.63ms | 1.17s | 281.83ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 388.16ms | 218.26ms | 393.87ms | 225.99ms | 1.66s | 311.32ms |

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
