# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.68s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.27s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.34s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 9.99s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 26.72s |
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
| avoidablePropagation | 210.46ms | 187.81ms | 149.44ms (fail) | 274.63ms | 207.41ms | 2.38s |
| broadPropagation | 453.71ms | 352.79ms | 6.15ms (fail) | 495.71ms | 454.82ms | 4.30s |
| deepPropagation | 165.77ms | 138.69ms | 137.88ms (fail) | 167.95ms | 180.13ms | 1.48s |
| diamond | 280.95ms | 229.77ms | 180.44ms (fail) | 351.55ms | 282.40ms | 2.35s |
| mux | 389.19ms | 361.18ms | 181.14ms (fail) | 420.40ms | 369.15ms | 1.86s |
| repeatedObservers | 46.13ms | 44.11ms | 52.71ms (fail) | 80.31ms | 40.58ms | 225.77ms |
| triangle | 102.57ms | 85.59ms | 76.57ms (fail) | 113.26ms | 100.11ms | 756.63ms |
| unstable | 78.19ms | 62.36ms | 339.77ms (fail) | 96.40ms | 70.06ms | 342.13ms |
| molBench | 495.92ms | 485.38ms | 1.01ms | 490.39ms | 482.85ms | 588.03ms |
| create_signals | 26.26ms | 27.49ms | 63.35ms | 99.81ms | 5.48ms | 68.74ms |
| comp_0to1 | 11.47ms | 12.06ms | 56.85ms | 35.63ms | 17.82ms | 27.57ms |
| comp_1to1 | 26.63ms | 8.72ms | 58.25ms | 50.48ms | 13.16ms | 38.59ms |
| comp_2to1 | 8.61ms | 4.41ms | 42.02ms | 46.82ms | 16.79ms | 35.71ms |
| comp_4to1 | 1.92ms | 14.94ms | 17.71ms | 19.15ms | 8.89ms | 22.91ms |
| comp_1000to1 | 4μs | 6μs | 45μs | 16μs | 8μs | 5.16ms |
| comp_1to2 | 21.00ms | 9.50ms | 49.29ms | 32.14ms | 29.63ms | 34.73ms |
| comp_1to4 | 15.23ms | 9.16ms | 48.99ms | 21.35ms | 29.23ms | 17.21ms |
| comp_1to8 | 6.74ms | 4.01ms | 47.02ms | 21.85ms | 8.20ms | 19.65ms |
| comp_1to1000 | 4.29ms | 3.26ms | 43.64ms | 14.23ms | 8.85ms | 14.28ms |
| update_1to1 | 9.32ms | 4.86ms | 6.12ms | 15.53ms | 8.88ms | 27.08ms |
| update_2to1 | 4.73ms | 2.40ms | 3.05ms | 7.78ms | 4.45ms | 13.27ms |
| update_4to1 | 2.35ms | 1.22ms | 1.56ms | 3.87ms | 2.47ms | 6.96ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 75μs |
| update_1to2 | 4.64ms | 2.27ms | 3.08ms | 8.02ms | 4.33ms | 13.64ms |
| update_1to4 | 2.56ms | 1.26ms | 1.57ms | 3.89ms | 2.25ms | 6.97ms |
| update_1to1000 | 42μs | 35μs | 425μs | 153μs | 2.37ms | 162μs |
| cellx1000 | 9.58ms | 7.22ms | 5.14ms | 11.56ms | 9.71ms | 70.44ms |
| cellx2500 | 30.75ms | 19.18ms | 25.60ms | 31.86ms | 26.01ms | 250.79ms |
| cellx5000 | 61.41ms | 45.39ms | 56.40ms | 72.20ms | 68.21ms | 576.53ms |
| 10x5 - 2 sources - read 20.0% (simple) | 502.81ms | 229.78ms | 240.01ms | 348.31ms | 442.93ms | 1.91s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.96ms | 173.36ms | 197.78ms | 248.04ms | 264.13ms | 1.46s |
| 1000x12 - 4 sources - dynamic (large) | 3.84s | 290.78ms | 342.43ms | 460.13ms | 3.64s | 1.72s |
| 1000x5 - 25 sources (wide dense) | 3.56s | 406.98ms | 520.91ms | 597.66ms | 2.50s | 3.32s |
| 5x500 - 3 sources (deep) | 226.27ms | 190.29ms | 203.09ms | 255.00ms | 227.78ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 470.96ms | 259.72ms | 257.38ms | 378.39ms | 463.98ms | 1.67s |

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
