# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.31s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.45s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.27s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.45s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.49s |

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
| avoidablePropagation | 223.95ms | 194.12ms | 148.13ms (fail) | 259.26ms | 207.84ms | 2.34s |
| broadPropagation | 469.05ms | 359.94ms | 6.37ms (fail) | 496.97ms | 457.48ms | 4.31s |
| deepPropagation | 178.90ms | 131.20ms | 150.10ms (fail) | 161.83ms | 183.05ms | 1.55s |
| diamond | 301.27ms | 240.50ms | 202.00ms (fail) | 352.13ms | 281.27ms | 2.41s |
| mux | 419.59ms | 377.85ms | 194.87ms (fail) | 427.50ms | 388.74ms | 1.84s |
| repeatedObservers | 46.56ms | 43.65ms | 52.58ms (fail) | 80.57ms | 40.27ms | 230.17ms |
| triangle | 100.38ms | 85.55ms | 78.82ms (fail) | 114.48ms | 98.95ms | 784.79ms |
| unstable | 75.88ms | 59.71ms | 343.96ms (fail) | 95.40ms | 74.86ms | 343.49ms |
| molBench | 488.52ms | 489.32ms | 921μs | 499.24ms | 489.79ms | 584.78ms |
| create_signals | 25.94ms | 27.60ms | 63.01ms | 77.60ms | 4.65ms | 88.35ms |
| comp_0to1 | 12.06ms | 7.63ms | 56.42ms | 26.16ms | 17.73ms | 34.79ms |
| comp_1to1 | 21.23ms | 4.32ms | 57.98ms | 50.61ms | 12.52ms | 17.84ms |
| comp_2to1 | 11.69ms | 2.53ms | 38.80ms | 10.05ms | 9.07ms | 17.21ms |
| comp_4to1 | 7.25ms | 10.11ms | 17.62ms | 18.60ms | 13.86ms | 29.49ms |
| comp_1000to1 | 5μs | 3μs | 45μs | 18μs | 4μs | 20μs |
| comp_1to2 | 22.53ms | 11.28ms | 48.30ms | 36.75ms | 28.05ms | 32.03ms |
| comp_1to4 | 9.47ms | 9.22ms | 46.58ms | 16.58ms | 29.86ms | 41.05ms |
| comp_1to8 | 6.50ms | 5.32ms | 45.74ms | 22.46ms | 7.83ms | 26.32ms |
| comp_1to1000 | 4.55ms | 3.58ms | 41.71ms | 14.27ms | 5.88ms | 15.58ms |
| update_1to1 | 10.25ms | 10.11ms | 6.35ms | 16.40ms | 9.91ms | 22.53ms |
| update_2to1 | 5.00ms | 2.14ms | 3.12ms | 8.04ms | 5.16ms | 11.73ms |
| update_4to1 | 2.56ms | 2.50ms | 1.52ms | 7.02ms | 2.52ms | 5.55ms |
| update_1000to1 | 25μs | 10μs | 15μs | 40μs | 21μs | 56μs |
| update_1to2 | 4.53ms | 5.01ms | 3.03ms | 8.24ms | 4.94ms | 11.07ms |
| update_1to4 | 2.55ms | 2.46ms | 1.54ms | 4.13ms | 2.48ms | 5.59ms |
| update_1to1000 | 43μs | 45μs | 411μs | 149μs | 205μs | 172μs |
| cellx1000 | 10.05ms | 7.14ms | 5.45ms | 13.10ms | 9.98ms | 84.99ms |
| cellx2500 | 35.21ms | 20.64ms | 28.04ms | 55.00ms | 28.37ms | 243.15ms |
| cellx5000 | 74.39ms | 47.85ms | 68.71ms | 132.12ms | 84.03ms | 604.80ms |
| 10x5 - 2 sources - read 20.0% (simple) | 507.55ms | 242.38ms | 236.07ms | 351.82ms | 443.12ms | 2.03s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 281.05ms | 185.63ms | 197.76ms | 248.91ms | 286.26ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 3.77s | 288.27ms | 363.58ms | 458.87ms | 3.75s | 1.80s |
| 1000x5 - 25 sources (wide dense) | 3.43s | 399.08ms | 510.19ms | 612.95ms | 2.76s | 3.54s |
| 5x500 - 3 sources (deep) | 221.34ms | 190.92ms | 203.55ms | 249.60ms | 235.95ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 482.19ms | 265.69ms | 265.98ms | 383.82ms | 468.76ms | 1.73s |

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
