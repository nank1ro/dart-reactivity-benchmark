# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.33s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.40s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.45s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.60s |
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
| Test Case | preact_signals | state_beacon | solidart(2.0-dev) | signals | alien_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 209.07ms | 159.06ms (fail) | 266.66ms | 210.98ms | 192.09ms | 2.35s |
| broadPropagation | 458.52ms | 6.55ms (fail) | 482.92ms | 455.05ms | 358.42ms | 4.38s |
| deepPropagation | 181.65ms | 142.35ms (fail) | 162.24ms | 185.63ms | 131.19ms | 1.54s |
| diamond | 281.10ms | 210.07ms (fail) | 344.88ms | 287.57ms | 233.86ms | 2.42s |
| mux | 405.75ms | 191.60ms (fail) | 432.29ms | 410.50ms | 374.68ms | 1.86s |
| repeatedObservers | 40.95ms | 52.50ms (fail) | 80.70ms | 46.01ms | 43.70ms | 223.73ms |
| triangle | 99.62ms | 80.70ms (fail) | 115.01ms | 104.31ms | 84.52ms | 760.70ms |
| unstable | 75.20ms | 340.68ms (fail) | 94.67ms | 76.19ms | 59.75ms | 336.52ms |
| molBench | 485.29ms | 933μs | 499.54ms | 485.14ms | 489.08ms | 583.07ms |
| create_signals | 5.50ms | 67.53ms | 100.68ms | 26.30ms | 27.72ms | 67.38ms |
| comp_0to1 | 18.51ms | 60.19ms | 36.87ms | 12.24ms | 7.34ms | 21.70ms |
| comp_1to1 | 14.78ms | 59.04ms | 49.30ms | 22.42ms | 4.29ms | 32.30ms |
| comp_2to1 | 20.55ms | 38.90ms | 25.28ms | 8.98ms | 2.27ms | 38.11ms |
| comp_4to1 | 15.13ms | 16.83ms | 15.88ms | 2.15ms | 8.67ms | 23.77ms |
| comp_1000to1 | 9μs | 44μs | 15μs | 5μs | 5μs | 20μs |
| comp_1to2 | 20.91ms | 49.53ms | 34.31ms | 14.88ms | 14.34ms | 37.44ms |
| comp_1to4 | 33.45ms | 47.39ms | 21.64ms | 9.57ms | 9.31ms | 20.94ms |
| comp_1to8 | 7.55ms | 46.80ms | 20.39ms | 9.19ms | 5.23ms | 22.77ms |
| comp_1to1000 | 6.53ms | 41.92ms | 14.36ms | 7.48ms | 3.47ms | 15.16ms |
| update_1to1 | 9.25ms | 6.00ms | 16.59ms | 10.25ms | 9.98ms | 28.11ms |
| update_2to1 | 4.86ms | 3.21ms | 8.07ms | 4.54ms | 2.16ms | 11.64ms |
| update_4to1 | 3.66ms | 1.54ms | 4.13ms | 2.63ms | 2.56ms | 7.07ms |
| update_1000to1 | 37μs | 15μs | 39μs | 25μs | 14μs | 68μs |
| update_1to2 | 5.97ms | 3.05ms | 8.38ms | 4.49ms | 4.97ms | 14.06ms |
| update_1to4 | 2.35ms | 1.55ms | 4.08ms | 2.55ms | 2.53ms | 7.07ms |
| update_1to1000 | 790μs | 419μs | 150μs | 45μs | 45μs | 175μs |
| cellx1000 | 9.84ms | 5.37ms | 15.14ms | 9.64ms | 7.23ms | 70.83ms |
| cellx2500 | 26.43ms | 23.98ms | 38.74ms | 32.05ms | 19.46ms | 241.95ms |
| cellx5000 | 69.12ms | 61.53ms | 107.80ms | 65.83ms | 45.04ms | 555.60ms |
| 10x5 - 2 sources - read 20.0% (simple) | 448.95ms | 255.10ms | 353.47ms | 501.70ms | 238.72ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 277.60ms | 198.16ms | 248.33ms | 278.80ms | 180.35ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 3.75s | 338.46ms | 471.53ms | 3.98s | 283.73ms | 1.91s |
| 1000x5 - 25 sources (wide dense) | 2.76s | 512.71ms | 612.58ms | 3.41s | 402.96ms | 3.54s |
| 5x500 - 3 sources (deep) | 231.25ms | 208.63ms | 253.18ms | 227.02ms | 193.62ms | 1.15s |
| 100x15 - 6 sources - dynamic (very dynamic) | 463.80ms | 260.66ms | 386.17ms | 493.15ms | 265.33ms | 1.78s |

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
