# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.26s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.33s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.35s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.87s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| Test Case | mobx | state_beacon | preact_signals | alien_signals | solidart(2.0-dev) | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.42s | 150.40ms (fail) | 208.72ms | 196.61ms | 275.75ms | 215.29ms |
| broadPropagation | 4.43s | 6.24ms (fail) | 455.86ms | 354.57ms | 499.39ms | 455.03ms |
| deepPropagation | 1.57s | 138.74ms (fail) | 183.03ms | 125.70ms | 163.41ms | 176.38ms |
| diamond | 2.46s | 204.54ms (fail) | 281.96ms | 236.64ms | 352.14ms | 286.17ms |
| mux | 1.81s | 196.99ms (fail) | 388.48ms | 376.87ms | 422.18ms | 411.92ms |
| repeatedObservers | 242.64ms | 53.28ms (fail) | 40.33ms | 43.71ms | 80.63ms | 46.22ms |
| triangle | 782.32ms | 92.00ms (fail) | 99.36ms | 84.91ms | 113.81ms | 101.84ms |
| unstable | 360.27ms | 338.77ms (fail) | 74.52ms | 59.67ms | 95.11ms | 76.13ms |
| molBench | 587.52ms | 886μs | 480.86ms | 489.03ms | 499.88ms | 486.34ms |
| create_signals | 83.41ms | 62.06ms | 5.23ms | 25.67ms | 94.78ms | 25.95ms |
| comp_0to1 | 45.52ms | 56.01ms | 17.48ms | 9.12ms | 32.20ms | 11.85ms |
| comp_1to1 | 17.60ms | 56.46ms | 14.91ms | 4.26ms | 29.73ms | 28.97ms |
| comp_2to1 | 20.60ms | 38.22ms | 20.47ms | 2.29ms | 23.91ms | 10.26ms |
| comp_4to1 | 14.21ms | 16.98ms | 11.00ms | 7.67ms | 12.20ms | 2.98ms |
| comp_1000to1 | 22μs | 43μs | 7μs | 3μs | 18μs | 8μs |
| comp_1to2 | 36.26ms | 47.53ms | 27.16ms | 12.18ms | 31.76ms | 19.16ms |
| comp_1to4 | 27.13ms | 45.67ms | 30.32ms | 12.06ms | 21.75ms | 12.84ms |
| comp_1to8 | 24.03ms | 45.07ms | 7.64ms | 5.02ms | 25.97ms | 6.87ms |
| comp_1to1000 | 15.29ms | 41.07ms | 7.26ms | 3.56ms | 14.31ms | 4.53ms |
| update_1to1 | 24.56ms | 6.04ms | 8.81ms | 10.07ms | 16.70ms | 10.36ms |
| update_2to1 | 12.24ms | 3.10ms | 4.74ms | 2.22ms | 8.02ms | 4.60ms |
| update_4to1 | 7.25ms | 1.53ms | 2.24ms | 2.58ms | 4.12ms | 2.51ms |
| update_1000to1 | 69μs | 15μs | 20μs | 27μs | 40μs | 25μs |
| update_1to2 | 11.12ms | 3.01ms | 4.35ms | 2.30ms | 8.32ms | 4.59ms |
| update_1to4 | 7.01ms | 1.52ms | 2.18ms | 2.40ms | 4.15ms | 2.56ms |
| update_1to1000 | 172μs | 422μs | 809μs | 47μs | 150μs | 42μs |
| cellx1000 | 69.43ms | 5.12ms | 9.55ms | 9.19ms | 11.97ms | 9.63ms |
| cellx2500 | 276.21ms | 23.05ms | 26.20ms | 20.94ms | 33.36ms | 33.48ms |
| cellx5000 | 615.52ms | 60.71ms | 75.25ms | 44.76ms | 81.41ms | 69.05ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.02s | 249.58ms | 443.83ms | 238.77ms | 351.07ms | 514.31ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.57s | 195.90ms | 277.37ms | 181.75ms | 248.37ms | 289.66ms |
| 1000x12 - 4 sources - dynamic (large) | 1.92s | 345.79ms | 3.72s | 288.42ms | 461.84ms | 3.77s |
| 1000x5 - 25 sources (wide dense) | 3.51s | 508.63ms | 2.73s | 409.83ms | 609.09ms | 3.53s |
| 5x500 - 3 sources (deep) | 1.13s | 203.44ms | 233.29ms | 191.24ms | 252.09ms | 222.96ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.74s | 257.64ms | 453.33ms | 254.82ms | 384.99ms | 486.77ms |

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
