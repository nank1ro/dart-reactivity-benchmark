# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.70s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 10.90s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.35s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 9.96s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.42s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.42s |

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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 209.47ms | 188.14ms | 158.16ms (fail) | 290.46ms | 207.94ms | 2.38s |
| broadPropagation | 450.74ms | 352.75ms | 6.89ms (fail) | 506.23ms | 448.96ms | 4.47s |
| deepPropagation | 169.07ms | 127.74ms | 139.66ms (fail) | 166.69ms | 177.32ms | 1.53s |
| diamond | 282.96ms | 229.57ms | 180.73ms (fail) | 351.43ms | 283.83ms | 2.39s |
| mux | 393.00ms | 360.47ms | 182.05ms (fail) | 420.10ms | 375.85ms | 1.87s |
| repeatedObservers | 46.28ms | 44.41ms | 53.84ms (fail) | 80.18ms | 41.23ms | 228.43ms |
| triangle | 101.55ms | 84.79ms | 77.35ms (fail) | 114.81ms | 101.25ms | 757.25ms |
| unstable | 78.80ms | 63.06ms | 339.35ms (fail) | 96.40ms | 69.90ms | 343.42ms |
| molBench | 496.62ms | 486.14ms | 1.57ms | 490.02ms | 487.25ms | 588.18ms |
| create_signals | 27.43ms | 28.18ms | 59.18ms | 82.14ms | 5.35ms | 82.88ms |
| comp_0to1 | 12.39ms | 7.94ms | 53.35ms | 31.51ms | 18.29ms | 37.99ms |
| comp_1to1 | 32.92ms | 4.34ms | 54.70ms | 40.55ms | 12.29ms | 17.62ms |
| comp_2to1 | 14.29ms | 2.42ms | 37.27ms | 25.87ms | 12.17ms | 25.55ms |
| comp_4to1 | 2.20ms | 8.07ms | 16.76ms | 21.55ms | 14.82ms | 20.08ms |
| comp_1000to1 | 4μs | 4μs | 42μs | 33μs | 4μs | 33μs |
| comp_1to2 | 21.56ms | 10.37ms | 48.82ms | 34.92ms | 18.89ms | 37.39ms |
| comp_1to4 | 14.11ms | 12.71ms | 44.98ms | 15.27ms | 28.74ms | 23.72ms |
| comp_1to8 | 6.70ms | 5.04ms | 42.31ms | 21.53ms | 8.48ms | 25.39ms |
| comp_1to1000 | 4.26ms | 3.84ms | 38.56ms | 14.78ms | 6.54ms | 15.74ms |
| update_1to1 | 9.34ms | 4.65ms | 6.10ms | 15.45ms | 8.82ms | 25.47ms |
| update_2to1 | 4.75ms | 2.36ms | 3.06ms | 7.76ms | 4.37ms | 10.92ms |
| update_4to1 | 2.35ms | 1.22ms | 1.56ms | 3.86ms | 2.25ms | 7.09ms |
| update_1000to1 | 23μs | 11μs | 16μs | 38μs | 22μs | 68μs |
| update_1to2 | 4.63ms | 2.36ms | 3.08ms | 7.99ms | 4.37ms | 13.89ms |
| update_1to4 | 2.52ms | 1.77ms | 1.63ms | 3.85ms | 2.24ms | 6.91ms |
| update_1to1000 | 42μs | 53μs | 378μs | 157μs | 993μs | 165μs |
| cellx1000 | 10.26ms | 7.67ms | 5.34ms | 14.16ms | 10.77ms | 73.84ms |
| cellx2500 | 37.05ms | 21.33ms | 29.62ms | 47.17ms | 32.72ms | 270.24ms |
| cellx5000 | 85.78ms | 55.11ms | 69.70ms | 129.71ms | 87.32ms | 607.08ms |
| 10x5 - 2 sources - read 20.0% (simple) | 512.34ms | 240.46ms | 237.09ms | 352.77ms | 430.81ms | 1.97s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.75ms | 173.89ms | 198.01ms | 246.71ms | 268.52ms | 1.47s |
| 1000x12 - 4 sources - dynamic (large) | 3.60s | 277.10ms | 344.35ms | 474.53ms | 3.65s | 1.93s |
| 1000x5 - 25 sources (wide dense) | 3.25s | 437.41ms | 520.50ms | 603.21ms | 2.47s | 3.44s |
| 5x500 - 3 sources (deep) | 229.20ms | 191.90ms | 203.04ms | 257.47ms | 225.69ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 505.22ms | 265.03ms | 256.01ms | 385.58ms | 441.67ms | 1.65s |

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
