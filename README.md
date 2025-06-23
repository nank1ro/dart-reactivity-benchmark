# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.65s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.31s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.23s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.50s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.91s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.36s |

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
| Test Case | solidart(2.0-dev) | signals | mobx | preact_signals | state_beacon | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 284.64ms | 208.16ms | 2.37s | 202.24ms | 147.60ms (fail) | 183.19ms |
| broadPropagation | 513.36ms | 450.96ms | 4.40s | 451.04ms | 5.94ms (fail) | 340.97ms |
| deepPropagation | 172.53ms | 164.64ms | 1.56s | 176.64ms | 144.60ms (fail) | 125.53ms |
| diamond | 356.37ms | 291.24ms | 2.44s | 280.45ms | 182.05ms (fail) | 231.59ms |
| mux | 447.38ms | 406.85ms | 1.82s | 401.15ms | 191.06ms (fail) | 370.12ms |
| repeatedObservers | 81.86ms | 45.09ms | 237.21ms | 39.92ms | 52.73ms (fail) | 45.50ms |
| triangle | 121.89ms | 103.59ms | 779.00ms | 100.66ms | 75.52ms (fail) | 85.41ms |
| unstable | 97.56ms | 79.04ms | 354.70ms | 70.62ms | 347.25ms (fail) | 66.92ms |
| molBench | 494.57ms | 485.98ms | 585.08ms | 489.09ms | 938μs | 485.88ms |
| create_signals | 54.33ms | 25.00ms | 87.50ms | 5.19ms | 59.48ms | 27.16ms |
| comp_0to1 | 27.67ms | 11.97ms | 24.42ms | 17.06ms | 53.19ms | 7.22ms |
| comp_1to1 | 38.35ms | 28.36ms | 37.59ms | 12.05ms | 55.75ms | 4.33ms |
| comp_2to1 | 27.04ms | 17.10ms | 35.07ms | 22.59ms | 36.18ms | 2.29ms |
| comp_4to1 | 13.63ms | 7.08ms | 13.80ms | 14.06ms | 16.03ms | 7.51ms |
| comp_1000to1 | 18μs | 6μs | 17μs | 4μs | 43μs | 4μs |
| comp_1to2 | 35.49ms | 21.60ms | 39.32ms | 17.82ms | 45.28ms | 10.10ms |
| comp_1to4 | 17.20ms | 13.48ms | 19.87ms | 32.20ms | 44.09ms | 11.49ms |
| comp_1to8 | 22.38ms | 6.67ms | 24.27ms | 6.93ms | 42.85ms | 4.89ms |
| comp_1to1000 | 17.17ms | 4.22ms | 15.94ms | 4.74ms | 39.15ms | 3.47ms |
| update_1to1 | 16.34ms | 8.91ms | 27.19ms | 8.62ms | 5.87ms | 10.41ms |
| update_2to1 | 8.08ms | 4.46ms | 13.57ms | 4.25ms | 3.18ms | 2.26ms |
| update_4to1 | 4.07ms | 2.23ms | 6.63ms | 2.17ms | 1.44ms | 2.50ms |
| update_1000to1 | 40μs | 22μs | 73μs | 21μs | 15μs | 27μs |
| update_1to2 | 8.24ms | 4.50ms | 12.82ms | 4.62ms | 2.93ms | 5.07ms |
| update_1to4 | 4.15ms | 2.21ms | 6.87ms | 2.14ms | 1.46ms | 1.97ms |
| update_1to1000 | 170μs | 42μs | 169μs | 195μs | 380μs | 41μs |
| cellx1000 | 16.07ms | 9.54ms | 72.51ms | 9.61ms | 5.15ms | 6.94ms |
| cellx2500 | 39.30ms | 32.23ms | 258.37ms | 28.79ms | 23.43ms | 18.71ms |
| cellx5000 | 101.10ms | 66.48ms | 580.06ms | 68.68ms | 53.12ms | 40.40ms |
| 10x5 - 2 sources - read 20.0% (simple) | 361.85ms | 530.26ms | 2.04s | 434.13ms | 239.40ms | 229.78ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 249.31ms | 286.92ms | 1.59s | 270.21ms | 198.64ms | 174.41ms |
| 1000x12 - 4 sources - dynamic (large) | 454.69ms | 3.88s | 1.95s | 3.67s | 337.14ms | 278.49ms |
| 1000x5 - 25 sources (wide dense) | 587.68ms | 3.60s | 3.58s | 2.70s | 489.13ms | 409.12ms |
| 5x500 - 3 sources (deep) | 251.61ms | 224.03ms | 1.18s | 229.86ms | 202.96ms | 187.71ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 379.94ms | 481.21ms | 1.75s | 445.66ms | 257.71ms | 265.55ms |

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
