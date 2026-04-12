# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.77s |
| 🥈 | preact_signals | 0.26 | 100.0% | 35/35 | 10.33s |
| 🥉 | solidart(2.0-dev) | 0.24 | 100.0% | 35/35 | 5.48s |
| 4 | signals | 0.24 | 100.0% | 35/35 | 11.07s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.00s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.40s |

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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.28s | 214.08ms | 182.63ms | 220.26ms | 274.30ms | 152.82ms (fail) |
| broadPropagation | 4.19s | 480.47ms | 356.39ms | 528.70ms | 487.20ms | 6.17ms (fail) |
| deepPropagation | 1.52s | 186.29ms | 116.63ms | 198.86ms | 163.29ms | 153.14ms (fail) |
| diamond | 2.24s | 285.55ms | 269.64ms | 289.12ms | 367.75ms | 193.97ms (fail) |
| mux | 1.75s | 392.68ms | 370.97ms | 392.08ms | 423.13ms | 184.73ms (fail) |
| repeatedObservers | 224.11ms | 46.61ms | 44.40ms | 42.06ms | 87.86ms | 55.78ms (fail) |
| triangle | 743.84ms | 105.66ms | 89.41ms | 105.36ms | 121.20ms | 80.27ms (fail) |
| unstable | 342.29ms | 78.56ms | 61.14ms | 72.77ms | 108.35ms | 345.18ms (fail) |
| molBench | 638.45ms | 547.91ms | 561.16ms | 547.38ms | 568.67ms | 1.03ms |
| create_signals | 85.91ms | 28.24ms | 24.42ms | 4.98ms | 81.85ms | 67.87ms |
| comp_0to1 | 23.06ms | 14.48ms | 9.23ms | 20.35ms | 26.18ms | 54.48ms |
| comp_1to1 | 39.98ms | 28.78ms | 4.15ms | 14.00ms | 44.65ms | 58.61ms |
| comp_2to1 | 26.47ms | 20.44ms | 2.24ms | 20.24ms | 46.04ms | 44.21ms |
| comp_4to1 | 21.18ms | 7.46ms | 9.21ms | 12.55ms | 15.35ms | 19.87ms |
| comp_1000to1 | 26μs | 8μs | 3μs | 6μs | 23μs | 40μs |
| comp_1to2 | 49.16ms | 22.15ms | 11.28ms | 22.04ms | 29.49ms | 45.32ms |
| comp_1to4 | 22.45ms | 7.60ms | 15.81ms | 14.99ms | 28.68ms | 43.17ms |
| comp_1to8 | 24.88ms | 6.59ms | 3.59ms | 5.85ms | 27.25ms | 41.31ms |
| comp_1to1000 | 14.39ms | 3.90ms | 3.01ms | 3.42ms | 14.48ms | 36.36ms |
| update_1to1 | 23.04ms | 9.63ms | 4.72ms | 9.64ms | 16.83ms | 6.00ms |
| update_2to1 | 11.36ms | 4.72ms | 2.41ms | 4.93ms | 8.37ms | 3.03ms |
| update_4to1 | 6.23ms | 2.38ms | 1.27ms | 2.44ms | 4.18ms | 1.53ms |
| update_1000to1 | 56μs | 36μs | 13μs | 24μs | 44μs | 15μs |
| update_1to2 | 11.42ms | 4.71ms | 2.38ms | 4.80ms | 8.53ms | 3.04ms |
| update_1to4 | 5.71ms | 2.37ms | 1.26ms | 2.65ms | 4.19ms | 1.52ms |
| update_1to1000 | 157μs | 39μs | 43μs | 57μs | 142μs | 370μs |
| cellx1000 | 81.47ms | 11.28ms | 6.74ms | 10.12ms | 13.29ms | 5.04ms |
| cellx2500 | 332.16ms | 33.87ms | 19.04ms | 29.34ms | 51.85ms | 29.79ms |
| cellx5000 | 609.30ms | 74.71ms | 41.73ms | 85.29ms | 132.14ms | 82.67ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.09s | 520.50ms | 248.38ms | 442.93ms | 374.40ms | 273.98ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.44s | 272.18ms | 193.58ms | 261.76ms | 268.28ms | 203.16ms |
| 1000x12 - 4 sources - dynamic (large) | 1.86s | 3.65s | 268.55ms | 3.53s | 424.88ms | 303.94ms |
| 1000x5 - 25 sources (wide dense) | 3.49s | 3.31s | 418.46ms | 2.75s | 651.09ms | 465.32ms |
| 5x500 - 3 sources (deep) | 1.13s | 229.08ms | 190.32ms | 242.95ms | 263.77ms | 202.44ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.67s | 467.56ms | 234.48ms | 441.85ms | 341.29ms | 236.09ms |

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
