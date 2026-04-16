# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.71s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.19s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.19s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.39s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.86s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.47s |

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
| avoidablePropagation | 2.30s | 200.05ms | 198.58ms | 206.95ms | 275.56ms | 148.27ms (fail) |
| broadPropagation | 4.32s | 465.74ms | 359.24ms | 458.03ms | 498.27ms | 6.36ms (fail) |
| deepPropagation | 1.55s | 181.43ms | 125.84ms | 182.19ms | 164.30ms | 135.02ms (fail) |
| diamond | 2.39s | 287.07ms | 246.08ms | 283.15ms | 336.58ms | 186.64ms (fail) |
| mux | 1.78s | 405.80ms | 359.57ms | 372.20ms | 425.39ms | 181.47ms (fail) |
| repeatedObservers | 230.52ms | 45.61ms | 45.45ms | 42.77ms | 80.56ms | 58.47ms (fail) |
| triangle | 765.36ms | 101.68ms | 105.52ms | 101.25ms | 113.33ms | 75.85ms (fail) |
| unstable | 350.29ms | 75.54ms | 62.51ms | 71.80ms | 95.65ms | 334.76ms (fail) |
| molBench | 585.23ms | 494.14ms | 480.97ms | 497.72ms | 490.47ms | 1.01ms |
| create_signals | 88.99ms | 25.73ms | 29.69ms | 5.37ms | 73.61ms | 62.05ms |
| comp_0to1 | 26.62ms | 11.61ms | 7.97ms | 22.73ms | 25.00ms | 58.14ms |
| comp_1to1 | 54.30ms | 17.14ms | 4.20ms | 11.97ms | 41.12ms | 59.52ms |
| comp_2to1 | 22.84ms | 11.58ms | 2.30ms | 18.43ms | 9.79ms | 39.48ms |
| comp_4to1 | 27.16ms | 1.86ms | 8.32ms | 12.34ms | 13.33ms | 18.49ms |
| comp_1000to1 | 27μs | 5μs | 3μs | 6μs | 290μs | 49μs |
| comp_1to2 | 32.19ms | 16.47ms | 19.66ms | 21.95ms | 38.60ms | 51.42ms |
| comp_1to4 | 20.55ms | 9.63ms | 5.44ms | 26.20ms | 22.48ms | 52.23ms |
| comp_1to8 | 23.36ms | 6.23ms | 4.23ms | 5.77ms | 23.18ms | 48.89ms |
| comp_1to1000 | 15.05ms | 4.20ms | 3.49ms | 5.79ms | 14.35ms | 44.32ms |
| update_1to1 | 21.11ms | 8.98ms | 4.63ms | 9.09ms | 15.74ms | 10.06ms |
| update_2to1 | 10.47ms | 4.47ms | 2.33ms | 4.64ms | 7.84ms | 7.63ms |
| update_4to1 | 5.84ms | 2.25ms | 1.23ms | 2.29ms | 3.90ms | 2.37ms |
| update_1000to1 | 55μs | 22μs | 11μs | 37μs | 40μs | 14μs |
| update_1to2 | 10.44ms | 4.43ms | 2.32ms | 4.58ms | 7.84ms | 4.28ms |
| update_1to4 | 5.21ms | 2.24ms | 1.19ms | 2.45ms | 3.92ms | 1.47ms |
| update_1to1000 | 154μs | 41μs | 42μs | 994μs | 145μs | 422μs |
| cellx1000 | 71.31ms | 10.50ms | 7.57ms | 10.20ms | 11.55ms | 5.22ms |
| cellx2500 | 253.43ms | 32.04ms | 19.41ms | 28.55ms | 30.49ms | 26.52ms |
| cellx5000 | 569.84ms | 64.64ms | 42.92ms | 72.92ms | 71.42ms | 77.14ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.99s | 510.23ms | 234.00ms | 453.20ms | 348.70ms | 240.22ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.47s | 282.85ms | 177.20ms | 277.28ms | 248.29ms | 200.96ms |
| 1000x12 - 4 sources - dynamic (large) | 1.76s | 3.84s | 283.11ms | 3.76s | 458.03ms | 349.75ms |
| 1000x5 - 25 sources (wide dense) | 3.32s | 3.35s | 411.16ms | 2.74s | 599.71ms | 514.99ms |
| 5x500 - 3 sources (deep) | 1.13s | 225.51ms | 188.94ms | 231.38ms | 253.49ms | 209.15ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.66s | 485.99ms | 263.38ms | 445.02ms | 383.13ms | 256.79ms |

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
