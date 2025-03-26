# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.72s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.06s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.46s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 11.17s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.38s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.49s |

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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 269.84ms | 204.44ms | 2.35s | 186.59ms | 212.75ms | 157.46ms (fail) |
| broadPropagation | 510.61ms | 453.36ms | 4.24s | 351.74ms | 467.47ms | 6.12ms (fail) |
| deepPropagation | 166.40ms | 181.81ms | 1.51s | 124.75ms | 184.39ms | 139.27ms (fail) |
| diamond | 350.12ms | 280.75ms | 2.44s | 234.04ms | 288.35ms | 198.36ms (fail) |
| mux | 438.35ms | 384.59ms | 1.82s | 372.13ms | 407.69ms | 193.53ms (fail) |
| repeatedObservers | 79.58ms | 38.78ms | 231.24ms | 45.53ms | 46.31ms | 53.79ms (fail) |
| triangle | 115.34ms | 99.64ms | 762.73ms | 85.86ms | 103.51ms | 77.63ms (fail) |
| unstable | 94.59ms | 70.84ms | 353.05ms | 60.76ms | 73.48ms | 336.29ms (fail) |
| molBench | 494.83ms | 472.34ms | 579.90ms | 492.28ms | 490.01ms | 1.42ms |
| create_signals | 76.17ms | 4.55ms | 84.17ms | 27.70ms | 26.49ms | 61.37ms |
| comp_0to1 | 26.92ms | 17.63ms | 27.37ms | 8.06ms | 12.52ms | 56.32ms |
| comp_1to1 | 46.44ms | 15.80ms | 38.98ms | 4.34ms | 28.01ms | 59.69ms |
| comp_2to1 | 27.70ms | 22.01ms | 23.19ms | 2.39ms | 18.36ms | 37.64ms |
| comp_4to1 | 19.04ms | 9.04ms | 26.01ms | 8.00ms | 4.77ms | 17.03ms |
| comp_1000to1 | 19μs | 5μs | 15μs | 4μs | 8μs | 43μs |
| comp_1to2 | 35.54ms | 20.96ms | 35.57ms | 10.89ms | 18.52ms | 45.87ms |
| comp_1to4 | 21.54ms | 27.02ms | 18.33ms | 16.98ms | 7.49ms | 44.59ms |
| comp_1to8 | 27.43ms | 6.14ms | 22.52ms | 5.14ms | 6.71ms | 44.05ms |
| comp_1to1000 | 14.91ms | 6.27ms | 14.98ms | 3.66ms | 4.52ms | 39.30ms |
| update_1to1 | 16.18ms | 8.18ms | 24.03ms | 11.29ms | 9.20ms | 11.68ms |
| update_2to1 | 8.12ms | 4.06ms | 11.24ms | 5.01ms | 4.60ms | 6.45ms |
| update_4to1 | 4.07ms | 2.03ms | 6.40ms | 2.74ms | 2.33ms | 3.02ms |
| update_1000to1 | 51μs | 20μs | 63μs | 11μs | 22μs | 15μs |
| update_1to2 | 7.93ms | 4.05ms | 10.69ms | 5.63ms | 4.91ms | 6.53ms |
| update_1to4 | 4.04ms | 2.05ms | 5.25ms | 2.46ms | 2.33ms | 3.09ms |
| update_1to1000 | 152μs | 849μs | 167μs | 38μs | 44μs | 392μs |
| cellx1000 | 13.18ms | 9.69ms | 84.23ms | 7.51ms | 9.75ms | 6.27ms |
| cellx2500 | 55.20ms | 37.30ms | 258.80ms | 21.07ms | 43.82ms | 25.91ms |
| cellx5000 | 179.19ms | 91.34ms | 597.14ms | 62.86ms | 101.52ms | 74.25ms |
| 10x5 - 2 sources - read 20.0% (simple) | 386.66ms | 442.43ms | 2.02s | 232.07ms | 505.53ms | 253.26ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 250.14ms | 270.90ms | 1.55s | 175.44ms | 280.03ms | 201.89ms |
| 1000x12 - 4 sources - dynamic (large) | 475.03ms | 3.59s | 1.83s | 284.76ms | 3.80s | 348.05ms |
| 1000x5 - 25 sources (wide dense) | 600.43ms | 2.59s | 3.56s | 412.30ms | 3.29s | 500.41ms |
| 5x500 - 3 sources (deep) | 257.12ms | 232.14ms | 1.15s | 192.03ms | 228.08ms | 210.72ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 387.48ms | 456.45ms | 1.71s | 265.96ms | 486.12ms | 269.08ms |

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
