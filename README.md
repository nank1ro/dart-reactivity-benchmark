# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.64s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.30s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.07s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 10.92s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.90s |
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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 209.84ms | 186.92ms | 146.24ms (fail) | 281.82ms | 207.64ms | 2.37s |
| broadPropagation | 452.11ms | 347.55ms | 6.36ms (fail) | 518.51ms | 446.53ms | 4.33s |
| deepPropagation | 176.34ms | 119.24ms | 137.53ms (fail) | 165.25ms | 175.08ms | 1.47s |
| diamond | 286.11ms | 228.53ms | 179.32ms (fail) | 357.76ms | 282.46ms | 2.34s |
| mux | 385.29ms | 357.97ms | 181.43ms (fail) | 420.13ms | 370.79ms | 1.85s |
| repeatedObservers | 46.39ms | 43.51ms | 52.25ms (fail) | 80.34ms | 40.56ms | 231.95ms |
| triangle | 103.55ms | 82.85ms | 77.64ms (fail) | 119.92ms | 100.78ms | 742.42ms |
| unstable | 77.68ms | 62.24ms | 335.99ms (fail) | 97.27ms | 70.86ms | 346.21ms |
| molBench | 494.91ms | 484.76ms | 1.01ms | 490.61ms | 480.17ms | 590.29ms |
| create_signals | 27.00ms | 29.46ms | 64.57ms | 76.72ms | 5.30ms | 70.94ms |
| comp_0to1 | 11.66ms | 8.06ms | 52.42ms | 26.85ms | 18.13ms | 28.79ms |
| comp_1to1 | 26.90ms | 4.18ms | 57.71ms | 49.32ms | 11.18ms | 38.67ms |
| comp_2to1 | 12.15ms | 2.32ms | 36.55ms | 18.83ms | 22.95ms | 35.68ms |
| comp_4to1 | 7.58ms | 7.53ms | 16.63ms | 9.66ms | 11.12ms | 15.96ms |
| comp_1000to1 | 4μs | 4μs | 40μs | 19μs | 6μs | 19μs |
| comp_1to2 | 14.23ms | 21.85ms | 44.68ms | 36.52ms | 29.11ms | 35.37ms |
| comp_1to4 | 14.07ms | 16.80ms | 44.34ms | 22.72ms | 25.64ms | 17.32ms |
| comp_1to8 | 9.17ms | 6.04ms | 42.43ms | 25.48ms | 5.66ms | 20.69ms |
| comp_1to1000 | 7.19ms | 3.56ms | 38.52ms | 14.68ms | 5.59ms | 15.56ms |
| update_1to1 | 9.35ms | 5.44ms | 6.11ms | 15.49ms | 9.09ms | 23.21ms |
| update_2to1 | 4.78ms | 2.37ms | 7.07ms | 7.75ms | 4.38ms | 13.90ms |
| update_4to1 | 4.84ms | 1.20ms | 1.60ms | 3.86ms | 2.33ms | 7.06ms |
| update_1000to1 | 23μs | 11μs | 16μs | 38μs | 22μs | 68μs |
| update_1to2 | 4.71ms | 2.35ms | 3.08ms | 7.72ms | 4.47ms | 13.99ms |
| update_1to4 | 2.56ms | 1.20ms | 1.61ms | 3.86ms | 2.28ms | 6.96ms |
| update_1to1000 | 44μs | 47μs | 379μs | 160μs | 953μs | 175μs |
| cellx1000 | 12.56ms | 7.24ms | 5.45ms | 15.29ms | 9.79ms | 74.91ms |
| cellx2500 | 34.65ms | 21.19ms | 33.48ms | 35.52ms | 27.71ms | 268.61ms |
| cellx5000 | 66.54ms | 47.80ms | 74.29ms | 87.50ms | 82.00ms | 580.61ms |
| 10x5 - 2 sources - read 20.0% (simple) | 497.94ms | 234.05ms | 236.88ms | 346.79ms | 429.59ms | 1.93s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 281.91ms | 173.54ms | 195.12ms | 249.37ms | 265.30ms | 1.46s |
| 1000x12 - 4 sources - dynamic (large) | 3.57s | 276.28ms | 339.00ms | 474.99ms | 3.71s | 1.83s |
| 1000x5 - 25 sources (wide dense) | 3.37s | 402.60ms | 521.96ms | 598.87ms | 2.53s | 3.41s |
| 5x500 - 3 sources (deep) | 225.20ms | 191.33ms | 203.50ms | 257.28ms | 229.56ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 473.23ms | 264.74ms | 260.14ms | 384.78ms | 452.77ms | 1.64s |

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
