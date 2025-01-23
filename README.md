# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.77 | 100.0% | 35/35 | 3.72s |
| 🥈 | preact_signals | 0.26 | 100.0% | 35/35 | 9.91s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.46s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.51s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.46s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.51s |

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
| Test Case | solidart | mobx | state_beacon | signals | alien_signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.20s | 2.30s | 170.72ms (fail) | 212.15ms | 199.21ms | 209.93ms |
| broadPropagation | 5.46s | 4.31s | 6.21ms (fail) | 460.96ms | 348.59ms | 457.50ms |
| deepPropagation | 2.01s | 1.54s | 141.12ms (fail) | 178.29ms | 123.39ms | 170.49ms |
| diamond | 3.44s | 2.42s | 191.39ms (fail) | 290.03ms | 237.07ms | 278.36ms |
| mux | 2.03s | 1.83s | 198.01ms (fail) | 410.92ms | 373.89ms | 386.45ms |
| repeatedObservers | 213.13ms | 232.06ms | 53.63ms (fail) | 44.84ms | 43.64ms | 41.32ms |
| triangle | 1.14s | 774.08ms | 76.56ms (fail) | 100.78ms | 85.51ms | 97.89ms |
| unstable | 350.62ms | 349.10ms | 337.35ms (fail) | 78.36ms | 60.05ms | 70.21ms |
| molBench | 1.74s | 587.15ms | 1.52ms | 486.90ms | 485.31ms | 484.77ms |
| create_signals | 75.60ms | 61.55ms | 72.78ms | 29.84ms | 21.55ms | 4.75ms |
| comp_0to1 | 39.38ms | 23.55ms | 49.93ms | 13.53ms | 5.19ms | 18.02ms |
| comp_1to1 | 43.73ms | 39.61ms | 53.21ms | 26.25ms | 11.15ms | 14.55ms |
| comp_2to1 | 30.38ms | 22.21ms | 33.89ms | 16.58ms | 14.41ms | 10.03ms |
| comp_4to1 | 13.98ms | 16.50ms | 17.42ms | 7.80ms | 1.77ms | 10.99ms |
| comp_1000to1 | 2.52ms | 20μs | 44μs | 8μs | 5μs | 5μs |
| comp_1to2 | 35.52ms | 38.58ms | 46.31ms | 17.14ms | 9.68ms | 28.36ms |
| comp_1to4 | 33.51ms | 22.26ms | 43.34ms | 13.91ms | 16.03ms | 28.79ms |
| comp_1to8 | 24.74ms | 23.05ms | 43.40ms | 7.18ms | 5.28ms | 7.92ms |
| comp_1to1000 | 20.41ms | 15.71ms | 41.11ms | 4.67ms | 3.62ms | 4.97ms |
| update_1to1 | 42.75ms | 27.70ms | 9.60ms | 9.38ms | 4.39ms | 10.53ms |
| update_2to1 | 21.81ms | 13.93ms | 2.96ms | 4.69ms | 3.23ms | 6.11ms |
| update_4to1 | 10.72ms | 7.01ms | 2.61ms | 2.40ms | 1.09ms | 2.69ms |
| update_1000to1 | 115μs | 80μs | 15μs | 23μs | 11μs | 25μs |
| update_1to2 | 21.69ms | 13.79ms | 3.51ms | 4.74ms | 2.21ms | 5.15ms |
| update_1to4 | 10.93ms | 6.82ms | 1.45ms | 2.38ms | 1.40ms | 2.50ms |
| update_1to1000 | 232μs | 188μs | 421μs | 46μs | 36μs | 203μs |
| cellx1000 | 161.78ms | 72.36ms | 5.18ms | 9.53ms | 7.39ms | 13.14ms |
| cellx2500 | 474.19ms | 261.86ms | 19.92ms | 30.74ms | 19.83ms | 58.17ms |
| cellx5000 | 1.09s | 638.16ms | 63.93ms | 60.78ms | 43.61ms | 136.51ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.63s (partial) | 2.06s | 250.72ms | 513.79ms | 236.00ms | 427.76ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.32s (partial) | 1.50s | 206.83ms | 276.17ms | 182.79ms | 274.35ms |
| 1000x12 - 4 sources - dynamic (large) | 4.06s (partial) | 1.92s | 353.90ms | 3.93s | 287.29ms | 3.41s |
| 1000x5 - 25 sources (wide dense) | 4.89s (partial) | 3.50s | 517.03ms | 3.51s | 411.63ms | 2.56s |
| 5x500 - 3 sources (deep) | 2.04s (partial) | 1.14s | 233.56ms | 230.62ms | 204.59ms | 229.23ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.80s (partial) | 1.74s | 264.54ms | 472.42ms | 265.18ms | 455.26ms |

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
