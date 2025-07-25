# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.66s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 10.31s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.26s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.33s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.23s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.42s |

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
| Test Case | state_beacon | mobx | solidart(2.0-dev) | preact_signals | signals | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 165.66ms (fail) | 2.31s | 280.87ms | 206.32ms | 208.69ms | 183.63ms |
| broadPropagation | 7.67ms (fail) | 4.42s | 505.43ms | 500.94ms | 464.46ms | 344.16ms |
| deepPropagation | 143.58ms (fail) | 1.57s | 167.13ms | 177.28ms | 176.01ms | 125.52ms |
| diamond | 200.62ms (fail) | 2.44s | 352.79ms | 298.61ms | 280.09ms | 229.95ms |
| mux | 191.62ms (fail) | 1.84s | 442.45ms | 403.31ms | 413.71ms | 372.46ms |
| repeatedObservers | 57.12ms (fail) | 227.41ms | 81.33ms | 41.27ms | 44.74ms | 45.56ms |
| triangle | 79.31ms (fail) | 758.04ms | 120.05ms | 102.32ms | 101.36ms | 84.51ms |
| unstable | 335.30ms (fail) | 356.28ms | 98.24ms | 72.44ms | 80.64ms | 67.49ms |
| molBench | 934μs | 582.30ms | 493.73ms | 489.75ms | 485.60ms | 487.88ms |
| create_signals | 63.34ms | 57.69ms | 74.18ms | 5.19ms | 24.75ms | 26.12ms |
| comp_0to1 | 59.97ms | 16.12ms | 28.99ms | 22.58ms | 11.06ms | 6.54ms |
| comp_1to1 | 56.38ms | 41.05ms | 36.17ms | 10.99ms | 26.74ms | 4.21ms |
| comp_2to1 | 37.22ms | 22.94ms | 39.04ms | 18.08ms | 8.78ms | 2.32ms |
| comp_4to1 | 17.64ms | 18.55ms | 15.17ms | 8.04ms | 1.93ms | 7.55ms |
| comp_1000to1 | 40μs | 17μs | 17μs | 6μs | 4μs | 3μs |
| comp_1to2 | 46.38ms | 34.91ms | 29.62ms | 11.91ms | 22.50ms | 19.17ms |
| comp_1to4 | 43.07ms | 17.85ms | 23.22ms | 27.50ms | 8.98ms | 11.55ms |
| comp_1to8 | 42.06ms | 20.43ms | 25.24ms | 6.62ms | 9.85ms | 6.04ms |
| comp_1to1000 | 38.18ms | 15.81ms | 16.94ms | 4.69ms | 6.70ms | 3.46ms |
| update_1to1 | 5.92ms | 28.33ms | 17.06ms | 8.56ms | 8.89ms | 10.22ms |
| update_2to1 | 3.24ms | 14.30ms | 8.51ms | 4.35ms | 4.55ms | 2.29ms |
| update_4to1 | 1.51ms | 7.25ms | 4.27ms | 2.19ms | 2.22ms | 2.64ms |
| update_1000to1 | 25μs | 68μs | 42μs | 21μs | 22μs | 26μs |
| update_1to2 | 2.98ms | 13.00ms | 8.65ms | 4.64ms | 4.47ms | 5.31ms |
| update_1to4 | 1.51ms | 6.85ms | 4.32ms | 2.18ms | 2.20ms | 2.46ms |
| update_1to1000 | 374μs | 171μs | 172μs | 143μs | 47μs | 47μs |
| cellx1000 | 5.12ms | 70.44ms | 11.84ms | 9.52ms | 9.34ms | 7.18ms |
| cellx2500 | 21.96ms | 240.55ms | 31.85ms | 25.03ms | 29.44ms | 19.43ms |
| cellx5000 | 49.98ms | 520.23ms | 69.51ms | 61.96ms | 54.30ms | 40.42ms |
| 10x5 - 2 sources - read 20.0% (simple) | 264.28ms | 2.00s | 350.29ms | 477.44ms | 524.30ms | 229.53ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 199.45ms | 1.51s | 247.69ms | 285.25ms | 291.36ms | 173.84ms |
| 1000x12 - 4 sources - dynamic (large) | 334.54ms | 1.86s | 459.20ms | 3.67s | 3.74s | 278.59ms |
| 1000x5 - 25 sources (wide dense) | 484.56ms | 3.44s | 583.30ms | 2.67s | 3.57s | 409.05ms |
| 5x500 - 3 sources (deep) | 202.42ms | 1.12s | 248.34ms | 225.83ms | 225.25ms | 191.26ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 259.31ms | 1.67s | 380.70ms | 450.95ms | 480.74ms | 259.16ms |

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
