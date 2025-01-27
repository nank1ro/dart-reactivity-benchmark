# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.68s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.02s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 9.80s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 28.13s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.73s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.48s |

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
| avoidablePropagation | 2.19s | 2.45s | 149.06ms (fail) | 209.77ms | 188.10ms | 212.94ms |
| broadPropagation | 5.53s | 4.54s | 6.40ms (fail) | 456.20ms | 346.35ms | 456.08ms |
| deepPropagation | 2.03s | 1.60s | 140.32ms (fail) | 169.33ms | 125.68ms | 176.49ms |
| diamond | 3.45s | 2.59s | 186.49ms (fail) | 283.14ms | 235.35ms | 273.75ms |
| mux | 2.07s | 1.84s | 197.99ms (fail) | 414.49ms | 377.62ms | 385.17ms |
| repeatedObservers | 211.60ms | 244.01ms | 54.87ms (fail) | 44.83ms | 44.20ms | 41.32ms |
| triangle | 1.14s | 820.14ms | 80.92ms (fail) | 106.75ms | 88.54ms | 101.05ms |
| unstable | 342.57ms | 362.13ms | 339.20ms (fail) | 77.42ms | 60.20ms | 70.14ms |
| molBench | 1.75s | 591.31ms | 962μs | 486.12ms | 487.69ms | 483.91ms |
| create_signals | 64.61ms | 73.38ms | 73.69ms | 28.88ms | 20.10ms | 4.63ms |
| comp_0to1 | 31.72ms | 16.19ms | 52.56ms | 14.82ms | 5.21ms | 17.06ms |
| comp_1to1 | 39.70ms | 37.56ms | 52.37ms | 17.17ms | 11.71ms | 15.39ms |
| comp_2to1 | 24.50ms | 33.69ms | 34.19ms | 9.88ms | 5.08ms | 20.87ms |
| comp_4to1 | 13.01ms | 16.07ms | 17.60ms | 2.02ms | 8.27ms | 19.12ms |
| comp_1000to1 | 2.20ms | 15μs | 44μs | 5μs | 3μs | 8μs |
| comp_1to2 | 42.57ms | 28.40ms | 47.70ms | 19.45ms | 14.12ms | 16.31ms |
| comp_1to4 | 27.49ms | 23.99ms | 42.91ms | 10.34ms | 8.91ms | 23.90ms |
| comp_1to8 | 23.54ms | 19.86ms | 43.03ms | 6.82ms | 3.89ms | 6.79ms |
| comp_1to1000 | 19.02ms | 15.14ms | 39.73ms | 4.62ms | 3.75ms | 4.53ms |
| update_1to1 | 43.19ms | 24.30ms | 8.03ms | 9.36ms | 4.38ms | 8.73ms |
| update_2to1 | 22.31ms | 11.52ms | 2.91ms | 5.42ms | 2.54ms | 4.42ms |
| update_4to1 | 10.75ms | 7.29ms | 1.92ms | 2.33ms | 1.15ms | 2.22ms |
| update_1000to1 | 115μs | 69μs | 14μs | 23μs | 11μs | 22μs |
| update_1to2 | 21.57ms | 11.75ms | 3.85ms | 4.73ms | 2.29ms | 4.36ms |
| update_1to4 | 11.00ms | 7.05ms | 1.49ms | 2.34ms | 2.13ms | 2.21ms |
| update_1to1000 | 215μs | 173μs | 421μs | 46μs | 48μs | 161μs |
| cellx1000 | 156.30ms | 71.40ms | 5.58ms | 9.72ms | 9.42ms | 9.72ms |
| cellx2500 | 498.87ms | 255.88ms | 19.28ms | 32.45ms | 20.24ms | 26.96ms |
| cellx5000 | 1.10s | 576.59ms | 66.32ms | 61.45ms | 46.62ms | 70.55ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.64s (partial) | 2.07s | 244.41ms | 509.50ms | 231.92ms | 444.48ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.37s (partial) | 1.52s | 207.56ms | 280.71ms | 180.67ms | 281.49ms |
| 1000x12 - 4 sources - dynamic (large) | 4.06s (partial) | 1.86s | 338.90ms | 3.67s | 279.10ms | 3.40s |
| 1000x5 - 25 sources (wide dense) | 5.04s (partial) | 3.55s | 524.67ms | 3.35s | 404.41ms | 2.54s |
| 5x500 - 3 sources (deep) | 1.99s (partial) | 1.16s | 233.48ms | 235.02ms | 203.18ms | 231.87ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.77s (partial) | 1.70s | 263.61ms | 475.16ms | 262.07ms | 451.66ms |

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
