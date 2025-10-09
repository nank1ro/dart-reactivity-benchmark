# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.30s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.08s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.46s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.62s |
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
| avoidablePropagation | 210.75ms | 193.66ms | 165.85ms (fail) | 278.50ms | 201.99ms | 2.36s |
| broadPropagation | 454.19ms | 356.24ms | 6.73ms (fail) | 492.82ms | 456.77ms | 4.34s |
| deepPropagation | 171.55ms | 125.64ms | 141.17ms (fail) | 165.77ms | 178.45ms | 1.55s |
| diamond | 297.28ms | 237.04ms | 184.89ms (fail) | 359.20ms | 280.58ms | 2.41s |
| mux | 407.72ms | 380.97ms | 193.93ms (fail) | 428.24ms | 392.58ms | 1.88s |
| repeatedObservers | 46.12ms | 43.60ms | 52.66ms (fail) | 82.53ms | 41.17ms | 229.84ms |
| triangle | 100.48ms | 85.25ms | 76.30ms (fail) | 115.47ms | 103.13ms | 790.46ms |
| unstable | 75.93ms | 60.17ms | 340.80ms (fail) | 98.32ms | 75.15ms | 344.81ms |
| molBench | 486.51ms | 489.51ms | 928μs | 500.17ms | 488.31ms | 585.26ms |
| create_signals | 25.17ms | 27.75ms | 66.30ms | 75.71ms | 4.63ms | 51.43ms |
| comp_0to1 | 11.35ms | 7.92ms | 55.91ms | 25.25ms | 17.73ms | 19.70ms |
| comp_1to1 | 24.69ms | 4.19ms | 57.34ms | 47.83ms | 11.17ms | 30.44ms |
| comp_2to1 | 8.94ms | 2.29ms | 40.82ms | 24.86ms | 18.33ms | 12.23ms |
| comp_4to1 | 2.05ms | 8.06ms | 16.93ms | 12.03ms | 12.44ms | 18.91ms |
| comp_1000to1 | 7μs | 3μs | 45μs | 17μs | 6μs | 20μs |
| comp_1to2 | 19.75ms | 17.63ms | 47.67ms | 33.23ms | 16.43ms | 42.12ms |
| comp_1to4 | 9.58ms | 12.63ms | 46.24ms | 14.58ms | 23.55ms | 27.51ms |
| comp_1to8 | 12.44ms | 4.94ms | 45.34ms | 19.59ms | 6.97ms | 22.14ms |
| comp_1to1000 | 7.08ms | 3.56ms | 41.74ms | 14.27ms | 7.06ms | 16.34ms |
| update_1to1 | 10.31ms | 10.00ms | 6.01ms | 16.41ms | 8.34ms | 26.40ms |
| update_2to1 | 4.55ms | 2.35ms | 3.55ms | 8.42ms | 4.38ms | 13.30ms |
| update_4to1 | 2.51ms | 2.58ms | 1.54ms | 4.11ms | 2.09ms | 7.12ms |
| update_1000to1 | 25μs | 26μs | 25μs | 40μs | 20μs | 67μs |
| update_1to2 | 4.50ms | 5.01ms | 3.02ms | 8.37ms | 4.07ms | 13.07ms |
| update_1to4 | 2.53ms | 2.30ms | 1.54ms | 4.11ms | 2.09ms | 6.57ms |
| update_1to1000 | 68μs | 37μs | 409μs | 149μs | 917μs | 175μs |
| cellx1000 | 9.61ms | 7.15ms | 5.10ms | 12.96ms | 10.12ms | 70.76ms |
| cellx2500 | 31.17ms | 20.26ms | 22.59ms | 35.55ms | 28.82ms | 252.84ms |
| cellx5000 | 59.92ms | 45.94ms | 57.66ms | 84.79ms | 72.21ms | 555.84ms |
| 10x5 - 2 sources - read 20.0% (simple) | 521.13ms | 240.69ms | 247.88ms | 378.90ms | 511.77ms | 2.08s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 285.70ms | 183.61ms | 195.86ms | 248.25ms | 291.11ms | 1.57s |
| 1000x12 - 4 sources - dynamic (large) | 3.75s | 276.58ms | 334.90ms | 457.10ms | 3.72s | 1.93s |
| 1000x5 - 25 sources (wide dense) | 3.33s | 409.38ms | 488.90ms | 610.73ms | 2.75s | 3.50s |
| 5x500 - 3 sources (deep) | 222.35ms | 192.48ms | 203.56ms | 256.58ms | 247.14ms | 1.15s |
| 100x15 - 6 sources - dynamic (very dynamic) | 477.18ms | 264.65ms | 259.27ms | 382.11ms | 475.39ms | 1.71s |

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
