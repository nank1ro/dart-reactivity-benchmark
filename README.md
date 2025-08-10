# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.64s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.21s |
| 🥉 | preact_signals | 0.25 | 100.0% | 35/35 | 10.36s |
| 4 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.46s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 27.99s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.45s |

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
| Test Case | mobx | state_beacon | preact_signals | alien_signals | solidart(2.0-dev) | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.37s | 166.03ms (fail) | 198.31ms | 185.10ms | 276.60ms | 212.31ms |
| broadPropagation | 4.48s | 5.96ms (fail) | 474.13ms | 347.44ms | 511.92ms | 457.30ms |
| deepPropagation | 1.58s | 139.29ms (fail) | 173.30ms | 125.40ms | 169.49ms | 171.92ms |
| diamond | 2.50s | 182.61ms (fail) | 278.69ms | 229.66ms | 349.72ms | 287.35ms |
| mux | 1.87s | 197.39ms (fail) | 406.93ms | 366.65ms | 449.88ms | 408.05ms |
| repeatedObservers | 236.86ms | 52.51ms (fail) | 39.72ms | 45.49ms | 81.55ms | 45.82ms |
| triangle | 778.27ms | 79.35ms (fail) | 98.77ms | 84.56ms | 126.29ms | 101.20ms |
| unstable | 354.03ms | 336.21ms (fail) | 69.62ms | 67.60ms | 96.47ms | 78.76ms |
| molBench | 581.58ms | 942μs | 485.57ms | 453.16ms | 494.10ms | 486.28ms |
| create_signals | 54.38ms | 60.56ms | 4.67ms | 21.18ms | 101.67ms | 25.17ms |
| comp_0to1 | 46.86ms | 53.88ms | 17.79ms | 7.97ms | 34.72ms | 11.76ms |
| comp_1to1 | 42.73ms | 56.36ms | 14.43ms | 4.29ms | 49.42ms | 27.30ms |
| comp_2to1 | 24.54ms | 40.56ms | 20.25ms | 2.36ms | 47.79ms | 9.11ms |
| comp_4to1 | 32.14ms | 16.80ms | 14.72ms | 8.49ms | 13.81ms | 1.90ms |
| comp_1000to1 | 16μs | 42μs | 5μs | 5μs | 21μs | 11μs |
| comp_1to2 | 34.23ms | 45.81ms | 15.49ms | 15.53ms | 29.34ms | 19.38ms |
| comp_1to4 | 30.80ms | 44.50ms | 27.79ms | 11.24ms | 35.95ms | 14.71ms |
| comp_1to8 | 20.70ms | 43.52ms | 9.40ms | 5.28ms | 24.17ms | 6.74ms |
| comp_1to1000 | 15.68ms | 39.02ms | 6.29ms | 3.63ms | 17.25ms | 4.34ms |
| update_1to1 | 24.95ms | 5.65ms | 8.66ms | 10.28ms | 16.50ms | 8.92ms |
| update_2to1 | 12.93ms | 3.16ms | 4.25ms | 2.31ms | 8.13ms | 4.46ms |
| update_4to1 | 5.98ms | 1.46ms | 2.29ms | 2.53ms | 4.14ms | 2.27ms |
| update_1000to1 | 81μs | 14μs | 21μs | 24μs | 40μs | 22μs |
| update_1to2 | 13.01ms | 2.84ms | 4.65ms | 5.20ms | 8.36ms | 4.47ms |
| update_1to4 | 7.11ms | 1.45ms | 2.16ms | 2.49ms | 4.13ms | 2.23ms |
| update_1to1000 | 199μs | 389μs | 981μs | 30μs | 172μs | 43μs |
| cellx1000 | 93.44ms | 6.06ms | 9.73ms | 7.18ms | 13.14ms | 9.75ms |
| cellx2500 | 253.37ms | 30.64ms | 29.12ms | 19.99ms | 52.28ms | 35.23ms |
| cellx5000 | 620.44ms | 69.75ms | 90.83ms | 52.04ms | 109.77ms | 80.24ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.04s | 240.68ms | 440.29ms | 222.87ms | 382.73ms | 526.29ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.52s | 202.72ms | 270.64ms | 173.42ms | 254.40ms | 278.75ms |
| 1000x12 - 4 sources - dynamic (large) | 1.80s | 351.36ms | 3.77s | 285.62ms | 466.41ms | 3.75s |
| 1000x5 - 25 sources (wide dense) | 3.65s | 504.75ms | 2.70s | 412.77ms | 582.95ms | 3.43s |
| 5x500 - 3 sources (deep) | 1.17s | 207.46ms | 228.67ms | 187.96ms | 263.11ms | 226.74ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.72s | 261.95ms | 446.98ms | 265.52ms | 379.46ms | 479.80ms |

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
