# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.39s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.24s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.53s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.61s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.41s |

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
| avoidablePropagation | 201.12ms | 150.78ms (fail) | 263.37ms | 212.94ms | 198.33ms | 2.34s |
| broadPropagation | 457.03ms | 6.25ms (fail) | 505.81ms | 464.41ms | 357.52ms | 4.33s |
| deepPropagation | 176.47ms | 137.83ms (fail) | 166.80ms | 175.16ms | 125.48ms | 1.55s |
| diamond | 282.19ms | 205.49ms (fail) | 346.11ms | 281.96ms | 234.14ms | 2.41s |
| mux | 387.00ms | 194.28ms (fail) | 459.70ms | 404.01ms | 378.88ms | 1.86s |
| repeatedObservers | 40.90ms | 52.49ms (fail) | 81.98ms | 46.30ms | 43.71ms | 236.32ms |
| triangle | 98.67ms | 79.11ms (fail) | 118.58ms | 112.61ms | 85.41ms | 769.19ms |
| unstable | 73.99ms | 351.16ms (fail) | 95.09ms | 74.83ms | 60.01ms | 343.42ms |
| molBench | 488.55ms | 987μs | 500.68ms | 485.54ms | 489.46ms | 585.77ms |
| create_signals | 5.48ms | 71.33ms | 87.46ms | 25.12ms | 27.20ms | 92.04ms |
| comp_0to1 | 18.64ms | 60.78ms | 41.19ms | 11.54ms | 7.91ms | 16.82ms |
| comp_1to1 | 11.29ms | 57.12ms | 34.15ms | 27.79ms | 4.21ms | 54.35ms |
| comp_2to1 | 11.40ms | 37.72ms | 34.45ms | 9.42ms | 2.28ms | 23.18ms |
| comp_4to1 | 18.48ms | 16.45ms | 18.78ms | 7.43ms | 8.40ms | 31.82ms |
| comp_1000to1 | 6μs | 46μs | 26μs | 5μs | 5μs | 16μs |
| comp_1to2 | 32.30ms | 47.87ms | 34.28ms | 18.46ms | 14.39ms | 35.34ms |
| comp_1to4 | 27.60ms | 46.15ms | 22.12ms | 11.12ms | 6.09ms | 19.05ms |
| comp_1to8 | 7.29ms | 45.08ms | 22.98ms | 6.39ms | 7.07ms | 21.38ms |
| comp_1to1000 | 6.74ms | 41.20ms | 14.36ms | 4.42ms | 3.16ms | 16.65ms |
| update_1to1 | 8.28ms | 6.01ms | 16.37ms | 10.15ms | 9.98ms | 25.39ms |
| update_2to1 | 4.34ms | 3.13ms | 8.03ms | 4.58ms | 2.14ms | 13.05ms |
| update_4to1 | 2.28ms | 1.54ms | 4.11ms | 2.55ms | 2.51ms | 6.97ms |
| update_1000to1 | 20μs | 15μs | 40μs | 25μs | 10μs | 66μs |
| update_1to2 | 4.07ms | 3.04ms | 8.37ms | 4.47ms | 4.96ms | 12.71ms |
| update_1to4 | 2.10ms | 1.54ms | 4.09ms | 2.72ms | 2.40ms | 6.37ms |
| update_1to1000 | 846μs | 408μs | 150μs | 43μs | 47μs | 172μs |
| cellx1000 | 10.16ms | 5.15ms | 13.39ms | 10.03ms | 7.16ms | 80.97ms |
| cellx2500 | 30.40ms | 22.98ms | 42.37ms | 34.32ms | 19.20ms | 276.44ms |
| cellx5000 | 100.62ms | 50.36ms | 107.58ms | 80.56ms | 40.96ms | 691.95ms |
| 10x5 - 2 sources - read 20.0% (simple) | 508.27ms | 234.64ms | 355.33ms | 515.22ms | 242.56ms | 2.04s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 308.08ms | 195.63ms | 253.57ms | 279.83ms | 180.99ms | 1.54s |
| 1000x12 - 4 sources - dynamic (large) | 3.74s | 335.07ms | 474.73ms | 3.77s | 281.23ms | 1.85s |
| 1000x5 - 25 sources (wide dense) | 2.75s | 483.77ms | 614.88ms | 3.44s | 405.47ms | 3.49s |
| 5x500 - 3 sources (deep) | 248.00ms | 204.19ms | 250.39ms | 224.62ms | 193.36ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 471.48ms | 261.11ms | 384.48ms | 480.17ms | 260.67ms | 1.71s |

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
