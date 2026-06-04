# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.76s |
| 🥈 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.47s |
| 🥉 | signals | 0.24 | 100.0% | 35/35 | 10.77s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 9.90s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.96s |
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
| avoidablePropagation | 265.13ms | 210.43ms | 2.31s | 214.16ms | 154.43ms (fail) | 183.20ms |
| broadPropagation | 487.80ms | 531.98ms | 4.22s | 512.98ms | 6.29ms (fail) | 356.93ms |
| deepPropagation | 165.46ms | 189.84ms | 1.50s | 193.68ms | 153.87ms (fail) | 117.49ms |
| diamond | 376.04ms | 286.50ms | 2.28s | 284.52ms | 190.63ms (fail) | 285.02ms |
| mux | 425.52ms | 384.40ms | 1.71s | 387.18ms | 190.59ms (fail) | 368.24ms |
| repeatedObservers | 89.25ms | 46.40ms | 230.37ms | 41.49ms | 54.02ms (fail) | 43.37ms |
| triangle | 121.68ms | 106.34ms | 729.77ms | 105.85ms | 79.69ms (fail) | 87.60ms |
| unstable | 105.66ms | 79.13ms | 337.88ms | 73.11ms | 341.91ms (fail) | 60.33ms |
| molBench | 558.85ms | 547.48ms | 643.28ms | 546.92ms | 1.12ms | 552.25ms |
| create_signals | 104.46ms | 29.52ms | 57.94ms | 5.64ms | 60.89ms | 30.20ms |
| comp_0to1 | 40.48ms | 12.95ms | 14.87ms | 19.80ms | 54.12ms | 9.09ms |
| comp_1to1 | 54.28ms | 33.86ms | 57.95ms | 20.68ms | 55.48ms | 4.11ms |
| comp_2to1 | 38.56ms | 20.89ms | 40.61ms | 30.66ms | 38.41ms | 2.22ms |
| comp_4to1 | 15.41ms | 8.46ms | 19.12ms | 12.69ms | 16.27ms | 16.25ms |
| comp_1000to1 | 15μs | 6μs | 16μs | 6μs | 40μs | 3μs |
| comp_1to2 | 37.02ms | 24.41ms | 39.00ms | 24.13ms | 44.88ms | 21.59ms |
| comp_1to4 | 15.04ms | 7.65ms | 17.73ms | 37.00ms | 44.81ms | 5.92ms |
| comp_1to8 | 20.94ms | 6.43ms | 21.06ms | 7.71ms | 42.38ms | 4.05ms |
| comp_1to1000 | 14.56ms | 4.02ms | 14.48ms | 6.69ms | 36.55ms | 3.50ms |
| update_1to1 | 16.26ms | 9.89ms | 23.51ms | 8.64ms | 6.15ms | 4.42ms |
| update_2to1 | 8.11ms | 5.12ms | 12.99ms | 4.25ms | 3.15ms | 2.28ms |
| update_4to1 | 4.08ms | 2.49ms | 5.77ms | 2.16ms | 1.59ms | 1.13ms |
| update_1000to1 | 40μs | 25μs | 56μs | 21μs | 16μs | 11μs |
| update_1to2 | 8.28ms | 5.00ms | 11.44ms | 4.24ms | 3.09ms | 2.24ms |
| update_1to4 | 4.05ms | 2.58ms | 5.77ms | 2.24ms | 1.54ms | 1.13ms |
| update_1to1000 | 143μs | 42μs | 153μs | 566μs | 356μs | 41μs |
| cellx1000 | 13.59ms | 10.12ms | 87.37ms | 9.94ms | 5.66ms | 6.85ms |
| cellx2500 | 41.63ms | 35.93ms | 321.52ms | 28.43ms | 25.82ms | 19.70ms |
| cellx5000 | 115.05ms | 79.90ms | 715.15ms | 86.08ms | 80.62ms | 46.00ms |
| 10x5 - 2 sources - read 20.0% (simple) | 371.26ms | 489.01ms | 2.04s | 432.49ms | 251.08ms | 239.68ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 271.57ms | 269.82ms | 1.41s | 265.70ms | 199.45ms | 184.38ms |
| 1000x12 - 4 sources - dynamic (large) | 433.31ms | 3.35s | 1.82s | 3.33s | 313.69ms | 263.89ms |
| 1000x5 - 25 sources (wide dense) | 638.70ms | 3.29s | 3.42s | 2.53s | 466.74ms | 414.31ms |
| 5x500 - 3 sources (deep) | 266.17ms | 228.62ms | 1.16s | 233.28ms | 202.87ms | 189.75ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 342.14ms | 466.07ms | 1.66s | 439.52ms | 236.53ms | 234.77ms |

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
