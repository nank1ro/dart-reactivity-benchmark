# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.76s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 9.81s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.32s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.53s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 40.31s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.53s |

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
| Test Case | solidart | mobx | state_beacon | signals | alien_signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.25s | 2.36s | 169.87ms (fail) | 207.81ms | 188.32ms | 210.34ms |
| broadPropagation | 5.52s | 4.34s | 6.87ms (fail) | 456.95ms | 344.48ms | 457.44ms |
| deepPropagation | 2.03s | 1.57s | 138.35ms (fail) | 176.00ms | 119.41ms | 173.43ms |
| diamond | 3.50s | 2.45s | 190.46ms (fail) | 287.58ms | 246.37ms | 272.82ms |
| mux | 2.09s | 1.78s | 193.89ms (fail) | 412.55ms | 421.63ms | 385.55ms |
| repeatedObservers | 217.05ms | 232.95ms | 54.01ms (fail) | 45.77ms | 43.66ms | 41.61ms |
| triangle | 1.15s | 774.77ms | 79.40ms (fail) | 102.92ms | 85.23ms | 98.21ms |
| unstable | 346.30ms | 358.19ms | 336.42ms (fail) | 78.41ms | 60.97ms | 69.44ms |
| molBench | 1.75s | 590.52ms | 893μs | 486.28ms | 472.17ms | 483.99ms |
| create_signals | 65.89ms | 72.73ms | 73.46ms | 30.23ms | 21.33ms | 4.68ms |
| comp_0to1 | 38.98ms | 19.93ms | 54.18ms | 15.35ms | 5.03ms | 17.08ms |
| comp_1to1 | 43.64ms | 28.61ms | 53.58ms | 28.14ms | 11.10ms | 14.44ms |
| comp_2to1 | 26.91ms | 17.22ms | 39.41ms | 16.66ms | 15.22ms | 10.68ms |
| comp_4to1 | 14.35ms | 18.41ms | 17.63ms | 5.67ms | 1.75ms | 13.07ms |
| comp_1000to1 | 2.45ms | 21μs | 79μs | 6μs | 3μs | 4μs |
| comp_1to2 | 42.21ms | 44.18ms | 46.69ms | 24.18ms | 10.30ms | 32.55ms |
| comp_1to4 | 31.62ms | 22.59ms | 43.76ms | 13.54ms | 7.30ms | 22.96ms |
| comp_1to8 | 25.20ms | 22.56ms | 44.61ms | 7.22ms | 3.76ms | 14.78ms |
| comp_1to1000 | 20.02ms | 15.83ms | 40.56ms | 4.80ms | 3.33ms | 7.26ms |
| update_1to1 | 43.12ms | 27.88ms | 7.99ms | 9.48ms | 4.36ms | 8.84ms |
| update_2to1 | 21.57ms | 13.92ms | 2.93ms | 4.67ms | 2.19ms | 4.36ms |
| update_4to1 | 10.91ms | 7.10ms | 2.41ms | 2.36ms | 1.93ms | 2.21ms |
| update_1000to1 | 117μs | 79μs | 15μs | 23μs | 19μs | 21μs |
| update_1to2 | 21.78ms | 14.03ms | 3.30ms | 4.73ms | 3.60ms | 4.36ms |
| update_1to4 | 11.03ms | 6.88ms | 1.49ms | 2.36ms | 1.15ms | 2.28ms |
| update_1to1000 | 233μs | 180μs | 412μs | 46μs | 48μs | 42μs |
| cellx1000 | 194.46ms | 82.37ms | 5.63ms | 10.12ms | 7.66ms | 9.88ms |
| cellx2500 | 587.93ms | 272.31ms | 22.20ms | 39.77ms | 22.28ms | 29.05ms |
| cellx5000 | 1.21s | 583.48ms | 76.55ms | 93.55ms | 54.04ms | 83.36ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.69s (partial) | 2.08s | 252.30ms | 510.85ms | 237.62ms | 430.86ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.38s (partial) | 1.55s | 202.85ms | 277.16ms | 183.91ms | 270.30ms |
| 1000x12 - 4 sources - dynamic (large) | 4.12s (partial) | 1.81s | 355.20ms | 3.75s | 293.46ms | 3.42s |
| 1000x5 - 25 sources (wide dense) | 5.00s (partial) | 3.51s | 506.21ms | 3.50s | 417.01ms | 2.53s |
| 5x500 - 3 sources (deep) | 2.08s (partial) | 1.15s | 233.82ms | 229.35ms | 199.76ms | 230.04ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.78s (partial) | 1.70s | 269.96ms | 479.64ms | 267.08ms | 452.66ms |

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
