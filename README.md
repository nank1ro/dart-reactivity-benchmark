# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.33s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.10s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 9.96s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.85s |
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
| Test Case | preact_signals | state_beacon | signals | alien_signals | mobx | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 197.29ms | 146.49ms (fail) | 202.21ms | 185.01ms | 2.35s | 273.88ms |
| broadPropagation | 439.81ms | 6.11ms (fail) | 505.64ms | 354.05ms | 4.42s | 509.00ms |
| deepPropagation | 176.18ms | 139.72ms (fail) | 170.01ms | 133.40ms | 1.50s | 171.37ms |
| diamond | 281.75ms | 182.62ms (fail) | 281.29ms | 235.51ms | 2.41s | 365.76ms |
| mux | 382.23ms | 187.46ms (fail) | 399.25ms | 358.45ms | 1.76s | 425.96ms |
| repeatedObservers | 40.98ms | 53.75ms (fail) | 45.84ms | 43.50ms | 239.53ms | 80.11ms |
| triangle | 98.54ms | 81.52ms (fail) | 100.39ms | 85.07ms | 739.41ms | 114.86ms |
| unstable | 73.79ms | 337.46ms (fail) | 72.73ms | 59.33ms | 341.40ms | 96.35ms |
| molBench | 484.13ms | 917μs | 496.42ms | 487.62ms | 592.60ms | 491.89ms |
| create_signals | 4.73ms | 62.11ms | 26.88ms | 31.64ms | 51.49ms | 58.73ms |
| comp_0to1 | 17.87ms | 55.49ms | 11.65ms | 13.37ms | 15.68ms | 25.12ms |
| comp_1to1 | 21.20ms | 56.18ms | 29.07ms | 4.18ms | 42.31ms | 28.88ms |
| comp_2to1 | 17.45ms | 37.98ms | 13.32ms | 2.42ms | 37.23ms | 35.17ms |
| comp_4to1 | 15.79ms | 16.20ms | 6.96ms | 12.96ms | 16.99ms | 18.34ms |
| comp_1000to1 | 4μs | 44μs | 5μs | 4μs | 15μs | 14μs |
| comp_1to2 | 22.41ms | 47.18ms | 22.51ms | 13.52ms | 36.75ms | 34.47ms |
| comp_1to4 | 32.10ms | 47.79ms | 7.26ms | 13.97ms | 17.75ms | 21.98ms |
| comp_1to8 | 7.05ms | 45.16ms | 6.47ms | 4.83ms | 20.57ms | 20.22ms |
| comp_1to1000 | 6.84ms | 41.16ms | 4.02ms | 3.40ms | 15.21ms | 14.13ms |
| update_1to1 | 9.37ms | 5.76ms | 9.77ms | 10.04ms | 23.67ms | 15.95ms |
| update_2to1 | 4.53ms | 2.95ms | 4.97ms | 2.27ms | 10.65ms | 8.50ms |
| update_4to1 | 2.29ms | 1.48ms | 2.43ms | 1.77ms | 6.59ms | 4.02ms |
| update_1000to1 | 27μs | 15μs | 24μs | 10μs | 68μs | 39μs |
| update_1to2 | 4.72ms | 2.92ms | 4.92ms | 4.97ms | 12.06ms | 8.25ms |
| update_1to4 | 2.35ms | 1.51ms | 2.47ms | 1.13ms | 6.86ms | 4.04ms |
| update_1to1000 | 775μs | 426μs | 44μs | 51μs | 161μs | 145μs |
| cellx1000 | 9.86ms | 5.22ms | 10.60ms | 7.86ms | 76.90ms | 15.00ms |
| cellx2500 | 26.70ms | 21.70ms | 41.07ms | 24.50ms | 273.24ms | 48.44ms |
| cellx5000 | 80.63ms | 75.22ms | 93.77ms | 66.42ms | 567.98ms | 119.00ms |
| 10x5 - 2 sources - read 20.0% (simple) | 434.31ms | 243.92ms | 495.94ms | 235.45ms | 1.90s | 346.92ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 270.09ms | 203.35ms | 284.43ms | 175.75ms | 1.43s | 252.18ms |
| 1000x12 - 4 sources - dynamic (large) | 3.58s | 350.46ms | 3.66s | 289.10ms | 1.83s | 470.27ms |
| 1000x5 - 25 sources (wide dense) | 2.54s | 514.46ms | 3.38s | 409.23ms | 3.34s | 615.47ms |
| 5x500 - 3 sources (deep) | 229.02ms | 205.95ms | 223.08ms | 191.51ms | 1.10s | 250.93ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 450.47ms | 265.91ms | 489.33ms | 267.12ms | 1.66s | 385.67ms |

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
