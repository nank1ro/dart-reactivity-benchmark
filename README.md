# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.78 | 100.0% | 35/35 | 3.68s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.03s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 9.79s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.24s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.66s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.49s |

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
| Test Case | alien_signals | signals | preact_signals | solidart | state_beacon | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 188.83ms | 212.84ms | 211.03ms | 2.20s | 154.63ms (fail) | 2.28s |
| broadPropagation | 347.67ms | 459.27ms | 453.56ms | 5.65s | 6.50ms (fail) | 4.39s |
| deepPropagation | 123.31ms | 175.37ms | 179.20ms | 2.01s | 140.22ms (fail) | 1.56s |
| diamond | 235.96ms | 287.24ms | 274.53ms | 3.46s | 193.01ms (fail) | 2.42s |
| mux | 375.90ms | 413.54ms | 386.79ms | 2.05s | 192.05ms (fail) | 1.84s |
| repeatedObservers | 44.37ms | 45.11ms | 41.50ms | 210.04ms | 53.57ms (fail) | 228.88ms |
| triangle | 85.35ms | 108.01ms | 99.43ms | 1.13s | 79.59ms (fail) | 768.45ms |
| unstable | 59.75ms | 78.08ms | 70.16ms | 341.02ms | 336.29ms (fail) | 354.22ms |
| molBench | 477.16ms | 485.99ms | 483.56ms | 1.74s | 913μs | 586.43ms |
| create_signals | 20.68ms | 29.50ms | 5.49ms | 83.05ms | 73.40ms | 54.73ms |
| comp_0to1 | 5.00ms | 14.91ms | 17.13ms | 34.56ms | 56.21ms | 21.80ms |
| comp_1to1 | 11.64ms | 18.44ms | 15.44ms | 52.19ms | 55.95ms | 37.81ms |
| comp_2to1 | 14.30ms | 10.41ms | 19.58ms | 30.99ms | 35.13ms | 21.73ms |
| comp_4to1 | 2.52ms | 5.87ms | 11.00ms | 15.18ms | 17.96ms | 22.05ms |
| comp_1000to1 | 3μs | 5μs | 6μs | 4.22ms | 100μs | 16μs |
| comp_1to2 | 13.28ms | 22.64ms | 30.23ms | 27.77ms | 47.06ms | 37.94ms |
| comp_1to4 | 9.79ms | 15.12ms | 26.46ms | 28.45ms | 44.67ms | 17.74ms |
| comp_1to8 | 4.16ms | 6.86ms | 7.05ms | 24.15ms | 46.38ms | 20.13ms |
| comp_1to1000 | 3.46ms | 4.76ms | 5.99ms | 19.20ms | 40.35ms | 15.32ms |
| update_1to1 | 4.37ms | 9.46ms | 8.77ms | 43.27ms | 7.62ms | 27.45ms |
| update_2to1 | 2.25ms | 4.69ms | 4.37ms | 22.47ms | 2.93ms | 13.97ms |
| update_4to1 | 1.13ms | 2.36ms | 2.21ms | 10.76ms | 1.84ms | 7.50ms |
| update_1000to1 | 10μs | 23μs | 21μs | 116μs | 15μs | 70μs |
| update_1to2 | 2.17ms | 4.74ms | 4.36ms | 21.28ms | 3.87ms | 14.01ms |
| update_1to4 | 1.42ms | 2.37ms | 2.21ms | 10.92ms | 1.50ms | 7.01ms |
| update_1to1000 | 39μs | 45μs | 762μs | 210μs | 412μs | 164μs |
| cellx1000 | 8.48ms | 9.64ms | 9.76ms | 161.68ms | 8.68ms | 72.56ms |
| cellx2500 | 19.93ms | 31.54ms | 26.56ms | 499.15ms | 20.87ms | 265.18ms |
| cellx5000 | 42.39ms | 59.72ms | 65.50ms | 1.10s | 57.30ms | 572.37ms |
| 10x5 - 2 sources - read 20.0% (simple) | 234.91ms | 515.34ms | 423.54ms | 2.64s (partial) | 257.14ms | 2.00s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 180.73ms | 286.26ms | 280.80ms | 2.36s (partial) | 206.95ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 288.74ms | 3.65s | 3.44s | 4.02s (partial) | 336.05ms | 1.80s |
| 1000x5 - 25 sources (wide dense) | 402.96ms | 3.36s | 2.52s | 4.90s (partial) | 513.33ms | 3.48s |
| 5x500 - 3 sources (deep) | 196.48ms | 228.51ms | 223.50ms | 2.01s (partial) | 232.20ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 267.21ms | 472.88ms | 447.24ms | 2.75s (partial) | 265.58ms | 1.67s |

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
