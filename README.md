# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.39s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.33s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.63s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.02s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.62s |

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
| avoidablePropagation | 217.29ms | 194.68ms | 162.87ms (fail) | 263.45ms | 201.43ms | 2.37s |
| broadPropagation | 460.24ms | 355.36ms | 6.66ms (fail) | 490.91ms | 456.12ms | 4.40s |
| deepPropagation | 182.12ms | 129.25ms | 141.66ms (fail) | 163.52ms | 182.14ms | 1.56s |
| diamond | 282.70ms | 234.24ms | 209.12ms (fail) | 344.34ms | 280.16ms | 2.44s |
| mux | 409.58ms | 380.91ms | 201.74ms (fail) | 432.99ms | 387.13ms | 1.85s |
| repeatedObservers | 46.06ms | 43.78ms | 52.58ms (fail) | 81.66ms | 40.05ms | 237.65ms |
| triangle | 102.27ms | 86.97ms | 82.89ms (fail) | 116.22ms | 98.46ms | 770.09ms |
| unstable | 76.31ms | 60.64ms | 345.72ms (fail) | 96.58ms | 74.20ms | 350.29ms |
| molBench | 486.18ms | 489.56ms | 1.34ms | 497.79ms | 487.10ms | 585.14ms |
| create_signals | 28.63ms | 24.56ms | 62.38ms | 95.75ms | 7.78ms | 80.88ms |
| comp_0to1 | 13.23ms | 8.06ms | 56.78ms | 33.67ms | 24.18ms | 21.32ms |
| comp_1to1 | 21.59ms | 4.37ms | 57.97ms | 50.34ms | 16.17ms | 35.28ms |
| comp_2to1 | 17.33ms | 2.32ms | 39.56ms | 28.53ms | 18.50ms | 8.92ms |
| comp_4to1 | 2.37ms | 9.73ms | 17.68ms | 8.88ms | 22.67ms | 24.91ms |
| comp_1000to1 | 6μs | 3μs | 50μs | 18μs | 9μs | 16μs |
| comp_1to2 | 16.94ms | 10.74ms | 49.01ms | 36.30ms | 18.54ms | 38.09ms |
| comp_1to4 | 13.82ms | 10.88ms | 46.60ms | 21.73ms | 30.61ms | 26.73ms |
| comp_1to8 | 10.32ms | 5.29ms | 45.41ms | 24.92ms | 8.09ms | 25.69ms |
| comp_1to1000 | 8.17ms | 3.53ms | 41.55ms | 14.36ms | 7.18ms | 15.53ms |
| update_1to1 | 10.26ms | 10.12ms | 6.05ms | 16.37ms | 8.42ms | 24.51ms |
| update_2to1 | 4.48ms | 2.13ms | 3.16ms | 8.03ms | 4.42ms | 14.03ms |
| update_4to1 | 2.54ms | 2.49ms | 1.52ms | 4.09ms | 2.16ms | 7.40ms |
| update_1000to1 | 25μs | 10μs | 15μs | 40μs | 20μs | 71μs |
| update_1to2 | 4.42ms | 5.01ms | 3.06ms | 9.12ms | 4.07ms | 13.86ms |
| update_1to4 | 2.53ms | 2.40ms | 1.52ms | 4.10ms | 2.12ms | 7.09ms |
| update_1to1000 | 69μs | 46μs | 411μs | 149μs | 774μs | 186μs |
| cellx1000 | 11.36ms | 7.56ms | 6.69ms | 13.09ms | 10.08ms | 91.22ms |
| cellx2500 | 48.81ms | 21.38ms | 32.10ms | 50.22ms | 31.59ms | 298.32ms |
| cellx5000 | 107.88ms | 52.44ms | 84.50ms | 121.44ms | 99.31ms | 660.03ms |
| 10x5 - 2 sources - read 20.0% (simple) | 507.83ms | 235.69ms | 265.20ms | 352.29ms | 511.20ms | 2.06s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.57ms | 182.24ms | 205.29ms | 258.23ms | 292.30ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 3.79s | 284.59ms | 371.72ms | 478.54ms | 3.80s | 1.97s |
| 1000x5 - 25 sources (wide dense) | 3.45s | 415.40ms | 526.43ms | 619.20ms | 2.76s | 3.57s |
| 5x500 - 3 sources (deep) | 225.66ms | 200.48ms | 219.61ms | 255.37ms | 251.06ms | 1.17s |
| 100x15 - 6 sources - dynamic (very dynamic) | 494.40ms | 272.65ms | 272.06ms | 393.82ms | 483.49ms | 1.76s |

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
