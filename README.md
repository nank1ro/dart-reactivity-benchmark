# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.31 | 100.0% | 35/35 | 5.23s |
| 🥉 | signals | 0.28 | 100.0% | 35/35 | 10.95s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.54s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.18s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.48s |

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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.30s | 199.25ms | 197.47ms | 208.78ms | 272.74ms | 148.10ms (fail) |
| broadPropagation | 4.32s | 468.62ms | 358.08ms | 454.69ms | 497.30ms | 5.78ms (fail) |
| deepPropagation | 1.55s | 175.26ms | 131.43ms | 180.46ms | 167.16ms | 138.23ms (fail) |
| diamond | 2.39s | 286.25ms | 243.51ms | 288.06ms | 345.88ms | 182.40ms (fail) |
| mux | 1.78s | 399.42ms | 365.13ms | 377.19ms | 421.82ms | 182.67ms (fail) |
| repeatedObservers | 229.89ms | 45.54ms | 45.36ms | 41.95ms | 80.79ms | 58.46ms (fail) |
| triangle | 768.26ms | 102.25ms | 88.22ms | 99.79ms | 113.56ms | 77.83ms (fail) |
| unstable | 342.86ms | 75.48ms | 62.48ms | 72.38ms | 96.31ms | 336.44ms (fail) |
| molBench | 588.68ms | 494.17ms | 481.02ms | 496.00ms | 490.79ms | 1.06ms |
| create_signals | 69.13ms | 26.21ms | 26.85ms | 5.61ms | 53.10ms | 65.54ms |
| comp_0to1 | 25.75ms | 10.78ms | 9.16ms | 18.10ms | 25.00ms | 60.97ms |
| comp_1to1 | 37.89ms | 27.59ms | 9.19ms | 13.55ms | 42.62ms | 56.63ms |
| comp_2to1 | 30.23ms | 14.63ms | 14.27ms | 16.97ms | 16.42ms | 37.83ms |
| comp_4to1 | 24.76ms | 4.80ms | 1.76ms | 15.07ms | 9.04ms | 17.79ms |
| comp_1000to1 | 15μs | 4μs | 5μs | 4μs | 21μs | 47μs |
| comp_1to2 | 44.26ms | 24.21ms | 11.87ms | 19.12ms | 33.80ms | 49.41ms |
| comp_1to4 | 34.11ms | 7.16ms | 16.76ms | 33.45ms | 16.95ms | 48.92ms |
| comp_1to8 | 21.02ms | 6.38ms | 4.98ms | 6.11ms | 22.56ms | 47.77ms |
| comp_1to1000 | 14.76ms | 4.05ms | 3.71ms | 5.46ms | 14.34ms | 43.48ms |
| update_1to1 | 21.10ms | 8.97ms | 4.65ms | 9.33ms | 15.69ms | 8.38ms |
| update_2to1 | 10.41ms | 4.49ms | 2.32ms | 4.62ms | 7.86ms | 2.86ms |
| update_4to1 | 5.22ms | 2.27ms | 1.17ms | 2.30ms | 3.92ms | 2.37ms |
| update_1000to1 | 52μs | 22μs | 11μs | 23μs | 40μs | 15μs |
| update_1to2 | 11.02ms | 4.46ms | 2.32ms | 4.53ms | 7.84ms | 5.13ms |
| update_1to4 | 5.23ms | 2.38ms | 1.20ms | 2.44ms | 4.16ms | 1.47ms |
| update_1to1000 | 157μs | 71μs | 59μs | 1.03ms | 148μs | 427μs |
| cellx1000 | 87.76ms | 9.84ms | 7.94ms | 10.35ms | 13.08ms | 6.84ms |
| cellx2500 | 245.16ms | 34.20ms | 23.00ms | 29.02ms | 37.15ms | 29.40ms |
| cellx5000 | 606.45ms | 77.13ms | 51.17ms | 86.14ms | 103.96ms | 76.02ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.05s | 509.66ms | 237.30ms | 461.91ms | 346.97ms | 239.64ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.51s | 287.60ms | 176.68ms | 272.87ms | 249.55ms | 202.08ms |
| 1000x12 - 4 sources - dynamic (large) | 1.79s | 3.49s | 287.78ms | 3.82s | 477.01ms | 356.64ms |
| 1000x5 - 25 sources (wide dense) | 3.43s | 3.44s | 420.24ms | 2.79s | 600.76ms | 519.84ms |
| 5x500 - 3 sources (deep) | 1.15s | 222.41ms | 198.62ms | 237.33ms | 255.74ms | 209.28ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.68s | 485.57ms | 265.62ms | 450.06ms | 385.88ms | 264.40ms |

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
