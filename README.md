# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.27s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 10.76s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.48s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.98s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.43s |

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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 211.53ms | 2.34s | 143.98ms (fail) | 194.84ms | 213.55ms | 276.79ms |
| broadPropagation | 457.46ms | 4.23s | 6.54ms (fail) | 361.89ms | 448.51ms | 497.74ms |
| deepPropagation | 173.48ms | 1.51s | 136.67ms (fail) | 126.16ms | 181.51ms | 167.80ms |
| diamond | 284.98ms | 2.38s | 183.49ms (fail) | 247.68ms | 284.25ms | 350.14ms |
| mux | 398.12ms | 1.78s | 177.43ms (fail) | 362.17ms | 381.03ms | 423.64ms |
| repeatedObservers | 45.74ms | 228.56ms | 55.24ms (fail) | 45.69ms | 41.45ms | 80.28ms |
| triangle | 102.89ms | 758.36ms | 78.11ms (fail) | 88.93ms | 99.60ms | 113.41ms |
| unstable | 75.31ms | 341.46ms | 338.63ms (fail) | 62.19ms | 71.67ms | 95.12ms |
| molBench | 493.21ms | 583.33ms | 1.18ms | 485.77ms | 494.51ms | 492.50ms |
| create_signals | 27.52ms | 88.67ms | 59.53ms | 30.63ms | 10.29ms | 55.99ms |
| comp_0to1 | 12.10ms | 22.02ms | 53.95ms | 8.15ms | 37.93ms | 25.95ms |
| comp_1to1 | 26.69ms | 46.53ms | 59.96ms | 4.29ms | 13.50ms | 36.48ms |
| comp_2to1 | 9.06ms | 28.81ms | 39.51ms | 2.32ms | 22.77ms | 37.63ms |
| comp_4to1 | 2.03ms | 13.90ms | 17.24ms | 8.91ms | 9.09ms | 4.75ms |
| comp_1000to1 | 5μs | 21μs | 42μs | 4μs | 4μs | 15μs |
| comp_1to2 | 20.94ms | 35.30ms | 45.35ms | 13.96ms | 31.56ms | 25.66ms |
| comp_1to4 | 11.30ms | 17.27ms | 44.85ms | 6.72ms | 28.87ms | 24.91ms |
| comp_1to8 | 6.36ms | 19.77ms | 43.56ms | 6.01ms | 9.54ms | 20.25ms |
| comp_1to1000 | 4.18ms | 15.26ms | 39.39ms | 3.33ms | 7.46ms | 15.02ms |
| update_1to1 | 9.01ms | 21.44ms | 6.92ms | 4.63ms | 9.05ms | 15.65ms |
| update_2to1 | 4.48ms | 10.42ms | 2.86ms | 2.36ms | 4.61ms | 7.84ms |
| update_4to1 | 2.25ms | 5.34ms | 2.21ms | 1.23ms | 2.25ms | 3.91ms |
| update_1000to1 | 22μs | 52μs | 14μs | 11μs | 38μs | 39μs |
| update_1to2 | 4.45ms | 10.39ms | 4.49ms | 2.34ms | 4.41ms | 8.10ms |
| update_1to4 | 2.25ms | 5.20ms | 1.47ms | 1.24ms | 2.40ms | 3.94ms |
| update_1to1000 | 41μs | 153μs | 379μs | 48μs | 852μs | 147μs |
| cellx1000 | 10.53ms | 77.88ms | 5.32ms | 7.35ms | 10.09ms | 13.08ms |
| cellx2500 | 53.62ms | 265.22ms | 23.02ms | 20.40ms | 29.54ms | 40.36ms |
| cellx5000 | 88.30ms | 587.60ms | 76.25ms | 51.19ms | 84.49ms | 110.42ms |
| 10x5 - 2 sources - read 20.0% (simple) | 498.68ms | 2.04s | 248.05ms | 242.31ms | 452.29ms | 357.56ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.17ms | 1.48s | 203.66ms | 184.36ms | 281.36ms | 254.32ms |
| 1000x12 - 4 sources - dynamic (large) | 3.50s | 1.90s | 340.97ms | 280.64ms | 3.77s | 467.36ms |
| 1000x5 - 25 sources (wide dense) | 3.24s | 3.32s | 517.21ms | 398.51ms | 2.78s | 604.83ms |
| 5x500 - 3 sources (deep) | 226.08ms | 1.12s | 210.84ms | 198.17ms | 230.47ms | 254.76ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 477.39ms | 1.70s | 258.71ms | 265.11ms | 441.97ms | 383.72ms |

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
