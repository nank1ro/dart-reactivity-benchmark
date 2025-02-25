# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.65 | 100.0% | 35/35 | 3.73s |
| 🥈 | preact_signals | 0.32 | 100.0% | 35/35 | 9.97s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.22s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.74s |
| 5 | solidart(2.0-dev) | 0.04 | 100.0% | 35/35 | 39.73s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.41s |

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
| Test Case | alien_signals | mobx | solidart(2.0-dev) | state_beacon | preact_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 185.51ms | 2.35s | 837.29ms | 150.38ms (fail) | 206.20ms | 215.04ms |
| broadPropagation | 353.95ms | 4.35s | 7.39s | 6.26ms (fail) | 454.23ms | 452.11ms |
| deepPropagation | 125.49ms | 1.53s | 929.98ms | 139.47ms (fail) | 179.59ms | 180.09ms |
| diamond | 242.83ms | 2.44s | 2.35s | 180.04ms (fail) | 282.47ms | 287.75ms |
| mux | 374.24ms | 1.88s | 1.15s | 191.26ms (fail) | 380.45ms | 410.22ms |
| repeatedObservers | 44.92ms | 230.26ms | 255.54ms | 52.10ms (fail) | 38.57ms | 46.84ms |
| triangle | 85.53ms | 786.13ms | 595.81ms | 76.41ms (fail) | 100.96ms | 103.01ms |
| unstable | 61.01ms | 354.23ms | 729.10ms | 340.68ms (fail) | 72.11ms | 75.06ms |
| molBench | 487.33ms | 581.22ms | 567.37ms | 1.14ms | 491.23ms | 487.52ms |
| create_signals | 26.25ms | 89.59ms | 62.19ms | 71.55ms | 4.78ms | 24.98ms |
| comp_0to1 | 11.38ms | 40.40ms | 39.85ms | 60.24ms | 18.19ms | 11.27ms |
| comp_1to1 | 9.95ms | 17.42ms | 27.23ms | 53.84ms | 11.29ms | 38.37ms |
| comp_2to1 | 6.72ms | 19.94ms | 40.34ms | 35.93ms | 17.88ms | 22.52ms |
| comp_4to1 | 20.24ms | 22.68ms | 22.31ms | 16.35ms | 3.54ms | 6.37ms |
| comp_1000to1 | 4μs | 15μs | 26μs | 42μs | 4μs | 10μs |
| comp_1to2 | 15.37ms | 40.86ms | 31.35ms | 47.62ms | 18.51ms | 14.88ms |
| comp_1to4 | 7.18ms | 24.76ms | 31.61ms | 47.87ms | 25.22ms | 7.21ms |
| comp_1to8 | 7.85ms | 24.47ms | 20.68ms | 42.95ms | 10.34ms | 6.99ms |
| comp_1to1000 | 3.18ms | 15.12ms | 16.02ms | 37.80ms | 4.43ms | 4.48ms |
| update_1to1 | 11.43ms | 22.22ms | 14.47ms | 5.73ms | 8.23ms | 9.14ms |
| update_2to1 | 5.11ms | 10.86ms | 7.30ms | 2.91ms | 4.05ms | 4.58ms |
| update_4to1 | 2.79ms | 6.64ms | 3.62ms | 1.47ms | 2.06ms | 2.33ms |
| update_1000to1 | 23μs | 78μs | 37μs | 15μs | 20μs | 23μs |
| update_1to2 | 5.59ms | 10.84ms | 7.44ms | 2.94ms | 4.05ms | 4.89ms |
| update_1to4 | 2.45ms | 5.65ms | 3.68ms | 1.47ms | 2.05ms | 2.32ms |
| update_1to1000 | 48μs | 165μs | 175μs | 370μs | 48μs | 45μs |
| cellx1000 | 7.19ms | 70.95ms | 83.15ms | 5.21ms | 9.61ms | 12.14ms |
| cellx2500 | 19.41ms | 247.43ms | 85.23ms | 24.93ms | 26.40ms | 31.23ms |
| cellx5000 | 42.07ms | 560.95ms | 322.69ms | 81.45ms | 65.95ms | 63.76ms |
| 10x5 - 2 sources - read 20.0% (simple) | 233.33ms | 2.08s | 2.79s | 237.90ms | 441.28ms | 505.87ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 179.26ms | 1.55s | 1.68s | 201.94ms | 269.48ms | 279.11ms |
| 1000x12 - 4 sources - dynamic (large) | 286.31ms | 1.93s | 5.45s | 333.16ms | 3.54s | 3.77s |
| 1000x5 - 25 sources (wide dense) | 413.97ms | 3.58s | 10.18s | 499.95ms | 2.60s | 3.42s |
| 5x500 - 3 sources (deep) | 193.44ms | 1.15s | 855.13ms | 203.33ms | 229.55ms | 227.12ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 257.97ms | 1.71s | 3.15s | 259.80ms | 448.43ms | 489.71ms |

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
