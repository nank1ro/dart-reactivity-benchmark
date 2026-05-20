# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.36s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 8.72s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 9.30s |
| 4 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 4.92s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.32s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.08s |

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
| avoidablePropagation | 193.59ms | 246.66ms | 2.28s | 168.02ms | 132.29ms (fail) | 202.54ms |
| broadPropagation | 381.10ms | 462.95ms | 4.07s | 306.81ms | 5.57ms (fail) | 424.44ms |
| deepPropagation | 178.62ms | 151.54ms | 1.42s | 107.36ms | 153.73ms (fail) | 173.64ms |
| diamond | 258.31ms | 351.56ms | 2.25s | 234.83ms | 174.93ms (fail) | 261.70ms |
| mux | 330.33ms | 388.65ms | 1.85s | 327.35ms | 160.52ms (fail) | 339.73ms |
| repeatedObservers | 34.10ms | 72.98ms | 224.26ms | 40.64ms | 45.60ms (fail) | 39.17ms |
| triangle | 94.03ms | 114.00ms | 747.33ms | 79.95ms | 73.94ms (fail) | 91.43ms |
| unstable | 58.49ms | 96.70ms | 322.30ms | 58.30ms | 316.63ms (fail) | 66.00ms |
| molBench | 365.06ms | 370.80ms | 483.09ms | 362.99ms | 860μs | 390.06ms |
| create_signals | 7.23ms | 73.87ms | 75.36ms | 36.08ms | 67.30ms | 24.86ms |
| comp_0to1 | 20.80ms | 41.77ms | 34.51ms | 14.54ms | 56.13ms | 12.29ms |
| comp_1to1 | 24.15ms | 58.59ms | 25.92ms | 6.29ms | 58.05ms | 35.44ms |
| comp_2to1 | 19.63ms | 23.57ms | 29.97ms | 3.76ms | 42.01ms | 13.40ms |
| comp_4to1 | 12.53ms | 9.34ms | 30.51ms | 13.02ms | 16.36ms | 9.26ms |
| comp_1000to1 | 6μs | 108μs | 20μs | 6μs | 41μs | 6μs |
| comp_1to2 | 33.12ms | 38.85ms | 42.62ms | 19.49ms | 45.72ms | 23.68ms |
| comp_1to4 | 31.67ms | 17.96ms | 24.90ms | 11.92ms | 47.05ms | 22.89ms |
| comp_1to8 | 8.62ms | 26.11ms | 28.09ms | 6.35ms | 43.27ms | 8.85ms |
| comp_1to1000 | 8.40ms | 15.94ms | 16.43ms | 5.26ms | 37.79ms | 5.70ms |
| update_1to1 | 8.20ms | 14.70ms | 20.32ms | 3.85ms | 4.46ms | 9.49ms |
| update_2to1 | 4.01ms | 7.25ms | 9.85ms | 1.84ms | 2.39ms | 5.02ms |
| update_4to1 | 1.84ms | 3.62ms | 5.61ms | 1.04ms | 1.33ms | 2.42ms |
| update_1000to1 | 22μs | 37μs | 48μs | 9μs | 12μs | 24μs |
| update_1to2 | 3.83ms | 7.20ms | 9.90ms | 2.02ms | 2.21ms | 4.95ms |
| update_1to4 | 2.19ms | 3.65ms | 5.42ms | 1.03ms | 1.17ms | 2.10ms |
| update_1to1000 | 513μs | 159μs | 173μs | 45μs | 365μs | 74μs |
| cellx1000 | 11.49ms | 18.82ms | 100.12ms | 8.75ms | 9.85ms | 12.24ms |
| cellx2500 | 32.95ms | 57.11ms | 309.53ms | 28.45ms | 31.12ms | 40.10ms |
| cellx5000 | 93.29ms | 143.13ms | 630.42ms | 74.98ms | 74.41ms | 87.39ms |
| 10x5 - 2 sources - read 20.0% (simple) | 398.92ms | 362.19ms | 2.01s | 229.94ms | 224.06ms | 418.73ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 233.82ms | 251.22ms | 1.47s | 172.73ms | 172.20ms | 240.39ms |
| 1000x12 - 4 sources - dynamic (large) | 3.02s | 367.01ms | 1.62s | 250.93ms | 275.01ms | 3.17s |
| 1000x5 - 25 sources (wide dense) | 2.24s | 546.95ms | 3.38s | 356.76ms | 382.30ms | 2.56s |
| 5x500 - 3 sources (deep) | 223.32ms | 273.10ms | 1.15s | 196.86ms | 200.83ms | 213.21ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 386.43ms | 306.52ms | 1.65s | 226.24ms | 217.75ms | 396.24ms |

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
