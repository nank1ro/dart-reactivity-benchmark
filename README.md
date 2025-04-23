# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.21s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 9.92s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.23s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.15s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.40s |

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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 272.91ms | 200.05ms | 2.33s | 188.54ms | 208.94ms | 156.24ms (fail) |
| broadPropagation | 506.92ms | 454.87ms | 4.21s | 344.56ms | 444.61ms | 6.32ms (fail) |
| deepPropagation | 177.41ms | 179.76ms | 1.50s | 126.49ms | 170.56ms | 142.76ms (fail) |
| diamond | 351.74ms | 280.66ms | 2.37s | 236.76ms | 284.22ms | 190.72ms (fail) |
| mux | 445.05ms | 371.35ms | 1.82s | 375.33ms | 406.49ms | 191.63ms (fail) |
| repeatedObservers | 78.37ms | 38.26ms | 230.07ms | 44.52ms | 44.59ms | 52.29ms (fail) |
| triangle | 124.29ms | 98.38ms | 773.53ms | 84.42ms | 100.37ms | 81.43ms (fail) |
| unstable | 90.80ms | 78.20ms | 341.56ms | 60.54ms | 72.27ms | 339.68ms (fail) |
| molBench | 485.25ms | 478.77ms | 571.87ms | 489.42ms | 479.60ms | 1.16ms |
| create_signals | 56.69ms | 5.04ms | 80.26ms | 26.30ms | 24.68ms | 66.40ms |
| comp_0to1 | 24.37ms | 17.46ms | 27.07ms | 6.94ms | 11.39ms | 55.25ms |
| comp_1to1 | 38.71ms | 13.70ms | 41.40ms | 4.10ms | 27.62ms | 60.52ms |
| comp_2to1 | 35.16ms | 14.98ms | 22.18ms | 2.23ms | 10.63ms | 34.79ms |
| comp_4to1 | 4.61ms | 15.05ms | 26.86ms | 11.05ms | 2.00ms | 15.65ms |
| comp_1000to1 | 17μs | 4μs | 15μs | 4μs | 5μs | 41μs |
| comp_1to2 | 28.14ms | 24.34ms | 35.76ms | 12.24ms | 19.45ms | 43.73ms |
| comp_1to4 | 21.18ms | 27.73ms | 20.88ms | 13.25ms | 11.45ms | 42.73ms |
| comp_1to8 | 19.76ms | 7.05ms | 21.95ms | 4.05ms | 6.60ms | 41.67ms |
| comp_1to1000 | 15.18ms | 6.08ms | 14.55ms | 3.16ms | 4.43ms | 37.24ms |
| update_1to1 | 16.09ms | 8.20ms | 25.46ms | 11.23ms | 9.22ms | 5.79ms |
| update_2to1 | 7.98ms | 4.04ms | 12.93ms | 5.47ms | 4.58ms | 2.91ms |
| update_4to1 | 4.07ms | 2.03ms | 6.35ms | 2.84ms | 2.32ms | 1.48ms |
| update_1000to1 | 40μs | 20μs | 67μs | 10μs | 22μs | 15μs |
| update_1to2 | 8.03ms | 4.05ms | 12.95ms | 5.61ms | 4.95ms | 2.96ms |
| update_1to4 | 4.09ms | 2.15ms | 6.33ms | 2.46ms | 2.32ms | 1.48ms |
| update_1to1000 | 153μs | 303μs | 179μs | 35μs | 44μs | 370μs |
| cellx1000 | 13.34ms | 9.51ms | 65.92ms | 7.22ms | 9.41ms | 5.56ms |
| cellx2500 | 30.38ms | 25.21ms | 231.12ms | 18.99ms | 30.50ms | 26.79ms |
| cellx5000 | 62.87ms | 62.55ms | 525.36ms | 41.09ms | 59.02ms | 63.34ms |
| 10x5 - 2 sources - read 20.0% (simple) | 358.14ms | 438.20ms | 2.01s | 230.19ms | 519.08ms | 241.37ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 245.83ms | 270.43ms | 1.53s | 176.71ms | 280.79ms | 200.98ms |
| 1000x12 - 4 sources - dynamic (large) | 458.57ms | 3.51s | 1.85s | 281.39ms | 3.71s | 332.60ms |
| 1000x5 - 25 sources (wide dense) | 587.07ms | 2.60s | 3.60s | 404.05ms | 3.56s | 496.64ms |
| 5x500 - 3 sources (deep) | 258.00ms | 232.89ms | 1.13s | 188.54ms | 227.25ms | 206.52ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 377.38ms | 446.56ms | 1.71s | 262.32ms | 474.88ms | 255.11ms |

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
