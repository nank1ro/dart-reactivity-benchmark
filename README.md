# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.36s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.38s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.34s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.12s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.45s |

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
| avoidablePropagation | 278.67ms | 165.51ms (fail) | 201.28ms | 206.84ms | 2.34s | 194.35ms |
| broadPropagation | 510.66ms | 6.12ms (fail) | 459.38ms | 456.00ms | 4.40s | 347.49ms |
| deepPropagation | 165.88ms | 142.19ms (fail) | 176.42ms | 171.46ms | 1.55s | 123.50ms |
| diamond | 351.00ms | 181.70ms (fail) | 280.17ms | 280.05ms | 2.46s | 230.73ms |
| mux | 440.33ms | 196.59ms (fail) | 400.89ms | 412.89ms | 1.84s | 375.66ms |
| repeatedObservers | 81.60ms | 52.68ms (fail) | 39.56ms | 45.27ms | 243.24ms | 48.12ms |
| triangle | 116.48ms | 75.19ms (fail) | 98.72ms | 100.99ms | 774.68ms | 85.00ms |
| unstable | 99.48ms | 336.26ms (fail) | 69.94ms | 79.04ms | 355.54ms | 66.67ms |
| molBench | 492.84ms | 936μs | 486.80ms | 486.05ms | 572.57ms | 485.46ms |
| create_signals | 76.71ms | 60.55ms | 5.25ms | 25.49ms | 89.73ms | 29.68ms |
| comp_0to1 | 27.68ms | 52.60ms | 17.29ms | 11.76ms | 16.27ms | 6.16ms |
| comp_1to1 | 48.09ms | 55.33ms | 11.54ms | 27.77ms | 47.37ms | 4.21ms |
| comp_2to1 | 43.50ms | 36.66ms | 12.89ms | 13.40ms | 46.87ms | 2.36ms |
| comp_4to1 | 11.66ms | 16.89ms | 11.80ms | 4.39ms | 14.46ms | 7.77ms |
| comp_1000to1 | 18μs | 42μs | 4μs | 5μs | 22μs | 3μs |
| comp_1to2 | 30.72ms | 44.76ms | 23.39ms | 13.50ms | 36.31ms | 16.61ms |
| comp_1to4 | 23.08ms | 43.51ms | 28.59ms | 12.99ms | 18.51ms | 6.88ms |
| comp_1to8 | 24.73ms | 42.72ms | 13.85ms | 8.24ms | 21.23ms | 4.52ms |
| comp_1to1000 | 17.18ms | 38.48ms | 8.09ms | 4.23ms | 15.83ms | 3.57ms |
| update_1to1 | 16.01ms | 5.63ms | 8.64ms | 9.21ms | 22.84ms | 10.19ms |
| update_2to1 | 8.53ms | 3.10ms | 4.40ms | 4.59ms | 12.67ms | 2.64ms |
| update_4to1 | 4.04ms | 1.44ms | 2.18ms | 2.21ms | 7.00ms | 2.52ms |
| update_1000to1 | 40μs | 15μs | 21μs | 22μs | 79μs | 24μs |
| update_1to2 | 8.07ms | 2.84ms | 4.66ms | 4.48ms | 14.02ms | 3.77ms |
| update_1to4 | 4.01ms | 1.44ms | 2.16ms | 2.32ms | 5.59ms | 2.48ms |
| update_1to1000 | 170μs | 379μs | 916μs | 53μs | 187μs | 32μs |
| cellx1000 | 12.90ms | 5.92ms | 12.35ms | 10.00ms | 81.24ms | 7.65ms |
| cellx2500 | 44.29ms | 32.52ms | 30.32ms | 36.41ms | 268.95ms | 23.71ms |
| cellx5000 | 125.50ms | 76.27ms | 102.32ms | 92.42ms | 623.59ms | 54.80ms |
| 10x5 - 2 sources - read 20.0% (simple) | 348.84ms | 236.78ms | 440.40ms | 506.81ms | 2.08s | 228.40ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 241.84ms | 196.88ms | 268.66ms | 284.54ms | 1.55s | 173.00ms |
| 1000x12 - 4 sources - dynamic (large) | 466.52ms | 351.80ms | 3.70s | 3.80s | 1.98s | 283.06ms |
| 1000x5 - 25 sources (wide dense) | 592.99ms | 504.35ms | 2.74s | 3.56s | 3.71s | 421.74ms |
| 5x500 - 3 sources (deep) | 259.85ms | 208.41ms | 235.02ms | 231.00ms | 1.16s | 190.24ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 385.40ms | 268.79ms | 443.75ms | 477.31ms | 1.76s | 269.16ms |

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
