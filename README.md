# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.64 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.28s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.24s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.17s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.66s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.41s |

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
| avoidablePropagation | 274.44ms | 204.55ms | 2.31s | 188.84ms | 212.73ms | 148.86ms (fail) |
| broadPropagation | 509.78ms | 451.96ms | 4.25s | 352.85ms | 452.87ms | 6.12ms (fail) |
| deepPropagation | 177.62ms | 181.09ms | 1.52s | 125.39ms | 175.76ms | 135.71ms (fail) |
| diamond | 351.39ms | 281.99ms | 2.43s | 234.37ms | 294.56ms | 179.90ms (fail) |
| mux | 435.95ms | 389.53ms | 1.81s | 371.03ms | 411.59ms | 195.00ms (fail) |
| repeatedObservers | 78.69ms | 38.45ms | 231.47ms | 44.86ms | 47.31ms | 53.91ms (fail) |
| triangle | 119.22ms | 105.54ms | 770.91ms | 96.17ms | 107.82ms | 76.29ms (fail) |
| unstable | 95.96ms | 70.95ms | 353.46ms | 60.45ms | 75.42ms | 340.44ms (fail) |
| molBench | 493.30ms | 490.44ms | 579.52ms | 492.07ms | 486.41ms | 940μs |
| create_signals | 71.82ms | 4.64ms | 67.05ms | 27.12ms | 26.32ms | 69.51ms |
| comp_0to1 | 26.69ms | 17.34ms | 26.00ms | 6.96ms | 11.06ms | 55.59ms |
| comp_1to1 | 47.37ms | 11.52ms | 36.74ms | 4.18ms | 26.84ms | 53.96ms |
| comp_2to1 | 24.94ms | 8.84ms | 29.73ms | 2.26ms | 10.22ms | 37.48ms |
| comp_4to1 | 9.23ms | 13.37ms | 17.39ms | 8.57ms | 2.24ms | 16.19ms |
| comp_1000to1 | 15μs | 4μs | 15μs | 6μs | 8μs | 41μs |
| comp_1to2 | 27.43ms | 27.82ms | 28.74ms | 19.50ms | 17.27ms | 44.11ms |
| comp_1to4 | 20.14ms | 27.07ms | 17.09ms | 9.04ms | 7.44ms | 43.36ms |
| comp_1to8 | 21.27ms | 10.11ms | 19.77ms | 4.96ms | 6.75ms | 42.33ms |
| comp_1to1000 | 15.58ms | 7.16ms | 15.00ms | 3.60ms | 4.43ms | 37.94ms |
| update_1to1 | 16.22ms | 8.29ms | 21.65ms | 11.33ms | 9.24ms | 5.73ms |
| update_2to1 | 7.92ms | 4.10ms | 10.56ms | 5.07ms | 5.31ms | 2.87ms |
| update_4to1 | 4.07ms | 2.06ms | 6.76ms | 2.76ms | 2.33ms | 1.46ms |
| update_1000to1 | 40μs | 20μs | 66μs | 15μs | 23μs | 14μs |
| update_1to2 | 8.11ms | 4.07ms | 10.97ms | 5.60ms | 4.89ms | 3.00ms |
| update_1to4 | 4.03ms | 2.09ms | 5.93ms | 2.50ms | 2.29ms | 1.47ms |
| update_1to1000 | 162μs | 712μs | 168μs | 47μs | 43μs | 368μs |
| cellx1000 | 12.56ms | 9.64ms | 80.07ms | 9.59ms | 10.75ms | 5.72ms |
| cellx2500 | 33.78ms | 27.15ms | 274.80ms | 20.29ms | 31.91ms | 27.89ms |
| cellx5000 | 90.31ms | 75.00ms | 590.13ms | 49.86ms | 69.13ms | 69.25ms |
| 10x5 - 2 sources - read 20.0% (simple) | 352.29ms | 480.39ms | 2.02s | 232.28ms | 513.28ms | 239.40ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 244.74ms | 284.48ms | 1.54s | 174.51ms | 278.29ms | 200.57ms |
| 1000x12 - 4 sources - dynamic (large) | 466.53ms | 3.63s | 2.04s | 284.99ms | 3.75s | 345.17ms |
| 1000x5 - 25 sources (wide dense) | 594.93ms | 2.61s | 3.60s | 417.37ms | 3.48s | 503.67ms |
| 5x500 - 3 sources (deep) | 253.44ms | 232.85ms | 1.19s | 188.43ms | 224.35ms | 203.94ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 386.57ms | 454.27ms | 1.75s | 261.89ms | 482.74ms | 263.20ms |

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
