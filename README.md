# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.71s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 9.96s |
| 🥉 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.23s |
| 4 | signals | 0.29 | 100.0% | 35/35 | 10.80s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.03s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.39s |

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
| avoidablePropagation | 216.19ms | 190.51ms | 159.44ms (fail) | 278.47ms | 207.45ms | 2.38s |
| broadPropagation | 455.06ms | 351.78ms | 6.33ms (fail) | 493.59ms | 455.02ms | 4.36s |
| deepPropagation | 172.18ms | 127.19ms | 137.19ms (fail) | 169.74ms | 176.65ms | 1.51s |
| diamond | 285.65ms | 234.20ms | 193.05ms (fail) | 352.07ms | 281.82ms | 2.39s |
| mux | 397.36ms | 357.89ms | 178.33ms (fail) | 419.27ms | 372.10ms | 1.81s |
| repeatedObservers | 46.75ms | 44.11ms | 51.44ms (fail) | 80.38ms | 40.05ms | 228.03ms |
| triangle | 106.40ms | 84.70ms | 79.65ms (fail) | 116.37ms | 100.47ms | 748.03ms |
| unstable | 78.43ms | 62.86ms | 335.61ms (fail) | 95.06ms | 69.46ms | 341.35ms |
| molBench | 495.55ms | 484.90ms | 1.02ms | 489.54ms | 485.85ms | 590.98ms |
| create_signals | 24.84ms | 26.60ms | 62.68ms | 93.19ms | 4.71ms | 58.16ms |
| comp_0to1 | 10.94ms | 11.86ms | 54.36ms | 35.73ms | 17.47ms | 18.95ms |
| comp_1to1 | 26.89ms | 22.35ms | 56.08ms | 45.57ms | 12.77ms | 29.07ms |
| comp_2to1 | 8.70ms | 8.25ms | 41.70ms | 9.94ms | 17.15ms | 20.52ms |
| comp_4to1 | 2.04ms | 13.23ms | 16.42ms | 17.99ms | 11.58ms | 28.83ms |
| comp_1000to1 | 5μs | 4μs | 40μs | 38μs | 4μs | 15μs |
| comp_1to2 | 18.35ms | 23.48ms | 43.93ms | 36.32ms | 16.45ms | 40.41ms |
| comp_1to4 | 12.16ms | 15.15ms | 43.50ms | 22.00ms | 27.78ms | 25.77ms |
| comp_1to8 | 9.72ms | 8.46ms | 41.71ms | 23.45ms | 7.56ms | 24.56ms |
| comp_1to1000 | 4.38ms | 3.68ms | 38.03ms | 14.52ms | 4.76ms | 15.68ms |
| update_1to1 | 9.67ms | 4.67ms | 6.10ms | 15.54ms | 8.76ms | 26.97ms |
| update_2to1 | 4.74ms | 2.41ms | 3.10ms | 8.14ms | 4.32ms | 13.25ms |
| update_4to1 | 2.38ms | 1.24ms | 1.58ms | 3.89ms | 2.26ms | 6.76ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 69μs |
| update_1to2 | 4.63ms | 2.25ms | 3.09ms | 7.75ms | 4.37ms | 13.83ms |
| update_1to4 | 2.54ms | 1.23ms | 1.60ms | 3.88ms | 2.23ms | 6.92ms |
| update_1to1000 | 43μs | 50μs | 400μs | 147μs | 179μs | 162μs |
| cellx1000 | 10.38ms | 7.90ms | 5.06ms | 12.02ms | 10.71ms | 70.11ms |
| cellx2500 | 32.25ms | 19.89ms | 22.69ms | 34.47ms | 25.64ms | 241.49ms |
| cellx5000 | 62.90ms | 48.42ms | 61.65ms | 77.18ms | 70.97ms | 543.07ms |
| 10x5 - 2 sources - read 20.0% (simple) | 508.20ms | 234.15ms | 245.16ms | 343.32ms | 429.79ms | 1.94s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 281.05ms | 178.68ms | 196.96ms | 245.36ms | 264.06ms | 1.50s |
| 1000x12 - 4 sources - dynamic (large) | 3.57s | 274.54ms | 340.81ms | 460.03ms | 3.64s | 1.94s |
| 1000x5 - 25 sources (wide dense) | 3.25s | 409.40ms | 505.35ms | 595.53ms | 2.51s | 3.37s |
| 5x500 - 3 sources (deep) | 224.76ms | 190.35ms | 202.37ms | 253.59ms | 232.47ms | 1.08s |
| 100x15 - 6 sources - dynamic (very dynamic) | 469.67ms | 260.72ms | 255.44ms | 377.56ms | 451.18ms | 1.64s |

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
