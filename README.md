# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.66s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.26s |
| 🥉 | signals | 0.28 | 100.0% | 35/35 | 10.93s |
| 4 | preact_signals | 0.27 | 100.0% | 35/35 | 10.01s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.10s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.42s |

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
| avoidablePropagation | 213.70ms | 186.57ms | 153.13ms (fail) | 286.73ms | 207.34ms | 2.34s |
| broadPropagation | 460.57ms | 353.76ms | 6.49ms (fail) | 503.34ms | 456.49ms | 4.39s |
| deepPropagation | 169.76ms | 129.38ms | 139.34ms (fail) | 171.85ms | 176.18ms | 1.49s |
| diamond | 284.15ms | 234.66ms | 199.53ms (fail) | 354.58ms | 291.12ms | 2.39s |
| mux | 382.14ms | 362.58ms | 183.89ms (fail) | 414.80ms | 370.33ms | 1.88s |
| repeatedObservers | 46.39ms | 43.41ms | 54.04ms (fail) | 80.90ms | 40.34ms | 226.41ms |
| triangle | 101.06ms | 83.14ms | 77.88ms (fail) | 117.73ms | 103.63ms | 760.60ms |
| unstable | 78.24ms | 62.45ms | 336.22ms (fail) | 96.25ms | 73.11ms | 345.17ms |
| molBench | 494.43ms | 486.34ms | 1.10ms | 490.33ms | 485.98ms | 587.55ms |
| create_signals | 25.36ms | 27.13ms | 62.56ms | 99.72ms | 16.53ms | 62.10ms |
| comp_0to1 | 11.74ms | 8.30ms | 59.43ms | 35.62ms | 20.37ms | 15.04ms |
| comp_1to1 | 31.19ms | 4.23ms | 61.42ms | 52.27ms | 6.89ms | 46.55ms |
| comp_2to1 | 13.79ms | 2.36ms | 40.80ms | 36.69ms | 13.20ms | 30.55ms |
| comp_4to1 | 2.31ms | 8.65ms | 16.77ms | 6.95ms | 12.54ms | 13.17ms |
| comp_1000to1 | 4μs | 5μs | 41μs | 16μs | 9μs | 19μs |
| comp_1to2 | 17.33ms | 18.99ms | 43.77ms | 32.60ms | 20.71ms | 35.08ms |
| comp_1to4 | 9.65ms | 11.19ms | 43.40ms | 14.62ms | 33.38ms | 21.65ms |
| comp_1to8 | 6.13ms | 5.29ms | 41.34ms | 19.06ms | 8.81ms | 23.27ms |
| comp_1to1000 | 4.24ms | 3.66ms | 37.91ms | 14.18ms | 6.33ms | 14.42ms |
| update_1to1 | 9.37ms | 4.65ms | 6.11ms | 15.44ms | 8.73ms | 27.81ms |
| update_2to1 | 4.72ms | 2.34ms | 3.08ms | 7.75ms | 4.34ms | 10.68ms |
| update_4to1 | 2.34ms | 1.21ms | 1.60ms | 3.90ms | 2.20ms | 7.07ms |
| update_1000to1 | 23μs | 11μs | 16μs | 38μs | 22μs | 77μs |
| update_1to2 | 4.66ms | 2.32ms | 3.07ms | 7.86ms | 4.36ms | 13.70ms |
| update_1to4 | 2.56ms | 1.20ms | 1.61ms | 3.88ms | 2.22ms | 6.92ms |
| update_1to1000 | 43μs | 61μs | 364μs | 147μs | 60μs | 187μs |
| cellx1000 | 9.55ms | 7.88ms | 5.13ms | 12.72ms | 9.61ms | 70.05ms |
| cellx2500 | 31.12ms | 20.52ms | 22.35ms | 31.76ms | 26.35ms | 245.26ms |
| cellx5000 | 63.80ms | 45.86ms | 61.70ms | 71.02ms | 71.64ms | 557.65ms |
| 10x5 - 2 sources - read 20.0% (simple) | 502.47ms | 234.67ms | 248.38ms | 347.73ms | 430.27ms | 1.91s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 277.39ms | 173.88ms | 197.35ms | 243.20ms | 268.54ms | 1.48s |
| 1000x12 - 4 sources - dynamic (large) | 3.41s | 275.25ms | 340.17ms | 458.83ms | 3.65s | 1.87s |
| 1000x5 - 25 sources (wide dense) | 3.54s | 408.18ms | 511.10ms | 594.90ms | 2.51s | 3.48s |
| 5x500 - 3 sources (deep) | 226.64ms | 191.84ms | 203.55ms | 253.65ms | 233.54ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 481.96ms | 262.60ms | 253.72ms | 378.78ms | 453.88ms | 1.64s |

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
