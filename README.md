# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.31 | 100.0% | 35/35 | 5.20s |
| 🥉 | preact_signals | 0.30 | 100.0% | 35/35 | 9.94s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 11.21s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.42s |
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
| Test Case | solidart(2.0-dev) | preact_signals | alien_signals | state_beacon | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 270.16ms | 205.61ms | 188.10ms | 161.16ms (fail) | 2.33s | 208.09ms |
| broadPropagation | 507.37ms | 451.85ms | 360.95ms | 5.89ms (fail) | 4.24s | 465.11ms |
| deepPropagation | 166.41ms | 177.30ms | 128.21ms | 137.58ms (fail) | 1.52s | 173.19ms |
| diamond | 357.12ms | 279.81ms | 237.39ms | 192.06ms (fail) | 2.42s | 289.54ms |
| mux | 445.81ms | 382.22ms | 375.06ms | 194.98ms (fail) | 1.86s | 409.13ms |
| repeatedObservers | 78.27ms | 38.40ms | 45.00ms | 53.17ms (fail) | 232.85ms | 46.48ms |
| triangle | 116.98ms | 99.66ms | 86.42ms | 83.36ms (fail) | 777.97ms | 103.38ms |
| unstable | 94.40ms | 71.34ms | 60.53ms | 337.57ms (fail) | 354.10ms | 74.85ms |
| molBench | 491.99ms | 492.52ms | 492.02ms | 1.06ms | 582.08ms | 484.91ms |
| create_signals | 57.10ms | 16.57ms | 29.46ms | 59.09ms | 70.53ms | 25.36ms |
| comp_0to1 | 25.69ms | 19.79ms | 8.02ms | 51.37ms | 25.29ms | 11.48ms |
| comp_1to1 | 38.85ms | 7.29ms | 4.16ms | 52.49ms | 30.29ms | 26.31ms |
| comp_2to1 | 24.22ms | 10.16ms | 2.29ms | 35.30ms | 8.42ms | 11.99ms |
| comp_4to1 | 7.22ms | 8.50ms | 8.51ms | 16.25ms | 35.13ms | 3.18ms |
| comp_1000to1 | 14μs | 4μs | 4μs | 41μs | 15μs | 5μs |
| comp_1to2 | 30.77ms | 15.43ms | 10.64ms | 44.30ms | 33.68ms | 18.65ms |
| comp_1to4 | 15.21ms | 20.13ms | 15.26ms | 43.45ms | 19.16ms | 10.88ms |
| comp_1to8 | 20.09ms | 7.14ms | 4.10ms | 42.46ms | 20.93ms | 6.82ms |
| comp_1to1000 | 14.76ms | 4.71ms | 3.23ms | 37.91ms | 15.08ms | 4.49ms |
| update_1to1 | 16.12ms | 8.19ms | 11.37ms | 5.73ms | 24.43ms | 9.27ms |
| update_2to1 | 7.91ms | 4.09ms | 4.90ms | 2.88ms | 12.19ms | 4.62ms |
| update_4to1 | 4.02ms | 2.08ms | 2.77ms | 1.47ms | 6.32ms | 2.35ms |
| update_1000to1 | 40μs | 20μs | 10μs | 15μs | 74μs | 23μs |
| update_1to2 | 8.06ms | 4.05ms | 5.59ms | 2.96ms | 11.47ms | 4.92ms |
| update_1to4 | 3.97ms | 2.06ms | 2.44ms | 1.48ms | 5.62ms | 2.34ms |
| update_1to1000 | 152μs | 66μs | 49μs | 370μs | 165μs | 44μs |
| cellx1000 | 11.17ms | 9.60ms | 7.46ms | 5.26ms | 68.35ms | 9.48ms |
| cellx2500 | 31.28ms | 26.47ms | 19.80ms | 27.34ms | 250.93ms | 32.09ms |
| cellx5000 | 67.99ms | 67.56ms | 42.81ms | 69.84ms | 576.77ms | 61.19ms |
| 10x5 - 2 sources - read 20.0% (simple) | 352.44ms | 440.18ms | 232.31ms | 248.26ms | 2.02s | 508.98ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 244.04ms | 281.08ms | 177.35ms | 217.27ms | 1.58s | 283.74ms |
| 1000x12 - 4 sources - dynamic (large) | 460.95ms | 3.51s | 287.39ms | 338.34ms | 1.84s | 3.77s |
| 1000x5 - 25 sources (wide dense) | 592.14ms | 2.60s | 407.93ms | 515.19ms | 3.54s | 3.43s |
| 5x500 - 3 sources (deep) | 255.28ms | 224.88ms | 188.47ms | 206.62ms | 1.15s | 228.66ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 382.92ms | 452.05ms | 263.54ms | 261.42ms | 1.75s | 483.09ms |

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
