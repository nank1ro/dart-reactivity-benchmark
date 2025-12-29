# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.66s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.32s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.35s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.24s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.04s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.38s |

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
| avoidablePropagation | 215.24ms | 187.28ms | 145.66ms (fail) | 279.47ms | 207.28ms | 2.36s |
| broadPropagation | 479.52ms | 352.28ms | 6.03ms (fail) | 509.35ms | 454.08ms | 4.36s |
| deepPropagation | 171.89ms | 133.71ms | 139.21ms (fail) | 169.16ms | 179.08ms | 1.49s |
| diamond | 300.07ms | 228.93ms | 178.77ms (fail) | 354.27ms | 288.21ms | 2.36s |
| mux | 385.74ms | 358.56ms | 179.32ms (fail) | 410.03ms | 381.47ms | 1.89s |
| repeatedObservers | 46.30ms | 44.42ms | 53.58ms (fail) | 80.77ms | 41.20ms | 228.57ms |
| triangle | 106.38ms | 85.59ms | 76.56ms (fail) | 113.52ms | 103.06ms | 752.42ms |
| unstable | 79.16ms | 63.93ms | 337.93ms (fail) | 95.61ms | 70.59ms | 348.20ms |
| molBench | 496.27ms | 485.59ms | 998μs | 490.39ms | 480.04ms | 593.45ms |
| create_signals | 24.85ms | 20.32ms | 57.24ms | 54.86ms | 5.35ms | 74.30ms |
| comp_0to1 | 11.34ms | 9.00ms | 51.79ms | 25.55ms | 18.24ms | 25.62ms |
| comp_1to1 | 17.14ms | 4.22ms | 52.87ms | 39.32ms | 14.77ms | 17.42ms |
| comp_2to1 | 8.85ms | 2.32ms | 34.97ms | 37.33ms | 18.82ms | 19.88ms |
| comp_4to1 | 1.97ms | 7.95ms | 16.57ms | 12.70ms | 8.47ms | 30.72ms |
| comp_1000to1 | 5μs | 3μs | 44μs | 15μs | 4μs | 19μs |
| comp_1to2 | 14.90ms | 12.99ms | 43.70ms | 28.23ms | 15.89ms | 40.63ms |
| comp_1to4 | 13.24ms | 12.10ms | 43.98ms | 20.74ms | 29.15ms | 22.68ms |
| comp_1to8 | 6.56ms | 5.08ms | 41.13ms | 20.65ms | 6.59ms | 23.89ms |
| comp_1to1000 | 4.19ms | 3.69ms | 37.57ms | 15.25ms | 4.98ms | 15.12ms |
| update_1to1 | 9.38ms | 4.78ms | 6.10ms | 15.47ms | 8.82ms | 23.69ms |
| update_2to1 | 4.83ms | 2.37ms | 3.06ms | 7.75ms | 4.31ms | 12.05ms |
| update_4to1 | 2.35ms | 1.21ms | 1.53ms | 3.86ms | 2.23ms | 6.19ms |
| update_1000to1 | 24μs | 19μs | 16μs | 38μs | 22μs | 60μs |
| update_1to2 | 4.66ms | 2.38ms | 3.06ms | 7.95ms | 4.36ms | 11.14ms |
| update_1to4 | 2.54ms | 1.51ms | 1.55ms | 3.87ms | 2.24ms | 6.08ms |
| update_1to1000 | 44μs | 50μs | 390μs | 171μs | 160μs | 159μs |
| cellx1000 | 9.98ms | 7.75ms | 5.19ms | 14.14ms | 10.00ms | 71.01ms |
| cellx2500 | 34.26ms | 21.49ms | 28.52ms | 49.02ms | 31.34ms | 254.53ms |
| cellx5000 | 73.68ms | 50.09ms | 74.78ms | 147.28ms | 98.27ms | 574.19ms |
| 10x5 - 2 sources - read 20.0% (simple) | 501.00ms | 234.12ms | 240.62ms | 350.06ms | 453.13ms | 1.93s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 281.46ms | 178.76ms | 198.19ms | 243.67ms | 269.48ms | 1.47s |
| 1000x12 - 4 sources - dynamic (large) | 3.79s | 272.94ms | 338.63ms | 476.22ms | 3.76s | 1.80s |
| 1000x5 - 25 sources (wide dense) | 3.55s | 404.71ms | 518.03ms | 599.64ms | 2.56s | 3.45s |
| 5x500 - 3 sources (deep) | 226.23ms | 191.05ms | 203.57ms | 256.82ms | 241.76ms | 1.11s |
| 100x15 - 6 sources - dynamic (very dynamic) | 478.98ms | 268.10ms | 255.22ms | 386.96ms | 459.23ms | 1.66s |

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
