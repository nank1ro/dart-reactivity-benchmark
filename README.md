# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.69s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.27s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.38s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.23s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.82s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.51s |

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
| Test Case | solidart(2.0-dev) | state_beacon | preact_signals | signals | mobx | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 281.08ms | 164.51ms (fail) | 199.36ms | 207.81ms | 2.32s | 180.20ms |
| broadPropagation | 510.55ms | 6.11ms (fail) | 458.32ms | 455.30ms | 4.42s | 341.06ms |
| deepPropagation | 173.50ms | 137.66ms (fail) | 175.29ms | 171.00ms | 1.56s | 120.38ms |
| diamond | 351.05ms | 191.74ms (fail) | 277.71ms | 280.99ms | 2.48s | 232.62ms |
| mux | 442.70ms | 208.59ms (fail) | 402.52ms | 456.59ms | 1.82s | 371.80ms |
| repeatedObservers | 81.94ms | 55.17ms (fail) | 40.29ms | 44.53ms | 241.42ms | 46.21ms |
| triangle | 118.85ms | 78.01ms (fail) | 99.56ms | 100.95ms | 769.71ms | 85.02ms |
| unstable | 98.32ms | 336.27ms (fail) | 70.47ms | 79.18ms | 359.70ms | 67.71ms |
| molBench | 494.36ms | 934μs | 489.12ms | 487.24ms | 580.59ms | 485.41ms |
| create_signals | 92.97ms | 60.37ms | 5.18ms | 24.44ms | 53.62ms | 29.17ms |
| comp_0to1 | 37.77ms | 52.73ms | 17.31ms | 14.16ms | 19.77ms | 7.27ms |
| comp_1to1 | 51.90ms | 54.89ms | 14.14ms | 28.00ms | 29.33ms | 4.40ms |
| comp_2to1 | 38.03ms | 36.84ms | 15.67ms | 13.44ms | 12.03ms | 2.32ms |
| comp_4to1 | 12.29ms | 17.07ms | 13.32ms | 6.75ms | 19.59ms | 7.68ms |
| comp_1000to1 | 17μs | 41μs | 4μs | 5μs | 21μs | 3μs |
| comp_1to2 | 30.17ms | 44.80ms | 28.05ms | 18.29ms | 41.11ms | 10.55ms |
| comp_1to4 | 22.61ms | 43.82ms | 26.43ms | 11.45ms | 22.92ms | 8.74ms |
| comp_1to8 | 25.11ms | 43.58ms | 9.80ms | 6.15ms | 25.08ms | 5.27ms |
| comp_1to1000 | 16.95ms | 38.29ms | 3.56ms | 4.18ms | 16.35ms | 3.32ms |
| update_1to1 | 15.86ms | 5.64ms | 8.69ms | 9.01ms | 25.68ms | 10.29ms |
| update_2to1 | 7.80ms | 3.13ms | 4.23ms | 4.49ms | 12.79ms | 2.29ms |
| update_4to1 | 3.98ms | 1.45ms | 2.15ms | 2.20ms | 6.59ms | 2.53ms |
| update_1000to1 | 39μs | 14μs | 21μs | 22μs | 57μs | 25μs |
| update_1to2 | 8.06ms | 2.84ms | 4.54ms | 4.49ms | 12.43ms | 5.19ms |
| update_1to4 | 3.99ms | 1.44ms | 2.15ms | 2.20ms | 6.43ms | 2.50ms |
| update_1to1000 | 170μs | 393μs | 37μs | 42μs | 174μs | 29μs |
| cellx1000 | 12.27ms | 5.81ms | 12.59ms | 9.53ms | 72.05ms | 7.15ms |
| cellx2500 | 35.07ms | 32.71ms | 28.10ms | 31.29ms | 266.47ms | 19.94ms |
| cellx5000 | 112.23ms | 70.15ms | 71.92ms | 77.45ms | 612.20ms | 46.61ms |
| 10x5 - 2 sources - read 20.0% (simple) | 365.21ms | 264.72ms | 442.12ms | 516.66ms | 2.01s | 263.32ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 250.72ms | 219.43ms | 269.66ms | 290.11ms | 1.53s | 178.63ms |
| 1000x12 - 4 sources - dynamic (large) | 465.24ms | 353.17ms | 3.70s | 3.74s | 1.93s | 275.64ms |
| 1000x5 - 25 sources (wide dense) | 586.01ms | 509.20ms | 2.70s | 3.43s | 3.64s | 412.05ms |
| 5x500 - 3 sources (deep) | 252.44ms | 204.47ms | 228.82ms | 224.88ms | 1.17s | 191.42ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 382.03ms | 264.18ms | 448.15ms | 478.60ms | 1.72s | 262.97ms |

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
