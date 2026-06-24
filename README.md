# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.66s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.39s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 9.88s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.38s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.80s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.49s |

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
| avoidablePropagation | 195.68ms | 146.96ms (fail) | 200.00ms | 185.35ms | 2.37s | 273.63ms |
| broadPropagation | 442.49ms | 6.09ms (fail) | 451.33ms | 344.42ms | 4.44s | 510.78ms |
| deepPropagation | 174.92ms | 139.47ms (fail) | 175.05ms | 124.52ms | 1.51s | 172.97ms |
| diamond | 283.93ms | 179.76ms (fail) | 281.38ms | 228.66ms | 2.28s | 361.00ms |
| mux | 376.92ms | 194.13ms (fail) | 405.20ms | 357.15ms | 1.76s | 427.20ms |
| repeatedObservers | 40.89ms | 52.80ms (fail) | 45.63ms | 43.25ms | 227.90ms | 80.18ms |
| triangle | 98.71ms | 79.05ms (fail) | 99.68ms | 87.21ms | 738.97ms | 117.32ms |
| unstable | 72.72ms | 337.08ms (fail) | 72.82ms | 59.76ms | 343.03ms | 96.30ms |
| molBench | 484.50ms | 1.12ms | 497.00ms | 487.19ms | 591.04ms | 492.24ms |
| create_signals | 5.48ms | 62.04ms | 26.39ms | 29.71ms | 64.64ms | 94.89ms |
| comp_0to1 | 17.35ms | 57.23ms | 11.69ms | 7.90ms | 15.78ms | 35.60ms |
| comp_1to1 | 13.21ms | 57.91ms | 28.01ms | 4.14ms | 47.26ms | 44.24ms |
| comp_2to1 | 17.79ms | 39.44ms | 13.40ms | 2.32ms | 34.28ms | 38.75ms |
| comp_4to1 | 8.05ms | 16.94ms | 5.58ms | 13.09ms | 17.62ms | 4.19ms |
| comp_1000to1 | 4μs | 43μs | 5μs | 4μs | 16μs | 14μs |
| comp_1to2 | 27.03ms | 46.16ms | 27.34ms | 11.52ms | 36.95ms | 33.80ms |
| comp_1to4 | 26.76ms | 53.28ms | 18.32ms | 14.23ms | 17.48ms | 19.59ms |
| comp_1to8 | 7.59ms | 45.70ms | 6.42ms | 4.83ms | 20.88ms | 22.68ms |
| comp_1to1000 | 5.86ms | 40.24ms | 3.97ms | 3.25ms | 15.41ms | 13.90ms |
| update_1to1 | 9.52ms | 5.78ms | 9.74ms | 9.94ms | 25.67ms | 15.84ms |
| update_2to1 | 4.61ms | 3.02ms | 4.95ms | 2.24ms | 12.66ms | 7.83ms |
| update_4to1 | 2.56ms | 1.50ms | 2.44ms | 2.52ms | 7.16ms | 3.96ms |
| update_1000to1 | 31μs | 15μs | 24μs | 10μs | 67μs | 39μs |
| update_1to2 | 4.82ms | 2.96ms | 4.85ms | 4.99ms | 11.32ms | 8.18ms |
| update_1to4 | 2.36ms | 1.55ms | 2.48ms | 1.09ms | 7.01ms | 4.00ms |
| update_1to1000 | 565μs | 418μs | 43μs | 35μs | 170μs | 145μs |
| cellx1000 | 9.72ms | 6.24ms | 10.25ms | 7.37ms | 80.13ms | 13.15ms |
| cellx2500 | 25.46ms | 27.07ms | 36.30ms | 19.65ms | 276.29ms | 35.47ms |
| cellx5000 | 64.31ms | 78.11ms | 88.46ms | 41.26ms | 610.05ms | 81.87ms |
| 10x5 - 2 sources - read 20.0% (simple) | 436.52ms | 263.29ms | 498.42ms | 232.59ms | 1.89s | 398.59ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 266.54ms | 204.62ms | 283.45ms | 176.19ms | 1.43s | 251.39ms |
| 1000x12 - 4 sources - dynamic (large) | 3.54s | 352.97ms | 3.83s | 281.80ms | 1.86s | 469.94ms |
| 1000x5 - 25 sources (wide dense) | 2.54s | 518.07ms | 3.53s | 413.00ms | 3.32s | 615.61ms |
| 5x500 - 3 sources (deep) | 227.30ms | 206.86ms | 223.35ms | 193.54ms | 1.07s | 257.70ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 450.54ms | 264.59ms | 485.16ms | 265.46ms | 1.65s | 387.97ms |

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
