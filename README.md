# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.29s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 9.94s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.35s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.50s |
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
| Test Case | solidart(2.0-dev) | preact_signals | alien_signals | state_beacon | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 271.15ms | 196.35ms | 188.55ms | 155.90ms (fail) | 2.34s | 206.73ms |
| broadPropagation | 511.42ms | 451.56ms | 358.43ms | 6.22ms (fail) | 4.29s | 458.03ms |
| deepPropagation | 170.06ms | 175.98ms | 126.29ms | 139.11ms (fail) | 1.53s | 178.84ms |
| diamond | 352.90ms | 277.31ms | 241.41ms | 188.77ms (fail) | 2.44s | 288.97ms |
| mux | 461.72ms | 380.49ms | 372.72ms | 193.64ms (fail) | 1.82s | 407.17ms |
| repeatedObservers | 77.82ms | 37.94ms | 45.95ms | 53.64ms (fail) | 230.57ms | 45.71ms |
| triangle | 117.34ms | 98.77ms | 88.50ms | 76.33ms (fail) | 772.55ms | 104.00ms |
| unstable | 95.73ms | 70.58ms | 63.19ms | 344.87ms (fail) | 356.14ms | 76.05ms |
| molBench | 493.69ms | 491.79ms | 492.35ms | 919μs | 579.09ms | 485.76ms |
| create_signals | 97.13ms | 5.25ms | 17.92ms | 59.44ms | 72.42ms | 25.52ms |
| comp_0to1 | 35.19ms | 17.33ms | 8.21ms | 52.29ms | 23.86ms | 11.45ms |
| comp_1to1 | 38.81ms | 11.63ms | 4.17ms | 53.21ms | 17.24ms | 28.75ms |
| comp_2to1 | 35.48ms | 16.71ms | 2.25ms | 35.68ms | 19.32ms | 14.33ms |
| comp_4to1 | 4.62ms | 8.84ms | 7.75ms | 16.05ms | 14.20ms | 7.60ms |
| comp_1000to1 | 14μs | 6μs | 6μs | 43μs | 17μs | 5μs |
| comp_1to2 | 26.27ms | 25.96ms | 15.95ms | 44.77ms | 34.78ms | 16.39ms |
| comp_1to4 | 26.01ms | 24.68ms | 11.88ms | 44.05ms | 29.02ms | 19.10ms |
| comp_1to8 | 24.16ms | 5.75ms | 5.90ms | 43.29ms | 21.55ms | 6.57ms |
| comp_1to1000 | 15.67ms | 6.42ms | 3.56ms | 39.05ms | 15.02ms | 4.60ms |
| update_1to1 | 16.14ms | 8.24ms | 11.21ms | 5.72ms | 26.41ms | 9.32ms |
| update_2to1 | 7.96ms | 4.06ms | 5.09ms | 2.86ms | 12.68ms | 4.63ms |
| update_4to1 | 4.04ms | 2.10ms | 2.79ms | 1.46ms | 6.58ms | 2.37ms |
| update_1000to1 | 40μs | 20μs | 24μs | 15μs | 65μs | 26μs |
| update_1to2 | 8.04ms | 4.08ms | 5.67ms | 2.94ms | 13.49ms | 4.93ms |
| update_1to4 | 4.05ms | 2.05ms | 2.54ms | 1.46ms | 6.52ms | 2.33ms |
| update_1to1000 | 150μs | 907μs | 49μs | 396μs | 176μs | 45μs |
| cellx1000 | 11.52ms | 9.68ms | 7.40ms | 5.10ms | 74.71ms | 9.74ms |
| cellx2500 | 30.83ms | 25.63ms | 19.56ms | 24.66ms | 221.35ms | 32.28ms |
| cellx5000 | 65.05ms | 67.91ms | 42.40ms | 65.58ms | 546.26ms | 80.42ms |
| 10x5 - 2 sources - read 20.0% (simple) | 346.77ms | 443.49ms | 231.83ms | 237.75ms | 2.04s | 503.94ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 244.63ms | 273.52ms | 180.25ms | 199.98ms | 1.56s | 276.86ms |
| 1000x12 - 4 sources - dynamic (large) | 458.81ms | 3.52s | 281.35ms | 332.40ms | 1.81s | 3.74s |
| 1000x5 - 25 sources (wide dense) | 596.13ms | 2.59s | 409.11ms | 506.50ms | 3.65s | 3.58s |
| 5x500 - 3 sources (deep) | 254.39ms | 231.55ms | 189.48ms | 205.05ms | 1.18s | 229.77ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 385.23ms | 446.69ms | 265.98ms | 267.26ms | 1.75s | 481.24ms |

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
