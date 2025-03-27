# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.71s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.21s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 9.92s |
| 4 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.36s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.72s |
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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 273.03ms | 211.62ms | 2.37s | 184.83ms | 209.92ms | 155.06ms (fail) |
| broadPropagation | 504.12ms | 453.48ms | 4.32s | 354.96ms | 454.95ms | 6.68ms (fail) |
| deepPropagation | 174.73ms | 177.59ms | 1.55s | 123.96ms | 176.74ms | 146.33ms (fail) |
| diamond | 357.61ms | 280.39ms | 2.46s | 232.96ms | 289.48ms | 182.44ms (fail) |
| mux | 443.11ms | 394.89ms | 1.84s | 372.20ms | 408.36ms | 191.70ms (fail) |
| repeatedObservers | 78.43ms | 38.98ms | 234.72ms | 45.34ms | 46.60ms | 52.87ms (fail) |
| triangle | 118.93ms | 99.90ms | 781.70ms | 86.50ms | 103.93ms | 79.02ms (fail) |
| unstable | 93.34ms | 70.15ms | 354.18ms | 59.96ms | 74.28ms | 337.92ms (fail) |
| molBench | 493.36ms | 490.88ms | 579.91ms | 492.11ms | 487.86ms | 1.27ms |
| create_signals | 97.50ms | 4.85ms | 79.18ms | 28.21ms | 25.72ms | 67.80ms |
| comp_0to1 | 40.50ms | 17.51ms | 25.77ms | 8.28ms | 12.07ms | 52.29ms |
| comp_1to1 | 46.23ms | 11.62ms | 42.34ms | 4.42ms | 28.85ms | 53.75ms |
| comp_2to1 | 39.18ms | 16.62ms | 21.76ms | 2.24ms | 9.79ms | 36.03ms |
| comp_4to1 | 15.56ms | 15.05ms | 20.97ms | 7.99ms | 2.24ms | 16.16ms |
| comp_1000to1 | 15μs | 6μs | 23μs | 3μs | 5μs | 43μs |
| comp_1to2 | 31.29ms | 21.13ms | 34.71ms | 11.86ms | 20.82ms | 44.70ms |
| comp_1to4 | 15.99ms | 22.62ms | 19.49ms | 9.32ms | 10.58ms | 43.53ms |
| comp_1to8 | 19.47ms | 7.91ms | 23.31ms | 5.17ms | 6.52ms | 43.06ms |
| comp_1to1000 | 15.79ms | 7.31ms | 15.11ms | 3.51ms | 4.51ms | 38.41ms |
| update_1to1 | 16.66ms | 8.29ms | 24.45ms | 11.38ms | 9.21ms | 5.74ms |
| update_2to1 | 7.95ms | 4.05ms | 10.76ms | 5.13ms | 4.61ms | 2.88ms |
| update_4to1 | 4.04ms | 2.07ms | 6.41ms | 2.79ms | 2.34ms | 1.47ms |
| update_1000to1 | 40μs | 20μs | 66μs | 10μs | 23μs | 14μs |
| update_1to2 | 8.10ms | 4.05ms | 13.13ms | 5.64ms | 4.91ms | 2.96ms |
| update_1to4 | 5.31ms | 2.06ms | 5.68ms | 2.43ms | 2.31ms | 1.48ms |
| update_1to1000 | 277μs | 717μs | 176μs | 34μs | 43μs | 384μs |
| cellx1000 | 12.07ms | 9.84ms | 76.85ms | 7.35ms | 9.44ms | 5.24ms |
| cellx2500 | 37.29ms | 26.97ms | 249.06ms | 21.27ms | 36.51ms | 28.35ms |
| cellx5000 | 112.82ms | 67.67ms | 561.69ms | 59.95ms | 83.05ms | 73.42ms |
| 10x5 - 2 sources - read 20.0% (simple) | 350.65ms | 440.21ms | 2.05s | 235.34ms | 508.16ms | 257.81ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 243.49ms | 270.84ms | 1.57s | 176.69ms | 284.85ms | 229.48ms |
| 1000x12 - 4 sources - dynamic (large) | 469.21ms | 3.47s | 1.92s | 281.55ms | 3.77s | 355.40ms |
| 1000x5 - 25 sources (wide dense) | 600.38ms | 2.59s | 3.57s | 416.64ms | 3.42s | 534.56ms |
| 5x500 - 3 sources (deep) | 252.32ms | 230.55ms | 1.17s | 187.13ms | 227.43ms | 203.89ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 381.16ms | 450.16ms | 1.71s | 266.36ms | 472.49ms | 266.46ms |

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
