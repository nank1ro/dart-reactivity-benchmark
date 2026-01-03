# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.66s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.17s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 9.96s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 10.89s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.11s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.35s |

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
| avoidablePropagation | 211.56ms | 189.83ms | 145.05ms (fail) | 277.19ms | 207.46ms | 2.37s |
| broadPropagation | 451.96ms | 351.76ms | 5.95ms (fail) | 499.47ms | 449.29ms | 4.36s |
| deepPropagation | 175.85ms | 127.35ms | 138.64ms (fail) | 170.25ms | 178.66ms | 1.50s |
| diamond | 284.11ms | 232.10ms | 182.23ms (fail) | 353.76ms | 282.66ms | 2.40s |
| mux | 390.26ms | 356.81ms | 177.51ms (fail) | 417.33ms | 365.81ms | 1.88s |
| repeatedObservers | 46.08ms | 44.22ms | 52.52ms (fail) | 80.44ms | 40.45ms | 237.82ms |
| triangle | 118.42ms | 82.27ms | 77.92ms (fail) | 116.19ms | 120.70ms | 744.10ms |
| unstable | 77.73ms | 62.26ms | 335.65ms (fail) | 96.23ms | 70.32ms | 344.74ms |
| molBench | 495.12ms | 486.28ms | 1.29ms | 490.42ms | 478.62ms | 590.12ms |
| create_signals | 26.10ms | 32.00ms | 57.23ms | 54.22ms | 5.36ms | 61.38ms |
| comp_0to1 | 12.17ms | 7.01ms | 51.95ms | 24.89ms | 17.80ms | 15.53ms |
| comp_1to1 | 18.34ms | 4.34ms | 52.75ms | 30.94ms | 10.86ms | 52.32ms |
| comp_2to1 | 16.73ms | 2.31ms | 35.27ms | 41.48ms | 11.74ms | 22.78ms |
| comp_4to1 | 2.28ms | 7.62ms | 16.09ms | 11.59ms | 14.64ms | 32.23ms |
| comp_1000to1 | 14μs | 3μs | 40μs | 15μs | 4μs | 15μs |
| comp_1to2 | 20.79ms | 15.09ms | 44.57ms | 47.74ms | 18.72ms | 41.80ms |
| comp_1to4 | 10.41ms | 11.41ms | 44.25ms | 20.06ms | 27.63ms | 21.00ms |
| comp_1to8 | 6.14ms | 5.15ms | 41.82ms | 19.90ms | 6.15ms | 23.40ms |
| comp_1to1000 | 4.23ms | 4.50ms | 38.47ms | 14.61ms | 6.20ms | 16.79ms |
| update_1to1 | 9.25ms | 4.68ms | 6.12ms | 17.68ms | 8.82ms | 27.73ms |
| update_2to1 | 4.91ms | 2.31ms | 3.44ms | 7.75ms | 4.52ms | 13.39ms |
| update_4to1 | 2.33ms | 1.21ms | 1.58ms | 3.87ms | 2.20ms | 7.15ms |
| update_1000to1 | 23μs | 11μs | 16μs | 38μs | 22μs | 70μs |
| update_1to2 | 4.63ms | 2.35ms | 3.05ms | 7.92ms | 4.39ms | 12.88ms |
| update_1to4 | 2.52ms | 2.51ms | 1.60ms | 3.87ms | 2.22ms | 6.92ms |
| update_1to1000 | 72μs | 48μs | 381μs | 159μs | 809μs | 161μs |
| cellx1000 | 9.65ms | 7.45ms | 5.13ms | 12.30ms | 9.71ms | 69.69ms |
| cellx2500 | 31.74ms | 19.81ms | 23.57ms | 33.15ms | 25.87ms | 244.76ms |
| cellx5000 | 63.34ms | 41.64ms | 63.96ms | 68.75ms | 67.16ms | 539.36ms |
| 10x5 - 2 sources - read 20.0% (simple) | 500.21ms | 237.63ms | 237.50ms | 349.26ms | 430.22ms | 1.92s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.13ms | 173.75ms | 197.22ms | 240.76ms | 271.31ms | 1.46s |
| 1000x12 - 4 sources - dynamic (large) | 3.65s | 274.19ms | 341.43ms | 455.84ms | 3.65s | 1.87s |
| 1000x5 - 25 sources (wide dense) | 3.26s | 406.88ms | 498.60ms | 575.95ms | 2.50s | 3.45s |
| 5x500 - 3 sources (deep) | 226.97ms | 189.79ms | 203.74ms | 254.91ms | 227.38ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 484.33ms | 270.21ms | 261.05ms | 368.10ms | 440.04ms | 1.68s |

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
