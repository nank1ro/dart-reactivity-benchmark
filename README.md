# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.80s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 9.95s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.42s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.15s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.10s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| Test Case | preact_signals | state_beacon | signals | alien_signals | mobx | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 223.30ms | 158.91ms (fail) | 211.69ms | 186.09ms | 2.35s | 264.94ms |
| broadPropagation | 526.58ms | 6.59ms (fail) | 521.70ms | 360.32ms | 4.28s | 494.15ms |
| deepPropagation | 192.25ms | 159.51ms (fail) | 174.74ms | 117.18ms | 1.54s | 166.41ms |
| diamond | 292.52ms | 187.33ms (fail) | 287.21ms | 265.56ms | 2.28s | 377.11ms |
| mux | 387.56ms | 188.70ms (fail) | 390.85ms | 363.31ms | 1.72s | 420.15ms |
| repeatedObservers | 42.39ms | 54.30ms (fail) | 46.55ms | 43.03ms | 232.24ms | 89.22ms |
| triangle | 109.21ms | 82.37ms (fail) | 107.98ms | 89.82ms | 723.26ms | 121.07ms |
| unstable | 75.02ms | 343.01ms (fail) | 79.61ms | 59.27ms | 347.06ms | 105.99ms |
| molBench | 547.85ms | 1.05ms | 547.50ms | 552.23ms | 643.42ms | 559.70ms |
| create_signals | 4.91ms | 70.08ms | 28.50ms | 31.59ms | 98.93ms | 98.30ms |
| comp_0to1 | 20.18ms | 61.47ms | 12.47ms | 8.28ms | 15.24ms | 38.42ms |
| comp_1to1 | 14.81ms | 59.77ms | 32.70ms | 4.13ms | 51.13ms | 47.43ms |
| comp_2to1 | 17.99ms | 39.42ms | 12.52ms | 2.20ms | 43.90ms | 31.15ms |
| comp_4to1 | 12.56ms | 16.62ms | 9.18ms | 12.87ms | 23.32ms | 19.60ms |
| comp_1000to1 | 4μs | 40μs | 5μs | 3μs | 15μs | 23μs |
| comp_1to2 | 33.80ms | 45.56ms | 31.99ms | 17.47ms | 36.76ms | 38.29ms |
| comp_1to4 | 22.08ms | 46.81ms | 13.21ms | 8.28ms | 23.58ms | 19.27ms |
| comp_1to8 | 7.89ms | 43.03ms | 6.30ms | 7.97ms | 24.73ms | 25.05ms |
| comp_1to1000 | 3.34ms | 36.69ms | 3.99ms | 3.46ms | 14.79ms | 14.58ms |
| update_1to1 | 8.48ms | 6.04ms | 9.99ms | 7.04ms | 23.50ms | 16.27ms |
| update_2to1 | 4.22ms | 3.36ms | 5.17ms | 2.59ms | 11.39ms | 8.13ms |
| update_4to1 | 2.12ms | 1.62ms | 2.52ms | 1.22ms | 5.94ms | 4.07ms |
| update_1000to1 | 21μs | 17μs | 25μs | 11μs | 56μs | 55μs |
| update_1to2 | 4.19ms | 3.18ms | 4.91ms | 2.23ms | 11.50ms | 8.14ms |
| update_1to4 | 2.11ms | 1.65ms | 2.55ms | 1.11ms | 5.85ms | 4.13ms |
| update_1to1000 | 42μs | 374μs | 40μs | 60μs | 171μs | 142μs |
| cellx1000 | 12.87ms | 5.96ms | 9.64ms | 7.18ms | 82.41ms | 11.18ms |
| cellx2500 | 33.11ms | 38.64ms | 36.65ms | 25.11ms | 309.09ms | 32.11ms |
| cellx5000 | 92.57ms | 98.15ms | 80.73ms | 75.90ms | 685.77ms | 74.95ms |
| 10x5 - 2 sources - read 20.0% (simple) | 424.32ms | 249.44ms | 484.21ms | 245.07ms | 1.97s | 379.39ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 260.12ms | 198.11ms | 276.80ms | 183.68ms | 1.40s | 272.74ms |
| 1000x12 - 4 sources - dynamic (large) | 3.35s | 319.54ms | 3.78s | 271.55ms | 1.84s | 425.56ms |
| 1000x5 - 25 sources (wide dense) | 2.55s | 467.27ms | 3.25s | 411.57ms | 3.49s | 637.75ms |
| 5x500 - 3 sources (deep) | 232.84ms | 231.96ms | 228.99ms | 191.04ms | 1.14s | 270.37ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 444.71ms | 237.62ms | 463.03ms | 245.42ms | 1.68s | 342.20ms |

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
