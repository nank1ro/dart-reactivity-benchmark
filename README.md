# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.46s |
| 🥉 | preact_signals | 0.25 | 100.0% | 35/35 | 9.89s |
| 4 | signals | 0.24 | 100.0% | 35/35 | 11.35s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.68s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.34s |

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
| Test Case | solidart(2.0-dev) | signals | mobx | preact_signals | state_beacon | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 266.07ms | 211.71ms | 2.29s | 215.63ms | 159.74ms (fail) | 185.36ms |
| broadPropagation | 488.56ms | 478.23ms | 4.21s | 521.58ms | 6.13ms (fail) | 359.42ms |
| deepPropagation | 163.05ms | 186.48ms | 1.47s | 189.89ms | 155.21ms (fail) | 115.99ms |
| diamond | 376.81ms | 289.37ms | 2.25s | 309.73ms | 188.28ms (fail) | 265.06ms |
| mux | 427.32ms | 389.14ms | 1.73s | 385.89ms | 185.31ms (fail) | 369.45ms |
| repeatedObservers | 88.95ms | 46.36ms | 229.17ms | 41.97ms | 54.09ms (fail) | 42.87ms |
| triangle | 120.52ms | 108.19ms | 721.65ms | 109.03ms | 80.79ms (fail) | 88.88ms |
| unstable | 105.41ms | 79.08ms | 354.55ms | 73.37ms | 344.71ms (fail) | 59.65ms |
| molBench | 559.06ms | 547.21ms | 637.94ms | 546.92ms | 1.30ms | 552.04ms |
| create_signals | 97.81ms | 27.79ms | 91.47ms | 5.64ms | 61.07ms | 31.17ms |
| comp_0to1 | 38.43ms | 12.83ms | 28.05ms | 20.10ms | 53.53ms | 9.04ms |
| comp_1to1 | 48.89ms | 26.87ms | 32.37ms | 21.18ms | 54.85ms | 4.08ms |
| comp_2to1 | 41.86ms | 14.02ms | 34.04ms | 18.57ms | 37.95ms | 2.22ms |
| comp_4to1 | 14.58ms | 11.26ms | 29.31ms | 12.83ms | 17.88ms | 14.79ms |
| comp_1000to1 | 14μs | 5μs | 16μs | 4μs | 55μs | 4μs |
| comp_1to2 | 29.50ms | 25.24ms | 42.98ms | 21.47ms | 44.36ms | 11.12ms |
| comp_1to4 | 27.18ms | 7.55ms | 18.77ms | 36.17ms | 44.60ms | 14.75ms |
| comp_1to8 | 24.22ms | 6.11ms | 22.75ms | 7.62ms | 41.44ms | 4.34ms |
| comp_1to1000 | 14.56ms | 3.94ms | 14.66ms | 6.92ms | 36.51ms | 3.19ms |
| update_1to1 | 16.19ms | 9.81ms | 23.31ms | 8.48ms | 6.20ms | 4.37ms |
| update_2to1 | 8.14ms | 5.12ms | 11.42ms | 4.25ms | 3.21ms | 2.28ms |
| update_4to1 | 4.08ms | 2.44ms | 6.18ms | 2.21ms | 1.56ms | 1.13ms |
| update_1000to1 | 40μs | 25μs | 57μs | 21μs | 17μs | 11μs |
| update_1to2 | 8.40ms | 4.97ms | 11.52ms | 4.24ms | 3.13ms | 2.28ms |
| update_1to4 | 4.09ms | 2.54ms | 5.75ms | 2.15ms | 1.59ms | 1.12ms |
| update_1to1000 | 144μs | 40μs | 153μs | 564μs | 356μs | 41μs |
| cellx1000 | 13.14ms | 9.67ms | 76.20ms | 10.12ms | 5.04ms | 6.92ms |
| cellx2500 | 39.52ms | 34.34ms | 264.68ms | 28.40ms | 23.18ms | 19.62ms |
| cellx5000 | 98.91ms | 71.97ms | 639.93ms | 72.75ms | 58.34ms | 53.78ms |
| 10x5 - 2 sources - read 20.0% (simple) | 375.66ms | 490.25ms | 1.99s | 426.21ms | 257.19ms | 242.29ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 271.37ms | 271.08ms | 1.41s | 263.01ms | 207.54ms | 183.71ms |
| 1000x12 - 4 sources - dynamic (large) | 431.95ms | 3.92s | 1.78s | 3.33s | 311.37ms | 263.80ms |
| 1000x5 - 25 sources (wide dense) | 639.47ms | 3.37s | 3.43s | 2.52s | 459.17ms | 413.21ms |
| 5x500 - 3 sources (deep) | 267.35ms | 227.28ms | 1.14s | 234.21ms | 199.73ms | 189.30ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 344.00ms | 468.31ms | 1.68s | 433.57ms | 236.07ms | 235.11ms |

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
