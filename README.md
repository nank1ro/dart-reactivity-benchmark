# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.16s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.45s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.17s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.53s |
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
| Test Case | solidart(2.0-dev) | alien_signals | state_beacon | preact_signals | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 273.52ms | 199.69ms | 147.85ms (fail) | 209.29ms | 2.23s | 203.95ms |
| broadPropagation | 495.57ms | 355.54ms | 6.43ms (fail) | 462.42ms | 4.33s | 469.53ms |
| deepPropagation | 166.45ms | 129.17ms | 154.64ms (fail) | 174.87ms | 1.54s | 175.02ms |
| diamond | 340.50ms | 244.36ms | 184.09ms (fail) | 295.19ms | 2.28s | 285.51ms |
| mux | 423.81ms | 362.54ms | 182.54ms (fail) | 377.58ms | 1.76s | 406.32ms |
| repeatedObservers | 80.51ms | 44.73ms | 55.59ms (fail) | 41.96ms | 222.70ms | 45.62ms |
| triangle | 113.45ms | 88.41ms | 75.81ms (fail) | 99.71ms | 763.89ms | 103.88ms |
| unstable | 95.52ms | 61.46ms | 335.21ms (fail) | 71.73ms | 338.31ms | 76.10ms |
| molBench | 488.80ms | 481.93ms | 1.02ms | 496.47ms | 581.61ms | 493.55ms |
| create_signals | 74.15ms | 26.81ms | 62.65ms | 5.32ms | 81.83ms | 31.83ms |
| comp_0to1 | 25.05ms | 7.23ms | 54.30ms | 17.72ms | 15.26ms | 12.27ms |
| comp_1to1 | 38.02ms | 4.32ms | 57.39ms | 12.34ms | 52.77ms | 27.95ms |
| comp_2to1 | 24.21ms | 2.29ms | 37.00ms | 18.59ms | 22.57ms | 9.44ms |
| comp_4to1 | 4.71ms | 10.51ms | 17.03ms | 7.61ms | 17.14ms | 2.13ms |
| comp_1000to1 | 15μs | 4μs | 42μs | 4μs | 24μs | 5μs |
| comp_1to2 | 30.74ms | 11.05ms | 46.04ms | 16.58ms | 35.73ms | 13.51ms |
| comp_1to4 | 20.47ms | 13.03ms | 44.95ms | 26.31ms | 20.42ms | 11.91ms |
| comp_1to8 | 21.55ms | 4.15ms | 44.00ms | 7.17ms | 24.43ms | 6.79ms |
| comp_1to1000 | 14.14ms | 3.19ms | 39.80ms | 4.31ms | 14.76ms | 4.42ms |
| update_1to1 | 15.65ms | 4.68ms | 9.27ms | 9.16ms | 21.01ms | 8.94ms |
| update_2to1 | 7.91ms | 2.35ms | 2.82ms | 4.61ms | 10.42ms | 4.49ms |
| update_4to1 | 3.92ms | 1.23ms | 2.35ms | 2.40ms | 5.53ms | 2.29ms |
| update_1000to1 | 39μs | 11μs | 14μs | 23μs | 51μs | 51μs |
| update_1to2 | 8.12ms | 2.35ms | 4.11ms | 4.64ms | 10.42ms | 4.49ms |
| update_1to4 | 3.95ms | 1.21ms | 1.47ms | 2.49ms | 5.27ms | 2.30ms |
| update_1to1000 | 143μs | 48μs | 397μs | 144μs | 154μs | 43μs |
| cellx1000 | 11.31ms | 7.37ms | 5.50ms | 9.84ms | 72.55ms | 9.90ms |
| cellx2500 | 30.41ms | 20.47ms | 32.37ms | 25.68ms | 247.65ms | 35.10ms |
| cellx5000 | 67.96ms | 46.90ms | 87.63ms | 63.49ms | 563.80ms | 79.32ms |
| 10x5 - 2 sources - read 20.0% (simple) | 345.13ms | 246.42ms | 238.46ms | 455.68ms | 1.99s | 497.77ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 248.34ms | 186.47ms | 199.29ms | 274.17ms | 1.47s | 277.37ms |
| 1000x12 - 4 sources - dynamic (large) | 454.76ms | 282.31ms | 347.98ms | 3.76s | 1.75s | 3.86s |
| 1000x5 - 25 sources (wide dense) | 598.45ms | 415.88ms | 516.88ms | 2.80s | 3.30s | 3.31s |
| 5x500 - 3 sources (deep) | 252.66ms | 190.92ms | 210.42ms | 234.15ms | 1.11s | 224.24ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 383.90ms | 261.64ms | 257.79ms | 454.37ms | 1.66s | 477.74ms |

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
