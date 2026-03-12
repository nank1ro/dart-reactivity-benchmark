# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.25s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 10.80s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.49s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.19s |
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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 199.83ms | 2.37s | 160.69ms (fail) | 199.33ms | 201.53ms | 274.70ms |
| broadPropagation | 457.04ms | 4.35s | 6.59ms (fail) | 360.46ms | 458.18ms | 514.10ms |
| deepPropagation | 171.96ms | 1.56s | 136.65ms (fail) | 124.02ms | 176.78ms | 166.47ms |
| diamond | 318.12ms | 2.49s | 196.62ms (fail) | 243.36ms | 289.38ms | 350.17ms |
| mux | 395.09ms | 1.79s | 197.51ms (fail) | 362.47ms | 376.23ms | 426.19ms |
| repeatedObservers | 45.84ms | 229.73ms | 58.88ms (fail) | 46.51ms | 42.15ms | 80.88ms |
| triangle | 101.67ms | 763.36ms | 102.18ms (fail) | 88.04ms | 100.53ms | 117.75ms |
| unstable | 74.61ms | 346.47ms | 338.20ms (fail) | 62.63ms | 70.81ms | 96.00ms |
| molBench | 495.29ms | 584.53ms | 922μs | 480.73ms | 494.71ms | 493.72ms |
| create_signals | 26.87ms | 53.39ms | 59.52ms | 29.08ms | 4.78ms | 77.42ms |
| comp_0to1 | 11.56ms | 14.74ms | 54.91ms | 7.34ms | 18.38ms | 26.35ms |
| comp_1to1 | 25.41ms | 45.10ms | 54.72ms | 4.29ms | 12.98ms | 48.61ms |
| comp_2to1 | 15.53ms | 35.65ms | 36.57ms | 2.39ms | 17.62ms | 24.79ms |
| comp_4to1 | 6.14ms | 23.41ms | 16.86ms | 9.16ms | 11.48ms | 9.85ms |
| comp_1000to1 | 7μs | 15μs | 44μs | 6μs | 6μs | 15μs |
| comp_1to2 | 15.97ms | 37.91ms | 45.87ms | 15.79ms | 22.87ms | 31.55ms |
| comp_1to4 | 13.43ms | 24.09ms | 45.32ms | 12.30ms | 25.91ms | 14.93ms |
| comp_1to8 | 13.16ms | 22.45ms | 43.83ms | 5.13ms | 6.20ms | 19.22ms |
| comp_1to1000 | 4.23ms | 15.15ms | 40.15ms | 3.67ms | 5.39ms | 14.21ms |
| update_1to1 | 8.95ms | 21.21ms | 8.86ms | 4.72ms | 9.11ms | 15.68ms |
| update_2to1 | 4.48ms | 10.50ms | 2.85ms | 2.34ms | 4.60ms | 7.84ms |
| update_4to1 | 2.28ms | 5.95ms | 2.03ms | 1.23ms | 2.36ms | 3.97ms |
| update_1000to1 | 21μs | 55μs | 14μs | 11μs | 23μs | 39μs |
| update_1to2 | 4.41ms | 10.42ms | 4.23ms | 2.34ms | 4.59ms | 7.97ms |
| update_1to4 | 2.25ms | 5.25ms | 1.50ms | 1.23ms | 2.41ms | 3.95ms |
| update_1to1000 | 66μs | 155μs | 402μs | 47μs | 844μs | 146μs |
| cellx1000 | 9.75ms | 71.21ms | 5.47ms | 7.36ms | 9.96ms | 15.29ms |
| cellx2500 | 32.77ms | 240.93ms | 28.07ms | 20.05ms | 26.05ms | 31.00ms |
| cellx5000 | 63.99ms | 547.62ms | 55.91ms | 43.25ms | 65.23ms | 68.23ms |
| 10x5 - 2 sources - read 20.0% (simple) | 497.35ms | 1.99s | 245.75ms | 236.05ms | 457.42ms | 345.26ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 285.19ms | 1.52s | 202.87ms | 183.51ms | 270.93ms | 250.20ms |
| 1000x12 - 4 sources - dynamic (large) | 3.51s | 1.89s | 337.33ms | 281.04ms | 3.78s | 462.36ms |
| 1000x5 - 25 sources (wide dense) | 3.29s | 3.35s | 514.51ms | 413.05ms | 2.83s | 599.42ms |
| 5x500 - 3 sources (deep) | 224.01ms | 1.12s | 209.81ms | 190.56ms | 234.09ms | 256.71ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 476.48ms | 1.65s | 259.59ms | 267.65ms | 453.44ms | 395.64ms |

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
