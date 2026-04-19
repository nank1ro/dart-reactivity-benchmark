# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 2.96s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 4.27s |
| 🥉 | preact_signals | 0.23 | 100.0% | 35/35 | 8.08s |
| 4 | signals | 0.22 | 100.0% | 35/35 | 8.90s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 20.87s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 2.58s |

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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 1.76s | 167.07ms | 141.86ms | 170.07ms | 208.16ms | 117.76ms (fail) |
| broadPropagation | 3.22s | 380.15ms | 274.36ms | 411.58ms | 380.79ms | 4.68ms (fail) |
| deepPropagation | 1.14s | 139.35ms | 91.43ms | 153.59ms | 125.59ms | 116.48ms (fail) |
| diamond | 1.72s | 217.93ms | 206.48ms | 222.42ms | 284.77ms | 148.77ms (fail) |
| mux | 1.36s | 300.64ms | 282.84ms | 298.27ms | 328.62ms | 146.86ms (fail) |
| repeatedObservers | 176.53ms | 35.93ms | 35.23ms | 33.61ms | 67.92ms | 42.29ms (fail) |
| triangle | 562.60ms | 86.37ms | 67.74ms | 83.35ms | 95.58ms | 61.25ms (fail) |
| unstable | 263.48ms | 60.76ms | 47.61ms | 56.44ms | 83.42ms | 265.39ms (fail) |
| molBench | 494.86ms | 424.76ms | 436.65ms | 424.53ms | 441.08ms | 788μs |
| create_signals | 48.06ms | 25.31ms | 22.64ms | 4.53ms | 54.27ms | 49.22ms |
| comp_0to1 | 11.59ms | 10.97ms | 6.98ms | 16.74ms | 21.89ms | 41.94ms |
| comp_1to1 | 46.32ms | 39.98ms | 3.16ms | 11.09ms | 35.28ms | 42.63ms |
| comp_2to1 | 30.17ms | 24.03ms | 1.76ms | 10.85ms | 34.27ms | 29.62ms |
| comp_4to1 | 24.70ms | 26.47ms | 9.20ms | 14.52ms | 14.89ms | 13.61ms |
| comp_1000to1 | 22μs | 20μs | 3μs | 6μs | 12μs | 32μs |
| comp_1to2 | 31.47ms | 8.25ms | 26.78ms | 20.18ms | 32.19ms | 34.58ms |
| comp_1to4 | 13.87ms | 12.28ms | 7.13ms | 23.07ms | 17.17ms | 33.59ms |
| comp_1to8 | 16.55ms | 7.90ms | 6.56ms | 5.76ms | 18.94ms | 31.86ms |
| comp_1to1000 | 11.53ms | 2.82ms | 2.64ms | 4.77ms | 11.27ms | 28.51ms |
| update_1to1 | 18.17ms | 7.40ms | 3.70ms | 7.49ms | 12.96ms | 4.65ms |
| update_2to1 | 8.93ms | 3.63ms | 1.85ms | 3.72ms | 6.48ms | 2.66ms |
| update_4to1 | 4.54ms | 1.85ms | 963μs | 1.81ms | 3.23ms | 1.20ms |
| update_1000to1 | 44μs | 18μs | 9μs | 17μs | 32μs | 12μs |
| update_1to2 | 8.79ms | 3.65ms | 1.84ms | 3.71ms | 6.63ms | 2.37ms |
| update_1to4 | 4.45ms | 1.84ms | 954μs | 2.03ms | 3.24ms | 1.19ms |
| update_1to1000 | 208μs | 37μs | 33μs | 745μs | 113μs | 325μs |
| cellx1000 | 64.69ms | 10.92ms | 7.07ms | 8.57ms | 9.58ms | 3.88ms |
| cellx2500 | 249.11ms | 23.66ms | 17.58ms | 35.89ms | 37.11ms | 23.24ms |
| cellx5000 | 538.75ms | 73.62ms | 49.55ms | 81.98ms | 129.36ms | 55.16ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.56s | 393.07ms | 189.41ms | 337.92ms | 289.42ms | 190.87ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.11s | 210.77ms | 144.53ms | 203.38ms | 210.70ms | 157.21ms |
| 1000x12 - 4 sources - dynamic (large) | 1.48s | 2.91s | 215.62ms | 2.77s | 338.07ms | 225.64ms |
| 1000x5 - 25 sources (wide dense) | 2.67s | 2.75s | 323.07ms | 2.13s | 496.78ms | 358.22ms |
| 5x500 - 3 sources (deep) | 899.82ms | 177.39ms | 151.44ms | 181.92ms | 204.99ms | 154.82ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.33s | 361.18ms | 182.81ms | 340.06ms | 267.30ms | 183.79ms |

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
