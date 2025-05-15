# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.74s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.37s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.04s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.28s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.83s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.43s |

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
| avoidablePropagation | 269.32ms | 204.09ms | 186.07ms | 154.17ms (fail) | 2.39s | 209.75ms |
| broadPropagation | 498.36ms | 461.94ms | 354.57ms | 5.82ms (fail) | 4.32s | 458.10ms |
| deepPropagation | 169.46ms | 177.92ms | 123.64ms | 137.20ms (fail) | 1.54s | 180.32ms |
| diamond | 360.65ms | 282.81ms | 235.50ms | 183.99ms (fail) | 2.45s | 288.26ms |
| mux | 439.45ms | 381.63ms | 369.56ms | 191.91ms (fail) | 1.83s | 412.44ms |
| repeatedObservers | 78.41ms | 38.80ms | 46.86ms | 52.41ms (fail) | 232.76ms | 45.95ms |
| triangle | 116.53ms | 101.86ms | 96.10ms | 78.31ms (fail) | 781.75ms | 104.78ms |
| unstable | 94.54ms | 70.98ms | 61.85ms | 337.18ms (fail) | 352.16ms | 71.49ms |
| molBench | 493.65ms | 491.22ms | 493.25ms | 1.05ms | 581.09ms | 489.64ms |
| create_signals | 92.49ms | 5.25ms | 29.24ms | 59.96ms | 88.78ms | 46.98ms |
| comp_0to1 | 37.54ms | 18.05ms | 8.35ms | 53.85ms | 16.07ms | 15.40ms |
| comp_1to1 | 47.86ms | 13.89ms | 4.42ms | 54.75ms | 52.07ms | 26.05ms |
| comp_2to1 | 40.34ms | 22.89ms | 2.38ms | 37.67ms | 25.36ms | 15.36ms |
| comp_4to1 | 18.80ms | 14.64ms | 8.95ms | 16.76ms | 24.39ms | 6.56ms |
| comp_1000to1 | 15μs | 5μs | 6μs | 44μs | 15μs | 11μs |
| comp_1to2 | 36.56ms | 19.27ms | 20.75ms | 46.41ms | 39.13ms | 15.56ms |
| comp_1to4 | 21.28ms | 31.43ms | 11.81ms | 44.40ms | 24.39ms | 7.54ms |
| comp_1to8 | 23.59ms | 9.54ms | 5.54ms | 43.48ms | 23.70ms | 7.00ms |
| comp_1to1000 | 14.91ms | 7.54ms | 3.73ms | 39.45ms | 15.74ms | 4.50ms |
| update_1to1 | 16.24ms | 8.25ms | 11.46ms | 5.72ms | 26.00ms | 9.19ms |
| update_2to1 | 7.95ms | 4.08ms | 3.95ms | 2.87ms | 11.88ms | 4.58ms |
| update_4to1 | 4.04ms | 2.08ms | 2.78ms | 1.47ms | 6.54ms | 2.36ms |
| update_1000to1 | 40μs | 20μs | 10μs | 15μs | 67μs | 23μs |
| update_1to2 | 8.14ms | 4.20ms | 5.54ms | 2.94ms | 12.40ms | 4.92ms |
| update_1to4 | 4.04ms | 2.09ms | 1.52ms | 1.48ms | 6.29ms | 2.36ms |
| update_1to1000 | 149μs | 820μs | 45μs | 400μs | 186μs | 45μs |
| cellx1000 | 12.71ms | 10.20ms | 7.55ms | 7.32ms | 78.59ms | 10.76ms |
| cellx2500 | 39.46ms | 28.35ms | 21.52ms | 31.87ms | 279.28ms | 32.19ms |
| cellx5000 | 111.42ms | 92.98ms | 58.87ms | 73.97ms | 609.16ms | 65.70ms |
| 10x5 - 2 sources - read 20.0% (simple) | 347.35ms | 439.81ms | 231.79ms | 243.13ms | 2.02s | 511.01ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 246.24ms | 277.70ms | 176.92ms | 201.96ms | 1.57s | 278.58ms |
| 1000x12 - 4 sources - dynamic (large) | 474.76ms | 3.55s | 284.35ms | 345.46ms | 1.94s | 3.75s |
| 1000x5 - 25 sources (wide dense) | 601.34ms | 2.58s | 415.14ms | 505.86ms | 3.59s | 3.49s |
| 5x500 - 3 sources (deep) | 257.70ms | 233.11ms | 189.12ms | 202.40ms | 1.16s | 225.34ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 387.40ms | 451.57ms | 263.20ms | 264.96ms | 1.73s | 483.91ms |

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
