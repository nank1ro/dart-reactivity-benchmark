# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.69s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.30s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 9.98s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.33s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.04s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.43s |

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
| avoidablePropagation | 186.50ms | 2.30s | 2.16s | 160.30ms (fail) | 205.65ms | 206.48ms |
| broadPropagation | 351.64ms | 4.24s | 5.28s | 5.94ms (fail) | 470.10ms | 451.55ms |
| deepPropagation | 119.92ms | 1.51s | 1.98s | 139.21ms (fail) | 172.55ms | 176.58ms |
| diamond | 236.33ms | 2.39s | 3.46s | 189.15ms (fail) | 277.18ms | 286.57ms |
| mux | 383.52ms | 1.82s | 2.01s | 193.92ms (fail) | 382.72ms | 404.79ms |
| repeatedObservers | 45.06ms | 224.49ms | 207.26ms | 52.19ms (fail) | 38.05ms | 46.15ms |
| triangle | 85.21ms | 779.59ms | 1.14s | 77.95ms (fail) | 100.53ms | 101.89ms |
| unstable | 60.58ms | 345.96ms | 343.38ms | 337.61ms (fail) | 70.82ms | 73.81ms |
| molBench | 492.47ms | 580.77ms | 1.71s | 952μs | 490.96ms | 488.94ms |
| create_signals | 26.21ms | 88.01ms | 48.02ms | 63.61ms | 4.74ms | 24.92ms |
| comp_0to1 | 7.87ms | 27.03ms | 33.60ms | 61.43ms | 17.38ms | 11.72ms |
| comp_1to1 | 4.14ms | 42.08ms | 29.45ms | 61.66ms | 14.29ms | 16.88ms |
| comp_2to1 | 2.24ms | 22.17ms | 37.26ms | 36.35ms | 17.39ms | 8.19ms |
| comp_4to1 | 7.53ms | 31.16ms | 7.01ms | 16.20ms | 14.77ms | 2.18ms |
| comp_1000to1 | 3μs | 15μs | 2.04ms | 41μs | 4μs | 5μs |
| comp_1to2 | 15.01ms | 35.99ms | 32.36ms | 46.31ms | 26.39ms | 22.36ms |
| comp_1to4 | 11.99ms | 22.25ms | 28.43ms | 44.74ms | 26.50ms | 7.40ms |
| comp_1to8 | 5.79ms | 22.46ms | 26.35ms | 43.76ms | 7.66ms | 6.52ms |
| comp_1to1000 | 3.40ms | 15.19ms | 17.54ms | 39.17ms | 6.21ms | 4.43ms |
| update_1to1 | 5.16ms | 24.80ms | 40.84ms | 5.84ms | 8.14ms | 9.20ms |
| update_2to1 | 5.06ms | 12.00ms | 20.66ms | 4.88ms | 4.05ms | 4.58ms |
| update_4to1 | 1.20ms | 6.11ms | 10.20ms | 1.49ms | 2.08ms | 2.31ms |
| update_1000to1 | 25μs | 62μs | 113μs | 15μs | 20μs | 25μs |
| update_1to2 | 2.57ms | 11.68ms | 20.54ms | 3.08ms | 4.05ms | 4.90ms |
| update_1to4 | 1.10ms | 6.09ms | 10.16ms | 1.50ms | 2.05ms | 2.37ms |
| update_1to1000 | 50μs | 170μs | 208μs | 393μs | 783μs | 66μs |
| cellx1000 | 7.37ms | 72.60ms | 156.33ms | 5.24ms | 9.54ms | 9.46ms |
| cellx2500 | 20.32ms | 246.21ms | 456.48ms | 28.26ms | 25.36ms | 30.99ms |
| cellx5000 | 41.64ms | 543.85ms | 1.11s | 61.22ms | 62.38ms | 61.94ms |
| 10x5 - 2 sources - read 20.0% (simple) | 255.79ms | 2.00s | 2.59s (partial) | 252.12ms | 439.05ms | 506.44ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 176.92ms | 1.56s | 2.47s (partial) | 200.73ms | 272.27ms | 279.65ms |
| 1000x12 - 4 sources - dynamic (large) | 275.90ms | 1.85s | 4.03s (partial) | 336.19ms | 3.53s | 3.78s |
| 1000x5 - 25 sources (wide dense) | 395.08ms | 3.63s | 4.85s (partial) | 497.23ms | 2.60s | 3.56s |
| 5x500 - 3 sources (deep) | 192.14ms | 1.15s | 1.96s (partial) | 204.15ms | 232.51ms | 225.35ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 263.94ms | 1.71s | 2.77s (partial) | 252.31ms | 449.31ms | 482.44ms |

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
