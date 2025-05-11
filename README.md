# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.31s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.01s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.24s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.25s |
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
| Test Case | preact_signals | mobx | state_beacon | solidart(2.0-dev) | alien_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 204.90ms | 2.30s | 152.22ms (fail) | 275.25ms | 187.86ms | 207.67ms |
| broadPropagation | 456.01ms | 4.23s | 6.47ms (fail) | 500.91ms | 353.95ms | 470.36ms |
| deepPropagation | 181.74ms | 1.50s | 142.31ms (fail) | 177.35ms | 122.08ms | 178.09ms |
| diamond | 286.55ms | 2.38s | 187.31ms (fail) | 347.97ms | 239.23ms | 289.08ms |
| mux | 383.88ms | 1.84s | 192.60ms (fail) | 437.59ms | 372.57ms | 408.41ms |
| repeatedObservers | 38.18ms | 222.84ms | 52.21ms (fail) | 77.78ms | 45.52ms | 48.38ms |
| triangle | 100.25ms | 774.19ms | 76.75ms (fail) | 116.75ms | 85.79ms | 101.38ms |
| unstable | 70.34ms | 344.64ms | 336.92ms (fail) | 93.85ms | 63.04ms | 75.25ms |
| molBench | 492.25ms | 580.07ms | 1.10ms | 493.22ms | 493.28ms | 488.57ms |
| create_signals | 5.25ms | 74.05ms | 64.25ms | 52.40ms | 27.59ms | 25.62ms |
| comp_0to1 | 17.57ms | 26.90ms | 53.64ms | 28.87ms | 7.99ms | 10.95ms |
| comp_1to1 | 14.25ms | 37.76ms | 58.62ms | 45.80ms | 4.23ms | 28.83ms |
| comp_2to1 | 16.19ms | 23.25ms | 37.53ms | 36.78ms | 2.24ms | 9.80ms |
| comp_4to1 | 13.43ms | 18.60ms | 16.66ms | 4.53ms | 7.77ms | 8.76ms |
| comp_1000to1 | 4μs | 17μs | 84μs | 17μs | 4μs | 5μs |
| comp_1to2 | 21.25ms | 33.35ms | 49.31ms | 26.85ms | 10.47ms | 18.88ms |
| comp_1to4 | 31.15ms | 29.70ms | 45.93ms | 24.28ms | 11.85ms | 12.81ms |
| comp_1to8 | 8.85ms | 22.59ms | 45.18ms | 23.82ms | 4.93ms | 7.29ms |
| comp_1to1000 | 7.00ms | 15.42ms | 38.97ms | 15.06ms | 3.52ms | 4.54ms |
| update_1to1 | 8.35ms | 22.73ms | 5.73ms | 16.30ms | 11.36ms | 9.27ms |
| update_2to1 | 4.14ms | 12.05ms | 3.30ms | 7.96ms | 5.03ms | 4.59ms |
| update_4to1 | 2.13ms | 5.63ms | 1.44ms | 4.08ms | 2.76ms | 2.35ms |
| update_1000to1 | 20μs | 68μs | 15μs | 40μs | 24μs | 23μs |
| update_1to2 | 4.13ms | 12.25ms | 2.95ms | 8.13ms | 5.63ms | 4.91ms |
| update_1to4 | 2.10ms | 5.68ms | 1.43ms | 4.06ms | 2.45ms | 2.32ms |
| update_1to1000 | 766μs | 198μs | 410μs | 151μs | 48μs | 44μs |
| cellx1000 | 10.28ms | 88.17ms | 5.41ms | 12.00ms | 7.53ms | 10.11ms |
| cellx2500 | 27.96ms | 235.05ms | 25.35ms | 38.62ms | 23.49ms | 33.62ms |
| cellx5000 | 90.04ms | 586.64ms | 85.77ms | 147.90ms | 58.17ms | 74.17ms |
| 10x5 - 2 sources - read 20.0% (simple) | 441.10ms | 1.99s | 242.10ms | 348.16ms | 232.17ms | 516.15ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 273.01ms | 1.54s | 202.37ms | 244.03ms | 177.13ms | 282.22ms |
| 1000x12 - 4 sources - dynamic (large) | 3.51s | 1.82s | 362.20ms | 471.99ms | 285.10ms | 3.75s |
| 1000x5 - 25 sources (wide dense) | 2.61s | 3.60s | 488.10ms | 597.45ms | 411.84ms | 3.43s |
| 5x500 - 3 sources (deep) | 231.10ms | 1.15s | 209.44ms | 258.51ms | 190.41ms | 229.62ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 450.48ms | 1.74s | 260.03ms | 376.34ms | 259.66ms | 488.29ms |

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
