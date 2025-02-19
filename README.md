# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.69s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.28s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 9.96s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.45s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.06s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.43s |

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
| Test Case | alien_signals | mobx | solidart | state_beacon | preact_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 186.42ms | 2.28s | 2.18s | 152.94ms (fail) | 203.76ms | 206.24ms |
| broadPropagation | 348.63ms | 4.23s | 5.34s | 6.25ms (fail) | 457.95ms | 454.49ms |
| deepPropagation | 124.67ms | 1.52s | 2.00s | 140.54ms (fail) | 177.04ms | 182.05ms |
| diamond | 233.87ms | 2.37s | 3.39s | 195.26ms (fail) | 278.94ms | 286.31ms |
| mux | 384.77ms | 1.81s | 2.04s | 191.54ms (fail) | 381.65ms | 411.43ms |
| repeatedObservers | 45.46ms | 226.57ms | 208.90ms | 52.50ms (fail) | 38.77ms | 46.41ms |
| triangle | 85.32ms | 777.81ms | 1.13s | 79.19ms (fail) | 101.02ms | 106.97ms |
| unstable | 60.85ms | 345.14ms | 335.96ms | 335.68ms (fail) | 70.66ms | 73.49ms |
| molBench | 491.99ms | 536.15ms | 1.70s | 1.10ms | 491.02ms | 485.74ms |
| create_signals | 26.63ms | 69.03ms | 60.74ms | 58.72ms | 4.54ms | 25.94ms |
| comp_0to1 | 8.13ms | 25.33ms | 27.83ms | 54.67ms | 17.70ms | 11.23ms |
| comp_1to1 | 4.25ms | 37.43ms | 30.74ms | 52.85ms | 10.97ms | 19.24ms |
| comp_2to1 | 2.56ms | 23.95ms | 36.74ms | 35.89ms | 22.13ms | 16.94ms |
| comp_4to1 | 7.99ms | 21.33ms | 7.08ms | 16.01ms | 10.91ms | 1.86ms |
| comp_1000to1 | 4μs | 15μs | 2.35ms | 40μs | 9μs | 5μs |
| comp_1to2 | 16.69ms | 38.21ms | 34.56ms | 44.05ms | 23.18ms | 20.48ms |
| comp_1to4 | 17.10ms | 23.12ms | 21.53ms | 42.81ms | 30.21ms | 17.49ms |
| comp_1to8 | 6.25ms | 23.25ms | 21.79ms | 42.48ms | 8.36ms | 6.98ms |
| comp_1to1000 | 3.83ms | 15.20ms | 17.61ms | 37.41ms | 7.18ms | 4.50ms |
| update_1to1 | 9.44ms | 24.23ms | 41.37ms | 5.73ms | 8.26ms | 9.21ms |
| update_2to1 | 5.02ms | 11.56ms | 20.58ms | 2.87ms | 4.06ms | 4.57ms |
| update_4to1 | 1.62ms | 6.50ms | 10.14ms | 1.46ms | 2.12ms | 2.31ms |
| update_1000to1 | 24μs | 68μs | 114μs | 15μs | 20μs | 23μs |
| update_1to2 | 3.55ms | 11.92ms | 20.57ms | 2.94ms | 4.06ms | 4.89ms |
| update_1to4 | 2.44ms | 5.81ms | 10.22ms | 1.46ms | 2.07ms | 2.29ms |
| update_1to1000 | 66μs | 161μs | 219μs | 370μs | 823μs | 43μs |
| cellx1000 | 8.46ms | 80.27ms | 151.68ms | 5.20ms | 9.71ms | 9.85ms |
| cellx2500 | 21.63ms | 266.63ms | 492.26ms | 25.76ms | 26.94ms | 32.36ms |
| cellx5000 | 49.23ms | 597.67ms | 1.12s | 72.29ms | 71.43ms | 68.92ms |
| 10x5 - 2 sources - read 20.0% (simple) | 229.66ms | 2.04s | 2.58s (partial) | 243.98ms | 436.56ms | 505.97ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 175.79ms | 1.55s | 2.37s (partial) | 207.45ms | 275.73ms | 285.65ms |
| 1000x12 - 4 sources - dynamic (large) | 273.38ms | 2.05s | 4.04s (partial) | 349.88ms | 3.52s | 3.75s |
| 1000x5 - 25 sources (wide dense) | 399.89ms | 3.55s | 4.89s (partial) | 505.72ms | 2.57s | 3.53s |
| 5x500 - 3 sources (deep) | 190.53ms | 1.15s | 1.97s (partial) | 212.55ms | 238.53ms | 225.78ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 264.49ms | 1.74s | 2.75s (partial) | 254.41ms | 448.69ms | 474.21ms |

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
