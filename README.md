# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.65s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.29s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 10.82s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.02s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.26s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.41s |

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
| avoidablePropagation | 208.93ms | 188.75ms | 166.32ms (fail) | 275.28ms | 200.32ms | 2.35s |
| broadPropagation | 462.39ms | 351.48ms | 6.97ms (fail) | 498.42ms | 466.57ms | 4.39s |
| deepPropagation | 173.42ms | 124.06ms | 139.17ms (fail) | 166.47ms | 184.73ms | 1.50s |
| diamond | 283.04ms | 232.36ms | 189.73ms (fail) | 358.24ms | 282.01ms | 2.41s |
| mux | 395.91ms | 353.12ms | 183.74ms (fail) | 421.05ms | 372.41ms | 1.83s |
| repeatedObservers | 46.11ms | 44.19ms | 52.88ms (fail) | 80.00ms | 40.33ms | 231.81ms |
| triangle | 102.44ms | 86.41ms | 76.50ms (fail) | 115.40ms | 100.58ms | 766.95ms |
| unstable | 78.06ms | 61.83ms | 338.35ms (fail) | 95.36ms | 69.41ms | 350.40ms |
| molBench | 495.46ms | 485.04ms | 1.35ms | 490.88ms | 486.73ms | 596.48ms |
| create_signals | 39.06ms | 27.90ms | 56.88ms | 92.89ms | 5.38ms | 81.86ms |
| comp_0to1 | 15.75ms | 8.39ms | 51.77ms | 34.59ms | 17.58ms | 16.06ms |
| comp_1to1 | 15.42ms | 4.27ms | 54.05ms | 50.05ms | 13.85ms | 39.57ms |
| comp_2to1 | 12.89ms | 2.27ms | 35.34ms | 22.54ms | 15.88ms | 43.35ms |
| comp_4to1 | 2.06ms | 8.45ms | 15.86ms | 18.00ms | 12.72ms | 15.23ms |
| comp_1000to1 | 18μs | 6μs | 41μs | 37μs | 5μs | 15μs |
| comp_1to2 | 21.10ms | 14.37ms | 43.67ms | 36.07ms | 18.77ms | 35.54ms |
| comp_1to4 | 13.17ms | 9.31ms | 43.91ms | 23.16ms | 30.77ms | 20.81ms |
| comp_1to8 | 6.47ms | 5.03ms | 41.69ms | 24.40ms | 6.39ms | 23.53ms |
| comp_1to1000 | 4.33ms | 3.29ms | 38.50ms | 14.63ms | 5.84ms | 15.79ms |
| update_1to1 | 9.28ms | 4.67ms | 6.19ms | 15.45ms | 8.93ms | 27.38ms |
| update_2to1 | 4.76ms | 2.33ms | 3.08ms | 7.75ms | 4.31ms | 13.62ms |
| update_4to1 | 2.38ms | 1.17ms | 1.58ms | 3.86ms | 2.22ms | 7.76ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 87μs |
| update_1to2 | 4.62ms | 2.29ms | 3.06ms | 7.72ms | 4.42ms | 13.87ms |
| update_1to4 | 2.55ms | 1.20ms | 1.60ms | 3.86ms | 2.23ms | 6.92ms |
| update_1to1000 | 43μs | 49μs | 393μs | 146μs | 792μs | 166μs |
| cellx1000 | 9.61ms | 7.22ms | 5.28ms | 11.97ms | 9.71ms | 76.05ms |
| cellx2500 | 31.02ms | 19.61ms | 24.51ms | 34.81ms | 27.37ms | 274.48ms |
| cellx5000 | 69.59ms | 44.34ms | 60.36ms | 84.16ms | 78.93ms | 601.42ms |
| 10x5 - 2 sources - read 20.0% (simple) | 501.22ms | 237.74ms | 245.88ms | 353.75ms | 432.39ms | 1.92s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.66ms | 174.30ms | 195.21ms | 245.21ms | 265.82ms | 1.48s |
| 1000x12 - 4 sources - dynamic (large) | 3.55s | 274.35ms | 345.38ms | 462.65ms | 3.66s | 1.85s |
| 1000x5 - 25 sources (wide dense) | 3.29s | 412.51ms | 517.41ms | 595.24ms | 2.52s | 3.49s |
| 5x500 - 3 sources (deep) | 225.35ms | 190.21ms | 202.79ms | 264.19ms | 229.80ms | 1.11s |
| 100x15 - 6 sources - dynamic (very dynamic) | 473.86ms | 263.62ms | 256.78ms | 382.17ms | 447.80ms | 1.68s |

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
