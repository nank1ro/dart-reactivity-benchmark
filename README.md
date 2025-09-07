# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.32s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.24s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.45s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.39s |
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
| Test Case | preact_signals | state_beacon | solidart(2.0-dev) | signals | alien_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 201.49ms | 148.21ms (fail) | 270.73ms | 212.87ms | 195.25ms | 2.35s |
| broadPropagation | 468.42ms | 6.63ms (fail) | 489.32ms | 464.07ms | 352.68ms | 4.30s |
| deepPropagation | 178.97ms | 144.52ms (fail) | 165.41ms | 182.26ms | 129.09ms | 1.55s |
| diamond | 280.21ms | 185.75ms (fail) | 353.19ms | 282.72ms | 235.36ms | 2.41s |
| mux | 392.40ms | 194.68ms (fail) | 428.92ms | 407.87ms | 381.02ms | 1.84s |
| repeatedObservers | 40.38ms | 52.56ms (fail) | 82.39ms | 45.94ms | 43.80ms | 232.58ms |
| triangle | 102.21ms | 77.36ms (fail) | 114.84ms | 100.16ms | 86.05ms | 778.06ms |
| unstable | 74.23ms | 342.76ms (fail) | 95.56ms | 76.30ms | 60.70ms | 341.62ms |
| molBench | 489.17ms | 1.29ms | 498.91ms | 485.15ms | 490.29ms | 584.49ms |
| create_signals | 5.34ms | 61.91ms | 104.14ms | 25.66ms | 28.50ms | 74.88ms |
| comp_0to1 | 17.55ms | 56.71ms | 33.42ms | 11.76ms | 7.44ms | 22.24ms |
| comp_1to1 | 10.85ms | 57.60ms | 49.63ms | 18.69ms | 4.33ms | 17.69ms |
| comp_2to1 | 11.78ms | 46.15ms | 44.04ms | 9.10ms | 2.22ms | 9.00ms |
| comp_4to1 | 8.66ms | 18.77ms | 19.89ms | 9.11ms | 7.61ms | 30.17ms |
| comp_1000to1 | 23μs | 45μs | 15μs | 8μs | 3μs | 18μs |
| comp_1to2 | 24.95ms | 50.81ms | 40.10ms | 16.90ms | 11.36ms | 35.06ms |
| comp_1to4 | 21.29ms | 50.31ms | 20.47ms | 11.94ms | 15.75ms | 19.46ms |
| comp_1to8 | 9.38ms | 46.72ms | 20.77ms | 7.09ms | 5.31ms | 21.57ms |
| comp_1to1000 | 9.85ms | 42.34ms | 13.95ms | 4.48ms | 3.59ms | 15.46ms |
| update_1to1 | 8.36ms | 6.00ms | 16.36ms | 10.04ms | 10.08ms | 22.35ms |
| update_2to1 | 4.48ms | 3.10ms | 8.01ms | 4.53ms | 2.73ms | 11.34ms |
| update_4to1 | 2.09ms | 1.51ms | 4.07ms | 2.60ms | 2.47ms | 6.12ms |
| update_1000to1 | 20μs | 15μs | 39μs | 25μs | 26μs | 57μs |
| update_1to2 | 4.11ms | 3.03ms | 8.38ms | 4.52ms | 4.99ms | 11.05ms |
| update_1to4 | 2.10ms | 1.50ms | 4.14ms | 2.56ms | 2.43ms | 5.45ms |
| update_1to1000 | 1.95ms | 426μs | 172μs | 44μs | 48μs | 172μs |
| cellx1000 | 9.76ms | 6.47ms | 14.44ms | 9.81ms | 8.74ms | 74.77ms |
| cellx2500 | 26.72ms | 24.21ms | 33.72ms | 32.80ms | 19.67ms | 254.83ms |
| cellx5000 | 73.47ms | 88.47ms | 76.94ms | 65.41ms | 45.94ms | 569.28ms |
| 10x5 - 2 sources - read 20.0% (simple) | 445.21ms | 239.38ms | 350.87ms | 508.38ms | 230.90ms | 2.04s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 274.53ms | 195.61ms | 254.91ms | 280.41ms | 179.10ms | 1.51s |
| 1000x12 - 4 sources - dynamic (large) | 3.80s | 343.40ms | 461.89ms | 3.76s | 281.01ms | 1.90s |
| 1000x5 - 25 sources (wide dense) | 2.74s | 504.33ms | 602.30ms | 3.47s | 404.75ms | 3.51s |
| 5x500 - 3 sources (deep) | 232.58ms | 202.87ms | 251.57ms | 224.28ms | 191.66ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 465.83ms | 260.95ms | 386.72ms | 488.62ms | 264.79ms | 1.70s |

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
