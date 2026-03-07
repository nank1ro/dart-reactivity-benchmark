# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.20s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 10.95s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.41s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.62s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.44s |

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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 199.17ms | 2.34s | 152.64ms (fail) | 194.74ms | 210.90ms | 276.83ms |
| broadPropagation | 459.35ms | 4.20s | 6.48ms (fail) | 357.91ms | 456.76ms | 506.58ms |
| deepPropagation | 174.89ms | 1.52s | 137.68ms (fail) | 126.64ms | 175.88ms | 164.52ms |
| diamond | 285.93ms | 2.37s | 199.15ms (fail) | 246.66ms | 290.49ms | 350.78ms |
| mux | 401.94ms | 1.78s | 175.55ms (fail) | 360.64ms | 379.46ms | 429.31ms |
| repeatedObservers | 46.27ms | 227.10ms | 54.99ms (fail) | 44.59ms | 41.72ms | 80.49ms |
| triangle | 99.75ms | 760.90ms | 85.75ms (fail) | 88.56ms | 99.86ms | 115.61ms |
| unstable | 77.49ms | 341.31ms | 336.79ms (fail) | 62.56ms | 72.44ms | 95.47ms |
| molBench | 493.58ms | 587.43ms | 1.10ms | 487.28ms | 497.06ms | 493.10ms |
| create_signals | 25.77ms | 67.98ms | 59.09ms | 27.77ms | 5.67ms | 69.91ms |
| comp_0to1 | 10.96ms | 15.17ms | 54.26ms | 9.21ms | 18.40ms | 25.15ms |
| comp_1to1 | 26.15ms | 34.80ms | 55.32ms | 4.19ms | 10.84ms | 50.07ms |
| comp_2to1 | 18.18ms | 23.86ms | 36.59ms | 2.37ms | 12.17ms | 16.99ms |
| comp_4to1 | 5.69ms | 13.93ms | 16.38ms | 8.91ms | 11.78ms | 11.86ms |
| comp_1000to1 | 7μs | 16μs | 43μs | 4μs | 5μs | 19μs |
| comp_1to2 | 19.65ms | 34.34ms | 46.40ms | 23.76ms | 15.86ms | 35.23ms |
| comp_1to4 | 7.29ms | 23.07ms | 45.25ms | 12.38ms | 27.05ms | 16.84ms |
| comp_1to8 | 6.46ms | 22.91ms | 44.30ms | 4.22ms | 7.10ms | 21.36ms |
| comp_1to1000 | 4.28ms | 15.14ms | 39.84ms | 3.52ms | 4.60ms | 14.13ms |
| update_1to1 | 9.01ms | 22.01ms | 8.50ms | 4.65ms | 9.00ms | 15.66ms |
| update_2to1 | 4.45ms | 11.33ms | 7.50ms | 2.32ms | 4.64ms | 7.83ms |
| update_4to1 | 2.25ms | 5.49ms | 1.87ms | 1.17ms | 2.26ms | 3.89ms |
| update_1000to1 | 22μs | 52μs | 14μs | 11μs | 33μs | 39μs |
| update_1to2 | 4.45ms | 10.62ms | 3.76ms | 2.39ms | 4.44ms | 7.84ms |
| update_1to4 | 2.27ms | 5.85ms | 1.45ms | 1.23ms | 2.39ms | 4.13ms |
| update_1to1000 | 42μs | 163μs | 412μs | 47μs | 215μs | 146μs |
| cellx1000 | 9.77ms | 66.08ms | 5.28ms | 8.25ms | 9.77ms | 11.40ms |
| cellx2500 | 32.56ms | 232.94ms | 22.93ms | 20.95ms | 26.11ms | 30.41ms |
| cellx5000 | 61.24ms | 531.95ms | 81.00ms | 47.06ms | 69.88ms | 64.50ms |
| 10x5 - 2 sources - read 20.0% (simple) | 494.91ms | 1.91s | 240.66ms | 238.09ms | 467.53ms | 347.43ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 282.81ms | 1.45s | 200.42ms | 184.45ms | 270.44ms | 252.97ms |
| 1000x12 - 4 sources - dynamic (large) | 3.65s | 1.81s | 336.89ms | 276.18ms | 3.76s | 456.63ms |
| 1000x5 - 25 sources (wide dense) | 3.33s | 3.39s | 512.40ms | 394.07ms | 2.76s | 598.84ms |
| 5x500 - 3 sources (deep) | 220.03ms | 1.11s | 207.97ms | 193.76ms | 236.65ms | 252.61ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 478.85ms | 1.67s | 260.51ms | 265.54ms | 447.38ms | 376.39ms |

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
