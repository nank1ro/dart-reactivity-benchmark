# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.71s |
| 🥈 | signals | 0.28 | 100.0% | 35/35 | 11.33s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 9.80s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.12s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.95s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.56s |

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
| avoidablePropagation | 2.22s | 2.32s | 165.89ms (fail) | 209.51ms | 191.70ms | 209.87ms |
| broadPropagation | 5.53s | 4.31s | 6.94ms (fail) | 463.57ms | 344.45ms | 449.69ms |
| deepPropagation | 2.06s | 1.54s | 140.84ms (fail) | 171.71ms | 123.47ms | 172.01ms |
| diamond | 3.53s | 2.46s | 204.75ms (fail) | 283.69ms | 241.60ms | 271.58ms |
| mux | 2.10s | 1.80s | 195.96ms (fail) | 408.48ms | 364.72ms | 387.08ms |
| repeatedObservers | 209.31ms | 233.68ms | 51.83ms (fail) | 44.82ms | 42.80ms | 41.26ms |
| triangle | 1.13s | 778.90ms | 85.62ms (fail) | 105.10ms | 85.66ms | 99.07ms |
| unstable | 345.07ms | 353.53ms | 333.86ms (fail) | 77.21ms | 59.71ms | 68.76ms |
| molBench | 1.73s | 573.70ms | 869μs | 484.50ms | 479.37ms | 482.94ms |
| create_signals | 60.87ms | 71.42ms | 68.69ms | 30.59ms | 20.49ms | 4.64ms |
| comp_0to1 | 37.67ms | 18.33ms | 53.99ms | 14.93ms | 5.03ms | 16.89ms |
| comp_1to1 | 49.73ms | 30.95ms | 52.54ms | 17.52ms | 8.86ms | 14.98ms |
| comp_2to1 | 35.40ms | 25.90ms | 33.26ms | 9.10ms | 14.41ms | 22.46ms |
| comp_4to1 | 22.09ms | 13.69ms | 17.03ms | 2.10ms | 14.44ms | 10.85ms |
| comp_1000to1 | 2.85ms | 31μs | 62μs | 5μs | 4μs | 10μs |
| comp_1to2 | 34.17ms | 32.37ms | 48.73ms | 15.49ms | 20.41ms | 21.63ms |
| comp_1to4 | 23.64ms | 19.20ms | 44.67ms | 14.50ms | 12.48ms | 32.62ms |
| comp_1to8 | 23.27ms | 20.84ms | 43.77ms | 6.95ms | 7.46ms | 7.77ms |
| comp_1to1000 | 18.69ms | 15.54ms | 39.86ms | 4.58ms | 5.80ms | 6.25ms |
| update_1to1 | 43.12ms | 27.78ms | 9.62ms | 9.38ms | 4.99ms | 8.81ms |
| update_2to1 | 21.21ms | 13.98ms | 2.93ms | 4.69ms | 2.75ms | 4.41ms |
| update_4to1 | 10.66ms | 7.28ms | 2.54ms | 2.43ms | 1.09ms | 2.18ms |
| update_1000to1 | 114μs | 81μs | 15μs | 23μs | 11μs | 21μs |
| update_1to2 | 21.53ms | 13.80ms | 3.91ms | 4.78ms | 2.19ms | 4.35ms |
| update_1to4 | 17.02ms | 6.86ms | 1.51ms | 2.36ms | 1.09ms | 2.20ms |
| update_1to1000 | 369μs | 163μs | 400μs | 46μs | 32μs | 934μs |
| cellx1000 | 170.39ms | 68.34ms | 5.24ms | 9.63ms | 7.36ms | 9.52ms |
| cellx2500 | 494.76ms | 248.82ms | 18.94ms | 31.13ms | 19.99ms | 24.97ms |
| cellx5000 | 1.08s | 541.07ms | 58.11ms | 62.27ms | 42.37ms | 69.23ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.65s (partial) | 1.99s | 278.84ms | 496.45ms | 239.05ms | 424.66ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.44s (partial) | 1.51s | 211.58ms | 282.83ms | 186.56ms | 270.03ms |
| 1000x12 - 4 sources - dynamic (large) | 4.04s (partial) | 1.80s | 352.60ms | 3.87s | 283.10ms | 3.45s |
| 1000x5 - 25 sources (wide dense) | 4.98s (partial) | 3.49s | 521.43ms | 3.48s | 404.38ms | 2.52s |
| 5x500 - 3 sources (deep) | 2.01s (partial) | 1.11s | 229.95ms | 229.59ms | 207.80ms | 228.65ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.80s (partial) | 1.68s | 270.20ms | 473.33ms | 264.61ms | 456.52ms |

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
