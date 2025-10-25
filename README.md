# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.36s |
| 🥈 | preact_signals | 0.30 | 100.0% | 35/35 | 8.69s |
| 🥉 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 4.88s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 9.45s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.51s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.14s |

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
| avoidablePropagation | 202.64ms | 168.39ms | 140.43ms (fail) | 244.69ms | 196.58ms | 2.31s |
| broadPropagation | 388.39ms | 306.61ms | 5.43ms (fail) | 460.45ms | 420.30ms | 4.17s |
| deepPropagation | 172.20ms | 108.49ms | 157.22ms (fail) | 150.74ms | 178.84ms | 1.48s |
| diamond | 253.76ms | 231.16ms | 181.03ms (fail) | 343.20ms | 250.80ms | 2.37s |
| mux | 348.85ms | 344.49ms | 175.60ms (fail) | 404.20ms | 340.05ms | 1.91s |
| repeatedObservers | 38.45ms | 39.44ms | 46.54ms (fail) | 70.54ms | 34.53ms | 224.41ms |
| triangle | 91.63ms | 79.18ms | 76.92ms (fail) | 111.47ms | 92.62ms | 767.06ms |
| unstable | 64.06ms | 61.80ms | 321.88ms (fail) | 95.99ms | 58.37ms | 328.94ms |
| molBench | 366.85ms | 363.99ms | 897μs | 371.73ms | 364.30ms | 459.47ms |
| create_signals | 24.68ms | 35.27ms | 67.04ms | 78.76ms | 6.68ms | 72.20ms |
| comp_0to1 | 12.91ms | 9.93ms | 52.66ms | 28.41ms | 20.12ms | 19.87ms |
| comp_1to1 | 31.04ms | 6.43ms | 54.42ms | 42.15ms | 15.72ms | 37.42ms |
| comp_2to1 | 20.28ms | 3.70ms | 40.44ms | 40.46ms | 21.82ms | 12.32ms |
| comp_4to1 | 9.71ms | 9.18ms | 18.34ms | 16.96ms | 11.42ms | 14.77ms |
| comp_1000to1 | 10μs | 7μs | 48μs | 17μs | 11μs | 17μs |
| comp_1to2 | 15.67ms | 25.21ms | 45.52ms | 26.94ms | 20.86ms | 42.70ms |
| comp_1to4 | 30.49ms | 6.62ms | 45.03ms | 23.07ms | 26.30ms | 36.45ms |
| comp_1to8 | 8.21ms | 7.15ms | 44.15ms | 25.13ms | 7.53ms | 27.59ms |
| comp_1to1000 | 8.17ms | 4.90ms | 38.84ms | 15.77ms | 5.75ms | 17.34ms |
| update_1to1 | 9.53ms | 4.04ms | 4.92ms | 15.79ms | 9.08ms | 22.42ms |
| update_2to1 | 4.86ms | 2.03ms | 2.88ms | 7.88ms | 4.49ms | 11.27ms |
| update_4to1 | 2.43ms | 1.03ms | 1.29ms | 3.92ms | 2.30ms | 5.90ms |
| update_1000to1 | 24μs | 10μs | 12μs | 39μs | 22μs | 58μs |
| update_1to2 | 4.89ms | 2.14ms | 2.46ms | 7.99ms | 4.74ms | 10.84ms |
| update_1to4 | 2.45ms | 962μs | 1.36ms | 3.95ms | 2.40ms | 5.72ms |
| update_1to1000 | 87μs | 41μs | 385μs | 160μs | 66μs | 212μs |
| cellx1000 | 11.65ms | 8.96ms | 8.61ms | 17.59ms | 10.01ms | 110.20ms |
| cellx2500 | 30.26ms | 27.30ms | 30.64ms | 46.60ms | 25.09ms | 292.46ms |
| cellx5000 | 81.10ms | 57.15ms | 69.95ms | 121.27ms | 67.24ms | 582.84ms |
| 10x5 - 2 sources - read 20.0% (simple) | 425.54ms | 226.29ms | 230.33ms | 360.60ms | 390.43ms | 2.18s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 246.59ms | 172.13ms | 176.43ms | 253.65ms | 235.38ms | 1.60s |
| 1000x12 - 4 sources - dynamic (large) | 3.26s | 252.14ms | 277.19ms | 367.95ms | 3.00s | 1.81s |
| 1000x5 - 25 sources (wide dense) | 2.69s | 361.51ms | 392.58ms | 537.50ms | 2.26s | 3.61s |
| 5x500 - 3 sources (deep) | 211.73ms | 205.79ms | 203.28ms | 271.11ms | 219.46ms | 1.21s |
| 100x15 - 6 sources - dynamic (very dynamic) | 390.17ms | 224.49ms | 220.32ms | 308.90ms | 381.20ms | 1.77s |

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
