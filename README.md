# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.50s |
| 🥉 | signals | 0.24 | 100.0% | 35/35 | 10.90s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 9.99s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.06s |
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
| Test Case | preact_signals | solidart(2.0-dev) | mobx | alien_signals | state_beacon | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 214.63ms | 265.49ms | 2.29s | 184.28ms | 155.65ms (fail) | 211.93ms |
| broadPropagation | 506.54ms | 487.50ms | 4.22s | 357.61ms | 6.11ms (fail) | 483.58ms |
| deepPropagation | 191.81ms | 167.42ms | 1.50s | 119.34ms | 155.90ms (fail) | 193.13ms |
| diamond | 285.59ms | 376.66ms | 2.24s | 265.14ms | 189.48ms (fail) | 288.45ms |
| mux | 385.40ms | 430.56ms | 1.69s | 360.89ms | 185.06ms (fail) | 397.98ms |
| repeatedObservers | 41.48ms | 88.94ms | 229.76ms | 42.96ms | 54.09ms (fail) | 46.78ms |
| triangle | 106.39ms | 122.46ms | 727.37ms | 87.49ms | 81.31ms (fail) | 106.04ms |
| unstable | 73.14ms | 105.98ms | 347.58ms | 59.98ms | 341.57ms (fail) | 79.32ms |
| molBench | 547.35ms | 558.86ms | 643.96ms | 552.09ms | 1.02ms | 547.66ms |
| create_signals | 5.87ms | 110.07ms | 100.78ms | 25.00ms | 64.75ms | 28.58ms |
| comp_0to1 | 24.43ms | 37.41ms | 15.13ms | 9.66ms | 55.81ms | 13.19ms |
| comp_1to1 | 14.65ms | 30.93ms | 56.89ms | 4.14ms | 59.29ms | 29.15ms |
| comp_2to1 | 19.56ms | 37.04ms | 50.45ms | 2.24ms | 39.39ms | 14.49ms |
| comp_4to1 | 13.12ms | 4.45ms | 35.46ms | 13.06ms | 16.81ms | 3.16ms |
| comp_1000to1 | 4μs | 16μs | 16μs | 6μs | 41μs | 6μs |
| comp_1to2 | 23.37ms | 36.36ms | 39.74ms | 21.41ms | 48.37ms | 23.68ms |
| comp_1to4 | 34.88ms | 22.37ms | 17.40ms | 6.03ms | 47.00ms | 13.17ms |
| comp_1to8 | 7.04ms | 25.00ms | 20.09ms | 3.95ms | 43.36ms | 6.54ms |
| comp_1to1000 | 6.35ms | 14.86ms | 14.66ms | 3.48ms | 36.41ms | 4.04ms |
| update_1to1 | 8.65ms | 16.34ms | 23.21ms | 4.39ms | 6.19ms | 9.84ms |
| update_2to1 | 4.24ms | 8.14ms | 11.40ms | 2.29ms | 3.16ms | 5.13ms |
| update_4to1 | 2.09ms | 4.09ms | 6.25ms | 1.14ms | 1.57ms | 2.54ms |
| update_1000to1 | 21μs | 41μs | 56μs | 11μs | 17μs | 25μs |
| update_1to2 | 4.22ms | 8.40ms | 11.52ms | 2.26ms | 3.10ms | 5.12ms |
| update_1to4 | 2.09ms | 4.11ms | 5.69ms | 1.14ms | 1.55ms | 2.60ms |
| update_1to1000 | 601μs | 143μs | 155μs | 45μs | 358μs | 40μs |
| cellx1000 | 10.09ms | 12.17ms | 90.13ms | 6.87ms | 5.05ms | 9.68ms |
| cellx2500 | 29.95ms | 45.34ms | 303.49ms | 21.20ms | 29.20ms | 39.80ms |
| cellx5000 | 112.31ms | 134.77ms | 671.71ms | 53.90ms | 96.41ms | 115.15ms |
| 10x5 - 2 sources - read 20.0% (simple) | 425.93ms | 373.45ms | 2.01s | 243.70ms | 251.74ms | 485.98ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 262.42ms | 273.14ms | 1.40s | 183.41ms | 199.41ms | 270.06ms |
| 1000x12 - 4 sources - dynamic (large) | 3.37s | 434.84ms | 1.94s | 274.56ms | 332.88ms | 3.44s |
| 1000x5 - 25 sources (wide dense) | 2.58s | 644.01ms | 3.45s | 408.07ms | 466.56ms | 3.31s |
| 5x500 - 3 sources (deep) | 233.84ms | 272.39ms | 1.16s | 191.87ms | 205.90ms | 238.38ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 438.21ms | 344.58ms | 1.75s | 237.00ms | 241.61ms | 474.06ms |

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
