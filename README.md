# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.71s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.00s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.18s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.79s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.57s |
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
| Test Case | alien_signals | mobx | solidart | state_beacon | preact_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 185.89ms | 2.37s | 2.19s | 154.62ms (fail) | 205.42ms | 209.10ms |
| broadPropagation | 353.63ms | 4.27s | 5.43s | 6.41ms (fail) | 453.91ms | 455.47ms |
| deepPropagation | 124.81ms | 1.52s | 2.02s | 138.67ms (fail) | 179.23ms | 180.00ms |
| diamond | 233.75ms | 2.46s | 3.43s | 200.69ms (fail) | 281.14ms | 286.38ms |
| mux | 385.74ms | 1.82s | 2.01s | 190.15ms (fail) | 387.90ms | 402.81ms |
| repeatedObservers | 45.47ms | 240.71ms | 206.08ms | 52.85ms (fail) | 37.98ms | 46.15ms |
| triangle | 85.91ms | 769.06ms | 1.13s | 77.77ms (fail) | 101.47ms | 104.72ms |
| unstable | 60.42ms | 356.81ms | 334.62ms | 347.80ms (fail) | 70.49ms | 73.33ms |
| molBench | 492.01ms | 580.95ms | 1.71s | 1.02ms | 491.82ms | 486.83ms |
| create_signals | 22.34ms | 85.37ms | 48.51ms | 66.36ms | 4.70ms | 25.28ms |
| comp_0to1 | 8.14ms | 15.28ms | 34.74ms | 53.27ms | 17.45ms | 11.99ms |
| comp_1to1 | 4.28ms | 46.00ms | 48.69ms | 53.64ms | 11.28ms | 26.34ms |
| comp_2to1 | 2.26ms | 24.08ms | 24.52ms | 36.22ms | 22.49ms | 10.97ms |
| comp_4to1 | 8.29ms | 31.86ms | 19.51ms | 16.28ms | 8.91ms | 7.64ms |
| comp_1000to1 | 6μs | 15μs | 2.04ms | 41μs | 6μs | 5μs |
| comp_1to2 | 27.54ms | 34.43ms | 25.64ms | 44.88ms | 20.76ms | 21.98ms |
| comp_1to4 | 5.68ms | 22.30ms | 28.99ms | 44.18ms | 25.00ms | 9.88ms |
| comp_1to8 | 6.15ms | 22.59ms | 24.47ms | 43.78ms | 5.92ms | 6.61ms |
| comp_1to1000 | 3.51ms | 14.91ms | 17.25ms | 38.62ms | 6.16ms | 4.57ms |
| update_1to1 | 7.03ms | 22.42ms | 41.41ms | 5.80ms | 8.19ms | 9.27ms |
| update_2to1 | 5.01ms | 10.60ms | 21.55ms | 2.87ms | 4.12ms | 4.62ms |
| update_4to1 | 1.54ms | 6.22ms | 10.19ms | 1.47ms | 2.08ms | 2.32ms |
| update_1000to1 | 24μs | 61μs | 115μs | 14μs | 20μs | 23μs |
| update_1to2 | 3.56ms | 11.00ms | 20.59ms | 2.95ms | 4.05ms | 4.89ms |
| update_1to4 | 1.59ms | 5.58ms | 10.24ms | 1.48ms | 2.03ms | 2.31ms |
| update_1to1000 | 48μs | 166μs | 226μs | 383μs | 834μs | 44μs |
| cellx1000 | 9.25ms | 82.62ms | 167.55ms | 5.55ms | 9.80ms | 9.87ms |
| cellx2500 | 19.98ms | 291.09ms | 481.42ms | 29.63ms | 27.45ms | 33.09ms |
| cellx5000 | 51.50ms | 599.60ms | 1.23s | 86.84ms | 73.38ms | 82.30ms |
| 10x5 - 2 sources - read 20.0% (simple) | 230.29ms | 2.02s | 2.65s (partial) | 245.08ms | 439.49ms | 506.31ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 177.51ms | 1.57s | 2.37s (partial) | 202.70ms | 270.63ms | 280.89ms |
| 1000x12 - 4 sources - dynamic (large) | 279.47ms | 1.93s | 4.10s (partial) | 343.90ms | 3.54s | 3.74s |
| 1000x5 - 25 sources (wide dense) | 402.92ms | 3.62s | 4.92s (partial) | 507.39ms | 2.60s | 3.43s |
| 5x500 - 3 sources (deep) | 194.61ms | 1.17s | 2.02s (partial) | 210.33ms | 232.54ms | 225.46ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 272.22ms | 1.73s | 2.79s (partial) | 259.42ms | 457.34ms | 479.39ms |

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
