# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.41s |
| 🥉 | preact_signals | 0.24 | 100.0% | 35/35 | 10.31s |
| 4 | signals | 0.23 | 100.0% | 35/35 | 11.31s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.70s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.50s |

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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 214.28ms | 2.21s | 152.29ms (fail) | 184.45ms | 215.16ms | 271.11ms |
| broadPropagation | 493.37ms | 4.20s | 6.09ms (fail) | 361.65ms | 511.24ms | 491.77ms |
| deepPropagation | 179.74ms | 1.48s | 158.33ms (fail) | 128.19ms | 204.75ms | 165.56ms |
| diamond | 290.39ms | 2.21s | 193.25ms (fail) | 236.41ms | 287.81ms | 366.12ms |
| mux | 388.76ms | 1.72s | 196.72ms (fail) | 369.39ms | 388.90ms | 425.88ms |
| repeatedObservers | 47.58ms | 225.91ms | 55.73ms (fail) | 44.26ms | 42.35ms | 88.60ms |
| triangle | 106.23ms | 719.14ms | 80.97ms (fail) | 90.49ms | 105.25ms | 119.64ms |
| unstable | 76.50ms | 336.76ms | 342.19ms (fail) | 60.90ms | 72.71ms | 107.41ms |
| molBench | 548.28ms | 638.73ms | 1.05ms | 559.76ms | 548.56ms | 569.21ms |
| create_signals | 29.95ms | 71.35ms | 61.65ms | 31.80ms | 5.94ms | 91.35ms |
| comp_0to1 | 12.86ms | 15.00ms | 57.92ms | 7.01ms | 21.18ms | 27.74ms |
| comp_1to1 | 33.02ms | 46.02ms | 57.98ms | 4.11ms | 14.04ms | 43.76ms |
| comp_2to1 | 29.89ms | 27.21ms | 37.91ms | 2.27ms | 19.60ms | 44.76ms |
| comp_4to1 | 29.74ms | 26.61ms | 16.60ms | 9.26ms | 9.34ms | 4.63ms |
| comp_1000to1 | 6μs | 15μs | 51μs | 4μs | 4μs | 20μs |
| comp_1to2 | 14.59ms | 42.83ms | 44.01ms | 18.88ms | 29.20ms | 29.12ms |
| comp_1to4 | 17.37ms | 19.20ms | 43.36ms | 4.89ms | 25.87ms | 26.97ms |
| comp_1to8 | 11.75ms | 23.85ms | 41.16ms | 4.49ms | 10.05ms | 24.01ms |
| comp_1to1000 | 4.44ms | 14.88ms | 37.14ms | 3.57ms | 6.95ms | 14.27ms |
| update_1to1 | 9.52ms | 23.41ms | 6.01ms | 4.76ms | 9.59ms | 16.65ms |
| update_2to1 | 5.00ms | 11.53ms | 3.06ms | 2.42ms | 4.79ms | 8.37ms |
| update_4to1 | 2.41ms | 6.96ms | 1.56ms | 1.25ms | 2.40ms | 4.21ms |
| update_1000to1 | 23μs | 56μs | 15μs | 20μs | 23μs | 41μs |
| update_1to2 | 4.73ms | 11.61ms | 3.05ms | 2.40ms | 4.71ms | 8.53ms |
| update_1to4 | 2.46ms | 5.74ms | 1.55ms | 1.24ms | 2.42ms | 4.25ms |
| update_1to1000 | 57μs | 156μs | 356μs | 47μs | 248μs | 144μs |
| cellx1000 | 9.42ms | 96.09ms | 5.09ms | 7.05ms | 10.21ms | 11.14ms |
| cellx2500 | 26.70ms | 325.86ms | 21.60ms | 19.92ms | 43.90ms | 32.78ms |
| cellx5000 | 66.97ms | 692.62ms | 76.95ms | 44.99ms | 140.92ms | 76.99ms |
| 10x5 - 2 sources - read 20.0% (simple) | 500.41ms | 1.99s | 255.59ms | 241.74ms | 433.87ms | 379.47ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 269.33ms | 1.41s | 213.91ms | 191.96ms | 265.12ms | 271.40ms |
| 1000x12 - 4 sources - dynamic (large) | 3.79s | 1.88s | 313.88ms | 268.21ms | 3.48s | 421.19ms |
| 1000x5 - 25 sources (wide dense) | 3.40s | 3.44s | 556.16ms | 415.31ms | 2.72s | 638.47ms |
| 5x500 - 3 sources (deep) | 231.16ms | 1.14s | 206.27ms | 192.19ms | 234.62ms | 281.95ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 466.23ms | 1.63s | 248.10ms | 236.59ms | 439.31ms | 339.62ms |

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
