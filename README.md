# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.76s |
| 🥈 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.30s |
| 🥉 | signals | 0.29 | 100.0% | 35/35 | 11.44s |
| 4 | preact_signals | 0.28 | 100.0% | 35/35 | 10.42s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.58s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.63s |

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
| avoidablePropagation | 210.54ms | 194.40ms | 158.25ms (fail) | 261.40ms | 201.41ms | 2.35s |
| broadPropagation | 458.72ms | 352.42ms | 6.58ms (fail) | 490.46ms | 476.50ms | 4.40s |
| deepPropagation | 180.25ms | 128.87ms | 140.42ms (fail) | 162.40ms | 179.64ms | 1.52s |
| diamond | 281.69ms | 236.62ms | 205.59ms (fail) | 351.52ms | 280.92ms | 2.39s |
| mux | 411.97ms | 376.30ms | 195.07ms (fail) | 423.46ms | 391.00ms | 1.81s |
| repeatedObservers | 46.32ms | 43.86ms | 52.84ms (fail) | 80.94ms | 40.90ms | 233.14ms |
| triangle | 102.42ms | 85.59ms | 85.53ms (fail) | 114.17ms | 98.69ms | 777.08ms |
| unstable | 75.67ms | 61.11ms | 373.94ms (fail) | 97.19ms | 74.53ms | 341.48ms |
| molBench | 485.26ms | 489.09ms | 989μs | 498.89ms | 488.70ms | 582.55ms |
| create_signals | 25.96ms | 27.47ms | 71.63ms | 77.59ms | 5.29ms | 71.01ms |
| comp_0to1 | 12.10ms | 11.35ms | 66.64ms | 26.13ms | 18.31ms | 38.69ms |
| comp_1to1 | 31.90ms | 9.36ms | 64.86ms | 43.88ms | 15.12ms | 40.63ms |
| comp_2to1 | 9.32ms | 12.66ms | 42.14ms | 19.15ms | 17.57ms | 35.73ms |
| comp_4to1 | 2.06ms | 8.71ms | 19.49ms | 16.35ms | 15.83ms | 25.64ms |
| comp_1000to1 | 5μs | 4μs | 46μs | 19μs | 5μs | 21μs |
| comp_1to2 | 20.29ms | 14.21ms | 52.50ms | 31.11ms | 14.90ms | 37.59ms |
| comp_1to4 | 11.98ms | 8.98ms | 48.20ms | 18.38ms | 20.89ms | 20.69ms |
| comp_1to8 | 6.69ms | 3.84ms | 47.72ms | 24.73ms | 6.49ms | 24.91ms |
| comp_1to1000 | 4.47ms | 3.50ms | 42.75ms | 14.26ms | 6.96ms | 15.40ms |
| update_1to1 | 10.26ms | 9.98ms | 6.02ms | 16.36ms | 8.38ms | 24.93ms |
| update_2to1 | 4.72ms | 2.17ms | 3.10ms | 9.13ms | 4.36ms | 14.27ms |
| update_4to1 | 2.55ms | 2.54ms | 1.55ms | 4.12ms | 2.07ms | 7.19ms |
| update_1000to1 | 25μs | 25μs | 15μs | 40μs | 20μs | 75μs |
| update_1to2 | 4.56ms | 5.14ms | 3.01ms | 8.22ms | 4.07ms | 12.64ms |
| update_1to4 | 2.58ms | 2.43ms | 1.53ms | 4.07ms | 2.08ms | 7.06ms |
| update_1to1000 | 44μs | 46μs | 456μs | 149μs | 497μs | 173μs |
| cellx1000 | 10.00ms | 8.54ms | 5.96ms | 13.03ms | 10.38ms | 84.46ms |
| cellx2500 | 34.38ms | 21.51ms | 29.61ms | 40.08ms | 30.33ms | 295.77ms |
| cellx5000 | 74.46ms | 56.21ms | 89.14ms | 121.66ms | 87.53ms | 656.19ms |
| 10x5 - 2 sources - read 20.0% (simple) | 502.34ms | 238.07ms | 257.88ms | 344.65ms | 459.17ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.33ms | 180.89ms | 203.99ms | 247.33ms | 275.67ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 4.00s | 291.70ms | 359.94ms | 477.88ms | 3.75s | 1.88s |
| 1000x5 - 25 sources (wide dense) | 3.43s | 408.87ms | 515.55ms | 614.85ms | 2.74s | 3.48s |
| 5x500 - 3 sources (deep) | 222.98ms | 197.45ms | 215.17ms | 255.27ms | 230.80ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 478.52ms | 267.28ms | 266.55ms | 389.87ms | 459.86ms | 1.72s |

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
