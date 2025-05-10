# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.74s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.24s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.08s |
| 4 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.53s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.59s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.56s |

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
| Test Case | preact_signals | mobx | state_beacon | solidart(2.0-dev) | alien_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 205.50ms | 2.33s | 154.27ms (fail) | 273.96ms | 185.94ms | 210.67ms |
| broadPropagation | 460.03ms | 4.25s | 6.44ms (fail) | 514.29ms | 364.08ms | 452.90ms |
| deepPropagation | 180.58ms | 1.55s | 139.54ms (fail) | 167.90ms | 124.20ms | 172.62ms |
| diamond | 277.63ms | 2.41s | 192.19ms (fail) | 356.60ms | 233.49ms | 299.13ms |
| mux | 380.47ms | 1.79s | 201.41ms (fail) | 440.84ms | 376.57ms | 410.79ms |
| repeatedObservers | 38.45ms | 225.19ms | 52.20ms (fail) | 81.42ms | 44.86ms | 46.40ms |
| triangle | 105.00ms | 766.69ms | 77.07ms (fail) | 115.29ms | 84.93ms | 105.87ms |
| unstable | 70.16ms | 345.99ms | 345.80ms (fail) | 95.53ms | 60.95ms | 75.21ms |
| molBench | 491.81ms | 576.76ms | 1.30ms | 493.95ms | 490.25ms | 489.41ms |
| create_signals | 4.69ms | 81.54ms | 66.14ms | 92.97ms | 23.91ms | 28.27ms |
| comp_0to1 | 18.44ms | 33.03ms | 57.70ms | 47.79ms | 7.73ms | 11.98ms |
| comp_1to1 | 12.20ms | 24.77ms | 55.61ms | 32.36ms | 4.34ms | 28.09ms |
| comp_2to1 | 25.97ms | 8.88ms | 37.64ms | 42.20ms | 2.39ms | 9.46ms |
| comp_4to1 | 11.22ms | 25.71ms | 17.47ms | 10.14ms | 11.13ms | 2.13ms |
| comp_1000to1 | 5μs | 16μs | 42μs | 30μs | 4μs | 5μs |
| comp_1to2 | 18.84ms | 38.36ms | 46.09ms | 39.31ms | 18.92ms | 18.63ms |
| comp_1to4 | 29.94ms | 21.57ms | 44.16ms | 21.95ms | 9.66ms | 12.10ms |
| comp_1to8 | 5.68ms | 23.32ms | 43.46ms | 22.35ms | 4.08ms | 9.03ms |
| comp_1to1000 | 6.46ms | 15.10ms | 38.27ms | 15.26ms | 3.66ms | 4.60ms |
| update_1to1 | 8.16ms | 23.25ms | 5.74ms | 16.23ms | 11.33ms | 9.32ms |
| update_2to1 | 4.15ms | 10.96ms | 2.89ms | 7.95ms | 5.00ms | 5.34ms |
| update_4to1 | 2.03ms | 7.08ms | 1.48ms | 4.05ms | 2.81ms | 2.33ms |
| update_1000to1 | 20μs | 68μs | 15μs | 40μs | 11μs | 23μs |
| update_1to2 | 4.09ms | 10.47ms | 2.94ms | 8.12ms | 5.61ms | 5.01ms |
| update_1to4 | 2.03ms | 5.31ms | 1.48ms | 4.04ms | 2.27ms | 2.32ms |
| update_1to1000 | 981μs | 168μs | 373μs | 149μs | 36μs | 44μs |
| cellx1000 | 10.96ms | 76.76ms | 6.69ms | 14.69ms | 7.90ms | 9.80ms |
| cellx2500 | 41.94ms | 272.30ms | 33.10ms | 65.62ms | 24.37ms | 33.47ms |
| cellx5000 | 110.60ms | 622.42ms | 92.82ms | 191.72ms | 64.53ms | 67.76ms |
| 10x5 - 2 sources - read 20.0% (simple) | 439.00ms | 2.01s | 256.79ms | 367.70ms | 233.94ms | 508.70ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 268.20ms | 1.55s | 215.20ms | 245.74ms | 178.16ms | 278.44ms |
| 1000x12 - 4 sources - dynamic (large) | 3.55s | 1.97s | 356.29ms | 479.19ms | 282.64ms | 3.75s |
| 1000x5 - 25 sources (wide dense) | 2.62s | 3.58s | 524.36ms | 606.56ms | 408.43ms | 3.45s |
| 5x500 - 3 sources (deep) | 230.72ms | 1.18s | 207.46ms | 260.14ms | 191.93ms | 229.07ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 453.83ms | 1.75s | 278.11ms | 390.75ms | 266.06ms | 498.38ms |

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
