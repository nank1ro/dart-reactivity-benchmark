# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.76s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 9.76s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.17s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.51s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.62s |
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
| Test Case | solidart | mobx | state_beacon | signals | alien_signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.19s | 2.37s | 152.70ms (fail) | 208.89ms | 196.57ms | 205.61ms |
| broadPropagation | 5.47s | 4.43s | 5.89ms (fail) | 461.11ms | 347.92ms | 455.50ms |
| deepPropagation | 2.03s | 1.58s | 139.27ms (fail) | 173.67ms | 121.78ms | 171.90ms |
| diamond | 3.44s | 2.44s | 185.52ms (fail) | 290.30ms | 244.23ms | 277.61ms |
| mux | 2.04s | 1.80s | 196.16ms (fail) | 412.24ms | 376.86ms | 422.66ms |
| repeatedObservers | 213.85ms | 237.56ms | 56.06ms (fail) | 44.91ms | 43.66ms | 41.25ms |
| triangle | 1.12s | 783.54ms | 77.37ms (fail) | 101.55ms | 86.87ms | 97.90ms |
| unstable | 342.95ms | 356.50ms | 334.97ms (fail) | 77.50ms | 60.69ms | 69.84ms |
| molBench | 1.75s | 588.30ms | 851μs | 486.51ms | 482.35ms | 484.71ms |
| create_signals | 71.25ms | 62.10ms | 72.75ms | 29.10ms | 20.19ms | 5.36ms |
| comp_0to1 | 33.76ms | 21.96ms | 51.67ms | 14.83ms | 5.06ms | 16.98ms |
| comp_1to1 | 48.68ms | 34.55ms | 52.63ms | 18.02ms | 8.79ms | 17.14ms |
| comp_2to1 | 20.28ms | 28.66ms | 33.98ms | 12.86ms | 4.29ms | 20.86ms |
| comp_4to1 | 12.00ms | 13.33ms | 17.28ms | 7.28ms | 6.75ms | 11.42ms |
| comp_1000to1 | 3.09ms | 15μs | 43μs | 5μs | 4μs | 5μs |
| comp_1to2 | 21.28ms | 36.06ms | 48.31ms | 21.04ms | 13.91ms | 17.63ms |
| comp_1to4 | 32.36ms | 19.61ms | 43.24ms | 15.81ms | 8.52ms | 22.84ms |
| comp_1to8 | 22.04ms | 23.35ms | 43.67ms | 6.93ms | 3.87ms | 7.08ms |
| comp_1to1000 | 18.57ms | 15.17ms | 40.13ms | 4.67ms | 3.54ms | 4.61ms |
| update_1to1 | 43.17ms | 27.50ms | 8.13ms | 9.40ms | 4.37ms | 8.78ms |
| update_2to1 | 21.36ms | 13.79ms | 2.90ms | 4.89ms | 2.19ms | 4.35ms |
| update_4to1 | 10.54ms | 7.11ms | 2.58ms | 2.39ms | 1.12ms | 2.20ms |
| update_1000to1 | 115μs | 70μs | 15μs | 23μs | 10μs | 21μs |
| update_1to2 | 21.45ms | 13.38ms | 3.81ms | 4.73ms | 2.17ms | 4.37ms |
| update_1to4 | 10.82ms | 6.59ms | 1.51ms | 2.35ms | 1.54ms | 2.18ms |
| update_1to1000 | 218μs | 161μs | 405μs | 45μs | 28μs | 145μs |
| cellx1000 | 153.13ms | 70.14ms | 5.20ms | 9.68ms | 8.05ms | 9.66ms |
| cellx2500 | 463.51ms | 250.13ms | 18.92ms | 31.16ms | 21.92ms | 26.51ms |
| cellx5000 | 1.13s | 551.65ms | 62.74ms | 65.59ms | 52.14ms | 70.08ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.66s (partial) | 2.01s | 239.86ms | 511.53ms | 234.54ms | 425.81ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.35s (partial) | 1.53s | 206.41ms | 285.21ms | 180.35ms | 277.56ms |
| 1000x12 - 4 sources - dynamic (large) | 4.19s (partial) | 1.85s | 345.11ms | 3.64s | 287.37ms | 3.39s |
| 1000x5 - 25 sources (wide dense) | 4.94s (partial) | 3.49s | 518.65ms | 3.51s | 449.44ms | 2.52s |
| 5x500 - 3 sources (deep) | 1.98s (partial) | 1.14s | 230.16ms | 229.29ms | 206.39ms | 221.32ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.77s (partial) | 1.71s | 265.95ms | 474.85ms | 274.35ms | 443.14ms |

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
