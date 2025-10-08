# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.72s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 10.32s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.38s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.31s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.51s |
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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 213.15ms | 194.12ms | 159.82ms (fail) | 262.54ms | 200.93ms | 2.37s |
| broadPropagation | 454.02ms | 353.31ms | 6.37ms (fail) | 490.09ms | 460.08ms | 4.36s |
| deepPropagation | 176.24ms | 130.32ms | 140.92ms (fail) | 162.10ms | 177.62ms | 1.53s |
| diamond | 287.13ms | 238.81ms | 188.56ms (fail) | 346.63ms | 286.12ms | 2.41s |
| mux | 422.06ms | 379.64ms | 194.08ms (fail) | 429.01ms | 390.63ms | 1.81s |
| repeatedObservers | 46.69ms | 43.94ms | 52.47ms (fail) | 80.56ms | 40.25ms | 232.43ms |
| triangle | 100.34ms | 86.45ms | 80.56ms (fail) | 113.88ms | 99.77ms | 779.56ms |
| unstable | 76.06ms | 59.95ms | 337.93ms (fail) | 95.09ms | 75.15ms | 344.52ms |
| molBench | 486.33ms | 489.19ms | 983μs | 499.88ms | 488.25ms | 581.75ms |
| create_signals | 26.45ms | 28.98ms | 68.01ms | 85.40ms | 5.21ms | 71.12ms |
| comp_0to1 | 12.08ms | 7.53ms | 59.85ms | 40.80ms | 22.02ms | 28.19ms |
| comp_1to1 | 29.29ms | 4.12ms | 58.23ms | 41.47ms | 12.48ms | 43.31ms |
| comp_2to1 | 9.38ms | 2.27ms | 39.75ms | 24.77ms | 17.55ms | 22.55ms |
| comp_4to1 | 2.13ms | 7.81ms | 17.71ms | 12.32ms | 11.58ms | 13.93ms |
| comp_1000to1 | 5μs | 4μs | 46μs | 15μs | 5μs | 16μs |
| comp_1to2 | 21.40ms | 9.65ms | 49.47ms | 42.16ms | 21.91ms | 37.11ms |
| comp_1to4 | 15.40ms | 13.36ms | 50.55ms | 21.40ms | 25.87ms | 25.63ms |
| comp_1to8 | 14.08ms | 4.81ms | 47.56ms | 20.91ms | 7.06ms | 25.24ms |
| comp_1to1000 | 4.53ms | 3.43ms | 42.79ms | 14.31ms | 5.71ms | 15.39ms |
| update_1to1 | 10.22ms | 10.05ms | 6.01ms | 16.40ms | 8.28ms | 28.18ms |
| update_2to1 | 4.64ms | 2.16ms | 3.10ms | 11.82ms | 4.38ms | 13.60ms |
| update_4to1 | 2.55ms | 2.48ms | 1.54ms | 4.17ms | 2.08ms | 7.44ms |
| update_1000to1 | 25μs | 26μs | 15μs | 40μs | 20μs | 68μs |
| update_1to2 | 4.55ms | 5.00ms | 3.02ms | 8.37ms | 4.07ms | 14.00ms |
| update_1to4 | 2.54ms | 2.41ms | 1.54ms | 4.13ms | 2.08ms | 6.95ms |
| update_1to1000 | 44μs | 44μs | 423μs | 150μs | 142μs | 172μs |
| cellx1000 | 10.00ms | 7.22ms | 5.36ms | 14.69ms | 10.00ms | 83.85ms |
| cellx2500 | 38.38ms | 20.10ms | 25.59ms | 51.81ms | 29.79ms | 257.15ms |
| cellx5000 | 102.85ms | 48.44ms | 80.83ms | 166.21ms | 81.59ms | 581.27ms |
| 10x5 - 2 sources - read 20.0% (simple) | 504.97ms | 237.79ms | 239.91ms | 347.90ms | 453.88ms | 2.00s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 282.63ms | 179.17ms | 194.87ms | 250.88ms | 275.76ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 3.67s | 285.28ms | 346.63ms | 462.42ms | 3.69s | 1.91s |
| 1000x5 - 25 sources (wide dense) | 3.58s | 411.91ms | 488.26ms | 607.61ms | 2.73s | 3.57s |
| 5x500 - 3 sources (deep) | 220.72ms | 188.29ms | 203.92ms | 252.30ms | 231.64ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 484.00ms | 266.74ms | 257.65ms | 398.10ms | 455.54ms | 1.68s |

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
