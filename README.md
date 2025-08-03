# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.24s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.38s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.34s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.62s |
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
| Test Case | state_beacon | mobx | solidart(2.0-dev) | preact_signals | signals | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 163.32ms (fail) | 2.32s | 275.43ms | 200.14ms | 204.97ms | 182.62ms |
| broadPropagation | 6.43ms (fail) | 4.48s | 502.63ms | 490.88ms | 452.97ms | 349.11ms |
| deepPropagation | 146.75ms (fail) | 1.56s | 167.19ms | 177.32ms | 173.72ms | 121.47ms |
| diamond | 183.13ms (fail) | 2.44s | 351.13ms | 300.36ms | 280.91ms | 233.03ms |
| mux | 198.57ms (fail) | 1.85s | 436.00ms | 403.43ms | 407.49ms | 370.51ms |
| repeatedObservers | 55.98ms (fail) | 233.46ms | 81.15ms | 41.17ms | 44.43ms | 45.60ms |
| triangle | 88.30ms (fail) | 770.48ms | 119.59ms | 102.09ms | 105.98ms | 84.75ms |
| unstable | 341.43ms (fail) | 352.66ms | 98.35ms | 72.77ms | 79.25ms | 66.99ms |
| molBench | 926μs | 578.82ms | 493.52ms | 488.76ms | 485.27ms | 486.67ms |
| create_signals | 62.45ms | 89.72ms | 75.70ms | 5.18ms | 24.69ms | 28.25ms |
| comp_0to1 | 52.78ms | 16.69ms | 27.96ms | 17.08ms | 11.15ms | 7.74ms |
| comp_1to1 | 54.77ms | 49.84ms | 29.23ms | 14.48ms | 18.16ms | 4.25ms |
| comp_2to1 | 35.75ms | 22.64ms | 39.31ms | 19.89ms | 16.57ms | 2.31ms |
| comp_4to1 | 16.06ms | 23.49ms | 12.34ms | 14.31ms | 2.25ms | 7.40ms |
| comp_1000to1 | 41μs | 17μs | 17μs | 4μs | 5μs | 3μs |
| comp_1to2 | 44.58ms | 36.08ms | 29.34ms | 17.84ms | 19.99ms | 10.52ms |
| comp_1to4 | 44.18ms | 19.53ms | 22.93ms | 38.38ms | 16.89ms | 11.61ms |
| comp_1to8 | 42.26ms | 23.25ms | 24.29ms | 8.72ms | 6.81ms | 4.90ms |
| comp_1to1000 | 38.83ms | 15.99ms | 17.15ms | 4.68ms | 4.79ms | 3.49ms |
| update_1to1 | 5.66ms | 27.03ms | 16.09ms | 8.59ms | 9.08ms | 10.44ms |
| update_2to1 | 3.10ms | 12.03ms | 7.81ms | 4.31ms | 4.81ms | 2.28ms |
| update_4to1 | 1.44ms | 6.82ms | 3.99ms | 2.18ms | 2.35ms | 2.53ms |
| update_1000to1 | 17μs | 70μs | 53μs | 21μs | 22μs | 26μs |
| update_1to2 | 2.83ms | 11.39ms | 8.01ms | 4.67ms | 4.50ms | 5.14ms |
| update_1to4 | 1.46ms | 6.98ms | 4.02ms | 2.18ms | 2.32ms | 2.46ms |
| update_1to1000 | 380μs | 173μs | 170μs | 204μs | 42μs | 57μs |
| cellx1000 | 5.03ms | 70.92ms | 11.99ms | 9.63ms | 9.49ms | 7.57ms |
| cellx2500 | 21.95ms | 234.66ms | 31.39ms | 25.82ms | 30.49ms | 20.50ms |
| cellx5000 | 54.90ms | 540.93ms | 69.31ms | 69.24ms | 59.24ms | 40.52ms |
| 10x5 - 2 sources - read 20.0% (simple) | 256.75ms | 2.03s | 354.48ms | 437.37ms | 518.93ms | 231.95ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 203.02ms | 1.56s | 243.65ms | 274.10ms | 281.05ms | 178.63ms |
| 1000x12 - 4 sources - dynamic (large) | 334.82ms | 1.81s | 459.87ms | 3.72s | 3.96s | 282.39ms |
| 1000x5 - 25 sources (wide dense) | 493.21ms | 3.52s | 589.02ms | 2.69s | 3.44s | 406.34ms |
| 5x500 - 3 sources (deep) | 204.67ms | 1.16s | 250.97ms | 224.78ms | 224.17ms | 188.06ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 258.08ms | 1.74s | 381.80ms | 450.57ms | 477.49ms | 271.15ms |

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
