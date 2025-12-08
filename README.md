# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.63s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 9.94s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.26s |
| 4 | signals | 0.24 | 100.0% | 35/35 | 11.20s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.97s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.41s |

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
| avoidablePropagation | 212.62ms | 190.24ms | 150.66ms (fail) | 275.83ms | 206.22ms | 2.38s |
| broadPropagation | 466.55ms | 350.43ms | 6.02ms (fail) | 504.24ms | 450.77ms | 4.36s |
| deepPropagation | 182.31ms | 123.79ms | 137.95ms (fail) | 170.97ms | 177.82ms | 1.50s |
| diamond | 292.47ms | 228.45ms | 186.99ms (fail) | 352.31ms | 283.27ms | 2.41s |
| mux | 391.81ms | 355.01ms | 183.21ms (fail) | 425.52ms | 375.05ms | 1.86s |
| repeatedObservers | 46.79ms | 43.27ms | 52.81ms (fail) | 81.48ms | 40.60ms | 237.19ms |
| triangle | 105.50ms | 85.92ms | 77.64ms (fail) | 116.97ms | 101.02ms | 762.33ms |
| unstable | 78.38ms | 62.58ms | 340.93ms (fail) | 95.07ms | 72.67ms | 351.58ms |
| molBench | 495.01ms | 485.46ms | 925μs | 490.33ms | 487.25ms | 590.32ms |
| create_signals | 26.03ms | 28.45ms | 64.06ms | 75.15ms | 5.51ms | 51.07ms |
| comp_0to1 | 11.87ms | 8.31ms | 51.63ms | 28.27ms | 17.92ms | 15.92ms |
| comp_1to1 | 25.97ms | 4.16ms | 60.95ms | 30.69ms | 14.03ms | 42.81ms |
| comp_2to1 | 15.82ms | 2.29ms | 41.90ms | 45.00ms | 19.30ms | 22.98ms |
| comp_4to1 | 8.22ms | 8.42ms | 16.85ms | 13.40ms | 8.62ms | 24.25ms |
| comp_1000to1 | 5μs | 3μs | 39μs | 19μs | 4μs | 21μs |
| comp_1to2 | 17.46ms | 16.11ms | 46.83ms | 27.24ms | 15.47ms | 36.55ms |
| comp_1to4 | 27.05ms | 5.34ms | 42.81ms | 25.35ms | 26.94ms | 21.55ms |
| comp_1to8 | 8.52ms | 4.28ms | 42.88ms | 25.32ms | 6.66ms | 23.62ms |
| comp_1to1000 | 6.31ms | 3.52ms | 37.65ms | 14.70ms | 4.83ms | 16.24ms |
| update_1to1 | 9.37ms | 4.61ms | 6.14ms | 15.50ms | 8.84ms | 26.65ms |
| update_2to1 | 4.76ms | 2.35ms | 3.05ms | 7.72ms | 4.38ms | 13.61ms |
| update_4to1 | 2.35ms | 1.20ms | 1.52ms | 3.85ms | 2.21ms | 7.38ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 68μs |
| update_1to2 | 4.61ms | 2.80ms | 3.07ms | 7.90ms | 4.35ms | 13.87ms |
| update_1to4 | 2.52ms | 1.22ms | 1.56ms | 3.88ms | 2.22ms | 6.92ms |
| update_1to1000 | 43μs | 50μs | 363μs | 156μs | 151μs | 170μs |
| cellx1000 | 10.46ms | 7.24ms | 5.48ms | 11.78ms | 9.66ms | 70.78ms |
| cellx2500 | 27.02ms | 19.12ms | 32.12ms | 35.99ms | 25.48ms | 244.05ms |
| cellx5000 | 68.89ms | 42.75ms | 75.77ms | 83.60ms | 69.28ms | 574.00ms |
| 10x5 - 2 sources - read 20.0% (simple) | 499.30ms | 236.28ms | 239.24ms | 345.07ms | 430.70ms | 1.91s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 277.69ms | 176.39ms | 199.97ms | 243.51ms | 272.38ms | 1.47s |
| 1000x12 - 4 sources - dynamic (large) | 3.82s | 275.60ms | 343.50ms | 468.53ms | 3.65s | 1.84s |
| 1000x5 - 25 sources (wide dense) | 3.35s | 402.03ms | 494.95ms | 595.11ms | 2.47s | 3.36s |
| 5x500 - 3 sources (deep) | 225.20ms | 189.30ms | 206.06ms | 253.04ms | 223.62ms | 1.09s |
| 100x15 - 6 sources - dynamic (very dynamic) | 477.51ms | 261.34ms | 256.01ms | 381.55ms | 448.49ms | 1.65s |

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
