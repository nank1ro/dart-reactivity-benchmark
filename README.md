# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.35s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.57s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.73s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.35s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.54s |

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
| avoidablePropagation | 219.19ms | 192.41ms | 159.27ms (fail) | 259.36ms | 208.97ms | 2.35s |
| broadPropagation | 466.01ms | 356.76ms | 6.49ms (fail) | 497.09ms | 528.27ms | 4.38s |
| deepPropagation | 178.23ms | 131.47ms | 139.10ms (fail) | 163.38ms | 182.16ms | 1.54s |
| diamond | 293.71ms | 237.00ms | 198.56ms (fail) | 349.99ms | 294.90ms | 2.45s |
| mux | 411.24ms | 380.42ms | 196.97ms (fail) | 429.47ms | 396.57ms | 1.85s |
| repeatedObservers | 46.34ms | 45.99ms | 54.76ms (fail) | 80.92ms | 60.50ms | 230.13ms |
| triangle | 101.88ms | 85.64ms | 81.81ms (fail) | 113.46ms | 104.32ms | 769.55ms |
| unstable | 76.45ms | 60.52ms | 342.35ms (fail) | 95.61ms | 94.75ms | 344.63ms |
| molBench | 485.22ms | 490.66ms | 955μs | 500.12ms | 490.18ms | 582.87ms |
| create_signals | 25.27ms | 26.17ms | 64.53ms | 54.30ms | 4.73ms | 51.20ms |
| comp_0to1 | 11.10ms | 7.56ms | 60.53ms | 25.08ms | 17.95ms | 15.85ms |
| comp_1to1 | 20.71ms | 4.27ms | 62.71ms | 25.58ms | 15.16ms | 44.92ms |
| comp_2to1 | 8.37ms | 2.22ms | 38.00ms | 32.83ms | 16.63ms | 22.44ms |
| comp_4to1 | 2.04ms | 8.58ms | 16.66ms | 4.26ms | 15.01ms | 27.93ms |
| comp_1000to1 | 5μs | 3μs | 44μs | 15μs | 5μs | 26μs |
| comp_1to2 | 18.78ms | 15.00ms | 48.37ms | 27.18ms | 18.44ms | 37.29ms |
| comp_1to4 | 10.69ms | 5.47ms | 46.52ms | 25.70ms | 34.50ms | 21.40ms |
| comp_1to8 | 8.04ms | 4.39ms | 45.89ms | 24.44ms | 8.42ms | 24.02ms |
| comp_1to1000 | 4.46ms | 3.45ms | 41.50ms | 14.44ms | 6.25ms | 15.41ms |
| update_1to1 | 10.20ms | 7.60ms | 6.00ms | 16.49ms | 9.20ms | 22.82ms |
| update_2to1 | 4.60ms | 2.17ms | 3.63ms | 8.01ms | 4.88ms | 11.62ms |
| update_4to1 | 2.55ms | 2.70ms | 1.53ms | 4.09ms | 2.34ms | 5.58ms |
| update_1000to1 | 26μs | 10μs | 15μs | 39μs | 22μs | 66μs |
| update_1to2 | 4.49ms | 4.96ms | 3.01ms | 8.40ms | 4.54ms | 11.06ms |
| update_1to4 | 2.53ms | 2.33ms | 1.53ms | 4.09ms | 2.35ms | 5.63ms |
| update_1to1000 | 42μs | 46μs | 428μs | 149μs | 161μs | 167μs |
| cellx1000 | 9.74ms | 7.14ms | 5.32ms | 20.35ms | 9.48ms | 71.84ms |
| cellx2500 | 32.25ms | 19.18ms | 24.47ms | 61.34ms | 25.65ms | 253.60ms |
| cellx5000 | 61.83ms | 41.67ms | 66.42ms | 168.40ms | 68.90ms | 546.49ms |
| 10x5 - 2 sources - read 20.0% (simple) | 508.46ms | 244.79ms | 265.15ms | 357.69ms | 512.14ms | 2.01s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.79ms | 185.30ms | 208.15ms | 249.88ms | 291.57ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 4.01s | 282.38ms | 350.87ms | 471.07ms | 3.79s | 1.85s |
| 1000x5 - 25 sources (wide dense) | 3.55s | 402.76ms | 518.44ms | 615.16ms | 2.80s | 3.46s |
| 5x500 - 3 sources (deep) | 226.90ms | 191.95ms | 212.20ms | 253.96ms | 245.66ms | 1.12s |
| 100x15 - 6 sources - dynamic (very dynamic) | 477.85ms | 266.05ms | 265.62ms | 387.30ms | 465.84ms | 1.70s |

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
