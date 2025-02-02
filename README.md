# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.69s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 9.64s |
| 🥉 | signals | 0.28 | 100.0% | 35/35 | 11.35s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.49s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.62s |
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
| Test Case | solidart | mobx | state_beacon | signals | alien_signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.21s | 2.31s | 165.85ms (fail) | 211.75ms | 185.24ms | 210.75ms |
| broadPropagation | 5.49s | 4.36s | 6.03ms (fail) | 459.23ms | 350.55ms | 454.44ms |
| deepPropagation | 2.01s | 1.55s | 141.89ms (fail) | 177.66ms | 120.35ms | 173.78ms |
| diamond | 3.49s | 2.40s | 187.58ms (fail) | 283.59ms | 235.88ms | 276.15ms |
| mux | 2.04s | 1.83s | 192.29ms (fail) | 416.72ms | 375.59ms | 386.44ms |
| repeatedObservers | 215.38ms | 233.79ms | 55.55ms (fail) | 44.97ms | 43.63ms | 41.07ms |
| triangle | 1.15s | 773.48ms | 79.37ms (fail) | 102.00ms | 86.02ms | 98.08ms |
| unstable | 342.39ms | 346.14ms | 345.92ms (fail) | 76.44ms | 60.07ms | 69.97ms |
| molBench | 1.75s | 590.25ms | 959μs | 486.08ms | 488.25ms | 483.72ms |
| create_signals | 69.88ms | 57.86ms | 77.12ms | 29.54ms | 20.73ms | 4.70ms |
| comp_0to1 | 28.84ms | 22.59ms | 58.74ms | 12.66ms | 5.08ms | 17.89ms |
| comp_1to1 | 47.97ms | 36.78ms | 53.80ms | 17.84ms | 11.66ms | 14.46ms |
| comp_2to1 | 20.60ms | 20.69ms | 34.14ms | 11.57ms | 6.21ms | 22.53ms |
| comp_4to1 | 17.72ms | 15.84ms | 17.43ms | 2.74ms | 8.62ms | 12.81ms |
| comp_1000to1 | 1.86ms | 21μs | 51μs | 6μs | 4μs | 6μs |
| comp_1to2 | 21.28ms | 36.37ms | 46.93ms | 18.85ms | 14.06ms | 21.87ms |
| comp_1to4 | 31.78ms | 20.27ms | 44.01ms | 10.20ms | 9.17ms | 27.14ms |
| comp_1to8 | 22.10ms | 22.77ms | 44.24ms | 6.84ms | 3.89ms | 5.79ms |
| comp_1to1000 | 19.14ms | 15.12ms | 40.95ms | 4.59ms | 3.70ms | 5.61ms |
| update_1to1 | 43.24ms | 22.93ms | 9.78ms | 9.37ms | 5.87ms | 8.81ms |
| update_2to1 | 21.58ms | 10.61ms | 2.90ms | 4.80ms | 3.89ms | 4.43ms |
| update_4to1 | 10.75ms | 7.17ms | 2.48ms | 2.37ms | 1.30ms | 2.23ms |
| update_1000to1 | 118μs | 68μs | 15μs | 23μs | 11μs | 21μs |
| update_1to2 | 21.68ms | 11.88ms | 3.75ms | 4.73ms | 2.56ms | 4.35ms |
| update_1to4 | 10.94ms | 5.70ms | 1.46ms | 2.34ms | 1.13ms | 2.21ms |
| update_1to1000 | 213μs | 163μs | 417μs | 46μs | 41μs | 61μs |
| cellx1000 | 152.31ms | 71.62ms | 5.43ms | 9.30ms | 7.81ms | 9.43ms |
| cellx2500 | 458.33ms | 247.79ms | 21.82ms | 29.85ms | 21.22ms | 27.46ms |
| cellx5000 | 1.08s | 568.63ms | 69.24ms | 58.07ms | 48.55ms | 75.30ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.65s (partial) | 2.00s | 243.58ms | 503.73ms | 232.76ms | 426.58ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.44s (partial) | 1.53s | 209.25ms | 283.82ms | 176.05ms | 272.01ms |
| 1000x12 - 4 sources - dynamic (large) | 4.07s (partial) | 1.90s | 362.26ms | 3.89s | 284.01ms | 3.31s |
| 1000x5 - 25 sources (wide dense) | 4.91s (partial) | 3.57s | 522.36ms | 3.47s | 403.05ms | 2.50s |
| 5x500 - 3 sources (deep) | 1.99s (partial) | 1.17s | 230.56ms | 231.19ms | 205.30ms | 223.99ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.79s (partial) | 1.73s | 270.43ms | 482.96ms | 264.41ms | 440.62ms |

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
