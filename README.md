# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.72s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.32s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 9.80s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.35s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 40.02s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.57s |

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
| Test Case | solidart | mobx | state_beacon | signals | alien_signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.19s | 2.30s | 166.19ms (fail) | 210.83ms | 191.22ms | 210.06ms |
| broadPropagation | 5.50s | 4.37s | 6.58ms (fail) | 465.96ms | 348.55ms | 456.89ms |
| deepPropagation | 2.01s | 1.55s | 143.46ms (fail) | 171.94ms | 122.70ms | 175.00ms |
| diamond | 3.49s | 2.44s | 209.34ms (fail) | 290.28ms | 239.24ms | 273.01ms |
| mux | 2.06s | 1.82s | 195.49ms (fail) | 409.12ms | 375.84ms | 389.67ms |
| repeatedObservers | 209.05ms | 239.19ms | 54.19ms (fail) | 45.01ms | 44.38ms | 41.44ms |
| triangle | 1.15s | 770.47ms | 78.38ms (fail) | 104.65ms | 85.41ms | 99.10ms |
| unstable | 339.39ms | 353.67ms | 342.57ms (fail) | 80.26ms | 60.97ms | 69.77ms |
| molBench | 1.75s | 585.69ms | 930μs | 485.73ms | 487.60ms | 485.48ms |
| create_signals | 61.27ms | 60.72ms | 63.68ms | 29.40ms | 20.73ms | 4.70ms |
| comp_0to1 | 43.77ms | 29.27ms | 56.71ms | 15.09ms | 5.00ms | 17.19ms |
| comp_1to1 | 46.03ms | 32.25ms | 53.09ms | 18.94ms | 11.14ms | 16.75ms |
| comp_2to1 | 29.78ms | 23.67ms | 37.62ms | 12.36ms | 16.71ms | 22.45ms |
| comp_4to1 | 13.29ms | 21.32ms | 19.32ms | 2.25ms | 2.49ms | 16.41ms |
| comp_1000to1 | 2.13ms | 17μs | 49μs | 5μs | 4μs | 8μs |
| comp_1to2 | 29.08ms | 33.58ms | 48.03ms | 21.70ms | 12.72ms | 20.80ms |
| comp_1to4 | 28.93ms | 17.77ms | 43.71ms | 15.07ms | 9.59ms | 29.20ms |
| comp_1to8 | 25.44ms | 21.14ms | 43.96ms | 7.67ms | 4.21ms | 7.97ms |
| comp_1to1000 | 19.43ms | 15.83ms | 40.39ms | 5.57ms | 3.73ms | 6.05ms |
| update_1to1 | 43.67ms | 28.19ms | 11.15ms | 9.39ms | 4.38ms | 8.78ms |
| update_2to1 | 21.39ms | 13.42ms | 3.38ms | 4.68ms | 2.76ms | 4.38ms |
| update_4to1 | 10.83ms | 7.36ms | 2.66ms | 2.33ms | 1.13ms | 2.19ms |
| update_1000to1 | 129μs | 68μs | 15μs | 23μs | 20μs | 21μs |
| update_1to2 | 21.47ms | 11.01ms | 4.53ms | 4.74ms | 2.18ms | 4.36ms |
| update_1to4 | 10.97ms | 7.02ms | 1.45ms | 2.34ms | 1.71ms | 2.19ms |
| update_1to1000 | 222μs | 164μs | 411μs | 46μs | 38μs | 776μs |
| cellx1000 | 198.18ms | 82.36ms | 5.24ms | 9.90ms | 7.51ms | 10.29ms |
| cellx2500 | 587.01ms | 275.78ms | 21.11ms | 36.72ms | 21.51ms | 33.89ms |
| cellx5000 | 1.20s | 588.52ms | 64.27ms | 76.66ms | 49.08ms | 93.53ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.63s (partial) | 2.01s | 274.75ms | 513.60ms | 239.35ms | 421.38ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.38s (partial) | 1.51s | 211.95ms | 278.51ms | 183.66ms | 271.59ms |
| 1000x12 - 4 sources - dynamic (large) | 4.05s (partial) | 1.77s | 346.71ms | 3.92s | 296.05ms | 3.41s |
| 1000x5 - 25 sources (wide dense) | 4.90s (partial) | 3.50s | 524.14ms | 3.37s | 408.69ms | 2.53s |
| 5x500 - 3 sources (deep) | 2.17s (partial) | 1.13s | 232.33ms | 228.68ms | 195.34ms | 225.36ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.81s (partial) | 1.71s | 265.45ms | 475.13ms | 268.48ms | 446.26ms |

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
