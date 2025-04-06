# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.35s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.17s |
| 4 | preact_signals | 0.27 | 100.0% | 35/35 | 10.07s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.35s |
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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 272.49ms | 197.49ms | 2.32s | 185.02ms | 209.53ms | 151.59ms (fail) |
| broadPropagation | 507.95ms | 457.53ms | 4.24s | 354.05ms | 459.73ms | 5.98ms (fail) |
| deepPropagation | 175.94ms | 179.70ms | 1.51s | 126.83ms | 177.60ms | 138.20ms (fail) |
| diamond | 352.29ms | 283.62ms | 2.42s | 235.20ms | 290.16ms | 184.14ms (fail) |
| mux | 441.34ms | 381.45ms | 1.81s | 372.65ms | 406.39ms | 193.30ms (fail) |
| repeatedObservers | 78.13ms | 38.39ms | 229.62ms | 45.32ms | 46.47ms | 52.22ms (fail) |
| triangle | 117.27ms | 101.16ms | 785.10ms | 83.84ms | 103.04ms | 77.35ms (fail) |
| unstable | 93.83ms | 70.68ms | 348.88ms | 60.65ms | 74.92ms | 341.71ms (fail) |
| molBench | 494.08ms | 490.45ms | 578.39ms | 492.64ms | 488.71ms | 1.38ms |
| create_signals | 76.18ms | 15.83ms | 89.55ms | 26.87ms | 26.22ms | 71.33ms |
| comp_0to1 | 29.78ms | 19.60ms | 27.40ms | 8.20ms | 12.35ms | 56.37ms |
| comp_1to1 | 31.91ms | 7.09ms | 42.19ms | 4.19ms | 28.79ms | 59.29ms |
| comp_2to1 | 23.99ms | 9.90ms | 23.60ms | 2.29ms | 9.49ms | 38.40ms |
| comp_4to1 | 7.98ms | 8.70ms | 16.27ms | 8.92ms | 2.03ms | 19.10ms |
| comp_1000to1 | 15μs | 4μs | 17μs | 6μs | 5μs | 42μs |
| comp_1to2 | 34.57ms | 24.68ms | 34.93ms | 14.34ms | 20.72ms | 48.41ms |
| comp_1to4 | 20.15ms | 27.61ms | 17.73ms | 5.48ms | 13.26ms | 44.23ms |
| comp_1to8 | 22.75ms | 5.89ms | 20.13ms | 7.27ms | 9.02ms | 43.30ms |
| comp_1to1000 | 14.70ms | 7.29ms | 15.40ms | 3.60ms | 4.58ms | 37.84ms |
| update_1to1 | 16.11ms | 8.20ms | 23.91ms | 11.49ms | 9.34ms | 5.72ms |
| update_2to1 | 7.92ms | 4.05ms | 10.59ms | 5.08ms | 5.34ms | 2.89ms |
| update_4to1 | 4.03ms | 2.04ms | 5.94ms | 2.79ms | 2.29ms | 1.48ms |
| update_1000to1 | 40μs | 20μs | 66μs | 10μs | 23μs | 15μs |
| update_1to2 | 8.11ms | 4.17ms | 10.96ms | 5.65ms | 4.90ms | 2.93ms |
| update_1to4 | 4.06ms | 2.02ms | 5.59ms | 2.46ms | 2.31ms | 1.47ms |
| update_1to1000 | 149μs | 857μs | 169μs | 50μs | 44μs | 371μs |
| cellx1000 | 12.44ms | 9.72ms | 76.28ms | 7.38ms | 9.64ms | 5.34ms |
| cellx2500 | 36.43ms | 30.97ms | 264.02ms | 22.44ms | 31.43ms | 29.55ms |
| cellx5000 | 110.88ms | 84.60ms | 574.49ms | 59.29ms | 67.39ms | 75.08ms |
| 10x5 - 2 sources - read 20.0% (simple) | 403.32ms | 458.42ms | 2.03s | 234.89ms | 507.48ms | 239.75ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 250.01ms | 270.96ms | 1.54s | 176.15ms | 283.10ms | 203.09ms |
| 1000x12 - 4 sources - dynamic (large) | 468.84ms | 3.56s | 1.84s | 291.38ms | 3.73s | 348.25ms |
| 1000x5 - 25 sources (wide dense) | 592.34ms | 2.61s | 3.55s | 408.40ms | 3.43s | 504.39ms |
| 5x500 - 3 sources (deep) | 256.06ms | 239.27ms | 1.15s | 205.85ms | 227.52ms | 205.24ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 387.88ms | 451.66ms | 1.72s | 263.19ms | 478.78ms | 258.71ms |

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
