# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.71s |
| 🥈 | preact_signals | 0.31 | 100.0% | 35/35 | 9.97s |
| 🥉 | solidart(2.0-dev) | 0.31 | 100.0% | 35/35 | 5.25s |
| 4 | signals | 0.29 | 100.0% | 35/35 | 11.27s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.44s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.50s |

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
| avoidablePropagation | 209.84ms | 187.78ms | 150.01ms (fail) | 278.60ms | 208.33ms | 2.38s |
| broadPropagation | 445.57ms | 349.63ms | 6.89ms (fail) | 502.88ms | 447.80ms | 4.41s |
| deepPropagation | 171.20ms | 131.71ms | 137.80ms (fail) | 169.33ms | 175.41ms | 1.51s |
| diamond | 280.44ms | 231.89ms | 190.84ms (fail) | 354.30ms | 285.36ms | 2.40s |
| mux | 398.26ms | 368.42ms | 181.38ms (fail) | 413.37ms | 371.63ms | 1.87s |
| repeatedObservers | 46.24ms | 43.33ms | 53.02ms (fail) | 80.68ms | 40.47ms | 231.17ms |
| triangle | 107.11ms | 98.26ms | 77.53ms (fail) | 116.46ms | 99.85ms | 756.15ms |
| unstable | 77.08ms | 62.87ms | 338.33ms (fail) | 96.16ms | 69.59ms | 352.92ms |
| molBench | 495.96ms | 485.85ms | 947μs | 490.72ms | 485.39ms | 597.93ms |
| create_signals | 29.96ms | 26.05ms | 60.14ms | 94.36ms | 5.55ms | 67.23ms |
| comp_0to1 | 11.43ms | 7.63ms | 54.59ms | 35.72ms | 18.76ms | 15.98ms |
| comp_1to1 | 27.99ms | 10.59ms | 55.70ms | 50.64ms | 13.10ms | 49.33ms |
| comp_2to1 | 8.96ms | 14.63ms | 37.64ms | 36.36ms | 10.03ms | 35.90ms |
| comp_4to1 | 2.02ms | 2.45ms | 16.98ms | 4.52ms | 8.10ms | 26.00ms |
| comp_1000to1 | 4μs | 4μs | 42μs | 15μs | 4μs | 20μs |
| comp_1to2 | 16.36ms | 18.10ms | 46.42ms | 35.37ms | 15.38ms | 40.14ms |
| comp_1to4 | 12.58ms | 12.14ms | 46.98ms | 20.66ms | 26.69ms | 23.49ms |
| comp_1to8 | 6.46ms | 6.54ms | 43.74ms | 22.34ms | 6.89ms | 27.19ms |
| comp_1to1000 | 4.47ms | 5.69ms | 39.44ms | 15.01ms | 4.77ms | 15.77ms |
| update_1to1 | 9.45ms | 4.65ms | 6.10ms | 15.33ms | 8.83ms | 26.67ms |
| update_2to1 | 4.76ms | 2.33ms | 3.06ms | 7.71ms | 4.43ms | 10.58ms |
| update_4to1 | 2.32ms | 1.21ms | 1.56ms | 3.84ms | 2.23ms | 7.34ms |
| update_1000to1 | 23μs | 11μs | 16μs | 38μs | 22μs | 62μs |
| update_1to2 | 4.65ms | 2.27ms | 3.08ms | 7.79ms | 4.40ms | 12.89ms |
| update_1to4 | 2.51ms | 1.31ms | 1.58ms | 3.83ms | 2.19ms | 6.90ms |
| update_1to1000 | 44μs | 43μs | 406μs | 147μs | 154μs | 178μs |
| cellx1000 | 9.61ms | 9.55ms | 7.30ms | 11.66ms | 9.65ms | 92.36ms |
| cellx2500 | 31.89ms | 19.69ms | 39.41ms | 31.49ms | 25.17ms | 308.07ms |
| cellx5000 | 62.46ms | 42.03ms | 107.17ms | 66.37ms | 65.00ms | 714.43ms |
| 10x5 - 2 sources - read 20.0% (simple) | 499.33ms | 233.79ms | 236.15ms | 345.52ms | 432.35ms | 1.93s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 284.49ms | 177.37ms | 199.66ms | 244.26ms | 268.29ms | 1.46s |
| 1000x12 - 4 sources - dynamic (large) | 3.94s | 279.02ms | 359.51ms | 457.84ms | 3.67s | 1.82s |
| 1000x5 - 25 sources (wide dense) | 3.36s | 408.03ms | 527.51ms | 596.63ms | 2.52s | 3.43s |
| 5x500 - 3 sources (deep) | 225.55ms | 193.13ms | 204.72ms | 262.31ms | 226.29ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 475.42ms | 268.54ms | 260.63ms | 381.96ms | 441.01ms | 1.68s |

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
