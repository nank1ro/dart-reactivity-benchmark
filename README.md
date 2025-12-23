# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.71s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.04s |
| 🥉 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.29s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.06s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.14s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.51s |

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
| avoidablePropagation | 218.86ms | 191.31ms | 159.25ms (fail) | 276.08ms | 205.57ms | 2.39s |
| broadPropagation | 458.08ms | 355.83ms | 6.17ms (fail) | 497.59ms | 466.08ms | 4.35s |
| deepPropagation | 181.25ms | 140.09ms | 136.55ms (fail) | 169.71ms | 178.49ms | 1.49s |
| diamond | 287.14ms | 241.54ms | 204.85ms (fail) | 353.79ms | 296.61ms | 2.40s |
| mux | 387.96ms | 370.43ms | 179.62ms (fail) | 419.23ms | 375.04ms | 1.87s |
| repeatedObservers | 46.38ms | 43.87ms | 54.67ms (fail) | 80.69ms | 40.39ms | 232.30ms |
| triangle | 101.90ms | 85.17ms | 77.10ms (fail) | 115.02ms | 101.93ms | 756.25ms |
| unstable | 75.77ms | 63.92ms | 337.42ms (fail) | 96.83ms | 72.61ms | 342.99ms |
| molBench | 494.54ms | 487.70ms | 963μs | 490.43ms | 488.86ms | 590.57ms |
| create_signals | 49.68ms | 25.80ms | 70.07ms | 100.83ms | 5.19ms | 68.02ms |
| comp_0to1 | 14.65ms | 8.50ms | 57.62ms | 34.47ms | 17.97ms | 20.39ms |
| comp_1to1 | 33.78ms | 4.44ms | 62.33ms | 51.84ms | 14.14ms | 46.73ms |
| comp_2to1 | 18.20ms | 2.39ms | 37.44ms | 37.03ms | 15.05ms | 33.72ms |
| comp_4to1 | 3.15ms | 10.14ms | 17.17ms | 12.87ms | 8.95ms | 19.21ms |
| comp_1000to1 | 5μs | 4μs | 69μs | 15μs | 6μs | 16μs |
| comp_1to2 | 19.96ms | 18.23ms | 47.53ms | 27.84ms | 15.67ms | 36.43ms |
| comp_1to4 | 10.36ms | 11.58ms | 48.81ms | 20.99ms | 26.51ms | 17.70ms |
| comp_1to8 | 6.31ms | 6.64ms | 46.03ms | 20.73ms | 7.05ms | 20.57ms |
| comp_1to1000 | 4.43ms | 3.73ms | 41.23ms | 15.38ms | 4.54ms | 15.49ms |
| update_1to1 | 9.43ms | 4.64ms | 6.16ms | 15.51ms | 9.00ms | 29.08ms |
| update_2to1 | 4.72ms | 2.36ms | 3.07ms | 7.78ms | 4.61ms | 14.87ms |
| update_4to1 | 2.33ms | 1.21ms | 1.60ms | 3.88ms | 2.29ms | 7.30ms |
| update_1000to1 | 23μs | 11μs | 16μs | 39μs | 22μs | 72μs |
| update_1to2 | 4.63ms | 2.30ms | 3.07ms | 7.91ms | 4.53ms | 14.14ms |
| update_1to4 | 2.55ms | 1.28ms | 1.60ms | 3.87ms | 2.24ms | 7.57ms |
| update_1to1000 | 43μs | 37μs | 418μs | 149μs | 137μs | 165μs |
| cellx1000 | 9.83ms | 7.29ms | 7.14ms | 12.45ms | 9.67ms | 72.31ms |
| cellx2500 | 32.88ms | 19.96ms | 24.67ms | 34.20ms | 26.45ms | 273.30ms |
| cellx5000 | 74.00ms | 47.47ms | 88.09ms | 84.06ms | 76.80ms | 590.91ms |
| 10x5 - 2 sources - read 20.0% (simple) | 504.62ms | 241.53ms | 243.29ms | 346.38ms | 430.50ms | 1.95s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 277.06ms | 175.57ms | 219.86ms | 246.15ms | 264.41ms | 1.46s |
| 1000x12 - 4 sources - dynamic (large) | 3.55s | 278.35ms | 352.03ms | 463.99ms | 3.69s | 1.84s |
| 1000x5 - 25 sources (wide dense) | 3.47s | 404.97ms | 501.80ms | 595.30ms | 2.50s | 3.41s |
| 5x500 - 3 sources (deep) | 227.76ms | 191.84ms | 206.38ms | 257.09ms | 229.40ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 479.92ms | 258.49ms | 264.44ms | 386.66ms | 453.76ms | 1.66s |

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
