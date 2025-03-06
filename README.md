# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.74s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.12s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.41s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 9.97s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.14s |
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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 280.75ms | 205.23ms | 2.33s | 186.67ms | 207.22ms | 154.97ms (fail) |
| broadPropagation | 510.83ms | 451.87ms | 4.35s | 358.54ms | 451.67ms | 6.25ms (fail) |
| deepPropagation | 167.78ms | 178.78ms | 1.54s | 122.43ms | 176.53ms | 141.09ms (fail) |
| diamond | 354.86ms | 279.83ms | 2.44s | 237.11ms | 286.63ms | 186.11ms (fail) |
| mux | 447.71ms | 381.77ms | 1.83s | 375.16ms | 401.71ms | 193.73ms (fail) |
| repeatedObservers | 78.05ms | 38.41ms | 228.81ms | 45.20ms | 45.92ms | 53.15ms (fail) |
| triangle | 117.25ms | 98.50ms | 774.76ms | 86.31ms | 104.19ms | 82.47ms (fail) |
| unstable | 95.64ms | 68.69ms | 353.49ms | 61.02ms | 73.89ms | 339.73ms (fail) |
| molBench | 494.71ms | 492.06ms | 581.44ms | 492.65ms | 489.31ms | 964μs |
| create_signals | 94.06ms | 4.65ms | 54.05ms | 28.79ms | 27.34ms | 64.56ms |
| comp_0to1 | 35.44ms | 18.01ms | 15.17ms | 7.16ms | 12.59ms | 59.38ms |
| comp_1to1 | 37.77ms | 11.59ms | 44.57ms | 4.18ms | 18.76ms | 55.49ms |
| comp_2to1 | 25.65ms | 18.52ms | 35.52ms | 2.36ms | 9.31ms | 37.40ms |
| comp_4to1 | 16.52ms | 12.60ms | 14.98ms | 12.56ms | 1.95ms | 16.65ms |
| comp_1000to1 | 19μs | 7μs | 16μs | 4μs | 5μs | 43μs |
| comp_1to2 | 39.65ms | 23.40ms | 35.76ms | 16.07ms | 19.50ms | 45.63ms |
| comp_1to4 | 20.58ms | 23.65ms | 17.41ms | 9.05ms | 20.01ms | 44.80ms |
| comp_1to8 | 23.22ms | 6.83ms | 21.35ms | 6.97ms | 6.43ms | 44.12ms |
| comp_1to1000 | 14.47ms | 6.27ms | 14.84ms | 3.37ms | 5.74ms | 39.02ms |
| update_1to1 | 16.13ms | 8.34ms | 24.31ms | 11.36ms | 9.35ms | 5.73ms |
| update_2to1 | 7.97ms | 4.04ms | 11.98ms | 3.69ms | 4.87ms | 2.90ms |
| update_4to1 | 4.03ms | 2.07ms | 6.78ms | 2.81ms | 2.35ms | 1.51ms |
| update_1000to1 | 40μs | 20μs | 62μs | 10μs | 22μs | 15μs |
| update_1to2 | 8.21ms | 4.12ms | 12.64ms | 5.61ms | 4.97ms | 2.95ms |
| update_1to4 | 4.04ms | 2.07ms | 6.20ms | 2.56ms | 2.36ms | 1.51ms |
| update_1to1000 | 162μs | 982μs | 178μs | 49μs | 45μs | 397μs |
| cellx1000 | 13.57ms | 10.37ms | 98.21ms | 10.32ms | 10.79ms | 6.14ms |
| cellx2500 | 51.09ms | 34.79ms | 304.71ms | 25.14ms | 40.51ms | 32.70ms |
| cellx5000 | 156.68ms | 90.18ms | 622.22ms | 57.86ms | 110.36ms | 93.31ms |
| 10x5 - 2 sources - read 20.0% (simple) | 346.22ms | 440.46ms | 2.04s | 230.97ms | 505.84ms | 251.22ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 243.77ms | 276.07ms | 1.62s | 177.34ms | 277.20ms | 200.91ms |
| 1000x12 - 4 sources - dynamic (large) | 470.50ms | 3.51s | 2.08s | 285.46ms | 3.75s | 353.09ms |
| 1000x5 - 25 sources (wide dense) | 590.35ms | 2.58s | 3.66s | 411.22ms | 3.34s | 505.34ms |
| 5x500 - 3 sources (deep) | 255.16ms | 232.49ms | 1.21s | 187.09ms | 228.06ms | 203.40ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 386.96ms | 442.30ms | 1.76s | 268.13ms | 480.27ms | 258.59ms |

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
