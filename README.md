# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.24s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.18s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.40s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.30s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.57s |

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
| avoidablePropagation | 200.95ms | 157.83ms (fail) | 262.31ms | 216.30ms | 192.49ms | 2.33s |
| broadPropagation | 456.33ms | 6.87ms (fail) | 504.75ms | 457.67ms | 353.28ms | 4.29s |
| deepPropagation | 178.10ms | 140.80ms (fail) | 162.86ms | 178.32ms | 127.33ms | 1.52s |
| diamond | 278.23ms | 204.06ms (fail) | 347.95ms | 283.74ms | 231.71ms | 2.40s |
| mux | 385.94ms | 198.07ms (fail) | 433.48ms | 412.06ms | 380.44ms | 1.83s |
| repeatedObservers | 40.10ms | 52.95ms (fail) | 80.54ms | 46.63ms | 43.71ms | 227.14ms |
| triangle | 100.09ms | 81.90ms (fail) | 114.23ms | 101.09ms | 84.03ms | 761.30ms |
| unstable | 74.44ms | 343.17ms (fail) | 96.06ms | 76.12ms | 60.10ms | 340.57ms |
| molBench | 487.91ms | 942μs | 492.30ms | 485.95ms | 490.67ms | 583.13ms |
| create_signals | 4.75ms | 68.64ms | 52.83ms | 25.98ms | 20.98ms | 65.19ms |
| comp_0to1 | 17.93ms | 58.34ms | 24.60ms | 12.16ms | 7.58ms | 15.73ms |
| comp_1to1 | 15.35ms | 66.35ms | 27.11ms | 27.48ms | 4.17ms | 47.29ms |
| comp_2to1 | 20.94ms | 45.80ms | 30.93ms | 8.98ms | 2.27ms | 23.21ms |
| comp_4to1 | 14.08ms | 19.13ms | 12.34ms | 2.05ms | 7.77ms | 26.68ms |
| comp_1000to1 | 5μs | 45μs | 14μs | 5μs | 3μs | 16μs |
| comp_1to2 | 18.51ms | 49.87ms | 39.45ms | 16.96ms | 9.83ms | 36.52ms |
| comp_1to4 | 34.01ms | 48.35ms | 21.14ms | 13.28ms | 16.01ms | 31.42ms |
| comp_1to8 | 7.08ms | 47.59ms | 19.25ms | 7.32ms | 4.90ms | 20.43ms |
| comp_1to1000 | 5.87ms | 43.24ms | 14.13ms | 4.43ms | 3.51ms | 14.90ms |
| update_1to1 | 8.38ms | 6.01ms | 16.36ms | 10.20ms | 10.03ms | 27.91ms |
| update_2to1 | 4.44ms | 3.19ms | 8.31ms | 4.52ms | 2.12ms | 14.06ms |
| update_4to1 | 2.09ms | 1.52ms | 4.07ms | 2.55ms | 2.52ms | 6.79ms |
| update_1000to1 | 20μs | 15μs | 40μs | 25μs | 33μs | 68μs |
| update_1to2 | 4.07ms | 3.08ms | 16.61ms | 4.54ms | 4.98ms | 14.36ms |
| update_1to4 | 2.09ms | 1.53ms | 4.12ms | 2.54ms | 2.50ms | 7.07ms |
| update_1to1000 | 159μs | 428μs | 147μs | 43μs | 48μs | 171μs |
| cellx1000 | 9.72ms | 5.34ms | 11.87ms | 9.94ms | 7.23ms | 82.51ms |
| cellx2500 | 28.80ms | 28.32ms | 33.96ms | 32.16ms | 19.55ms | 228.60ms |
| cellx5000 | 76.51ms | 64.30ms | 86.14ms | 65.70ms | 45.79ms | 590.32ms |
| 10x5 - 2 sources - read 20.0% (simple) | 452.97ms | 267.18ms | 350.02ms | 507.99ms | 233.97ms | 2.04s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 275.98ms | 206.78ms | 248.28ms | 285.18ms | 180.03ms | 1.51s |
| 1000x12 - 4 sources - dynamic (large) | 3.73s | 354.27ms | 461.78ms | 3.74s | 281.43ms | 1.82s |
| 1000x5 - 25 sources (wide dense) | 2.76s | 515.14ms | 611.18ms | 3.44s | 408.42ms | 3.53s |
| 5x500 - 3 sources (deep) | 232.69ms | 213.54ms | 262.20ms | 222.18ms | 190.50ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 465.86ms | 267.88ms | 389.54ms | 473.76ms | 264.68ms | 1.72s |

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
