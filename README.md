# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.75s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 10.96s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.27s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.53s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.53s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.47s |

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
| avoidablePropagation | 213.73ms | 277.86ms | 2.30s | 200.24ms | 150.64ms (fail) | 203.83ms |
| broadPropagation | 456.28ms | 497.24ms | 4.41s | 358.30ms | 5.87ms (fail) | 468.51ms |
| deepPropagation | 176.06ms | 165.47ms | 1.59s | 127.08ms | 138.46ms (fail) | 169.21ms |
| diamond | 286.17ms | 345.76ms | 2.35s | 247.66ms | 202.26ms (fail) | 288.03ms |
| mux | 373.09ms | 419.51ms | 1.81s | 367.92ms | 179.74ms (fail) | 399.70ms |
| repeatedObservers | 42.16ms | 80.66ms | 229.77ms | 45.80ms | 58.57ms (fail) | 45.43ms |
| triangle | 100.65ms | 113.27ms | 763.56ms | 88.89ms | 79.04ms (fail) | 100.52ms |
| unstable | 71.94ms | 96.20ms | 347.25ms | 61.80ms | 334.21ms (fail) | 75.52ms |
| molBench | 497.60ms | 490.76ms | 588.23ms | 481.52ms | 1.12ms | 494.40ms |
| create_signals | 5.42ms | 76.65ms | 72.43ms | 28.86ms | 60.29ms | 26.73ms |
| comp_0to1 | 18.13ms | 26.79ms | 27.72ms | 10.03ms | 55.50ms | 12.07ms |
| comp_1to1 | 13.22ms | 38.01ms | 38.67ms | 4.27ms | 56.50ms | 27.63ms |
| comp_2to1 | 9.37ms | 32.40ms | 24.85ms | 2.35ms | 37.59ms | 9.16ms |
| comp_4to1 | 7.63ms | 12.42ms | 16.80ms | 8.56ms | 16.99ms | 1.97ms |
| comp_1000to1 | 4μs | 14μs | 35μs | 4μs | 43μs | 5μs |
| comp_1to2 | 15.94ms | 27.29ms | 33.96ms | 10.97ms | 46.73ms | 16.44ms |
| comp_1to4 | 27.08ms | 22.27ms | 30.76ms | 13.91ms | 45.88ms | 11.45ms |
| comp_1to8 | 7.25ms | 24.21ms | 23.71ms | 4.01ms | 45.02ms | 6.74ms |
| comp_1to1000 | 4.55ms | 15.12ms | 15.24ms | 3.20ms | 40.25ms | 4.13ms |
| update_1to1 | 9.20ms | 15.57ms | 21.41ms | 4.62ms | 9.23ms | 8.93ms |
| update_2to1 | 4.63ms | 7.88ms | 10.41ms | 2.35ms | 2.85ms | 4.47ms |
| update_4to1 | 2.31ms | 3.93ms | 5.21ms | 1.24ms | 1.60ms | 2.25ms |
| update_1000to1 | 23μs | 39μs | 52μs | 11μs | 15μs | 22μs |
| update_1to2 | 4.61ms | 8.00ms | 11.08ms | 2.33ms | 4.20ms | 4.42ms |
| update_1to4 | 2.38ms | 3.92ms | 5.32ms | 1.22ms | 1.47ms | 2.27ms |
| update_1to1000 | 201μs | 164μs | 166μs | 49μs | 384μs | 42μs |
| cellx1000 | 10.38ms | 14.82ms | 105.61ms | 7.34ms | 5.50ms | 9.89ms |
| cellx2500 | 39.48ms | 46.10ms | 281.22ms | 20.51ms | 29.03ms | 34.68ms |
| cellx5000 | 113.33ms | 108.31ms | 678.62ms | 52.32ms | 80.16ms | 78.27ms |
| 10x5 - 2 sources - read 20.0% (simple) | 452.00ms | 342.64ms | 2.04s | 242.53ms | 239.95ms | 497.50ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 277.80ms | 247.78ms | 1.53s | 183.32ms | 199.33ms | 287.75ms |
| 1000x12 - 4 sources - dynamic (large) | 3.78s | 468.57ms | 1.87s | 288.32ms | 355.37ms | 3.72s |
| 1000x5 - 25 sources (wide dense) | 2.83s | 600.54ms | 3.46s | 425.42ms | 521.93ms | 3.25s |
| 5x500 - 3 sources (deep) | 238.21ms | 258.21ms | 1.16s | 193.79ms | 205.79ms | 224.63ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 438.96ms | 384.89ms | 1.69s | 261.48ms | 260.51ms | 476.95ms |

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
