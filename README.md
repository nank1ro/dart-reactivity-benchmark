# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.31s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.35s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.49s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.13s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.47s |

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
| avoidablePropagation | 211.96ms | 194.44ms | 147.64ms (fail) | 265.12ms | 200.80ms | 2.41s |
| broadPropagation | 476.94ms | 364.47ms | 6.34ms (fail) | 501.03ms | 459.60ms | 4.58s |
| deepPropagation | 177.87ms | 129.42ms | 140.19ms (fail) | 164.07ms | 176.99ms | 1.59s |
| diamond | 283.20ms | 239.91ms | 208.79ms (fail) | 353.80ms | 279.50ms | 2.47s |
| mux | 407.83ms | 380.74ms | 195.51ms (fail) | 432.98ms | 392.85ms | 1.84s |
| repeatedObservers | 47.23ms | 44.27ms | 52.34ms (fail) | 81.02ms | 41.48ms | 234.81ms |
| triangle | 101.42ms | 86.56ms | 77.57ms (fail) | 113.81ms | 98.88ms | 800.06ms |
| unstable | 77.82ms | 60.81ms | 342.91ms (fail) | 94.70ms | 74.45ms | 349.22ms |
| molBench | 485.05ms | 490.76ms | 1.25ms | 499.67ms | 487.20ms | 588.93ms |
| create_signals | 26.00ms | 20.83ms | 63.14ms | 75.56ms | 4.69ms | 60.26ms |
| comp_0to1 | 11.90ms | 7.50ms | 60.36ms | 25.94ms | 17.79ms | 19.65ms |
| comp_1to1 | 27.64ms | 4.18ms | 63.24ms | 44.61ms | 11.19ms | 31.62ms |
| comp_2to1 | 9.21ms | 2.27ms | 41.49ms | 38.36ms | 20.42ms | 20.47ms |
| comp_4to1 | 2.04ms | 9.95ms | 17.67ms | 17.43ms | 14.03ms | 14.97ms |
| comp_1000to1 | 4μs | 4μs | 44μs | 19μs | 4μs | 16μs |
| comp_1to2 | 22.36ms | 12.37ms | 51.14ms | 26.78ms | 18.24ms | 31.11ms |
| comp_1to4 | 9.23ms | 13.15ms | 51.85ms | 20.80ms | 36.29ms | 31.14ms |
| comp_1to8 | 8.99ms | 4.14ms | 46.37ms | 24.32ms | 8.13ms | 25.03ms |
| comp_1to1000 | 6.95ms | 3.22ms | 40.93ms | 15.14ms | 6.15ms | 15.81ms |
| update_1to1 | 10.22ms | 10.05ms | 6.05ms | 16.38ms | 8.38ms | 28.30ms |
| update_2to1 | 4.58ms | 2.15ms | 4.42ms | 8.11ms | 4.39ms | 13.43ms |
| update_4to1 | 2.64ms | 2.47ms | 1.55ms | 4.12ms | 2.09ms | 7.11ms |
| update_1000to1 | 25μs | 18μs | 15μs | 40μs | 21μs | 69μs |
| update_1to2 | 4.49ms | 4.96ms | 3.05ms | 8.66ms | 4.06ms | 13.52ms |
| update_1to4 | 2.51ms | 2.44ms | 1.56ms | 4.11ms | 2.11ms | 7.04ms |
| update_1to1000 | 43μs | 48μs | 407μs | 155μs | 186μs | 174μs |
| cellx1000 | 9.81ms | 9.00ms | 5.25ms | 14.15ms | 9.69ms | 75.19ms |
| cellx2500 | 33.86ms | 20.55ms | 24.85ms | 45.42ms | 29.24ms | 266.10ms |
| cellx5000 | 67.77ms | 44.44ms | 67.24ms | 95.97ms | 78.94ms | 599.86ms |
| 10x5 - 2 sources - read 20.0% (simple) | 507.28ms | 237.30ms | 239.88ms | 351.58ms | 521.18ms | 2.11s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.88ms | 175.38ms | 197.52ms | 247.99ms | 291.13ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 3.74s | 280.75ms | 342.56ms | 462.79ms | 3.73s | 1.97s |
| 1000x5 - 25 sources (wide dense) | 3.59s | 406.56ms | 498.12ms | 610.49ms | 2.75s | 3.48s |
| 5x500 - 3 sources (deep) | 221.92ms | 192.75ms | 204.75ms | 253.44ms | 246.70ms | 1.17s |
| 100x15 - 6 sources - dynamic (very dynamic) | 482.54ms | 260.03ms | 261.59ms | 387.53ms | 469.89ms | 1.73s |

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
