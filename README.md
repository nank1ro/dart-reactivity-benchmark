# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.65 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.27s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.40s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 9.99s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.33s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.36s |

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
| avoidablePropagation | 281.18ms | 205.61ms | 2.34s | 184.80ms | 210.73ms | 154.27ms (fail) |
| broadPropagation | 502.54ms | 457.22ms | 4.21s | 351.64ms | 451.62ms | 6.04ms (fail) |
| deepPropagation | 171.03ms | 178.89ms | 1.49s | 126.03ms | 178.94ms | 136.80ms (fail) |
| diamond | 351.98ms | 280.83ms | 2.37s | 236.45ms | 291.19ms | 193.27ms (fail) |
| mux | 441.94ms | 386.24ms | 1.81s | 372.71ms | 409.73ms | 187.01ms (fail) |
| repeatedObservers | 78.49ms | 38.29ms | 228.87ms | 45.21ms | 46.84ms | 52.29ms (fail) |
| triangle | 125.23ms | 100.47ms | 767.47ms | 85.47ms | 105.20ms | 77.63ms (fail) |
| unstable | 94.88ms | 70.77ms | 349.27ms | 60.57ms | 74.89ms | 336.74ms (fail) |
| molBench | 493.34ms | 491.56ms | 577.99ms | 489.88ms | 488.82ms | 1.00ms |
| create_signals | 78.92ms | 4.58ms | 70.57ms | 26.14ms | 25.05ms | 58.80ms |
| comp_0to1 | 27.04ms | 20.96ms | 24.24ms | 7.93ms | 11.51ms | 51.52ms |
| comp_1to1 | 27.22ms | 14.05ms | 28.35ms | 4.25ms | 18.08ms | 52.75ms |
| comp_2to1 | 34.90ms | 20.97ms | 20.10ms | 2.23ms | 10.80ms | 35.56ms |
| comp_4to1 | 10.85ms | 15.06ms | 14.07ms | 8.72ms | 1.93ms | 16.14ms |
| comp_1000to1 | 14μs | 5μs | 15μs | 5μs | 5μs | 39μs |
| comp_1to2 | 28.54ms | 19.10ms | 35.42ms | 19.15ms | 21.71ms | 43.77ms |
| comp_1to4 | 21.23ms | 31.71ms | 23.69ms | 6.27ms | 7.48ms | 42.67ms |
| comp_1to8 | 20.54ms | 7.41ms | 20.22ms | 7.55ms | 6.66ms | 42.64ms |
| comp_1to1000 | 14.53ms | 6.37ms | 15.10ms | 3.45ms | 4.46ms | 37.26ms |
| update_1to1 | 16.10ms | 8.31ms | 23.94ms | 11.27ms | 9.69ms | 5.74ms |
| update_2to1 | 7.92ms | 4.05ms | 10.87ms | 4.79ms | 4.57ms | 2.88ms |
| update_4to1 | 4.02ms | 2.03ms | 6.41ms | 2.78ms | 2.34ms | 1.47ms |
| update_1000to1 | 40μs | 20μs | 60μs | 11μs | 22μs | 15μs |
| update_1to2 | 8.09ms | 4.05ms | 12.92ms | 5.60ms | 4.74ms | 2.95ms |
| update_1to4 | 4.02ms | 2.62ms | 5.85ms | 2.44ms | 2.32ms | 1.47ms |
| update_1to1000 | 152μs | 754μs | 168μs | 48μs | 44μs | 365μs |
| cellx1000 | 13.24ms | 10.88ms | 70.14ms | 7.86ms | 9.55ms | 5.17ms |
| cellx2500 | 31.66ms | 25.45ms | 251.11ms | 19.11ms | 31.19ms | 24.02ms |
| cellx5000 | 69.54ms | 64.86ms | 574.54ms | 45.70ms | 59.14ms | 53.20ms |
| 10x5 - 2 sources - read 20.0% (simple) | 356.32ms | 449.75ms | 1.99s | 231.62ms | 506.32ms | 239.51ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 248.04ms | 273.01ms | 1.55s | 181.47ms | 277.64ms | 202.07ms |
| 1000x12 - 4 sources - dynamic (large) | 464.66ms | 3.51s | 1.87s | 281.76ms | 3.86s | 335.51ms |
| 1000x5 - 25 sources (wide dense) | 600.88ms | 2.60s | 3.67s | 407.23ms | 3.56s | 502.77ms |
| 5x500 - 3 sources (deep) | 254.36ms | 234.88ms | 1.18s | 194.25ms | 228.55ms | 203.01ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 382.66ms | 453.81ms | 1.71s | 264.38ms | 474.51ms | 255.90ms |

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
