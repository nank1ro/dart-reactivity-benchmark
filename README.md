# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.34s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 10.75s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.57s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.96s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.54s |

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
| avoidablePropagation | 199.62ms | 193.97ms | 146.10ms (fail) | 275.25ms | 199.88ms | 2.29s |
| broadPropagation | 463.88ms | 356.92ms | 6.03ms (fail) | 496.22ms | 457.64ms | 4.22s |
| deepPropagation | 170.31ms | 126.31ms | 139.21ms (fail) | 169.20ms | 179.60ms | 1.55s |
| diamond | 285.65ms | 241.57ms | 180.26ms (fail) | 348.29ms | 283.42ms | 2.33s |
| mux | 399.58ms | 361.57ms | 185.18ms (fail) | 419.64ms | 371.86ms | 1.76s |
| repeatedObservers | 45.48ms | 45.57ms | 55.48ms (fail) | 80.70ms | 41.53ms | 222.72ms |
| triangle | 106.74ms | 88.35ms | 76.81ms (fail) | 116.94ms | 99.31ms | 767.81ms |
| unstable | 75.35ms | 62.13ms | 388.75ms (fail) | 96.75ms | 73.27ms | 337.45ms |
| molBench | 493.83ms | 486.55ms | 1.00ms | 492.72ms | 495.44ms | 587.55ms |
| create_signals | 26.32ms | 27.08ms | 67.73ms | 93.85ms | 5.38ms | 87.39ms |
| comp_0to1 | 11.81ms | 8.10ms | 59.34ms | 36.82ms | 23.31ms | 34.63ms |
| comp_1to1 | 26.06ms | 4.24ms | 61.49ms | 46.52ms | 12.81ms | 29.46ms |
| comp_2to1 | 9.26ms | 2.33ms | 39.63ms | 44.38ms | 17.43ms | 22.04ms |
| comp_4to1 | 2.09ms | 7.74ms | 19.02ms | 4.60ms | 12.76ms | 19.28ms |
| comp_1000to1 | 8μs | 3μs | 42μs | 15μs | 8μs | 33μs |
| comp_1to2 | 21.36ms | 10.18ms | 46.42ms | 33.44ms | 16.20ms | 39.00ms |
| comp_1to4 | 14.41ms | 9.65ms | 50.83ms | 20.41ms | 27.82ms | 23.46ms |
| comp_1to8 | 7.02ms | 4.89ms | 45.18ms | 22.02ms | 7.03ms | 25.33ms |
| comp_1to1000 | 4.20ms | 3.49ms | 39.58ms | 14.73ms | 4.55ms | 15.02ms |
| update_1to1 | 8.91ms | 4.63ms | 9.03ms | 15.70ms | 8.88ms | 21.02ms |
| update_2to1 | 4.43ms | 2.41ms | 2.85ms | 7.83ms | 4.59ms | 10.46ms |
| update_4to1 | 2.24ms | 1.23ms | 2.84ms | 3.93ms | 2.23ms | 5.82ms |
| update_1000to1 | 22μs | 11μs | 14μs | 39μs | 23μs | 55μs |
| update_1to2 | 4.44ms | 2.38ms | 4.38ms | 7.97ms | 4.50ms | 10.47ms |
| update_1to4 | 2.24ms | 1.20ms | 1.47ms | 3.91ms | 2.34ms | 5.26ms |
| update_1to1000 | 42μs | 46μs | 384μs | 147μs | 172μs | 158μs |
| cellx1000 | 10.79ms | 7.43ms | 6.01ms | 13.80ms | 10.57ms | 87.43ms |
| cellx2500 | 42.11ms | 20.23ms | 34.42ms | 38.83ms | 37.20ms | 270.02ms |
| cellx5000 | 104.70ms | 47.02ms | 98.75ms | 114.54ms | 107.83ms | 614.65ms |
| 10x5 - 2 sources - read 20.0% (simple) | 499.81ms | 255.31ms | 235.11ms | 355.92ms | 449.89ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.52ms | 174.98ms | 199.37ms | 248.59ms | 277.70ms | 1.47s |
| 1000x12 - 4 sources - dynamic (large) | 3.48s | 283.17ms | 354.16ms | 467.90ms | 3.81s | 1.87s |
| 1000x5 - 25 sources (wide dense) | 3.25s | 410.04ms | 513.12ms | 606.74ms | 2.82s | 3.41s |
| 5x500 - 3 sources (deep) | 226.84ms | 198.11ms | 207.52ms | 255.80ms | 239.03ms | 1.12s |
| 100x15 - 6 sources - dynamic (very dynamic) | 477.86ms | 265.32ms | 257.73ms | 382.27ms | 462.16ms | 1.68s |

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
