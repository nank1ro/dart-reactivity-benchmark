# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.70s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 10.76s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.32s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.43s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.89s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.52s |

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
| avoidablePropagation | 2.27s | 202.68ms | 197.82ms | 210.04ms | 274.08ms | 148.00ms (fail) |
| broadPropagation | 4.34s | 463.63ms | 355.37ms | 452.74ms | 495.61ms | 5.73ms (fail) |
| deepPropagation | 1.54s | 170.20ms | 125.64ms | 176.04ms | 166.91ms | 140.83ms (fail) |
| diamond | 2.34s | 288.43ms | 245.19ms | 285.79ms | 355.24ms | 182.22ms (fail) |
| mux | 1.77s | 397.34ms | 365.71ms | 371.34ms | 419.34ms | 179.87ms (fail) |
| repeatedObservers | 227.38ms | 45.86ms | 46.45ms | 41.92ms | 80.46ms | 55.41ms (fail) |
| triangle | 765.08ms | 101.34ms | 89.00ms | 99.54ms | 114.63ms | 79.10ms (fail) |
| unstable | 339.80ms | 76.17ms | 62.23ms | 71.72ms | 95.34ms | 336.25ms (fail) |
| molBench | 586.80ms | 494.72ms | 481.34ms | 496.56ms | 490.75ms | 1.00ms |
| create_signals | 80.58ms | 26.50ms | 28.48ms | 5.42ms | 97.27ms | 70.61ms |
| comp_0to1 | 14.87ms | 11.65ms | 6.97ms | 17.73ms | 34.59ms | 58.04ms |
| comp_1to1 | 42.86ms | 26.59ms | 4.25ms | 14.05ms | 45.43ms | 65.30ms |
| comp_2to1 | 23.77ms | 9.21ms | 2.38ms | 19.17ms | 45.10ms | 43.83ms |
| comp_4to1 | 27.69ms | 2.08ms | 10.44ms | 11.39ms | 19.21ms | 18.18ms |
| comp_1000to1 | 15μs | 5μs | 3μs | 4μs | 14μs | 48μs |
| comp_1to2 | 40.30ms | 19.73ms | 15.68ms | 26.25ms | 27.41ms | 51.13ms |
| comp_1to4 | 24.31ms | 10.07ms | 5.51ms | 31.94ms | 19.69ms | 51.93ms |
| comp_1to8 | 22.68ms | 6.48ms | 4.32ms | 7.82ms | 22.89ms | 48.62ms |
| comp_1to1000 | 15.01ms | 4.06ms | 3.47ms | 6.82ms | 13.91ms | 43.80ms |
| update_1to1 | 21.66ms | 8.92ms | 4.65ms | 9.24ms | 15.67ms | 9.60ms |
| update_2to1 | 10.73ms | 4.44ms | 2.40ms | 4.64ms | 7.85ms | 7.65ms |
| update_4to1 | 5.87ms | 2.25ms | 1.27ms | 2.32ms | 3.92ms | 2.21ms |
| update_1000to1 | 55μs | 22μs | 11μs | 23μs | 39μs | 15μs |
| update_1to2 | 10.52ms | 4.42ms | 2.37ms | 4.62ms | 8.03ms | 4.53ms |
| update_1to4 | 5.40ms | 2.25ms | 1.23ms | 2.48ms | 3.92ms | 1.44ms |
| update_1to1000 | 154μs | 41μs | 48μs | 717μs | 146μs | 425μs |
| cellx1000 | 69.43ms | 9.79ms | 7.57ms | 10.13ms | 12.04ms | 5.79ms |
| cellx2500 | 252.31ms | 35.59ms | 21.69ms | 29.65ms | 40.29ms | 25.12ms |
| cellx5000 | 559.45ms | 76.10ms | 56.03ms | 81.13ms | 95.22ms | 79.33ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.01s | 511.41ms | 230.48ms | 461.26ms | 351.31ms | 248.23ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.47s | 283.85ms | 176.10ms | 270.26ms | 252.95ms | 201.44ms |
| 1000x12 - 4 sources - dynamic (large) | 1.86s | 3.52s | 285.41ms | 3.78s | 468.50ms | 358.71ms |
| 1000x5 - 25 sources (wide dense) | 3.38s | 3.25s | 407.61ms | 2.75s | 601.09ms | 515.65ms |
| 5x500 - 3 sources (deep) | 1.12s | 221.13ms | 192.67ms | 230.63ms | 254.50ms | 210.15ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.64s | 478.24ms | 264.95ms | 449.80ms | 384.48ms | 265.09ms |

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
