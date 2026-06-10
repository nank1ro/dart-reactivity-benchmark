# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 2.93s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 7.73s |
| 🥉 | solidart(2.0-dev) | 0.24 | 100.0% | 35/35 | 4.34s |
| 4 | signals | 0.24 | 100.0% | 35/35 | 8.80s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 21.02s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 2.68s |

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
| Test Case | preact_signals | state_beacon | signals | alien_signals | mobx | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 166.92ms | 123.81ms (fail) | 163.48ms | 143.09ms | 1.76s | 206.19ms |
| broadPropagation | 402.98ms | 5.09ms (fail) | 366.23ms | 275.13ms | 3.25s | 383.41ms |
| deepPropagation | 148.38ms | 120.31ms (fail) | 140.86ms | 91.55ms | 1.14s | 132.68ms |
| diamond | 221.47ms | 147.42ms (fail) | 223.78ms | 205.61ms | 1.75s | 291.04ms |
| mux | 306.25ms | 143.57ms (fail) | 303.19ms | 278.17ms | 1.34s | 327.48ms |
| repeatedObservers | 33.54ms | 42.20ms (fail) | 36.83ms | 33.59ms | 177.04ms | 68.84ms |
| triangle | 82.33ms | 62.11ms (fail) | 83.42ms | 66.87ms | 566.19ms | 94.97ms |
| unstable | 56.96ms | 267.84ms (fail) | 61.89ms | 47.59ms | 264.24ms | 82.61ms |
| molBench | 424.60ms | 786μs | 424.88ms | 428.43ms | 497.89ms | 433.71ms |
| create_signals | 4.69ms | 52.00ms | 24.38ms | 22.96ms | 84.63ms | 84.96ms |
| comp_0to1 | 16.18ms | 44.05ms | 11.07ms | 8.06ms | 33.52ms | 32.17ms |
| comp_1to1 | 17.40ms | 50.91ms | 30.53ms | 3.25ms | 13.28ms | 47.28ms |
| comp_2to1 | 15.73ms | 32.04ms | 11.98ms | 1.74ms | 27.07ms | 39.80ms |
| comp_4to1 | 10.39ms | 13.30ms | 7.56ms | 10.44ms | 24.67ms | 14.08ms |
| comp_1000to1 | 3μs | 31μs | 4μs | 3μs | 13μs | 12μs |
| comp_1to2 | 25.60ms | 35.01ms | 20.31ms | 14.35ms | 32.77ms | 24.22ms |
| comp_1to4 | 19.30ms | 34.85ms | 10.69ms | 5.56ms | 19.16ms | 21.91ms |
| comp_1to8 | 7.89ms | 32.27ms | 5.38ms | 5.26ms | 19.92ms | 20.63ms |
| comp_1to1000 | 2.62ms | 28.07ms | 3.15ms | 2.71ms | 11.53ms | 11.39ms |
| update_1to1 | 7.08ms | 4.85ms | 7.74ms | 3.51ms | 18.25ms | 13.01ms |
| update_2to1 | 3.31ms | 2.48ms | 3.97ms | 1.74ms | 8.87ms | 6.46ms |
| update_4to1 | 1.63ms | 1.26ms | 1.93ms | 869μs | 4.56ms | 3.29ms |
| update_1000to1 | 16μs | 13μs | 20μs | 8μs | 43μs | 32μs |
| update_1to2 | 3.26ms | 2.42ms | 4.01ms | 1.72ms | 8.80ms | 6.71ms |
| update_1to4 | 1.62ms | 1.25ms | 2.06ms | 847μs | 4.45ms | 3.27ms |
| update_1to1000 | 27μs | 290μs | 31μs | 22μs | 133μs | 111μs |
| cellx1000 | 10.32ms | 4.14ms | 7.84ms | 5.46ms | 68.78ms | 10.94ms |
| cellx2500 | 26.13ms | 23.13ms | 30.36ms | 18.29ms | 242.67ms | 38.72ms |
| cellx5000 | 79.86ms | 80.89ms | 92.93ms | 53.12ms | 606.46ms | 135.12ms |
| 10x5 - 2 sources - read 20.0% (simple) | 340.27ms | 193.73ms | 380.13ms | 189.34ms | 1.55s | 291.65ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 205.18ms | 159.94ms | 211.30ms | 142.14ms | 1.10s | 210.26ms |
| 1000x12 - 4 sources - dynamic (large) | 2.58s | 262.25ms | 2.97s | 213.50ms | 1.45s | 339.88ms |
| 1000x5 - 25 sources (wide dense) | 1.98s | 359.34ms | 2.61s | 319.89ms | 2.70s | 493.96ms |
| 5x500 - 3 sources (deep) | 188.08ms | 160.67ms | 186.16ms | 146.65ms | 923.34ms | 206.20ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 341.78ms | 186.68ms | 358.61ms | 184.27ms | 1.31s | 267.12ms |

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
