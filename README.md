# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.65s |
| 🥈 | preact_signals | 0.26 | 100.0% | 35/35 | 9.98s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.33s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.22s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.15s |
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
| avoidablePropagation | 213.73ms | 186.85ms | 160.19ms (fail) | 286.08ms | 205.08ms | 2.38s |
| broadPropagation | 465.54ms | 351.85ms | 6.25ms (fail) | 497.26ms | 447.21ms | 4.45s |
| deepPropagation | 174.78ms | 125.93ms | 139.22ms (fail) | 166.46ms | 180.44ms | 1.52s |
| diamond | 290.25ms | 229.45ms | 178.01ms (fail) | 354.59ms | 283.60ms | 2.41s |
| mux | 386.07ms | 353.44ms | 177.96ms (fail) | 418.62ms | 372.00ms | 1.84s |
| repeatedObservers | 46.52ms | 43.24ms | 52.11ms (fail) | 83.52ms | 40.53ms | 231.23ms |
| triangle | 101.52ms | 83.75ms | 76.79ms (fail) | 113.60ms | 100.48ms | 769.56ms |
| unstable | 77.43ms | 63.12ms | 340.17ms (fail) | 96.02ms | 69.59ms | 347.67ms |
| molBench | 495.75ms | 485.81ms | 974μs | 490.15ms | 480.66ms | 590.27ms |
| create_signals | 27.62ms | 27.56ms | 62.04ms | 76.89ms | 4.83ms | 88.89ms |
| comp_0to1 | 12.72ms | 7.86ms | 60.08ms | 26.79ms | 24.01ms | 16.61ms |
| comp_1to1 | 33.86ms | 4.22ms | 52.80ms | 39.26ms | 13.89ms | 49.21ms |
| comp_2to1 | 14.19ms | 2.33ms | 36.40ms | 26.21ms | 17.36ms | 23.28ms |
| comp_4to1 | 2.03ms | 8.79ms | 16.07ms | 14.83ms | 12.98ms | 28.33ms |
| comp_1000to1 | 5μs | 6μs | 40μs | 18μs | 5μs | 14μs |
| comp_1to2 | 18.75ms | 19.18ms | 43.63ms | 37.66ms | 15.71ms | 36.68ms |
| comp_1to4 | 13.63ms | 10.82ms | 43.45ms | 21.24ms | 29.30ms | 16.96ms |
| comp_1to8 | 8.53ms | 5.39ms | 41.30ms | 20.71ms | 6.85ms | 19.93ms |
| comp_1to1000 | 4.45ms | 3.74ms | 37.48ms | 14.79ms | 5.01ms | 15.01ms |
| update_1to1 | 9.33ms | 6.03ms | 6.11ms | 15.55ms | 8.82ms | 21.79ms |
| update_2to1 | 4.75ms | 2.32ms | 3.24ms | 7.81ms | 4.32ms | 10.88ms |
| update_4to1 | 2.33ms | 1.17ms | 1.59ms | 3.88ms | 2.20ms | 5.46ms |
| update_1000to1 | 23μs | 11μs | 16μs | 39μs | 22μs | 53μs |
| update_1to2 | 4.62ms | 2.83ms | 3.07ms | 7.96ms | 4.36ms | 10.78ms |
| update_1to4 | 2.45ms | 1.19ms | 1.59ms | 3.90ms | 2.23ms | 5.29ms |
| update_1to1000 | 44μs | 36μs | 359μs | 172μs | 172μs | 156μs |
| cellx1000 | 10.44ms | 7.56ms | 5.07ms | 13.96ms | 10.15ms | 76.82ms |
| cellx2500 | 38.75ms | 21.03ms | 23.71ms | 40.69ms | 29.86ms | 275.28ms |
| cellx5000 | 81.21ms | 51.93ms | 80.61ms | 123.13ms | 79.38ms | 592.52ms |
| 10x5 - 2 sources - read 20.0% (simple) | 510.33ms | 235.58ms | 238.42ms | 363.30ms | 432.96ms | 1.93s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.30ms | 173.13ms | 199.45ms | 245.37ms | 268.94ms | 1.45s |
| 1000x12 - 4 sources - dynamic (large) | 3.88s | 276.95ms | 341.82ms | 472.85ms | 3.66s | 1.83s |
| 1000x5 - 25 sources (wide dense) | 3.30s | 402.81ms | 523.55ms | 602.31ms | 2.49s | 3.37s |
| 5x500 - 3 sources (deep) | 226.86ms | 189.51ms | 204.17ms | 262.38ms | 230.75ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 479.62ms | 262.79ms | 259.98ms | 382.11ms | 451.40ms | 1.65s |

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
