# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.23s |
| 🥉 | preact_signals | 0.25 | 100.0% | 35/35 | 9.95s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.30s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.32s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.39s |

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
| avoidablePropagation | 274.07ms | 206.05ms | 2.31s | 186.66ms | 207.07ms | 152.33ms (fail) |
| broadPropagation | 498.25ms | 473.37ms | 4.27s | 360.39ms | 454.95ms | 5.74ms (fail) |
| deepPropagation | 173.01ms | 177.36ms | 1.54s | 125.26ms | 174.07ms | 136.85ms (fail) |
| diamond | 350.38ms | 284.63ms | 2.40s | 240.34ms | 302.80ms | 182.77ms (fail) |
| mux | 437.36ms | 381.13ms | 1.84s | 376.29ms | 411.96ms | 192.87ms (fail) |
| repeatedObservers | 82.74ms | 38.62ms | 228.23ms | 44.80ms | 45.45ms | 53.84ms (fail) |
| triangle | 118.75ms | 101.03ms | 760.13ms | 85.41ms | 99.15ms | 80.01ms (fail) |
| unstable | 93.04ms | 70.62ms | 348.36ms | 59.73ms | 73.21ms | 335.74ms (fail) |
| molBench | 493.73ms | 488.46ms | 582.24ms | 491.94ms | 490.65ms | 1.17ms |
| create_signals | 71.83ms | 4.67ms | 57.40ms | 26.66ms | 25.46ms | 59.33ms |
| comp_0to1 | 29.82ms | 22.81ms | 18.69ms | 6.97ms | 11.37ms | 53.18ms |
| comp_1to1 | 41.03ms | 11.17ms | 30.25ms | 4.16ms | 27.45ms | 52.05ms |
| comp_2to1 | 35.65ms | 11.46ms | 13.69ms | 2.32ms | 18.13ms | 34.75ms |
| comp_4to1 | 4.67ms | 9.58ms | 14.77ms | 8.82ms | 8.19ms | 16.05ms |
| comp_1000to1 | 29μs | 4μs | 15μs | 4μs | 5μs | 41μs |
| comp_1to2 | 37.23ms | 16.37ms | 36.63ms | 15.21ms | 22.59ms | 43.81ms |
| comp_1to4 | 21.46ms | 28.32ms | 24.57ms | 5.45ms | 12.75ms | 42.90ms |
| comp_1to8 | 20.84ms | 10.29ms | 21.36ms | 4.63ms | 12.16ms | 42.02ms |
| comp_1to1000 | 15.12ms | 10.39ms | 14.89ms | 3.53ms | 4.50ms | 37.41ms |
| update_1to1 | 16.11ms | 8.27ms | 23.52ms | 9.69ms | 9.20ms | 5.72ms |
| update_2to1 | 7.94ms | 4.07ms | 11.73ms | 4.94ms | 4.57ms | 2.88ms |
| update_4to1 | 4.10ms | 2.10ms | 6.58ms | 2.75ms | 2.29ms | 1.47ms |
| update_1000to1 | 40μs | 36μs | 55μs | 14μs | 22μs | 24μs |
| update_1to2 | 8.07ms | 4.15ms | 11.93ms | 5.59ms | 4.93ms | 2.96ms |
| update_1to4 | 4.05ms | 2.08ms | 5.84ms | 2.42ms | 2.29ms | 1.46ms |
| update_1to1000 | 147μs | 2.61ms | 167μs | 49μs | 43μs | 376μs |
| cellx1000 | 11.32ms | 9.82ms | 80.10ms | 7.41ms | 9.40ms | 5.14ms |
| cellx2500 | 30.75ms | 26.91ms | 263.98ms | 20.27ms | 30.82ms | 25.93ms |
| cellx5000 | 72.93ms | 70.02ms | 548.15ms | 45.17ms | 62.99ms | 64.27ms |
| 10x5 - 2 sources - read 20.0% (simple) | 350.12ms | 443.77ms | 2.00s | 239.03ms | 505.97ms | 244.35ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 242.50ms | 275.05ms | 1.56s | 177.34ms | 277.92ms | 203.24ms |
| 1000x12 - 4 sources - dynamic (large) | 459.27ms | 3.48s | 1.89s | 280.02ms | 3.75s | 337.35ms |
| 1000x5 - 25 sources (wide dense) | 592.72ms | 2.59s | 3.56s | 408.01ms | 3.54s | 502.65ms |
| 5x500 - 3 sources (deep) | 255.37ms | 230.69ms | 1.14s | 190.12ms | 227.03ms | 207.57ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 377.94ms | 447.86ms | 1.72s | 263.90ms | 473.62ms | 259.68ms |

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
