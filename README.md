# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.70s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 10.00s |
| 🥉 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.26s |
| 4 | signals | 0.28 | 100.0% | 35/35 | 11.15s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.16s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.44s |

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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 273.47ms | 208.21ms | 2.29s | 185.22ms | 209.47ms | 158.29ms (fail) |
| broadPropagation | 498.10ms | 463.75ms | 4.72s | 354.62ms | 463.49ms | 6.96ms (fail) |
| deepPropagation | 175.94ms | 176.10ms | 1.54s | 125.38ms | 177.18ms | 138.77ms (fail) |
| diamond | 351.61ms | 280.88ms | 2.56s | 236.27ms | 283.94ms | 209.26ms (fail) |
| mux | 436.96ms | 380.92ms | 1.88s | 371.03ms | 412.73ms | 189.86ms (fail) |
| repeatedObservers | 80.98ms | 38.45ms | 226.53ms | 44.94ms | 46.77ms | 54.76ms (fail) |
| triangle | 118.88ms | 99.24ms | 795.81ms | 84.98ms | 107.54ms | 79.97ms (fail) |
| unstable | 93.38ms | 70.53ms | 369.32ms | 61.10ms | 72.87ms | 341.75ms (fail) |
| molBench | 493.92ms | 490.61ms | 591.25ms | 489.91ms | 488.75ms | 1.31ms |
| create_signals | 66.05ms | 4.63ms | 88.12ms | 26.45ms | 24.88ms | 58.39ms |
| comp_0to1 | 25.36ms | 17.34ms | 27.30ms | 11.23ms | 11.38ms | 53.29ms |
| comp_1to1 | 47.83ms | 14.28ms | 50.38ms | 10.19ms | 40.99ms | 53.40ms |
| comp_2to1 | 20.18ms | 10.56ms | 33.10ms | 7.11ms | 7.72ms | 35.70ms |
| comp_4to1 | 13.93ms | 9.69ms | 31.71ms | 9.04ms | 2.81ms | 16.24ms |
| comp_1000to1 | 19μs | 4μs | 15μs | 4μs | 5μs | 42μs |
| comp_1to2 | 38.74ms | 28.98ms | 38.48ms | 14.03ms | 12.43ms | 48.27ms |
| comp_1to4 | 22.87ms | 38.46ms | 31.99ms | 8.32ms | 13.56ms | 43.98ms |
| comp_1to8 | 25.11ms | 5.79ms | 21.04ms | 3.77ms | 11.17ms | 43.23ms |
| comp_1to1000 | 15.03ms | 5.46ms | 15.02ms | 3.43ms | 4.49ms | 38.11ms |
| update_1to1 | 16.14ms | 8.12ms | 21.77ms | 11.22ms | 9.19ms | 5.73ms |
| update_2to1 | 7.99ms | 4.10ms | 11.18ms | 5.00ms | 4.55ms | 2.87ms |
| update_4to1 | 4.04ms | 2.05ms | 5.47ms | 2.79ms | 2.34ms | 1.43ms |
| update_1000to1 | 40μs | 20μs | 65μs | 10μs | 23μs | 15μs |
| update_1to2 | 7.93ms | 4.05ms | 12.38ms | 5.22ms | 4.92ms | 2.93ms |
| update_1to4 | 4.02ms | 2.06ms | 5.74ms | 2.43ms | 2.33ms | 1.44ms |
| update_1to1000 | 160μs | 161μs | 175μs | 48μs | 42μs | 382μs |
| cellx1000 | 12.03ms | 9.76ms | 94.94ms | 7.34ms | 9.52ms | 5.19ms |
| cellx2500 | 33.72ms | 25.89ms | 263.20ms | 19.20ms | 25.16ms | 22.84ms |
| cellx5000 | 80.60ms | 75.72ms | 628.84ms | 41.47ms | 60.76ms | 66.62ms |
| 10x5 - 2 sources - read 20.0% (simple) | 349.21ms | 442.62ms | 2.01s | 236.57ms | 508.08ms | 248.00ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 250.51ms | 271.56ms | 1.53s | 175.66ms | 278.84ms | 205.41ms |
| 1000x12 - 4 sources - dynamic (large) | 461.80ms | 3.53s | 1.87s | 282.00ms | 3.75s | 342.12ms |
| 1000x5 - 25 sources (wide dense) | 590.87ms | 2.60s | 3.53s | 407.48ms | 3.40s | 502.24ms |
| 5x500 - 3 sources (deep) | 257.73ms | 231.32ms | 1.16s | 187.54ms | 229.51ms | 204.77ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 384.26ms | 448.90ms | 1.71s | 265.13ms | 477.83ms | 258.31ms |

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
