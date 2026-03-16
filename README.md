# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.32s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.20s |
| 4 | preact_signals | 0.21 | 100.0% | 35/35 | 10.52s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.65s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| avoidablePropagation | 203.56ms | 2.30s | 145.09ms (fail) | 194.28ms | 200.60ms | 274.77ms |
| broadPropagation | 455.17ms | 4.25s | 6.08ms (fail) | 357.69ms | 454.66ms | 510.84ms |
| deepPropagation | 174.48ms | 1.52s | 139.30ms (fail) | 128.31ms | 174.60ms | 165.43ms |
| diamond | 282.39ms | 2.36s | 204.04ms (fail) | 247.21ms | 288.75ms | 343.08ms |
| mux | 399.95ms | 1.75s | 178.59ms (fail) | 361.61ms | 375.75ms | 414.10ms |
| repeatedObservers | 45.54ms | 230.84ms | 55.26ms (fail) | 46.42ms | 42.08ms | 83.52ms |
| triangle | 103.31ms | 748.68ms | 77.99ms (fail) | 88.37ms | 99.86ms | 115.10ms |
| unstable | 75.72ms | 346.31ms | 335.87ms (fail) | 62.51ms | 71.74ms | 95.61ms |
| molBench | 495.72ms | 583.25ms | 1.19ms | 481.61ms | 495.62ms | 489.01ms |
| create_signals | 26.62ms | 54.19ms | 69.22ms | 28.21ms | 5.58ms | 78.36ms |
| comp_0to1 | 11.97ms | 15.12ms | 62.82ms | 8.64ms | 19.05ms | 26.65ms |
| comp_1to1 | 28.80ms | 43.57ms | 58.49ms | 4.22ms | 14.24ms | 44.31ms |
| comp_2to1 | 19.50ms | 23.55ms | 42.66ms | 2.28ms | 22.62ms | 10.04ms |
| comp_4to1 | 1.85ms | 13.90ms | 22.60ms | 7.35ms | 15.15ms | 14.21ms |
| comp_1000to1 | 4μs | 14μs | 42μs | 3μs | 4μs | 19μs |
| comp_1to2 | 18.95ms | 39.94ms | 45.62ms | 15.01ms | 25.40ms | 38.72ms |
| comp_1to4 | 13.62ms | 31.85ms | 45.24ms | 9.12ms | 23.00ms | 20.88ms |
| comp_1to8 | 7.02ms | 20.30ms | 43.34ms | 3.84ms | 9.49ms | 26.16ms |
| comp_1to1000 | 4.40ms | 14.93ms | 39.69ms | 4.04ms | 8.57ms | 14.64ms |
| update_1to1 | 8.89ms | 21.02ms | 9.74ms | 4.63ms | 9.00ms | 15.76ms |
| update_2to1 | 4.46ms | 10.40ms | 2.82ms | 2.33ms | 4.66ms | 8.01ms |
| update_4to1 | 2.29ms | 5.26ms | 2.65ms | 1.16ms | 2.30ms | 3.91ms |
| update_1000to1 | 22μs | 54μs | 14μs | 11μs | 33μs | 39μs |
| update_1to2 | 4.42ms | 10.92ms | 5.07ms | 2.34ms | 4.44ms | 7.84ms |
| update_1to4 | 2.27ms | 5.19ms | 1.44ms | 1.15ms | 2.36ms | 3.94ms |
| update_1to1000 | 41μs | 154μs | 385μs | 30μs | 2.71ms | 147μs |
| cellx1000 | 10.62ms | 87.13ms | 5.22ms | 8.90ms | 10.61ms | 12.91ms |
| cellx2500 | 37.92ms | 232.75ms | 25.91ms | 19.92ms | 34.00ms | 46.14ms |
| cellx5000 | 79.83ms | 579.41ms | 56.30ms | 41.55ms | 95.28ms | 113.90ms |
| 10x5 - 2 sources - read 20.0% (simple) | 510.09ms | 1.94s | 260.16ms | 234.65ms | 453.07ms | 351.60ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.01ms | 1.45s | 201.54ms | 177.47ms | 273.48ms | 255.29ms |
| 1000x12 - 4 sources - dynamic (large) | 3.68s | 1.74s | 335.34ms | 276.34ms | 3.77s | 472.51ms |
| 1000x5 - 25 sources (wide dense) | 3.51s | 3.40s | 519.16ms | 407.27ms | 2.83s | 616.47ms |
| 5x500 - 3 sources (deep) | 223.76ms | 1.14s | 205.40ms | 192.56ms | 236.77ms | 256.74ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 482.41ms | 1.68s | 258.38ms | 264.26ms | 453.95ms | 386.71ms |

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
