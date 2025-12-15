# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.68s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 9.96s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.24s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 10.79s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 27.27s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.37s |

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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 213.30ms | 191.02ms | 146.55ms (fail) | 292.63ms | 207.03ms | 2.33s |
| broadPropagation | 461.30ms | 350.43ms | 6.12ms (fail) | 492.97ms | 464.46ms | 4.41s |
| deepPropagation | 173.37ms | 127.18ms | 137.48ms (fail) | 170.91ms | 178.99ms | 1.51s |
| diamond | 291.41ms | 230.85ms | 179.27ms (fail) | 352.66ms | 283.84ms | 2.39s |
| mux | 393.20ms | 358.07ms | 183.29ms (fail) | 416.56ms | 376.91ms | 1.85s |
| repeatedObservers | 46.52ms | 43.59ms | 52.34ms (fail) | 80.58ms | 40.13ms | 234.95ms |
| triangle | 102.22ms | 82.87ms | 78.24ms (fail) | 113.92ms | 101.33ms | 744.90ms |
| unstable | 78.08ms | 62.54ms | 333.92ms (fail) | 95.40ms | 70.01ms | 341.84ms |
| molBench | 495.00ms | 485.51ms | 1.25ms | 489.96ms | 483.91ms | 591.49ms |
| create_signals | 26.13ms | 27.84ms | 56.60ms | 97.97ms | 5.35ms | 90.66ms |
| comp_0to1 | 11.26ms | 8.58ms | 51.42ms | 34.79ms | 17.35ms | 16.30ms |
| comp_1to1 | 27.57ms | 4.18ms | 52.62ms | 47.92ms | 11.32ms | 51.52ms |
| comp_2to1 | 8.31ms | 2.27ms | 35.20ms | 48.60ms | 22.54ms | 23.17ms |
| comp_4to1 | 1.95ms | 8.50ms | 15.70ms | 7.97ms | 1.70ms | 31.79ms |
| comp_1000to1 | 4μs | 6μs | 42μs | 16μs | 4μs | 27μs |
| comp_1to2 | 22.46ms | 16.98ms | 43.55ms | 33.83ms | 17.54ms | 33.23ms |
| comp_1to4 | 13.86ms | 9.06ms | 43.83ms | 20.66ms | 17.81ms | 23.62ms |
| comp_1to8 | 6.50ms | 6.18ms | 42.67ms | 22.43ms | 14.75ms | 23.45ms |
| comp_1to1000 | 4.18ms | 3.57ms | 37.47ms | 14.46ms | 5.94ms | 15.49ms |
| update_1to1 | 9.43ms | 4.65ms | 6.10ms | 15.56ms | 8.77ms | 24.39ms |
| update_2to1 | 4.74ms | 2.34ms | 3.07ms | 7.77ms | 4.43ms | 12.88ms |
| update_4to1 | 2.33ms | 1.15ms | 1.60ms | 3.87ms | 2.20ms | 6.35ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 57μs |
| update_1to2 | 4.67ms | 2.36ms | 3.09ms | 7.94ms | 4.40ms | 12.86ms |
| update_1to4 | 2.54ms | 1.17ms | 1.62ms | 3.87ms | 2.25ms | 5.96ms |
| update_1to1000 | 74μs | 28μs | 363μs | 150μs | 51μs | 182μs |
| cellx1000 | 9.67ms | 7.77ms | 5.20ms | 11.54ms | 9.63ms | 72.98ms |
| cellx2500 | 31.42ms | 20.67ms | 23.12ms | 31.94ms | 25.71ms | 250.32ms |
| cellx5000 | 63.98ms | 44.98ms | 77.39ms | 67.29ms | 69.93ms | 586.30ms |
| 10x5 - 2 sources - read 20.0% (simple) | 511.12ms | 260.64ms | 240.20ms | 345.30ms | 432.71ms | 1.95s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.99ms | 176.20ms | 197.37ms | 243.59ms | 267.61ms | 1.44s |
| 1000x12 - 4 sources - dynamic (large) | 3.54s | 273.35ms | 332.72ms | 452.71ms | 3.63s | 1.96s |
| 1000x5 - 25 sources (wide dense) | 3.25s | 409.95ms | 522.50ms | 581.11ms | 2.50s | 3.44s |
| 5x500 - 3 sources (deep) | 225.88ms | 189.34ms | 203.39ms | 257.00ms | 225.86ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 475.67ms | 266.26ms | 254.14ms | 374.19ms | 445.61ms | 1.67s |

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
