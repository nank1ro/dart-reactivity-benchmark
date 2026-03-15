# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.82s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.44s |
| 🥉 | signals | 0.28 | 100.0% | 35/35 | 10.95s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.79s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.63s |
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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 198.84ms | 2.37s | 157.45ms (fail) | 196.09ms | 206.86ms | 273.58ms |
| broadPropagation | 452.29ms | 4.27s | 5.98ms (fail) | 359.97ms | 457.65ms | 500.09ms |
| deepPropagation | 169.85ms | 1.52s | 139.46ms (fail) | 126.31ms | 173.21ms | 163.02ms |
| diamond | 285.77ms | 2.42s | 180.04ms (fail) | 247.41ms | 283.69ms | 348.93ms |
| mux | 402.61ms | 1.84s | 187.06ms (fail) | 364.06ms | 381.47ms | 415.74ms |
| repeatedObservers | 45.64ms | 231.40ms | 55.86ms (fail) | 45.56ms | 42.11ms | 80.30ms |
| triangle | 101.64ms | 764.66ms | 76.92ms (fail) | 88.58ms | 99.45ms | 112.96ms |
| unstable | 74.14ms | 341.80ms | 337.41ms (fail) | 62.05ms | 71.00ms | 95.11ms |
| molBench | 494.43ms | 589.18ms | 1.13ms | 487.33ms | 495.74ms | 490.22ms |
| create_signals | 29.26ms | 63.77ms | 61.30ms | 24.99ms | 10.99ms | 61.48ms |
| comp_0to1 | 12.62ms | 15.35ms | 55.69ms | 8.38ms | 37.63ms | 27.35ms |
| comp_1to1 | 27.14ms | 44.21ms | 56.39ms | 4.71ms | 10.86ms | 44.33ms |
| comp_2to1 | 8.78ms | 38.24ms | 38.87ms | 2.60ms | 10.91ms | 54.87ms |
| comp_4to1 | 2.33ms | 14.62ms | 17.23ms | 8.87ms | 19.47ms | 4.90ms |
| comp_1000to1 | 6μs | 16μs | 43μs | 4μs | 9μs | 15μs |
| comp_1to2 | 22.84ms | 37.85ms | 49.04ms | 21.03ms | 23.35ms | 29.02ms |
| comp_1to4 | 15.45ms | 24.12ms | 45.75ms | 6.65ms | 32.77ms | 35.77ms |
| comp_1to8 | 7.53ms | 25.90ms | 44.47ms | 9.38ms | 7.59ms | 25.69ms |
| comp_1to1000 | 4.25ms | 15.38ms | 40.22ms | 3.83ms | 4.84ms | 14.89ms |
| update_1to1 | 9.01ms | 21.56ms | 8.67ms | 4.64ms | 9.00ms | 15.74ms |
| update_2to1 | 4.45ms | 10.39ms | 7.59ms | 2.38ms | 4.60ms | 7.86ms |
| update_4to1 | 2.33ms | 5.46ms | 1.68ms | 1.23ms | 2.31ms | 3.99ms |
| update_1000to1 | 22μs | 61μs | 14μs | 11μs | 23μs | 39μs |
| update_1to2 | 4.46ms | 10.46ms | 5.17ms | 2.35ms | 4.46ms | 8.07ms |
| update_1to4 | 2.26ms | 5.26ms | 1.47ms | 1.23ms | 2.39ms | 3.99ms |
| update_1to1000 | 43μs | 154μs | 389μs | 49μs | 221μs | 149μs |
| cellx1000 | 13.18ms | 106.13ms | 8.93ms | 8.75ms | 13.31ms | 19.74ms |
| cellx2500 | 57.52ms | 358.49ms | 35.45ms | 31.41ms | 51.13ms | 79.13ms |
| cellx5000 | 130.74ms | 697.73ms | 95.54ms | 85.70ms | 145.24ms | 192.35ms |
| 10x5 - 2 sources - read 20.0% (simple) | 493.94ms | 1.99s | 247.44ms | 239.75ms | 459.66ms | 346.66ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.23ms | 1.48s | 199.77ms | 183.25ms | 270.61ms | 249.68ms |
| 1000x12 - 4 sources - dynamic (large) | 3.48s | 1.94s | 355.85ms | 290.88ms | 3.82s | 472.88ms |
| 1000x5 - 25 sources (wide dense) | 3.41s | 3.42s | 517.73ms | 425.24ms | 2.94s | 605.20ms |
| 5x500 - 3 sources (deep) | 230.75ms | 1.24s | 208.25ms | 198.71ms | 236.37ms | 266.73ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 475.24ms | 1.71s | 266.67ms | 273.97ms | 459.10ms | 393.38ms |

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
