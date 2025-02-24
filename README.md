# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.74s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.26s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.00s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.57s |
| 5 | solidart(2.0-dev) | 0.04 | 100.0% | 35/35 | 39.48s |
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
| Test Case | alien_signals | mobx | solidart(2.0-dev) | state_beacon | preact_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 187.38ms | 2.38s | 842.95ms | 149.18ms (fail) | 206.43ms | 210.06ms |
| broadPropagation | 354.55ms | 4.24s | 7.51s | 5.87ms (fail) | 456.42ms | 459.03ms |
| deepPropagation | 126.89ms | 1.55s | 854.20ms | 139.38ms (fail) | 174.76ms | 179.18ms |
| diamond | 240.25ms | 2.41s | 2.33s | 186.51ms (fail) | 276.14ms | 289.73ms |
| mux | 375.66ms | 1.84s | 1.14s | 191.59ms (fail) | 382.72ms | 414.69ms |
| repeatedObservers | 45.62ms | 230.50ms | 256.05ms | 52.37ms (fail) | 38.61ms | 46.71ms |
| triangle | 87.98ms | 790.20ms | 602.90ms | 76.88ms (fail) | 98.82ms | 101.68ms |
| unstable | 60.93ms | 351.79ms | 718.39ms | 339.88ms (fail) | 71.52ms | 74.11ms |
| molBench | 491.09ms | 579.89ms | 567.86ms | 1.14ms | 490.65ms | 487.50ms |
| create_signals | 25.96ms | 79.36ms | 65.20ms | 67.60ms | 4.82ms | 25.33ms |
| comp_0to1 | 7.25ms | 37.25ms | 48.27ms | 55.31ms | 17.65ms | 11.18ms |
| comp_1to1 | 4.17ms | 17.02ms | 45.17ms | 57.69ms | 10.98ms | 19.30ms |
| comp_2to1 | 2.22ms | 8.94ms | 16.18ms | 37.97ms | 17.34ms | 11.80ms |
| comp_4to1 | 8.47ms | 35.46ms | 10.89ms | 16.84ms | 14.95ms | 2.13ms |
| comp_1000to1 | 3μs | 25μs | 17μs | 46μs | 5μs | 5μs |
| comp_1to2 | 10.59ms | 34.86ms | 37.17ms | 49.37ms | 30.37ms | 13.18ms |
| comp_1to4 | 12.48ms | 21.30ms | 23.86ms | 47.97ms | 24.33ms | 12.79ms |
| comp_1to8 | 4.66ms | 22.84ms | 21.27ms | 46.64ms | 6.20ms | 9.18ms |
| comp_1to1000 | 3.17ms | 14.83ms | 15.85ms | 42.21ms | 6.41ms | 4.50ms |
| update_1to1 | 11.29ms | 23.92ms | 14.55ms | 5.72ms | 8.27ms | 9.27ms |
| update_2to1 | 5.03ms | 12.13ms | 7.50ms | 2.88ms | 4.05ms | 4.56ms |
| update_4to1 | 2.96ms | 6.07ms | 3.65ms | 1.48ms | 2.11ms | 2.39ms |
| update_1000to1 | 19μs | 64μs | 36μs | 15μs | 20μs | 23μs |
| update_1to2 | 5.65ms | 11.73ms | 7.26ms | 2.94ms | 4.08ms | 4.94ms |
| update_1to4 | 2.40ms | 5.96ms | 3.63ms | 1.50ms | 2.09ms | 2.33ms |
| update_1to1000 | 47μs | 163μs | 167μs | 412μs | 1.05ms | 44μs |
| cellx1000 | 7.26ms | 68.50ms | 68.74ms | 5.07ms | 9.64ms | 9.69ms |
| cellx2500 | 19.21ms | 243.06ms | 177.56ms | 20.62ms | 25.36ms | 31.13ms |
| cellx5000 | 42.29ms | 564.32ms | 408.18ms | 60.16ms | 67.31ms | 62.31ms |
| 10x5 - 2 sources - read 20.0% (simple) | 238.59ms | 2.02s | 2.53s | 260.43ms | 455.74ms | 518.09ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 188.36ms | 1.53s | 1.56s | 200.22ms | 275.39ms | 285.68ms |
| 1000x12 - 4 sources - dynamic (large) | 281.68ms | 1.90s | 5.21s | 334.72ms | 3.56s | 3.84s |
| 1000x5 - 25 sources (wide dense) | 425.88ms | 3.61s | 10.40s | 505.42ms | 2.59s | 3.41s |
| 5x500 - 3 sources (deep) | 190.76ms | 1.17s | 934.52ms | 202.97ms | 230.28ms | 231.16ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 265.17ms | 1.74s | 3.05s | 259.99ms | 447.69ms | 478.11ms |

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
