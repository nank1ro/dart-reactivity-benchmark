# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.20s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 10.98s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.48s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.08s |
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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.32s | 199.90ms | 198.80ms | 209.07ms | 272.54ms | 148.41ms (fail) |
| broadPropagation | 4.35s | 463.87ms | 358.78ms | 458.47ms | 499.01ms | 6.04ms (fail) |
| deepPropagation | 1.55s | 168.71ms | 124.92ms | 181.55ms | 165.25ms | 137.30ms (fail) |
| diamond | 2.45s | 283.88ms | 245.33ms | 285.35ms | 344.54ms | 180.91ms (fail) |
| mux | 1.80s | 404.95ms | 367.64ms | 371.45ms | 421.24ms | 180.74ms (fail) |
| repeatedObservers | 233.51ms | 45.99ms | 44.51ms | 42.31ms | 80.52ms | 55.77ms (fail) |
| triangle | 773.56ms | 101.14ms | 87.67ms | 99.45ms | 114.57ms | 76.49ms (fail) |
| unstable | 347.13ms | 76.50ms | 61.44ms | 72.10ms | 95.49ms | 336.61ms (fail) |
| molBench | 588.57ms | 493.71ms | 482.51ms | 496.23ms | 490.69ms | 1.00ms |
| create_signals | 52.32ms | 40.55ms | 28.45ms | 5.52ms | 67.00ms | 66.45ms |
| comp_0to1 | 14.82ms | 16.91ms | 7.28ms | 21.99ms | 27.61ms | 59.01ms |
| comp_1to1 | 39.63ms | 31.10ms | 4.27ms | 12.75ms | 42.42ms | 62.14ms |
| comp_2to1 | 34.55ms | 8.52ms | 2.33ms | 17.54ms | 9.82ms | 37.30ms |
| comp_4to1 | 27.55ms | 2.18ms | 8.77ms | 8.79ms | 18.70ms | 17.03ms |
| comp_1000to1 | 15μs | 5μs | 3μs | 5μs | 19μs | 44μs |
| comp_1to2 | 41.03ms | 18.76ms | 20.82ms | 15.41ms | 35.44ms | 48.47ms |
| comp_1to4 | 28.71ms | 9.86ms | 11.78ms | 24.21ms | 17.05ms | 48.86ms |
| comp_1to8 | 22.52ms | 6.29ms | 6.43ms | 7.27ms | 22.14ms | 47.35ms |
| comp_1to1000 | 15.04ms | 4.13ms | 3.55ms | 4.73ms | 13.96ms | 41.52ms |
| update_1to1 | 21.30ms | 8.92ms | 5.35ms | 9.19ms | 15.75ms | 8.98ms |
| update_2to1 | 10.54ms | 4.88ms | 2.41ms | 4.62ms | 7.83ms | 7.19ms |
| update_4to1 | 5.22ms | 2.28ms | 1.20ms | 2.31ms | 3.91ms | 2.26ms |
| update_1000to1 | 59μs | 22μs | 11μs | 22μs | 39μs | 14μs |
| update_1to2 | 11.10ms | 4.48ms | 2.36ms | 4.58ms | 7.84ms | 3.88ms |
| update_1to4 | 5.39ms | 2.25ms | 1.17ms | 2.49ms | 3.95ms | 1.47ms |
| update_1to1000 | 156μs | 72μs | 29μs | 161μs | 144μs | 414μs |
| cellx1000 | 78.31ms | 9.96ms | 7.63ms | 10.15ms | 14.40ms | 5.42ms |
| cellx2500 | 226.47ms | 33.31ms | 21.41ms | 27.93ms | 33.61ms | 27.57ms |
| cellx5000 | 591.85ms | 65.60ms | 49.91ms | 77.25ms | 79.83ms | 60.12ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.98s | 504.63ms | 237.09ms | 457.42ms | 346.80ms | 233.82ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.49s | 280.78ms | 183.48ms | 270.15ms | 248.94ms | 201.41ms |
| 1000x12 - 4 sources - dynamic (large) | 1.77s | 3.49s | 278.40ms | 3.81s | 462.46ms | 339.19ms |
| 1000x5 - 25 sources (wide dense) | 3.41s | 3.50s | 410.39ms | 2.79s | 601.54ms | 517.74ms |
| 5x500 - 3 sources (deep) | 1.13s | 225.97ms | 193.40ms | 233.87ms | 255.70ms | 207.46ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.66s | 471.42ms | 266.86ms | 453.42ms | 384.13ms | 255.47ms |

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
