# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.21s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 10.81s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.51s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.67s |
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
| avoidablePropagation | 199.84ms | 2.27s | 157.49ms (fail) | 192.69ms | 208.68ms | 278.98ms |
| broadPropagation | 469.29ms | 4.22s | 7.09ms (fail) | 359.12ms | 454.11ms | 504.14ms |
| deepPropagation | 171.26ms | 1.50s | 138.55ms (fail) | 128.37ms | 177.46ms | 165.16ms |
| diamond | 290.38ms | 2.34s | 191.25ms (fail) | 246.77ms | 283.89ms | 347.03ms |
| mux | 392.63ms | 1.76s | 178.10ms (fail) | 359.36ms | 379.48ms | 425.23ms |
| repeatedObservers | 45.91ms | 222.79ms | 55.60ms (fail) | 46.41ms | 41.72ms | 80.53ms |
| triangle | 101.40ms | 746.30ms | 76.64ms (fail) | 88.54ms | 99.45ms | 118.57ms |
| unstable | 77.32ms | 333.24ms | 336.17ms (fail) | 62.40ms | 71.37ms | 95.44ms |
| molBench | 493.19ms | 584.77ms | 1.58ms | 487.31ms | 494.86ms | 490.33ms |
| create_signals | 26.16ms | 90.84ms | 60.09ms | 28.27ms | 5.66ms | 75.53ms |
| comp_0to1 | 11.37ms | 28.81ms | 54.42ms | 7.87ms | 18.60ms | 26.61ms |
| comp_1to1 | 27.20ms | 54.99ms | 60.88ms | 4.39ms | 10.93ms | 49.94ms |
| comp_2to1 | 8.72ms | 26.18ms | 36.38ms | 2.35ms | 17.81ms | 24.41ms |
| comp_4to1 | 1.85ms | 16.89ms | 16.62ms | 8.62ms | 12.84ms | 16.35ms |
| comp_1000to1 | 4μs | 16μs | 44μs | 3μs | 4μs | 15μs |
| comp_1to2 | 19.32ms | 32.58ms | 45.72ms | 20.33ms | 24.56ms | 27.27ms |
| comp_1to4 | 15.07ms | 21.59ms | 45.28ms | 5.30ms | 23.66ms | 24.12ms |
| comp_1to8 | 6.83ms | 22.72ms | 44.48ms | 5.20ms | 15.95ms | 21.33ms |
| comp_1to1000 | 4.13ms | 15.24ms | 39.68ms | 3.54ms | 5.10ms | 14.34ms |
| update_1to1 | 9.02ms | 21.60ms | 10.02ms | 4.62ms | 9.05ms | 15.72ms |
| update_2to1 | 4.46ms | 10.37ms | 7.55ms | 2.38ms | 4.55ms | 7.86ms |
| update_4to1 | 2.24ms | 5.72ms | 1.91ms | 1.24ms | 2.30ms | 3.93ms |
| update_1000to1 | 22μs | 62μs | 14μs | 11μs | 23μs | 39μs |
| update_1to2 | 4.42ms | 10.51ms | 5.08ms | 2.33ms | 4.49ms | 7.99ms |
| update_1to4 | 2.30ms | 7.06ms | 1.46ms | 1.22ms | 2.41ms | 3.96ms |
| update_1to1000 | 40μs | 155μs | 384μs | 46μs | 69μs | 163μs |
| cellx1000 | 9.70ms | 69.73ms | 5.02ms | 7.50ms | 10.01ms | 11.54ms |
| cellx2500 | 32.13ms | 255.86ms | 25.82ms | 20.85ms | 26.42ms | 33.11ms |
| cellx5000 | 65.05ms | 561.91ms | 60.03ms | 44.30ms | 69.69ms | 70.84ms |
| 10x5 - 2 sources - read 20.0% (simple) | 506.44ms | 1.94s | 247.63ms | 235.57ms | 457.75ms | 341.75ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.13ms | 1.45s | 202.35ms | 183.25ms | 278.49ms | 245.74ms |
| 1000x12 - 4 sources - dynamic (large) | 3.59s | 1.87s | 338.38ms | 282.18ms | 3.81s | 453.12ms |
| 1000x5 - 25 sources (wide dense) | 3.24s | 3.39s | 521.16ms | 416.45ms | 2.79s | 595.01ms |
| 5x500 - 3 sources (deep) | 219.28ms | 1.11s | 207.53ms | 196.00ms | 236.71ms | 251.77ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 482.06ms | 1.68s | 259.57ms | 262.31ms | 450.63ms | 385.53ms |

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
