# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.73s |
| 🥈 | signals | 0.30 | 100.0% | 35/35 | 11.04s |
| 🥉 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.37s |
| 4 | preact_signals | 0.27 | 100.0% | 35/35 | 10.50s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.73s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.55s |

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
| avoidablePropagation | 213.83ms | 192.33ms | 166.97ms (fail) | 265.45ms | 201.14ms | 2.36s |
| broadPropagation | 455.22ms | 353.52ms | 6.81ms (fail) | 510.85ms | 468.53ms | 4.46s |
| deepPropagation | 180.29ms | 123.45ms | 141.94ms (fail) | 163.20ms | 178.48ms | 1.56s |
| diamond | 286.34ms | 235.77ms | 208.03ms (fail) | 355.46ms | 291.72ms | 2.42s |
| mux | 413.39ms | 377.80ms | 197.30ms (fail) | 458.58ms | 393.95ms | 1.81s |
| repeatedObservers | 46.21ms | 43.91ms | 52.79ms (fail) | 80.48ms | 41.07ms | 228.96ms |
| triangle | 102.62ms | 84.51ms | 85.14ms (fail) | 116.19ms | 99.06ms | 777.09ms |
| unstable | 76.56ms | 60.15ms | 340.95ms (fail) | 96.29ms | 75.58ms | 345.35ms |
| molBench | 485.32ms | 489.38ms | 905μs | 493.31ms | 478.54ms | 582.03ms |
| create_signals | 25.22ms | 27.45ms | 64.44ms | 79.16ms | 18.76ms | 56.85ms |
| comp_0to1 | 11.30ms | 11.98ms | 56.24ms | 26.55ms | 21.50ms | 15.46ms |
| comp_1to1 | 28.98ms | 10.36ms | 57.38ms | 50.40ms | 7.10ms | 41.45ms |
| comp_2to1 | 13.85ms | 6.10ms | 39.28ms | 24.85ms | 12.84ms | 33.57ms |
| comp_4to1 | 3.33ms | 7.43ms | 17.35ms | 10.79ms | 11.24ms | 25.41ms |
| comp_1000to1 | 5μs | 4μs | 44μs | 17μs | 6μs | 21μs |
| comp_1to2 | 13.08ms | 14.14ms | 48.17ms | 33.95ms | 18.51ms | 29.99ms |
| comp_1to4 | 13.89ms | 8.69ms | 46.42ms | 22.34ms | 28.81ms | 24.21ms |
| comp_1to8 | 6.74ms | 3.68ms | 45.62ms | 25.49ms | 6.83ms | 27.40ms |
| comp_1to1000 | 4.40ms | 3.71ms | 41.52ms | 15.25ms | 7.30ms | 14.90ms |
| update_1to1 | 10.24ms | 10.01ms | 6.01ms | 17.80ms | 8.30ms | 28.25ms |
| update_2to1 | 4.56ms | 2.12ms | 3.10ms | 9.18ms | 4.41ms | 14.14ms |
| update_4to1 | 2.50ms | 2.49ms | 1.54ms | 4.44ms | 2.12ms | 7.37ms |
| update_1000to1 | 25μs | 25μs | 16μs | 57μs | 20μs | 70μs |
| update_1to2 | 4.50ms | 5.06ms | 3.03ms | 9.04ms | 4.07ms | 12.57ms |
| update_1to4 | 2.56ms | 2.46ms | 1.55ms | 4.44ms | 2.10ms | 5.65ms |
| update_1to1000 | 43μs | 34μs | 409μs | 158μs | 851μs | 171μs |
| cellx1000 | 9.67ms | 9.03ms | 6.42ms | 12.60ms | 9.80ms | 78.21ms |
| cellx2500 | 31.71ms | 21.00ms | 31.79ms | 40.12ms | 27.85ms | 278.24ms |
| cellx5000 | 61.87ms | 54.97ms | 74.74ms | 127.33ms | 85.24ms | 621.40ms |
| 10x5 - 2 sources - read 20.0% (simple) | 515.59ms | 233.34ms | 263.89ms | 353.07ms | 503.88ms | 2.00s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.65ms | 178.32ms | 198.55ms | 257.03ms | 296.22ms | 1.54s |
| 1000x12 - 4 sources - dynamic (large) | 3.76s | 287.76ms | 353.58ms | 464.47ms | 3.73s | 1.94s |
| 1000x5 - 25 sources (wide dense) | 3.28s | 410.41ms | 518.22ms | 600.67ms | 2.75s | 3.49s |
| 5x500 - 3 sources (deep) | 219.08ms | 190.47ms | 207.35ms | 254.16ms | 244.74ms | 1.16s |
| 100x15 - 6 sources - dynamic (very dynamic) | 472.33ms | 264.50ms | 258.35ms | 383.86ms | 473.51ms | 1.74s |

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
