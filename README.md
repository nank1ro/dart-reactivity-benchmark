# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.24s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.57s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 9.98s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.47s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.40s |

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
| avoidablePropagation | 274.70ms | 206.77ms | 2.34s | 187.63ms | 216.81ms | 151.31ms (fail) |
| broadPropagation | 503.81ms | 460.14ms | 4.27s | 359.95ms | 454.65ms | 6.37ms (fail) |
| deepPropagation | 175.47ms | 176.24ms | 1.52s | 125.97ms | 176.91ms | 136.51ms (fail) |
| diamond | 359.19ms | 286.33ms | 2.41s | 244.92ms | 287.28ms | 187.82ms (fail) |
| mux | 439.87ms | 383.59ms | 1.84s | 374.08ms | 404.00ms | 191.90ms (fail) |
| repeatedObservers | 80.17ms | 39.18ms | 231.43ms | 44.89ms | 47.09ms | 53.05ms (fail) |
| triangle | 117.42ms | 105.63ms | 761.64ms | 85.28ms | 100.75ms | 78.09ms (fail) |
| unstable | 97.08ms | 70.96ms | 352.13ms | 61.50ms | 72.83ms | 337.10ms (fail) |
| molBench | 494.06ms | 492.07ms | 582.13ms | 491.45ms | 488.71ms | 1.10ms |
| create_signals | 52.06ms | 4.76ms | 51.13ms | 27.05ms | 29.15ms | 62.06ms |
| comp_0to1 | 25.58ms | 17.96ms | 19.06ms | 8.07ms | 11.99ms | 55.64ms |
| comp_1to1 | 42.51ms | 14.06ms | 24.13ms | 4.44ms | 23.67ms | 56.92ms |
| comp_2to1 | 20.91ms | 20.82ms | 9.00ms | 2.39ms | 9.29ms | 37.67ms |
| comp_4to1 | 10.59ms | 15.57ms | 27.92ms | 7.77ms | 2.01ms | 16.69ms |
| comp_1000to1 | 19μs | 6μs | 22μs | 4μs | 5μs | 44μs |
| comp_1to2 | 35.70ms | 15.49ms | 38.37ms | 9.52ms | 21.26ms | 47.06ms |
| comp_1to4 | 19.70ms | 21.82ms | 25.03ms | 12.31ms | 10.50ms | 46.17ms |
| comp_1to8 | 26.01ms | 8.28ms | 24.09ms | 5.02ms | 6.48ms | 44.98ms |
| comp_1to1000 | 14.64ms | 8.04ms | 15.16ms | 3.67ms | 6.55ms | 40.38ms |
| update_1to1 | 16.14ms | 8.26ms | 23.82ms | 11.29ms | 9.28ms | 5.75ms |
| update_2to1 | 9.04ms | 4.11ms | 12.37ms | 3.45ms | 4.57ms | 2.87ms |
| update_4to1 | 5.04ms | 2.06ms | 6.07ms | 2.76ms | 2.31ms | 1.47ms |
| update_1000to1 | 40μs | 20μs | 63μs | 19μs | 22μs | 15μs |
| update_1to2 | 8.63ms | 4.12ms | 12.73ms | 4.32ms | 4.89ms | 2.95ms |
| update_1to4 | 4.06ms | 2.02ms | 5.95ms | 1.43ms | 2.29ms | 1.46ms |
| update_1to1000 | 310μs | 953μs | 163μs | 46μs | 43μs | 396μs |
| cellx1000 | 11.25ms | 9.66ms | 75.23ms | 7.34ms | 9.54ms | 5.02ms |
| cellx2500 | 31.84ms | 25.50ms | 250.65ms | 19.78ms | 32.48ms | 28.16ms |
| cellx5000 | 75.03ms | 68.48ms | 581.67ms | 43.82ms | 69.45ms | 66.05ms |
| 10x5 - 2 sources - read 20.0% (simple) | 352.27ms | 442.85ms | 2.00s | 234.08ms | 506.84ms | 243.02ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 246.43ms | 271.27ms | 1.56s | 176.99ms | 276.84ms | 198.92ms |
| 1000x12 - 4 sources - dynamic (large) | 465.76ms | 3.50s | 1.87s | 279.83ms | 4.00s | 336.62ms |
| 1000x5 - 25 sources (wide dense) | 595.84ms | 2.62s | 3.65s | 400.65ms | 3.57s | 493.52ms |
| 5x500 - 3 sources (deep) | 253.37ms | 227.40ms | 1.15s | 190.54ms | 226.93ms | 202.45ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 375.25ms | 442.98ms | 1.73s | 265.56ms | 485.80ms | 256.07ms |

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
