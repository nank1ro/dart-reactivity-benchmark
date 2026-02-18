# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.33s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.18s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.54s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.85s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.48s |

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
| avoidablePropagation | 203.37ms | 2.31s | 145.77ms (fail) | 194.83ms | 207.09ms | 274.50ms |
| broadPropagation | 451.12ms | 4.29s | 6.43ms (fail) | 355.87ms | 449.87ms | 507.17ms |
| deepPropagation | 172.73ms | 1.51s | 140.70ms (fail) | 123.58ms | 177.65ms | 165.62ms |
| diamond | 285.16ms | 2.40s | 189.56ms (fail) | 242.87ms | 291.07ms | 348.83ms |
| mux | 395.07ms | 1.77s | 181.25ms (fail) | 362.72ms | 374.15ms | 426.44ms |
| repeatedObservers | 45.76ms | 225.05ms | 55.62ms (fail) | 46.40ms | 42.47ms | 80.89ms |
| triangle | 127.10ms | 745.60ms | 80.56ms (fail) | 87.97ms | 131.54ms | 115.67ms |
| unstable | 75.33ms | 336.68ms | 336.18ms (fail) | 62.21ms | 74.30ms | 95.58ms |
| molBench | 493.68ms | 586.39ms | 1.12ms | 487.94ms | 496.57ms | 492.22ms |
| create_signals | 27.67ms | 88.68ms | 65.25ms | 29.12ms | 4.92ms | 62.74ms |
| comp_0to1 | 12.26ms | 22.75ms | 55.02ms | 8.30ms | 19.09ms | 25.69ms |
| comp_1to1 | 36.11ms | 22.05ms | 56.20ms | 4.33ms | 13.11ms | 49.09ms |
| comp_2to1 | 8.67ms | 24.13ms | 45.36ms | 2.40ms | 10.09ms | 25.25ms |
| comp_4to1 | 7.23ms | 37.75ms | 16.80ms | 10.77ms | 8.60ms | 11.12ms |
| comp_1000to1 | 7μs | 26μs | 43μs | 6μs | 4μs | 18μs |
| comp_1to2 | 18.77ms | 35.25ms | 46.13ms | 28.89ms | 15.63ms | 35.10ms |
| comp_1to4 | 11.01ms | 30.64ms | 47.11ms | 6.06ms | 24.77ms | 22.67ms |
| comp_1to8 | 7.26ms | 19.84ms | 43.88ms | 6.26ms | 9.60ms | 23.38ms |
| comp_1to1000 | 4.94ms | 14.96ms | 39.87ms | 3.31ms | 5.56ms | 14.25ms |
| update_1to1 | 8.88ms | 21.59ms | 8.78ms | 4.63ms | 8.96ms | 15.55ms |
| update_2to1 | 4.50ms | 11.20ms | 4.74ms | 2.35ms | 4.56ms | 7.90ms |
| update_4to1 | 2.19ms | 5.25ms | 2.70ms | 1.21ms | 2.29ms | 3.94ms |
| update_1000to1 | 22μs | 57μs | 14μs | 11μs | 23μs | 40μs |
| update_1to2 | 4.43ms | 10.76ms | 3.88ms | 2.35ms | 5.01ms | 7.84ms |
| update_1to4 | 2.21ms | 5.75ms | 1.48ms | 1.22ms | 2.36ms | 3.93ms |
| update_1to1000 | 44μs | 152μs | 385μs | 45μs | 996μs | 156μs |
| cellx1000 | 10.37ms | 82.18ms | 5.38ms | 7.47ms | 10.49ms | 11.82ms |
| cellx2500 | 34.47ms | 248.56ms | 25.87ms | 22.00ms | 32.74ms | 41.36ms |
| cellx5000 | 94.07ms | 612.27ms | 84.19ms | 55.39ms | 76.36ms | 113.16ms |
| 10x5 - 2 sources - read 20.0% (simple) | 505.54ms | 1.94s | 242.17ms | 238.29ms | 458.46ms | 392.33ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.17ms | 1.46s | 203.21ms | 183.65ms | 269.80ms | 251.20ms |
| 1000x12 - 4 sources - dynamic (large) | 3.77s | 1.77s | 356.02ms | 294.25ms | 3.79s | 467.85ms |
| 1000x5 - 25 sources (wide dense) | 3.38s | 3.43s | 519.47ms | 415.10ms | 2.83s | 600.66ms |
| 5x500 - 3 sources (deep) | 236.36ms | 1.12s | 207.59ms | 195.21ms | 236.03ms | 257.01ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 472.65ms | 1.65s | 263.25ms | 265.87ms | 457.06ms | 380.17ms |

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
