# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.73s |
| 🥈 | signals | 0.25 | 100.0% | 35/35 | 11.20s |
| 🥉 | preact_signals | 0.24 | 100.0% | 35/35 | 9.88s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.42s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.90s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.50s |

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
| avoidablePropagation | 2.18s | 2.31s | 152.38ms (fail) | 211.12ms | 203.47ms | 211.32ms |
| broadPropagation | 5.48s | 4.39s | 6.21ms (fail) | 462.25ms | 351.70ms | 468.49ms |
| deepPropagation | 2.00s | 1.56s | 141.95ms (fail) | 177.34ms | 123.28ms | 174.95ms |
| diamond | 3.46s | 2.46s | 194.80ms (fail) | 286.33ms | 236.08ms | 275.85ms |
| mux | 2.03s | 1.82s | 196.41ms (fail) | 409.51ms | 381.70ms | 385.60ms |
| repeatedObservers | 209.12ms | 233.59ms | 53.51ms (fail) | 44.62ms | 44.65ms | 41.31ms |
| triangle | 1.15s | 763.27ms | 76.94ms (fail) | 101.02ms | 86.75ms | 99.05ms |
| unstable | 340.48ms | 348.53ms | 339.28ms (fail) | 77.89ms | 60.60ms | 69.43ms |
| molBench | 1.74s | 582.67ms | 869μs | 486.28ms | 487.24ms | 483.88ms |
| create_signals | 70.81ms | 76.65ms | 73.16ms | 31.10ms | 20.54ms | 4.55ms |
| comp_0to1 | 29.20ms | 17.59ms | 52.73ms | 15.17ms | 5.08ms | 16.75ms |
| comp_1to1 | 43.85ms | 42.61ms | 53.27ms | 25.18ms | 11.39ms | 15.39ms |
| comp_2to1 | 33.87ms | 21.36ms | 36.91ms | 15.43ms | 5.38ms | 15.55ms |
| comp_4to1 | 21.47ms | 17.10ms | 17.30ms | 6.40ms | 8.63ms | 11.23ms |
| comp_1000to1 | 2.88ms | 19μs | 48μs | 8μs | 3μs | 6μs |
| comp_1to2 | 25.75ms | 37.11ms | 45.49ms | 12.83ms | 14.12ms | 28.70ms |
| comp_1to4 | 32.18ms | 20.34ms | 42.91ms | 20.67ms | 8.80ms | 30.27ms |
| comp_1to8 | 23.64ms | 22.62ms | 43.31ms | 6.58ms | 4.00ms | 7.02ms |
| comp_1to1000 | 20.11ms | 15.41ms | 39.72ms | 4.55ms | 3.68ms | 6.34ms |
| update_1to1 | 42.80ms | 28.25ms | 8.81ms | 9.49ms | 4.36ms | 8.81ms |
| update_2to1 | 21.68ms | 14.02ms | 2.90ms | 4.70ms | 2.18ms | 4.37ms |
| update_4to1 | 10.73ms | 7.07ms | 2.48ms | 2.35ms | 1.13ms | 2.22ms |
| update_1000to1 | 116μs | 68μs | 15μs | 23μs | 11μs | 21μs |
| update_1to2 | 21.40ms | 14.04ms | 3.29ms | 4.75ms | 2.18ms | 4.40ms |
| update_1to4 | 10.94ms | 6.99ms | 1.45ms | 2.36ms | 1.40ms | 2.29ms |
| update_1to1000 | 228μs | 162μs | 397μs | 46μs | 31μs | 1.79ms |
| cellx1000 | 157.18ms | 69.97ms | 6.70ms | 9.46ms | 8.86ms | 26.90ms |
| cellx2500 | 473.79ms | 262.28ms | 20.94ms | 31.79ms | 20.14ms | 46.73ms |
| cellx5000 | 1.04s | 554.39ms | 56.95ms | 61.76ms | 43.29ms | 143.08ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.64s (partial) | 2.02s | 266.63ms | 506.95ms | 235.76ms | 427.41ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.35s (partial) | 1.53s | 212.02ms | 293.33ms | 183.95ms | 278.49ms |
| 1000x12 - 4 sources - dynamic (large) | 4.16s (partial) | 1.80s | 338.24ms | 3.66s | 286.82ms | 3.35s |
| 1000x5 - 25 sources (wide dense) | 4.91s (partial) | 3.52s | 515.96ms | 3.50s | 406.70ms | 2.56s |
| 5x500 - 3 sources (deep) | 2.37s (partial) | 1.14s | 232.75ms | 229.30ms | 208.56ms | 226.79ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.79s (partial) | 1.71s | 267.59ms | 489.98ms | 271.32ms | 444.66ms |

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
