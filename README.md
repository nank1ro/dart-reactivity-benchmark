# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.78 | 100.0% | 35/35 | 3.66s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 10.04s |
| 🥉 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.40s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.41s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.51s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| avoidablePropagation | 211.23ms | 186.84ms | 144.36ms (fail) | 282.85ms | 206.13ms | 2.34s |
| broadPropagation | 447.31ms | 352.31ms | 5.82ms (fail) | 506.22ms | 455.50ms | 4.43s |
| deepPropagation | 172.89ms | 124.84ms | 140.06ms (fail) | 170.87ms | 178.37ms | 1.51s |
| diamond | 279.30ms | 232.00ms | 182.34ms (fail) | 368.44ms | 282.61ms | 2.37s |
| mux | 392.74ms | 364.02ms | 183.68ms (fail) | 417.29ms | 379.99ms | 1.92s |
| repeatedObservers | 46.04ms | 43.34ms | 52.36ms (fail) | 84.91ms | 40.24ms | 229.57ms |
| triangle | 99.85ms | 85.22ms | 78.56ms (fail) | 119.46ms | 100.44ms | 752.47ms |
| unstable | 77.85ms | 61.85ms | 339.68ms (fail) | 97.99ms | 71.30ms | 341.52ms |
| molBench | 497.27ms | 486.67ms | 1.20ms | 498.06ms | 480.21ms | 589.08ms |
| create_signals | 26.78ms | 29.49ms | 63.98ms | 61.74ms | 11.17ms | 66.49ms |
| comp_0to1 | 12.17ms | 8.22ms | 54.48ms | 26.00ms | 25.66ms | 23.23ms |
| comp_1to1 | 18.68ms | 4.25ms | 55.75ms | 31.45ms | 7.08ms | 40.28ms |
| comp_2to1 | 18.11ms | 2.28ms | 38.65ms | 37.12ms | 10.51ms | 26.94ms |
| comp_4to1 | 8.55ms | 10.33ms | 16.68ms | 19.74ms | 9.05ms | 14.40ms |
| comp_1000to1 | 5μs | 4μs | 42μs | 15μs | 5μs | 19μs |
| comp_1to2 | 18.14ms | 15.53ms | 46.42ms | 33.37ms | 23.00ms | 38.90ms |
| comp_1to4 | 10.31ms | 6.23ms | 46.09ms | 20.89ms | 24.52ms | 23.73ms |
| comp_1to8 | 6.38ms | 6.21ms | 44.45ms | 20.66ms | 6.76ms | 25.29ms |
| comp_1to1000 | 4.20ms | 3.62ms | 39.63ms | 15.06ms | 4.18ms | 15.67ms |
| update_1to1 | 9.42ms | 4.66ms | 6.11ms | 15.52ms | 8.76ms | 27.40ms |
| update_2to1 | 4.74ms | 2.35ms | 3.09ms | 7.73ms | 4.56ms | 13.37ms |
| update_4to1 | 2.34ms | 1.22ms | 1.57ms | 3.88ms | 2.20ms | 6.61ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 66μs |
| update_1to2 | 4.64ms | 2.28ms | 3.05ms | 7.89ms | 4.40ms | 13.89ms |
| update_1to4 | 2.54ms | 1.23ms | 1.58ms | 3.91ms | 2.22ms | 6.92ms |
| update_1to1000 | 43μs | 46μs | 397μs | 147μs | 47μs | 165μs |
| cellx1000 | 10.35ms | 10.22ms | 7.14ms | 13.38ms | 12.46ms | 83.92ms |
| cellx2500 | 44.40ms | 21.64ms | 31.89ms | 47.36ms | 30.12ms | 301.56ms |
| cellx5000 | 92.17ms | 51.58ms | 89.44ms | 140.99ms | 85.68ms | 620.91ms |
| 10x5 - 2 sources - read 20.0% (simple) | 499.95ms | 225.95ms | 233.84ms | 370.45ms | 431.71ms | 1.96s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 276.94ms | 172.86ms | 198.61ms | 252.32ms | 268.57ms | 1.49s |
| 1000x12 - 4 sources - dynamic (large) | 3.93s | 279.44ms | 364.50ms | 479.06ms | 3.67s | 1.95s |
| 1000x5 - 25 sources (wide dense) | 3.46s | 405.59ms | 524.53ms | 601.46ms | 2.52s | 3.48s |
| 5x500 - 3 sources (deep) | 233.52ms | 195.89ms | 202.91ms | 258.00ms | 224.61ms | 1.11s |
| 100x15 - 6 sources - dynamic (very dynamic) | 485.35ms | 260.65ms | 254.19ms | 390.47ms | 457.61ms | 1.69s |

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
