# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.68s |
| 🥈 | signals | 0.28 | 100.0% | 35/35 | 10.81s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.33s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 9.96s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.27s |
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
| avoidablePropagation | 219.33ms | 187.55ms | 162.00ms (fail) | 295.69ms | 202.62ms | 2.39s |
| broadPropagation | 467.61ms | 352.61ms | 6.42ms (fail) | 505.79ms | 448.97ms | 4.41s |
| deepPropagation | 179.85ms | 132.52ms | 139.40ms (fail) | 172.97ms | 175.87ms | 1.49s |
| diamond | 293.81ms | 232.91ms | 192.82ms (fail) | 356.32ms | 283.36ms | 2.38s |
| mux | 396.26ms | 365.28ms | 183.28ms (fail) | 434.24ms | 368.87ms | 1.91s |
| repeatedObservers | 46.90ms | 44.19ms | 52.86ms (fail) | 80.90ms | 40.11ms | 232.47ms |
| triangle | 105.17ms | 85.48ms | 76.76ms (fail) | 114.44ms | 101.49ms | 756.28ms |
| unstable | 78.44ms | 62.69ms | 337.97ms (fail) | 97.02ms | 69.72ms | 345.14ms |
| molBench | 495.18ms | 484.67ms | 972μs | 497.21ms | 480.13ms | 594.29ms |
| create_signals | 26.43ms | 27.47ms | 66.60ms | 100.85ms | 5.38ms | 63.80ms |
| comp_0to1 | 11.45ms | 11.44ms | 60.23ms | 35.73ms | 18.05ms | 16.12ms |
| comp_1to1 | 17.35ms | 8.49ms | 59.56ms | 44.86ms | 15.19ms | 47.29ms |
| comp_2to1 | 17.85ms | 14.21ms | 38.67ms | 36.60ms | 21.87ms | 23.75ms |
| comp_4to1 | 2.58ms | 1.73ms | 16.75ms | 10.78ms | 15.50ms | 17.25ms |
| comp_1000to1 | 5μs | 3μs | 40μs | 16μs | 4μs | 22μs |
| comp_1to2 | 15.72ms | 10.29ms | 44.79ms | 31.73ms | 26.40ms | 37.17ms |
| comp_1to4 | 9.80ms | 7.43ms | 44.20ms | 20.70ms | 23.94ms | 23.39ms |
| comp_1to8 | 6.20ms | 3.65ms | 42.34ms | 22.22ms | 14.79ms | 24.46ms |
| comp_1to1000 | 4.25ms | 3.33ms | 38.52ms | 14.63ms | 7.64ms | 16.22ms |
| update_1to1 | 9.39ms | 4.63ms | 6.11ms | 15.59ms | 8.90ms | 27.07ms |
| update_2to1 | 4.69ms | 2.34ms | 3.46ms | 7.79ms | 4.40ms | 13.10ms |
| update_4to1 | 2.42ms | 1.21ms | 1.55ms | 3.88ms | 2.20ms | 7.06ms |
| update_1000to1 | 23μs | 17μs | 16μs | 48μs | 22μs | 69μs |
| update_1to2 | 4.62ms | 2.29ms | 3.05ms | 7.93ms | 4.34ms | 13.79ms |
| update_1to4 | 2.55ms | 1.21ms | 1.58ms | 3.88ms | 2.22ms | 6.97ms |
| update_1to1000 | 43μs | 48μs | 369μs | 146μs | 739μs | 168μs |
| cellx1000 | 9.82ms | 9.31ms | 5.33ms | 12.24ms | 9.77ms | 72.96ms |
| cellx2500 | 32.10ms | 19.37ms | 22.12ms | 35.34ms | 29.59ms | 273.67ms |
| cellx5000 | 62.85ms | 44.80ms | 65.65ms | 88.81ms | 79.70ms | 568.42ms |
| 10x5 - 2 sources - read 20.0% (simple) | 504.83ms | 235.07ms | 242.36ms | 346.45ms | 433.14ms | 1.94s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.31ms | 174.58ms | 207.18ms | 244.77ms | 264.87ms | 1.46s |
| 1000x12 - 4 sources - dynamic (large) | 3.55s | 280.42ms | 348.87ms | 460.09ms | 3.64s | 1.88s |
| 1000x5 - 25 sources (wide dense) | 3.26s | 415.82ms | 512.16ms | 590.78ms | 2.49s | 3.45s |
| 5x500 - 3 sources (deep) | 226.46ms | 194.96ms | 205.10ms | 262.25ms | 225.02ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 474.65ms | 260.54ms | 259.53ms | 380.20ms | 440.30ms | 1.66s |

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
