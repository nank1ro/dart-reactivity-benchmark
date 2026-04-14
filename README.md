# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.20s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 10.93s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.42s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.98s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.60s |

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
| avoidablePropagation | 2.28s | 203.63ms | 198.41ms | 210.22ms | 273.02ms | 148.19ms (fail) |
| broadPropagation | 4.29s | 462.81ms | 361.95ms | 456.73ms | 494.79ms | 6.09ms (fail) |
| deepPropagation | 1.55s | 171.13ms | 130.21ms | 179.99ms | 166.82ms | 146.05ms (fail) |
| diamond | 2.41s | 286.83ms | 245.29ms | 286.64ms | 348.32ms | 182.82ms (fail) |
| mux | 1.79s | 396.87ms | 362.10ms | 374.77ms | 419.08ms | 185.02ms (fail) |
| repeatedObservers | 231.02ms | 45.68ms | 45.58ms | 42.42ms | 80.89ms | 56.22ms (fail) |
| triangle | 768.11ms | 102.19ms | 88.43ms | 100.31ms | 115.53ms | 82.30ms (fail) |
| unstable | 357.42ms | 75.62ms | 62.78ms | 71.94ms | 96.33ms | 335.83ms (fail) |
| molBench | 588.93ms | 496.70ms | 481.62ms | 496.21ms | 490.44ms | 988μs |
| create_signals | 51.31ms | 26.33ms | 20.62ms | 5.31ms | 76.41ms | 62.94ms |
| comp_0to1 | 15.06ms | 11.71ms | 8.38ms | 21.43ms | 30.79ms | 57.30ms |
| comp_1to1 | 44.14ms | 27.07ms | 4.30ms | 13.73ms | 47.51ms | 59.06ms |
| comp_2to1 | 34.45ms | 14.89ms | 2.33ms | 21.66ms | 24.10ms | 38.96ms |
| comp_4to1 | 23.56ms | 1.89ms | 8.61ms | 15.02ms | 15.14ms | 17.34ms |
| comp_1000to1 | 15μs | 4μs | 4μs | 6μs | 15μs | 47μs |
| comp_1to2 | 34.66ms | 17.90ms | 11.39ms | 19.55ms | 25.94ms | 50.84ms |
| comp_1to4 | 17.68ms | 15.04ms | 16.74ms | 24.85ms | 24.96ms | 48.43ms |
| comp_1to8 | 19.92ms | 6.64ms | 5.02ms | 5.96ms | 22.77ms | 47.78ms |
| comp_1to1000 | 14.75ms | 4.02ms | 3.40ms | 5.29ms | 14.02ms | 43.51ms |
| update_1to1 | 21.43ms | 8.96ms | 4.64ms | 9.23ms | 15.61ms | 9.77ms |
| update_2to1 | 10.67ms | 4.53ms | 2.32ms | 4.58ms | 7.87ms | 2.85ms |
| update_4to1 | 5.55ms | 2.45ms | 1.23ms | 2.39ms | 3.90ms | 2.85ms |
| update_1000to1 | 54μs | 22μs | 11μs | 23μs | 39μs | 17μs |
| update_1to2 | 10.41ms | 4.43ms | 2.33ms | 4.53ms | 8.09ms | 4.33ms |
| update_1to4 | 5.18ms | 2.25ms | 1.16ms | 2.47ms | 3.95ms | 1.45ms |
| update_1to1000 | 170μs | 41μs | 31μs | 885μs | 159μs | 437μs |
| cellx1000 | 75.15ms | 9.79ms | 7.75ms | 10.00ms | 11.36ms | 5.24ms |
| cellx2500 | 254.61ms | 31.35ms | 19.34ms | 26.00ms | 30.69ms | 26.52ms |
| cellx5000 | 549.22ms | 60.08ms | 42.30ms | 64.01ms | 68.94ms | 61.58ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.98s | 503.11ms | 235.30ms | 450.26ms | 347.20ms | 256.11ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.49s | 279.33ms | 178.98ms | 270.14ms | 252.99ms | 212.61ms |
| 1000x12 - 4 sources - dynamic (large) | 1.89s | 3.63s | 276.72ms | 3.77s | 453.86ms | 359.08ms |
| 1000x5 - 25 sources (wide dense) | 3.41s | 3.34s | 413.21ms | 2.77s | 596.29ms | 573.86ms |
| 5x500 - 3 sources (deep) | 1.11s | 223.64ms | 195.04ms | 230.02ms | 253.50ms | 238.62ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.65s | 471.82ms | 266.70ms | 445.49ms | 380.88ms | 274.24ms |

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
