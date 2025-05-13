# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.33s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.28s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.27s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.02s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.52s |

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
| avoidablePropagation | 271.70ms | 205.64ms | 185.19ms | 150.89ms (fail) | 2.36s | 209.57ms |
| broadPropagation | 502.68ms | 457.26ms | 363.61ms | 5.90ms (fail) | 4.25s | 465.53ms |
| deepPropagation | 172.01ms | 178.56ms | 124.76ms | 140.92ms (fail) | 1.53s | 176.29ms |
| diamond | 354.89ms | 280.77ms | 243.34ms | 180.32ms (fail) | 2.40s | 286.10ms |
| mux | 443.82ms | 380.03ms | 379.02ms | 194.73ms (fail) | 1.81s | 406.07ms |
| repeatedObservers | 77.86ms | 38.62ms | 44.91ms | 53.10ms (fail) | 232.91ms | 46.56ms |
| triangle | 115.94ms | 98.43ms | 84.88ms | 76.53ms (fail) | 760.88ms | 103.11ms |
| unstable | 93.80ms | 71.61ms | 60.09ms | 337.98ms (fail) | 351.48ms | 72.97ms |
| molBench | 494.93ms | 491.58ms | 493.41ms | 1.33ms | 580.39ms | 488.76ms |
| create_signals | 55.35ms | 5.25ms | 25.41ms | 69.42ms | 71.52ms | 28.94ms |
| comp_0to1 | 26.57ms | 17.73ms | 8.34ms | 59.77ms | 27.16ms | 16.26ms |
| comp_1to1 | 34.65ms | 14.19ms | 5.33ms | 55.66ms | 38.34ms | 32.34ms |
| comp_2to1 | 35.43ms | 21.49ms | 2.87ms | 42.67ms | 43.95ms | 14.53ms |
| comp_4to1 | 4.77ms | 16.62ms | 14.17ms | 21.44ms | 17.63ms | 1.80ms |
| comp_1000to1 | 15μs | 5μs | 7μs | 48μs | 23μs | 5μs |
| comp_1to2 | 32.62ms | 19.39ms | 17.29ms | 45.32ms | 36.42ms | 22.60ms |
| comp_1to4 | 20.75ms | 31.24ms | 17.40ms | 44.06ms | 20.63ms | 9.80ms |
| comp_1to8 | 24.56ms | 8.08ms | 4.81ms | 42.83ms | 24.69ms | 9.56ms |
| comp_1to1000 | 15.19ms | 7.83ms | 3.28ms | 37.83ms | 15.57ms | 4.50ms |
| update_1to1 | 16.14ms | 8.23ms | 11.40ms | 5.81ms | 23.73ms | 9.29ms |
| update_2to1 | 7.92ms | 4.09ms | 4.73ms | 2.90ms | 11.73ms | 4.71ms |
| update_4to1 | 4.02ms | 2.13ms | 2.83ms | 1.48ms | 7.00ms | 2.33ms |
| update_1000to1 | 40μs | 20μs | 12μs | 15μs | 63μs | 23μs |
| update_1to2 | 8.04ms | 4.07ms | 5.05ms | 2.95ms | 12.91ms | 4.89ms |
| update_1to4 | 4.03ms | 2.08ms | 1.57ms | 1.50ms | 6.10ms | 2.31ms |
| update_1to1000 | 149μs | 1.11ms | 48μs | 370μs | 180μs | 45μs |
| cellx1000 | 13.86ms | 11.40ms | 7.88ms | 6.45ms | 85.85ms | 9.99ms |
| cellx2500 | 52.54ms | 47.69ms | 24.86ms | 37.47ms | 334.91ms | 36.80ms |
| cellx5000 | 148.19ms | 128.84ms | 56.34ms | 85.52ms | 678.55ms | 120.78ms |
| 10x5 - 2 sources - read 20.0% (simple) | 351.13ms | 469.80ms | 235.45ms | 248.96ms | 2.01s | 503.69ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 242.63ms | 294.54ms | 177.50ms | 202.04ms | 1.52s | 278.11ms |
| 1000x12 - 4 sources - dynamic (large) | 473.09ms | 3.63s | 280.43ms | 355.65ms | 2.07s | 3.76s |
| 1000x5 - 25 sources (wide dense) | 590.51ms | 2.64s | 410.83ms | 505.98ms | 3.70s | 3.43s |
| 5x500 - 3 sources (deep) | 256.28ms | 236.80ms | 189.53ms | 230.32ms | 1.18s | 230.71ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 384.13ms | 452.94ms | 265.88ms | 269.00ms | 1.81s | 486.31ms |

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
