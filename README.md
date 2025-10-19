# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.29s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.20s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.40s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.36s |
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
| Test Case | state_beacon | alien_signals | signals | solidart(2.0-dev) | mobx | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 155.64ms (fail) | 195.59ms | 215.43ms | 265.07ms | 2.34s | 204.99ms |
| broadPropagation | 6.84ms (fail) | 358.91ms | 461.13ms | 492.51ms | 4.32s | 459.96ms |
| deepPropagation | 140.94ms (fail) | 128.88ms | 177.81ms | 163.34ms | 1.55s | 179.92ms |
| diamond | 195.33ms (fail) | 236.92ms | 284.09ms | 350.38ms | 2.42s | 278.78ms |
| mux | 197.80ms (fail) | 378.61ms | 412.55ms | 439.65ms | 1.83s | 393.17ms |
| repeatedObservers | 52.64ms (fail) | 43.65ms | 46.07ms | 80.52ms | 233.06ms | 40.15ms |
| triangle | 78.26ms (fail) | 85.14ms | 104.22ms | 113.19ms | 756.84ms | 102.04ms |
| unstable | 339.21ms (fail) | 59.83ms | 75.69ms | 96.68ms | 342.46ms | 72.78ms |
| molBench | 1.17ms | 491.90ms | 486.40ms | 493.11ms | 582.68ms | 488.86ms |
| create_signals | 62.82ms | 27.25ms | 25.47ms | 94.19ms | 70.80ms | 5.25ms |
| comp_0to1 | 56.98ms | 7.23ms | 11.65ms | 33.16ms | 28.52ms | 17.50ms |
| comp_1to1 | 58.64ms | 4.14ms | 26.67ms | 50.92ms | 32.09ms | 10.93ms |
| comp_2to1 | 44.55ms | 2.27ms | 9.99ms | 21.70ms | 39.33ms | 12.76ms |
| comp_4to1 | 16.95ms | 9.94ms | 2.09ms | 10.00ms | 14.11ms | 13.86ms |
| comp_1000to1 | 44μs | 5μs | 8μs | 19μs | 16μs | 4μs |
| comp_1to2 | 48.71ms | 11.22ms | 13.07ms | 30.02ms | 33.31ms | 15.40ms |
| comp_1to4 | 46.31ms | 8.82ms | 9.71ms | 21.85ms | 21.84ms | 27.73ms |
| comp_1to8 | 45.93ms | 5.17ms | 6.68ms | 24.86ms | 24.82ms | 7.33ms |
| comp_1to1000 | 41.56ms | 3.41ms | 4.37ms | 14.09ms | 15.60ms | 6.70ms |
| update_1to1 | 6.07ms | 10.03ms | 10.21ms | 16.43ms | 27.86ms | 8.78ms |
| update_2to1 | 3.23ms | 2.17ms | 4.58ms | 8.02ms | 11.72ms | 4.52ms |
| update_4to1 | 1.57ms | 2.55ms | 2.54ms | 4.11ms | 7.23ms | 2.45ms |
| update_1000to1 | 15μs | 10μs | 25μs | 40μs | 69μs | 20μs |
| update_1to2 | 3.06ms | 5.06ms | 4.50ms | 8.23ms | 13.32ms | 4.30ms |
| update_1to4 | 1.56ms | 2.43ms | 2.53ms | 4.08ms | 6.87ms | 2.20ms |
| update_1to1000 | 441μs | 32μs | 78μs | 148μs | 183μs | 882μs |
| cellx1000 | 5.65ms | 8.16ms | 9.64ms | 11.84ms | 78.70ms | 9.85ms |
| cellx2500 | 31.09ms | 20.03ms | 32.99ms | 33.47ms | 297.52ms | 27.88ms |
| cellx5000 | 68.52ms | 45.69ms | 63.77ms | 78.42ms | 611.03ms | 82.53ms |
| 10x5 - 2 sources - read 20.0% (simple) | 244.10ms | 234.36ms | 506.96ms | 349.81ms | 2.00s | 451.02ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 196.79ms | 186.37ms | 280.09ms | 254.06ms | 1.52s | 275.64ms |
| 1000x12 - 4 sources - dynamic (large) | 346.84ms | 281.23ms | 3.78s | 466.26ms | 1.83s | 3.77s |
| 1000x5 - 25 sources (wide dense) | 519.06ms | 413.23ms | 3.43s | 614.01ms | 3.46s | 2.73s |
| 5x500 - 3 sources (deep) | 206.31ms | 195.88ms | 225.66ms | 254.40ms | 1.13s | 230.51ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 261.20ms | 265.67ms | 473.96ms | 386.96ms | 1.71s | 462.66ms |

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
