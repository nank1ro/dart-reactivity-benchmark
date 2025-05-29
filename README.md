# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.68s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.13s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.19s |
| 4 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.22s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 28.25s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| Test Case | state_beacon | alien_signals | mobx | solidart(2.0-dev) | signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 165.80ms (fail) | 190.98ms | 2.42s | 274.66ms | 208.45ms | 201.02ms |
| broadPropagation | 6.53ms (fail) | 345.39ms | 4.40s | 510.70ms | 520.74ms | 456.38ms |
| deepPropagation | 143.73ms (fail) | 125.27ms | 1.56s | 170.90ms | 168.25ms | 175.72ms |
| diamond | 197.29ms (fail) | 228.68ms | 2.46s | 351.16ms | 297.63ms | 279.34ms |
| mux | 194.94ms (fail) | 372.62ms | 1.86s | 435.12ms | 411.15ms | 397.55ms |
| repeatedObservers | 54.77ms (fail) | 45.51ms | 241.40ms | 81.92ms | 46.44ms | 39.81ms |
| triangle | 77.96ms (fail) | 84.47ms | 783.91ms | 118.76ms | 102.83ms | 97.30ms |
| unstable | 338.12ms (fail) | 66.97ms | 355.33ms | 97.63ms | 82.65ms | 69.89ms |
| molBench | 865μs | 487.96ms | 578.75ms | 492.61ms | 487.20ms | 489.00ms |
| create_signals | 65.63ms | 27.07ms | 68.73ms | 53.69ms | 25.15ms | 5.31ms |
| comp_0to1 | 57.31ms | 6.81ms | 27.65ms | 27.12ms | 10.24ms | 17.16ms |
| comp_1to1 | 57.73ms | 4.27ms | 32.33ms | 36.91ms | 27.19ms | 11.11ms |
| comp_2to1 | 37.17ms | 2.25ms | 44.35ms | 32.91ms | 8.94ms | 17.96ms |
| comp_4to1 | 16.92ms | 10.13ms | 16.64ms | 13.82ms | 1.91ms | 12.18ms |
| comp_1000to1 | 41μs | 6μs | 21μs | 21μs | 5μs | 7μs |
| comp_1to2 | 45.19ms | 18.65ms | 35.22ms | 37.08ms | 14.65ms | 12.59ms |
| comp_1to4 | 43.90ms | 7.60ms | 18.32ms | 22.98ms | 9.32ms | 24.06ms |
| comp_1to8 | 42.54ms | 7.03ms | 20.32ms | 24.43ms | 6.18ms | 6.99ms |
| comp_1to1000 | 38.83ms | 3.47ms | 15.85ms | 17.36ms | 4.13ms | 4.44ms |
| update_1to1 | 5.66ms | 10.42ms | 23.65ms | 16.08ms | 8.95ms | 8.56ms |
| update_2to1 | 3.92ms | 2.27ms | 12.84ms | 7.80ms | 4.52ms | 4.34ms |
| update_4to1 | 1.43ms | 2.53ms | 6.79ms | 4.00ms | 2.25ms | 2.20ms |
| update_1000to1 | 14μs | 24μs | 67μs | 40μs | 22μs | 21μs |
| update_1to2 | 2.84ms | 5.25ms | 12.30ms | 8.00ms | 4.51ms | 4.62ms |
| update_1to4 | 1.46ms | 2.49ms | 7.09ms | 4.01ms | 2.25ms | 2.16ms |
| update_1to1000 | 397μs | 28μs | 174μs | 180μs | 43μs | 148μs |
| cellx1000 | 5.27ms | 7.31ms | 70.39ms | 11.71ms | 9.70ms | 9.60ms |
| cellx2500 | 22.84ms | 19.76ms | 245.68ms | 31.45ms | 31.26ms | 25.63ms |
| cellx5000 | 61.51ms | 44.98ms | 546.17ms | 70.64ms | 59.80ms | 63.03ms |
| 10x5 - 2 sources - read 20.0% (simple) | 244.82ms | 231.32ms | 2.01s | 357.95ms | 515.37ms | 434.71ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 203.21ms | 178.47ms | 1.59s | 243.63ms | 282.36ms | 269.69ms |
| 1000x12 - 4 sources - dynamic (large) | 347.18ms | 284.67ms | 2.10s | 456.93ms | 3.75s | 3.64s |
| 1000x5 - 25 sources (wide dense) | 503.39ms | 404.95ms | 3.83s | 588.18ms | 3.31s | 2.73s |
| 5x500 - 3 sources (deep) | 208.48ms | 194.56ms | 1.17s | 248.14ms | 224.51ms | 229.30ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 263.94ms | 259.36ms | 1.70s | 376.38ms | 488.54ms | 442.71ms |

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
