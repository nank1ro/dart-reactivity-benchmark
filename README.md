# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.80s |
| 🥈 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.36s |
| 🥉 | signals | 0.28 | 100.0% | 35/35 | 10.95s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.55s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.97s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.52s |

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
| avoidablePropagation | 202.32ms | 2.27s | 158.53ms (fail) | 202.93ms | 203.08ms | 274.21ms |
| broadPropagation | 456.51ms | 4.25s | 6.22ms (fail) | 362.80ms | 454.06ms | 501.68ms |
| deepPropagation | 170.69ms | 1.51s | 137.74ms (fail) | 128.67ms | 176.41ms | 164.57ms |
| diamond | 284.46ms | 2.33s | 180.11ms (fail) | 247.82ms | 287.85ms | 352.46ms |
| mux | 394.59ms | 1.74s | 178.83ms (fail) | 361.50ms | 371.58ms | 418.07ms |
| repeatedObservers | 46.29ms | 237.63ms | 55.11ms (fail) | 46.21ms | 41.92ms | 81.59ms |
| triangle | 100.09ms | 751.66ms | 77.06ms (fail) | 90.03ms | 99.14ms | 115.14ms |
| unstable | 76.77ms | 344.67ms | 334.48ms (fail) | 63.78ms | 71.46ms | 95.58ms |
| molBench | 492.42ms | 586.41ms | 1.15ms | 488.52ms | 496.69ms | 491.87ms |
| create_signals | 28.55ms | 92.29ms | 69.90ms | 28.45ms | 5.64ms | 98.64ms |
| comp_0to1 | 12.59ms | 20.93ms | 60.40ms | 10.20ms | 18.87ms | 33.13ms |
| comp_1to1 | 29.77ms | 40.96ms | 55.99ms | 11.56ms | 11.33ms | 28.22ms |
| comp_2to1 | 19.55ms | 36.04ms | 38.45ms | 6.23ms | 11.98ms | 46.66ms |
| comp_4to1 | 7.45ms | 14.61ms | 20.67ms | 7.33ms | 11.54ms | 4.68ms |
| comp_1000to1 | 4μs | 28μs | 44μs | 5μs | 9μs | 15μs |
| comp_1to2 | 22.88ms | 36.16ms | 50.46ms | 16.23ms | 21.98ms | 33.56ms |
| comp_1to4 | 7.45ms | 18.16ms | 48.63ms | 9.40ms | 31.82ms | 15.11ms |
| comp_1to8 | 6.79ms | 20.80ms | 45.85ms | 3.90ms | 9.70ms | 21.69ms |
| comp_1to1000 | 4.02ms | 15.12ms | 40.08ms | 3.63ms | 6.12ms | 14.42ms |
| update_1to1 | 8.93ms | 22.07ms | 9.35ms | 4.64ms | 8.97ms | 15.61ms |
| update_2to1 | 4.48ms | 11.11ms | 2.83ms | 2.32ms | 4.56ms | 7.83ms |
| update_4to1 | 2.22ms | 5.53ms | 2.35ms | 1.16ms | 2.25ms | 3.92ms |
| update_1000to1 | 22μs | 59μs | 14μs | 11μs | 22μs | 39μs |
| update_1to2 | 4.46ms | 10.60ms | 4.93ms | 2.35ms | 4.46ms | 8.01ms |
| update_1to4 | 2.21ms | 5.64ms | 1.48ms | 1.30ms | 2.33ms | 4.01ms |
| update_1to1000 | 42μs | 156μs | 393μs | 47μs | 1.05ms | 151μs |
| cellx1000 | 10.25ms | 83.17ms | 6.77ms | 9.02ms | 11.53ms | 13.38ms |
| cellx2500 | 42.24ms | 280.84ms | 35.67ms | 24.12ms | 42.84ms | 60.34ms |
| cellx5000 | 102.75ms | 607.17ms | 99.44ms | 70.79ms | 102.10ms | 147.56ms |
| 10x5 - 2 sources - read 20.0% (simple) | 508.86ms | 1.95s | 245.00ms | 240.42ms | 450.11ms | 346.92ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.64ms | 1.46s | 200.23ms | 185.88ms | 270.99ms | 248.16ms |
| 1000x12 - 4 sources - dynamic (large) | 3.53s | 1.97s | 356.38ms | 286.63ms | 3.80s | 473.93ms |
| 1000x5 - 25 sources (wide dense) | 3.37s | 3.46s | 520.99ms | 424.84ms | 2.83s | 599.95ms |
| 5x500 - 3 sources (deep) | 224.72ms | 1.12s | 214.05ms | 193.79ms | 236.35ms | 256.36ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 486.80ms | 1.67s | 262.49ms | 264.51ms | 451.69ms | 385.11ms |

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
