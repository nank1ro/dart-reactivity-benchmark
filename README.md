# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.72s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.43s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 9.96s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.64s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.42s |
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
| Test Case | alien_signals | mobx | solidart | state_beacon | preact_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 184.92ms | 2.32s | 2.19s | 156.94ms (fail) | 196.81ms | 211.43ms |
| broadPropagation | 351.90ms | 4.23s | 5.32s | 6.75ms (fail) | 459.71ms | 467.19ms |
| deepPropagation | 124.54ms | 1.53s | 1.99s | 140.90ms (fail) | 177.92ms | 182.52ms |
| diamond | 236.53ms | 2.40s | 3.45s | 191.76ms (fail) | 277.92ms | 292.56ms |
| mux | 381.92ms | 1.81s | 2.01s | 191.29ms (fail) | 383.37ms | 399.69ms |
| repeatedObservers | 45.38ms | 228.22ms | 208.98ms | 52.56ms (fail) | 38.02ms | 45.73ms |
| triangle | 83.34ms | 782.91ms | 1.13s | 78.78ms (fail) | 101.17ms | 103.66ms |
| unstable | 59.50ms | 357.43ms | 345.38ms | 335.75ms (fail) | 70.84ms | 71.66ms |
| molBench | 492.65ms | 579.90ms | 1.71s | 1.22ms | 490.96ms | 489.02ms |
| create_signals | 25.44ms | 90.10ms | 80.03ms | 68.01ms | 4.72ms | 26.51ms |
| comp_0to1 | 8.12ms | 25.73ms | 33.64ms | 60.23ms | 22.34ms | 12.45ms |
| comp_1to1 | 4.41ms | 44.74ms | 48.87ms | 58.27ms | 15.47ms | 27.85ms |
| comp_2to1 | 2.32ms | 21.25ms | 32.02ms | 44.39ms | 20.06ms | 9.90ms |
| comp_4to1 | 10.07ms | 27.50ms | 12.23ms | 17.65ms | 14.93ms | 2.20ms |
| comp_1000to1 | 4μs | 18μs | 1.99ms | 46μs | 4μs | 5μs |
| comp_1to2 | 16.53ms | 34.28ms | 24.27ms | 50.12ms | 15.20ms | 14.22ms |
| comp_1to4 | 9.19ms | 22.56ms | 24.67ms | 48.31ms | 22.23ms | 11.66ms |
| comp_1to8 | 3.82ms | 22.67ms | 19.21ms | 46.94ms | 8.32ms | 6.92ms |
| comp_1to1000 | 3.59ms | 15.47ms | 17.60ms | 42.21ms | 6.91ms | 4.57ms |
| update_1to1 | 8.11ms | 22.36ms | 47.41ms | 5.76ms | 8.25ms | 9.30ms |
| update_2to1 | 5.09ms | 10.63ms | 26.37ms | 2.90ms | 4.04ms | 4.57ms |
| update_4to1 | 1.08ms | 6.71ms | 11.71ms | 1.47ms | 2.32ms | 2.31ms |
| update_1000to1 | 24μs | 58μs | 125μs | 15μs | 20μs | 23μs |
| update_1to2 | 3.04ms | 11.28ms | 26.34ms | 2.96ms | 4.07ms | 4.91ms |
| update_1to4 | 1.97ms | 5.30ms | 13.07ms | 1.50ms | 2.07ms | 2.30ms |
| update_1to1000 | 33μs | 171μs | 224μs | 437μs | 976μs | 44μs |
| cellx1000 | 7.47ms | 79.34ms | 165.01ms | 5.94ms | 9.56ms | 10.44ms |
| cellx2500 | 21.01ms | 255.89ms | 534.86ms | 22.49ms | 25.53ms | 39.42ms |
| cellx5000 | 57.97ms | 588.44ms | 1.17s | 62.63ms | 76.56ms | 95.86ms |
| 10x5 - 2 sources - read 20.0% (simple) | 228.20ms | 2.02s | 2.63s (partial) | 268.36ms | 444.35ms | 505.44ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 195.56ms | 1.58s | 2.42s (partial) | 201.51ms | 275.24ms | 278.67ms |
| 1000x12 - 4 sources - dynamic (large) | 281.34ms | 1.97s | 4.06s (partial) | 356.10ms | 3.51s | 3.96s |
| 1000x5 - 25 sources (wide dense) | 398.21ms | 3.61s | 4.92s (partial) | 501.92ms | 2.59s | 3.43s |
| 5x500 - 3 sources (deep) | 192.46ms | 1.18s | 1.98s (partial) | 204.97ms | 231.05ms | 228.88ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 269.73ms | 1.76s | 2.78s (partial) | 264.10ms | 449.42ms | 478.66ms |

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
