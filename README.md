# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.65s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 10.90s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 9.91s |
| 4 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.32s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.15s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.38s |

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
| avoidablePropagation | 210.85ms | 187.60ms | 143.73ms (fail) | 280.06ms | 207.46ms | 2.40s |
| broadPropagation | 452.50ms | 352.30ms | 5.97ms (fail) | 509.30ms | 453.54ms | 4.41s |
| deepPropagation | 180.09ms | 124.88ms | 138.74ms (fail) | 168.53ms | 177.87ms | 1.52s |
| diamond | 288.82ms | 230.68ms | 179.35ms (fail) | 358.44ms | 282.61ms | 2.45s |
| mux | 395.22ms | 356.76ms | 182.72ms (fail) | 421.60ms | 374.16ms | 1.88s |
| repeatedObservers | 45.97ms | 43.30ms | 53.04ms (fail) | 80.51ms | 40.37ms | 232.55ms |
| triangle | 113.03ms | 85.92ms | 78.84ms (fail) | 113.00ms | 110.61ms | 745.48ms |
| unstable | 77.83ms | 62.65ms | 336.57ms (fail) | 95.31ms | 69.89ms | 346.56ms |
| molBench | 496.17ms | 484.13ms | 1.27ms | 490.00ms | 480.00ms | 591.87ms |
| create_signals | 25.40ms | 27.68ms | 56.95ms | 105.41ms | 5.39ms | 72.30ms |
| comp_0to1 | 11.39ms | 8.31ms | 51.26ms | 36.78ms | 18.25ms | 28.30ms |
| comp_1to1 | 26.66ms | 4.23ms | 52.44ms | 52.16ms | 13.79ms | 37.22ms |
| comp_2to1 | 8.80ms | 2.31ms | 35.73ms | 48.71ms | 17.17ms | 24.18ms |
| comp_4to1 | 1.86ms | 8.80ms | 15.95ms | 17.76ms | 21.77ms | 30.66ms |
| comp_1000to1 | 5μs | 5μs | 40μs | 17μs | 6μs | 15μs |
| comp_1to2 | 19.96ms | 19.29ms | 43.90ms | 27.33ms | 25.11ms | 36.79ms |
| comp_1to4 | 11.84ms | 11.28ms | 43.70ms | 20.92ms | 25.35ms | 19.02ms |
| comp_1to8 | 6.27ms | 5.33ms | 41.40ms | 23.17ms | 6.91ms | 23.48ms |
| comp_1to1000 | 4.24ms | 4.02ms | 37.80ms | 14.79ms | 4.70ms | 15.24ms |
| update_1to1 | 9.36ms | 4.66ms | 6.09ms | 15.23ms | 8.75ms | 27.12ms |
| update_2to1 | 4.73ms | 2.31ms | 3.07ms | 7.67ms | 4.36ms | 13.33ms |
| update_4to1 | 2.37ms | 2.60ms | 1.56ms | 3.81ms | 2.25ms | 7.08ms |
| update_1000to1 | 23μs | 24μs | 16μs | 37μs | 23μs | 86μs |
| update_1to2 | 4.64ms | 2.24ms | 3.07ms | 7.81ms | 4.37ms | 13.40ms |
| update_1to4 | 2.56ms | 1.15ms | 1.60ms | 3.82ms | 2.24ms | 5.67ms |
| update_1to1000 | 43μs | 48μs | 363μs | 152μs | 148μs | 162μs |
| cellx1000 | 9.69ms | 7.36ms | 5.25ms | 12.23ms | 9.49ms | 73.16ms |
| cellx2500 | 31.86ms | 19.41ms | 26.66ms | 34.18ms | 25.52ms | 250.05ms |
| cellx5000 | 62.17ms | 42.83ms | 68.43ms | 86.92ms | 67.07ms | 566.79ms |
| 10x5 - 2 sources - read 20.0% (simple) | 509.34ms | 233.55ms | 237.18ms | 349.93ms | 431.75ms | 1.93s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.92ms | 173.84ms | 196.08ms | 245.00ms | 265.41ms | 1.44s |
| 1000x12 - 4 sources - dynamic (large) | 3.55s | 275.52ms | 348.58ms | 459.61ms | 3.58s | 1.84s |
| 1000x5 - 25 sources (wide dense) | 3.36s | 411.52ms | 519.37ms | 589.82ms | 2.51s | 3.40s |
| 5x500 - 3 sources (deep) | 224.56ms | 190.13ms | 204.24ms | 255.23ms | 226.82ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 475.03ms | 261.60ms | 257.43ms | 382.48ms | 434.20ms | 1.62s |

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
