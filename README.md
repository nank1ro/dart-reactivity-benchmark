# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.22s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.13s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.46s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.02s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.44s |

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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 205.90ms | 2.29s | 154.22ms (fail) | 193.04ms | 206.46ms | 273.14ms |
| broadPropagation | 457.53ms | 4.34s | 5.84ms (fail) | 361.40ms | 464.25ms | 501.28ms |
| deepPropagation | 172.44ms | 1.54s | 138.83ms (fail) | 126.97ms | 176.39ms | 169.25ms |
| diamond | 283.48ms | 2.42s | 176.96ms (fail) | 248.14ms | 282.65ms | 337.63ms |
| mux | 405.95ms | 1.79s | 179.77ms (fail) | 362.79ms | 380.91ms | 415.56ms |
| repeatedObservers | 45.89ms | 230.43ms | 55.73ms (fail) | 44.70ms | 42.42ms | 80.39ms |
| triangle | 102.00ms | 762.80ms | 76.40ms (fail) | 87.98ms | 99.96ms | 114.19ms |
| unstable | 76.07ms | 341.56ms | 336.68ms (fail) | 61.25ms | 71.10ms | 95.86ms |
| molBench | 495.14ms | 589.86ms | 1.34ms | 487.30ms | 496.98ms | 487.18ms |
| create_signals | 26.27ms | 53.33ms | 62.98ms | 24.71ms | 5.56ms | 94.60ms |
| comp_0to1 | 12.22ms | 15.12ms | 61.54ms | 9.03ms | 18.65ms | 31.29ms |
| comp_1to1 | 26.05ms | 46.30ms | 58.80ms | 8.49ms | 10.91ms | 27.55ms |
| comp_2to1 | 13.85ms | 35.30ms | 37.10ms | 4.33ms | 13.75ms | 28.42ms |
| comp_4to1 | 6.48ms | 13.57ms | 17.15ms | 9.53ms | 8.84ms | 4.68ms |
| comp_1000to1 | 4μs | 21μs | 44μs | 3μs | 4μs | 15μs |
| comp_1to2 | 23.35ms | 35.48ms | 49.33ms | 19.84ms | 24.78ms | 33.55ms |
| comp_1to4 | 13.34ms | 19.95ms | 51.91ms | 5.27ms | 22.02ms | 20.78ms |
| comp_1to8 | 6.88ms | 22.79ms | 45.76ms | 4.78ms | 9.11ms | 23.92ms |
| comp_1to1000 | 4.20ms | 15.45ms | 40.68ms | 3.26ms | 7.81ms | 14.34ms |
| update_1to1 | 8.93ms | 21.42ms | 9.50ms | 4.71ms | 9.05ms | 15.59ms |
| update_2to1 | 4.47ms | 10.43ms | 2.90ms | 2.34ms | 4.57ms | 7.86ms |
| update_4to1 | 2.28ms | 5.41ms | 2.03ms | 1.24ms | 2.25ms | 3.98ms |
| update_1000to1 | 22μs | 66μs | 15μs | 11μs | 23μs | 39μs |
| update_1to2 | 4.50ms | 10.36ms | 3.74ms | 2.35ms | 4.51ms | 8.12ms |
| update_1to4 | 2.26ms | 5.26ms | 1.46ms | 1.24ms | 2.36ms | 3.92ms |
| update_1to1000 | 42μs | 163μs | 414μs | 46μs | 2.46ms | 147μs |
| cellx1000 | 10.83ms | 71.54ms | 5.37ms | 9.25ms | 10.14ms | 11.65ms |
| cellx2500 | 35.18ms | 252.09ms | 28.58ms | 19.89ms | 26.75ms | 33.90ms |
| cellx5000 | 74.35ms | 572.90ms | 68.85ms | 43.72ms | 67.77ms | 75.92ms |
| 10x5 - 2 sources - read 20.0% (simple) | 505.79ms | 1.96s | 234.61ms | 228.58ms | 455.22ms | 348.15ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 284.95ms | 1.51s | 203.47ms | 177.77ms | 274.61ms | 243.06ms |
| 1000x12 - 4 sources - dynamic (large) | 3.78s | 1.89s | 344.58ms | 290.01ms | 3.76s | 455.76ms |
| 1000x5 - 25 sources (wide dense) | 3.34s | 3.35s | 520.26ms | 412.48ms | 2.82s | 596.14ms |
| 5x500 - 3 sources (deep) | 226.93ms | 1.12s | 205.64ms | 196.05ms | 232.98ms | 271.92ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 474.99ms | 1.66s | 259.23ms | 270.47ms | 451.28ms | 387.83ms |

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
