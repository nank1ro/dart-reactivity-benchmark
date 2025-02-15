# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.68s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.45s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.10s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.36s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.61s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.40s |

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
| avoidablePropagation | 184.91ms | 2.35s | 2.16s | 150.85ms (fail) | 205.82ms | 206.17ms |
| broadPropagation | 355.71ms | 4.23s | 5.37s | 6.30ms (fail) | 462.32ms | 450.24ms |
| deepPropagation | 124.49ms | 1.53s | 2.01s | 139.28ms (fail) | 181.82ms | 172.96ms |
| diamond | 233.25ms | 2.42s | 3.49s | 184.24ms (fail) | 283.56ms | 288.36ms |
| mux | 385.18ms | 1.80s | 2.04s | 188.72ms (fail) | 383.15ms | 413.11ms |
| repeatedObservers | 45.38ms | 233.10ms | 205.73ms | 51.99ms (fail) | 39.60ms | 46.64ms |
| triangle | 82.99ms | 770.97ms | 1.18s | 75.90ms (fail) | 99.83ms | 105.10ms |
| unstable | 60.00ms | 355.87ms | 346.51ms | 336.84ms (fail) | 67.53ms | 73.96ms |
| molBench | 492.15ms | 577.77ms | 1.73s | 1.21ms | 491.41ms | 489.77ms |
| create_signals | 26.01ms | 86.30ms | 83.23ms | 63.06ms | 4.61ms | 26.07ms |
| comp_0to1 | 7.97ms | 26.59ms | 30.83ms | 60.91ms | 17.50ms | 12.09ms |
| comp_1to1 | 4.39ms | 47.17ms | 47.12ms | 54.83ms | 14.42ms | 27.55ms |
| comp_2to1 | 2.35ms | 43.13ms | 20.19ms | 42.92ms | 15.73ms | 10.24ms |
| comp_4to1 | 8.64ms | 30.74ms | 16.96ms | 16.65ms | 18.23ms | 2.19ms |
| comp_1000to1 | 5μs | 28μs | 2.13ms | 40μs | 4μs | 5μs |
| comp_1to2 | 13.86ms | 33.75ms | 45.03ms | 47.54ms | 28.62ms | 13.36ms |
| comp_1to4 | 6.18ms | 17.22ms | 25.01ms | 46.42ms | 21.68ms | 11.69ms |
| comp_1to8 | 7.51ms | 20.17ms | 24.12ms | 43.81ms | 7.09ms | 6.69ms |
| comp_1to1000 | 3.48ms | 14.84ms | 17.61ms | 37.81ms | 5.41ms | 4.43ms |
| update_1to1 | 7.76ms | 26.18ms | 40.99ms | 5.74ms | 9.72ms | 9.24ms |
| update_2to1 | 5.12ms | 12.03ms | 20.52ms | 2.90ms | 5.54ms | 4.57ms |
| update_4to1 | 1.74ms | 6.55ms | 10.24ms | 1.56ms | 3.01ms | 2.31ms |
| update_1000to1 | 26μs | 67μs | 113μs | 15μs | 20μs | 22μs |
| update_1to2 | 4.43ms | 12.06ms | 20.61ms | 3.31ms | 4.07ms | 4.95ms |
| update_1to4 | 2.57ms | 5.91ms | 10.26ms | 1.46ms | 3.69ms | 2.30ms |
| update_1to1000 | 36μs | 165μs | 239μs | 369μs | 143μs | 43μs |
| cellx1000 | 7.63ms | 72.68ms | 182.38ms | 5.36ms | 9.71ms | 9.53ms |
| cellx2500 | 20.16ms | 243.42ms | 496.69ms | 21.25ms | 31.30ms | 31.27ms |
| cellx5000 | 44.86ms | 541.60ms | 1.16s | 65.00ms | 78.91ms | 64.98ms |
| 10x5 - 2 sources - read 20.0% (simple) | 225.33ms | 1.99s | 2.70s (partial) | 243.96ms | 508.72ms | 525.83ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 175.23ms | 1.53s | 2.46s (partial) | 202.92ms | 275.27ms | 284.47ms |
| 1000x12 - 4 sources - dynamic (large) | 280.81ms | 1.87s | 4.01s (partial) | 335.45ms | 3.53s | 3.94s |
| 1000x5 - 25 sources (wide dense) | 399.26ms | 3.61s | 4.90s (partial) | 503.21ms | 2.62s | 3.50s |
| 5x500 - 3 sources (deep) | 192.97ms | 1.14s | 1.99s (partial) | 203.57ms | 231.44ms | 230.83ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 267.23ms | 1.72s | 2.77s (partial) | 259.39ms | 446.21ms | 480.60ms |

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
