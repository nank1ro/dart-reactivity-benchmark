# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.80s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.41s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.09s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.36s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.13s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.54s |

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
| avoidablePropagation | 271.40ms | 200.05ms | 188.76ms | 155.90ms (fail) | 2.30s | 211.57ms |
| broadPropagation | 508.77ms | 458.24ms | 365.55ms | 6.62ms (fail) | 4.31s | 461.52ms |
| deepPropagation | 168.76ms | 181.45ms | 124.01ms | 142.25ms (fail) | 1.56s | 172.30ms |
| diamond | 351.58ms | 280.98ms | 237.67ms | 202.00ms (fail) | 2.37s | 295.95ms |
| mux | 458.61ms | 388.82ms | 387.15ms | 195.41ms (fail) | 1.86s | 419.37ms |
| repeatedObservers | 78.76ms | 38.59ms | 45.56ms | 52.99ms (fail) | 231.09ms | 46.16ms |
| triangle | 116.24ms | 99.62ms | 86.83ms | 78.89ms (fail) | 795.43ms | 105.09ms |
| unstable | 96.17ms | 69.88ms | 61.94ms | 349.74ms (fail) | 354.97ms | 71.25ms |
| molBench | 498.28ms | 498.15ms | 497.87ms | 1.06ms | 587.49ms | 496.29ms |
| create_signals | 65.22ms | 5.57ms | 29.03ms | 70.28ms | 82.30ms | 30.70ms |
| comp_0to1 | 29.77ms | 20.01ms | 8.99ms | 61.46ms | 29.70ms | 14.63ms |
| comp_1to1 | 33.91ms | 11.23ms | 4.59ms | 55.53ms | 53.01ms | 38.95ms |
| comp_2to1 | 43.19ms | 12.56ms | 2.65ms | 39.82ms | 44.26ms | 13.49ms |
| comp_4to1 | 6.59ms | 31.15ms | 15.53ms | 17.78ms | 28.06ms | 2.39ms |
| comp_1000to1 | 16μs | 5μs | 5μs | 51μs | 20μs | 5μs |
| comp_1to2 | 46.53ms | 26.24ms | 12.63ms | 45.88ms | 45.71ms | 24.37ms |
| comp_1to4 | 24.18ms | 28.97ms | 16.77ms | 46.00ms | 28.38ms | 14.76ms |
| comp_1to8 | 24.14ms | 6.20ms | 5.67ms | 44.65ms | 28.00ms | 12.07ms |
| comp_1to1000 | 15.92ms | 7.00ms | 4.93ms | 38.07ms | 16.59ms | 6.56ms |
| update_1to1 | 16.12ms | 8.22ms | 6.87ms | 5.75ms | 22.37ms | 9.62ms |
| update_2to1 | 7.95ms | 4.12ms | 2.57ms | 3.96ms | 12.13ms | 5.43ms |
| update_4to1 | 4.07ms | 2.46ms | 2.67ms | 1.56ms | 6.33ms | 2.73ms |
| update_1000to1 | 40μs | 20μs | 12μs | 17μs | 59μs | 24μs |
| update_1to2 | 8.14ms | 4.11ms | 3.96ms | 3.13ms | 10.58ms | 4.95ms |
| update_1to4 | 4.03ms | 2.05ms | 1.33ms | 1.57ms | 5.33ms | 2.49ms |
| update_1to1000 | 155μs | 1.00ms | 44μs | 413μs | 177μs | 80μs |
| cellx1000 | 12.42ms | 12.33ms | 7.50ms | 6.41ms | 85.84ms | 10.61ms |
| cellx2500 | 45.84ms | 32.98ms | 22.30ms | 36.28ms | 311.64ms | 39.77ms |
| cellx5000 | 158.34ms | 106.37ms | 57.36ms | 87.59ms | 713.35ms | 96.89ms |
| 10x5 - 2 sources - read 20.0% (simple) | 349.73ms | 451.05ms | 243.68ms | 250.83ms | 2.04s | 515.76ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 247.36ms | 271.88ms | 180.97ms | 201.78ms | 1.55s | 280.14ms |
| 1000x12 - 4 sources - dynamic (large) | 474.82ms | 3.50s | 288.65ms | 355.50ms | 1.99s | 3.79s |
| 1000x5 - 25 sources (wide dense) | 596.37ms | 2.65s | 415.92ms | 513.22ms | 3.68s | 3.45s |
| 5x500 - 3 sources (deep) | 259.24ms | 235.14ms | 202.14ms | 204.82ms | 1.18s | 228.22ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 391.26ms | 445.44ms | 265.72ms | 261.64ms | 1.79s | 488.31ms |

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
