# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.72s |
| 🥈 | preact_signals | 0.30 | 100.0% | 35/35 | 10.37s |
| 🥉 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.31s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.59s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.30s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.48s |

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
| Test Case | mobx | state_beacon | preact_signals | alien_signals | solidart(2.0-dev) | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.32s | 156.00ms (fail) | 200.90ms | 192.19ms | 260.99ms | 211.51ms |
| broadPropagation | 4.29s | 6.74ms (fail) | 469.23ms | 354.34ms | 503.00ms | 457.71ms |
| deepPropagation | 1.54s | 142.00ms (fail) | 180.41ms | 126.69ms | 164.57ms | 179.17ms |
| diamond | 2.43s | 201.10ms (fail) | 279.15ms | 236.93ms | 350.11ms | 283.93ms |
| mux | 1.82s | 195.07ms (fail) | 392.93ms | 382.25ms | 436.48ms | 409.55ms |
| repeatedObservers | 229.82ms | 52.68ms (fail) | 40.46ms | 44.24ms | 80.74ms | 46.27ms |
| triangle | 771.88ms | 79.61ms (fail) | 103.03ms | 85.84ms | 114.14ms | 107.52ms |
| unstable | 346.71ms | 374.73ms (fail) | 74.03ms | 61.12ms | 94.91ms | 76.72ms |
| molBench | 582.70ms | 969μs | 477.44ms | 489.40ms | 501.16ms | 485.75ms |
| create_signals | 68.83ms | 65.73ms | 4.70ms | 23.62ms | 96.22ms | 25.83ms |
| comp_0to1 | 27.77ms | 55.60ms | 17.59ms | 8.36ms | 35.94ms | 11.94ms |
| comp_1to1 | 43.93ms | 57.61ms | 12.76ms | 9.51ms | 49.92ms | 29.27ms |
| comp_2to1 | 33.89ms | 38.65ms | 10.78ms | 5.49ms | 28.32ms | 14.89ms |
| comp_4to1 | 22.63ms | 17.37ms | 15.34ms | 14.90ms | 9.65ms | 6.60ms |
| comp_1000to1 | 15μs | 45μs | 4μs | 3μs | 19μs | 8μs |
| comp_1to2 | 35.22ms | 47.94ms | 24.75ms | 12.52ms | 34.27ms | 21.17ms |
| comp_1to4 | 24.59ms | 46.35ms | 21.34ms | 7.17ms | 22.64ms | 7.46ms |
| comp_1to8 | 24.17ms | 45.77ms | 8.11ms | 6.57ms | 24.86ms | 6.61ms |
| comp_1to1000 | 15.39ms | 41.86ms | 8.41ms | 3.49ms | 14.20ms | 4.40ms |
| update_1to1 | 27.43ms | 6.01ms | 8.35ms | 10.12ms | 16.35ms | 10.17ms |
| update_2to1 | 12.88ms | 3.10ms | 4.44ms | 2.59ms | 8.04ms | 4.51ms |
| update_4to1 | 7.33ms | 1.54ms | 2.07ms | 2.63ms | 4.11ms | 2.55ms |
| update_1000to1 | 68μs | 15μs | 35μs | 21μs | 40μs | 37μs |
| update_1to2 | 13.38ms | 3.02ms | 4.16ms | 3.89ms | 8.20ms | 4.54ms |
| update_1to4 | 6.86ms | 1.53ms | 2.18ms | 1.93ms | 4.07ms | 2.55ms |
| update_1to1000 | 171μs | 410μs | 39μs | 47μs | 146μs | 44μs |
| cellx1000 | 82.08ms | 5.84ms | 9.74ms | 9.65ms | 12.82ms | 10.16ms |
| cellx2500 | 265.79ms | 28.46ms | 32.63ms | 21.07ms | 33.15ms | 36.24ms |
| cellx5000 | 582.41ms | 67.29ms | 70.75ms | 43.81ms | 75.47ms | 78.62ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.02s | 248.23ms | 452.05ms | 238.14ms | 358.90ms | 509.71ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.52s | 198.29ms | 281.27ms | 180.92ms | 254.33ms | 282.44ms |
| 1000x12 - 4 sources - dynamic (large) | 1.84s | 343.82ms | 3.72s | 282.46ms | 464.83ms | 3.99s |
| 1000x5 - 25 sources (wide dense) | 3.48s | 482.67ms | 2.75s | 402.22ms | 611.69ms | 3.57s |
| 5x500 - 3 sources (deep) | 1.13s | 206.54ms | 230.50ms | 197.25ms | 252.30ms | 221.18ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.70s | 261.96ms | 460.80ms | 263.17ms | 386.26ms | 481.60ms |

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
