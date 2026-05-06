# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.20s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 10.73s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.54s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.87s |
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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.30s | 199.40ms | 197.79ms | 209.37ms | 273.13ms | 148.48ms (fail) |
| broadPropagation | 4.28s | 469.24ms | 358.68ms | 454.05ms | 494.35ms | 6.18ms (fail) |
| deepPropagation | 1.56s | 166.20ms | 125.79ms | 178.24ms | 166.10ms | 136.78ms (fail) |
| diamond | 2.40s | 290.49ms | 246.21ms | 284.89ms | 346.41ms | 179.85ms (fail) |
| mux | 1.79s | 396.42ms | 361.61ms | 376.72ms | 418.71ms | 177.11ms (fail) |
| repeatedObservers | 232.58ms | 45.92ms | 46.19ms | 42.56ms | 80.64ms | 55.56ms (fail) |
| triangle | 768.83ms | 100.19ms | 88.41ms | 101.61ms | 114.50ms | 75.39ms (fail) |
| unstable | 342.46ms | 81.24ms | 62.66ms | 71.87ms | 94.50ms | 336.46ms (fail) |
| molBench | 584.45ms | 493.95ms | 481.72ms | 495.71ms | 489.11ms | 978μs |
| create_signals | 67.02ms | 25.63ms | 27.79ms | 5.45ms | 73.31ms | 59.20ms |
| comp_0to1 | 20.35ms | 12.83ms | 9.14ms | 17.91ms | 25.35ms | 53.51ms |
| comp_1to1 | 31.74ms | 25.98ms | 4.40ms | 13.98ms | 41.96ms | 57.62ms |
| comp_2to1 | 35.97ms | 10.53ms | 2.39ms | 20.16ms | 45.98ms | 35.90ms |
| comp_4to1 | 22.37ms | 9.22ms | 7.51ms | 15.27ms | 4.79ms | 16.19ms |
| comp_1000to1 | 16μs | 5μs | 3μs | 6μs | 15μs | 43μs |
| comp_1to2 | 33.12ms | 20.54ms | 10.40ms | 15.37ms | 32.38ms | 45.92ms |
| comp_1to4 | 17.48ms | 13.01ms | 9.13ms | 20.18ms | 14.80ms | 45.24ms |
| comp_1to8 | 19.81ms | 6.43ms | 5.12ms | 7.02ms | 20.66ms | 43.68ms |
| comp_1to1000 | 14.87ms | 4.02ms | 3.49ms | 5.40ms | 14.17ms | 39.72ms |
| update_1to1 | 21.28ms | 9.04ms | 4.66ms | 9.49ms | 15.63ms | 8.89ms |
| update_2to1 | 10.37ms | 4.48ms | 2.34ms | 4.58ms | 7.85ms | 2.83ms |
| update_4to1 | 5.59ms | 2.27ms | 2.25ms | 2.27ms | 3.90ms | 2.40ms |
| update_1000to1 | 51μs | 22μs | 22μs | 23μs | 39μs | 14μs |
| update_1to2 | 10.42ms | 4.62ms | 4.38ms | 4.55ms | 8.11ms | 5.66ms |
| update_1to4 | 5.19ms | 2.29ms | 2.20ms | 2.44ms | 3.95ms | 1.46ms |
| update_1to1000 | 168μs | 40μs | 45μs | 298μs | 163μs | 391μs |
| cellx1000 | 68.85ms | 10.12ms | 7.91ms | 9.96ms | 11.56ms | 5.36ms |
| cellx2500 | 251.97ms | 31.34ms | 19.77ms | 26.46ms | 31.84ms | 25.98ms |
| cellx5000 | 554.98ms | 59.61ms | 42.13ms | 64.10ms | 64.29ms | 60.36ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.98s | 500.15ms | 233.99ms | 457.66ms | 347.38ms | 238.02ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.49s | 282.97ms | 178.78ms | 271.16ms | 248.01ms | 198.48ms |
| 1000x12 - 4 sources - dynamic (large) | 1.82s | 3.50s | 277.58ms | 3.87s | 468.11ms | 341.88ms |
| 1000x5 - 25 sources (wide dense) | 3.33s | 3.25s | 419.00ms | 2.80s | 602.89ms | 515.63ms |
| 5x500 - 3 sources (deep) | 1.14s | 223.90ms | 191.32ms | 234.23ms | 253.19ms | 209.37ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.66s | 469.45ms | 266.19ms | 451.06ms | 384.56ms | 257.77ms |

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
