# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.79s |
| 🥈 | preact_signals | 0.26 | 100.0% | 35/35 | 9.93s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 10.83s |
| 4 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.42s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.81s |
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
| Test Case | preact_signals | state_beacon | signals | alien_signals | mobx | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 218.34ms | 157.33ms (fail) | 212.30ms | 183.90ms | 2.33s | 265.95ms |
| broadPropagation | 530.30ms | 6.21ms (fail) | 467.57ms | 359.13ms | 4.21s | 488.37ms |
| deepPropagation | 193.70ms | 152.95ms (fail) | 179.74ms | 118.15ms | 1.48s | 169.58ms |
| diamond | 282.68ms | 190.53ms (fail) | 291.95ms | 286.75ms | 2.27s | 379.94ms |
| mux | 395.95ms | 192.46ms (fail) | 390.33ms | 370.99ms | 1.71s | 431.02ms |
| repeatedObservers | 41.66ms | 54.34ms (fail) | 47.33ms | 42.91ms | 233.46ms | 89.38ms |
| triangle | 114.80ms | 81.77ms (fail) | 106.65ms | 85.53ms | 722.83ms | 122.85ms |
| unstable | 73.47ms | 342.78ms (fail) | 79.18ms | 59.58ms | 344.40ms | 105.30ms |
| molBench | 547.04ms | 1.10ms | 547.20ms | 552.28ms | 640.53ms | 558.85ms |
| create_signals | 5.72ms | 70.51ms | 28.37ms | 33.60ms | 68.28ms | 75.34ms |
| comp_0to1 | 19.67ms | 57.69ms | 12.36ms | 9.92ms | 14.72ms | 39.89ms |
| comp_1to1 | 20.71ms | 61.52ms | 29.56ms | 4.16ms | 57.75ms | 60.05ms |
| comp_2to1 | 19.46ms | 44.22ms | 11.76ms | 2.32ms | 37.76ms | 32.32ms |
| comp_4to1 | 12.77ms | 16.42ms | 2.70ms | 14.54ms | 31.13ms | 19.02ms |
| comp_1000to1 | 4μs | 39μs | 5μs | 3μs | 15μs | 19μs |
| comp_1to2 | 29.34ms | 44.69ms | 19.44ms | 20.30ms | 36.73ms | 38.66ms |
| comp_1to4 | 23.18ms | 44.29ms | 7.51ms | 5.73ms | 22.52ms | 24.04ms |
| comp_1to8 | 9.09ms | 41.30ms | 6.45ms | 4.11ms | 23.11ms | 24.55ms |
| comp_1to1000 | 3.33ms | 36.15ms | 4.02ms | 3.52ms | 14.77ms | 14.59ms |
| update_1to1 | 8.51ms | 6.17ms | 9.96ms | 4.40ms | 23.49ms | 16.46ms |
| update_2to1 | 4.29ms | 3.16ms | 5.15ms | 2.31ms | 11.47ms | 8.18ms |
| update_4to1 | 2.14ms | 1.57ms | 2.50ms | 1.25ms | 5.89ms | 4.08ms |
| update_1000to1 | 20μs | 16μs | 25μs | 11μs | 57μs | 41μs |
| update_1to2 | 4.22ms | 3.11ms | 4.94ms | 2.26ms | 11.57ms | 8.21ms |
| update_1to4 | 2.12ms | 1.56ms | 2.57ms | 1.16ms | 5.75ms | 4.13ms |
| update_1to1000 | 45μs | 360μs | 40μs | 46μs | 157μs | 143μs |
| cellx1000 | 12.51ms | 5.47ms | 10.98ms | 7.73ms | 77.96ms | 11.27ms |
| cellx2500 | 27.96ms | 27.43ms | 31.63ms | 20.14ms | 274.49ms | 31.98ms |
| cellx5000 | 70.92ms | 96.25ms | 65.45ms | 46.77ms | 647.87ms | 73.35ms |
| 10x5 - 2 sources - read 20.0% (simple) | 432.79ms | 249.65ms | 487.21ms | 251.54ms | 2.03s | 372.17ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 261.33ms | 200.93ms | 274.20ms | 190.63ms | 1.41s | 271.63ms |
| 1000x12 - 4 sources - dynamic (large) | 3.38s | 324.19ms | 3.54s | 268.78ms | 1.80s | 426.63ms |
| 1000x5 - 25 sources (wide dense) | 2.53s | 465.92ms | 3.25s | 414.12ms | 3.42s | 639.83ms |
| 5x500 - 3 sources (deep) | 228.08ms | 201.60ms | 227.56ms | 189.54ms | 1.14s | 266.15ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 431.52ms | 234.79ms | 470.06ms | 236.79ms | 1.71s | 345.16ms |

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
