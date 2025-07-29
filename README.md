# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.67s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.09s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.29s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.38s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.79s |
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
| Test Case | state_beacon | mobx | solidart(2.0-dev) | preact_signals | signals | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 160.65ms (fail) | 2.33s | 274.16ms | 221.20ms | 207.12ms | 183.27ms |
| broadPropagation | 6.70ms (fail) | 4.41s | 500.98ms | 450.59ms | 457.11ms | 345.06ms |
| deepPropagation | 141.46ms (fail) | 1.56s | 165.79ms | 175.94ms | 177.91ms | 125.11ms |
| diamond | 187.66ms (fail) | 2.46s | 355.71ms | 282.83ms | 280.63ms | 230.88ms |
| mux | 198.68ms (fail) | 1.86s | 445.03ms | 421.49ms | 449.38ms | 368.93ms |
| repeatedObservers | 52.33ms (fail) | 232.25ms | 81.60ms | 40.70ms | 46.83ms | 45.43ms |
| triangle | 76.23ms (fail) | 786.36ms | 118.30ms | 98.12ms | 102.34ms | 85.06ms |
| unstable | 336.22ms (fail) | 347.90ms | 97.47ms | 70.01ms | 79.56ms | 67.01ms |
| molBench | 900μs | 573.19ms | 494.81ms | 490.84ms | 486.45ms | 486.60ms |
| create_signals | 67.30ms | 68.44ms | 75.87ms | 5.28ms | 26.33ms | 27.61ms |
| comp_0to1 | 57.49ms | 16.36ms | 27.88ms | 20.40ms | 11.95ms | 6.86ms |
| comp_1to1 | 62.77ms | 39.91ms | 29.15ms | 14.50ms | 28.37ms | 4.16ms |
| comp_2to1 | 45.16ms | 34.97ms | 43.00ms | 11.68ms | 8.52ms | 2.29ms |
| comp_4to1 | 16.93ms | 23.12ms | 16.92ms | 8.68ms | 1.87ms | 8.48ms |
| comp_1000to1 | 42μs | 17μs | 17μs | 6μs | 5μs | 3μs |
| comp_1to2 | 48.52ms | 43.17ms | 33.73ms | 17.03ms | 14.99ms | 12.08ms |
| comp_1to4 | 49.87ms | 18.54ms | 22.60ms | 26.18ms | 10.51ms | 14.95ms |
| comp_1to8 | 44.28ms | 20.80ms | 24.86ms | 8.63ms | 7.63ms | 4.11ms |
| comp_1to1000 | 39.04ms | 16.30ms | 16.83ms | 7.72ms | 4.18ms | 3.17ms |
| update_1to1 | 5.67ms | 22.55ms | 15.93ms | 8.60ms | 9.06ms | 10.24ms |
| update_2to1 | 3.28ms | 11.42ms | 7.86ms | 4.35ms | 4.45ms | 2.33ms |
| update_4to1 | 1.47ms | 6.86ms | 4.01ms | 2.19ms | 2.25ms | 2.49ms |
| update_1000to1 | 14μs | 70μs | 52μs | 21μs | 22μs | 24μs |
| update_1to2 | 2.87ms | 12.26ms | 8.02ms | 4.68ms | 4.48ms | 5.08ms |
| update_1to4 | 1.46ms | 6.10ms | 3.99ms | 2.17ms | 2.24ms | 2.46ms |
| update_1to1000 | 378μs | 184μs | 170μs | 853μs | 43μs | 47μs |
| cellx1000 | 5.39ms | 76.62ms | 12.57ms | 10.70ms | 11.53ms | 7.17ms |
| cellx2500 | 24.61ms | 258.68ms | 35.88ms | 35.91ms | 48.12ms | 19.33ms |
| cellx5000 | 68.78ms | 576.10ms | 89.65ms | 103.34ms | 97.69ms | 41.67ms |
| 10x5 - 2 sources - read 20.0% (simple) | 237.15ms | 2.04s | 363.35ms | 438.85ms | 512.41ms | 231.49ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 198.56ms | 1.56s | 243.38ms | 268.58ms | 278.80ms | 178.83ms |
| 1000x12 - 4 sources - dynamic (large) | 333.33ms | 1.93s | 464.88ms | 3.72s | 3.74s | 280.25ms |
| 1000x5 - 25 sources (wide dense) | 514.78ms | 3.53s | 587.89ms | 2.72s | 3.27s | 411.24ms |
| 5x500 - 3 sources (deep) | 202.91ms | 1.17s | 252.09ms | 234.70ms | 225.23ms | 188.83ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 255.85ms | 1.75s | 379.69ms | 453.01ms | 479.68ms | 264.70ms |

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
