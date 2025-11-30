# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.63s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.20s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 10.83s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 9.89s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.19s |
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
| avoidablePropagation | 227.41ms | 189.14ms | 144.65ms (fail) | 277.13ms | 208.31ms | 2.40s |
| broadPropagation | 464.62ms | 349.67ms | 6.13ms (fail) | 495.62ms | 466.83ms | 4.37s |
| deepPropagation | 176.97ms | 124.15ms | 141.16ms (fail) | 171.93ms | 179.03ms | 1.51s |
| diamond | 289.52ms | 231.85ms | 180.20ms (fail) | 347.92ms | 283.81ms | 2.41s |
| mux | 391.15ms | 358.86ms | 182.37ms (fail) | 422.18ms | 371.66ms | 1.86s |
| repeatedObservers | 47.38ms | 43.40ms | 53.59ms (fail) | 82.73ms | 40.15ms | 230.23ms |
| triangle | 104.79ms | 85.09ms | 76.69ms (fail) | 115.97ms | 102.23ms | 744.06ms |
| unstable | 79.59ms | 64.58ms | 336.20ms (fail) | 95.90ms | 70.38ms | 346.21ms |
| molBench | 495.29ms | 485.72ms | 972μs | 489.50ms | 479.61ms | 588.92ms |
| create_signals | 25.83ms | 29.93ms | 62.40ms | 54.45ms | 5.36ms | 52.20ms |
| comp_0to1 | 11.46ms | 7.17ms | 51.44ms | 25.29ms | 17.79ms | 16.32ms |
| comp_1to1 | 24.39ms | 4.24ms | 52.52ms | 38.24ms | 13.05ms | 41.08ms |
| comp_2to1 | 11.70ms | 2.29ms | 35.32ms | 41.26ms | 17.44ms | 35.06ms |
| comp_4to1 | 4.37ms | 8.29ms | 15.78ms | 4.34ms | 8.84ms | 18.82ms |
| comp_1000to1 | 4μs | 4μs | 45μs | 18μs | 6μs | 16μs |
| comp_1to2 | 16.38ms | 15.32ms | 43.54ms | 26.80ms | 13.56ms | 33.42ms |
| comp_1to4 | 10.84ms | 5.39ms | 43.69ms | 31.45ms | 31.45ms | 20.61ms |
| comp_1to8 | 6.12ms | 4.32ms | 41.42ms | 22.73ms | 6.58ms | 23.92ms |
| comp_1to1000 | 4.19ms | 3.42ms | 37.99ms | 14.68ms | 5.65ms | 16.20ms |
| update_1to1 | 9.37ms | 4.63ms | 6.10ms | 15.48ms | 8.85ms | 24.77ms |
| update_2to1 | 4.85ms | 2.35ms | 3.06ms | 7.75ms | 4.30ms | 11.48ms |
| update_4to1 | 2.40ms | 1.21ms | 1.56ms | 3.87ms | 2.23ms | 7.16ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 67μs |
| update_1to2 | 4.80ms | 2.29ms | 3.09ms | 7.89ms | 4.36ms | 13.71ms |
| update_1to4 | 2.55ms | 1.20ms | 1.59ms | 3.87ms | 2.21ms | 6.92ms |
| update_1to1000 | 62μs | 58μs | 366μs | 169μs | 990μs | 180μs |
| cellx1000 | 9.61ms | 8.79ms | 5.55ms | 12.02ms | 9.70ms | 70.37ms |
| cellx2500 | 31.52ms | 20.03ms | 21.54ms | 32.06ms | 25.91ms | 249.13ms |
| cellx5000 | 60.41ms | 41.50ms | 60.33ms | 69.02ms | 66.08ms | 553.72ms |
| 10x5 - 2 sources - read 20.0% (simple) | 501.55ms | 239.35ms | 244.10ms | 345.23ms | 436.03ms | 1.99s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.32ms | 174.99ms | 206.41ms | 243.34ms | 261.24ms | 1.48s |
| 1000x12 - 4 sources - dynamic (large) | 3.57s | 272.13ms | 350.22ms | 465.83ms | 3.60s | 1.93s |
| 1000x5 - 25 sources (wide dense) | 3.26s | 405.33ms | 521.89ms | 597.02ms | 2.47s | 3.41s |
| 5x500 - 3 sources (deep) | 225.52ms | 191.98ms | 203.89ms | 256.70ms | 226.48ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 479.16ms | 253.92ms | 258.26ms | 383.81ms | 447.77ms | 1.63s |

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
