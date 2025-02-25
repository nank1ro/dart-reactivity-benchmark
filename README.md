# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.68s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 9.97s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.38s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.80s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.35s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.47s |

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
| Test Case | alien_signals | mobx | solidart | state_beacon | preact_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 184.49ms | 2.36s | 2.17s | 153.29ms (fail) | 200.76ms | 210.15ms |
| broadPropagation | 351.43ms | 4.29s | 5.42s | 6.38ms (fail) | 458.88ms | 454.09ms |
| deepPropagation | 120.40ms | 1.55s | 2.02s | 141.00ms (fail) | 178.11ms | 176.19ms |
| diamond | 237.26ms | 2.38s | 3.43s | 196.20ms (fail) | 282.69ms | 290.17ms |
| mux | 383.77ms | 1.84s | 2.02s | 192.05ms (fail) | 387.45ms | 410.88ms |
| repeatedObservers | 45.66ms | 229.31ms | 207.36ms | 52.62ms (fail) | 38.97ms | 46.78ms |
| triangle | 83.48ms | 781.10ms | 1.12s | 81.91ms (fail) | 99.01ms | 105.47ms |
| unstable | 60.87ms | 348.70ms | 337.32ms | 336.96ms (fail) | 70.75ms | 75.03ms |
| molBench | 492.02ms | 577.66ms | 1.70s | 1.30ms | 490.94ms | 484.09ms |
| create_signals | 25.98ms | 71.38ms | 60.13ms | 61.21ms | 4.64ms | 25.70ms |
| comp_0to1 | 10.10ms | 24.69ms | 34.99ms | 56.31ms | 18.22ms | 11.49ms |
| comp_1to1 | 4.84ms | 28.89ms | 42.51ms | 55.45ms | 11.78ms | 27.04ms |
| comp_2to1 | 2.25ms | 16.48ms | 23.85ms | 44.69ms | 17.16ms | 11.93ms |
| comp_4to1 | 10.78ms | 14.38ms | 18.66ms | 17.98ms | 8.86ms | 5.05ms |
| comp_1000to1 | 5μs | 17μs | 2.20ms | 52μs | 5μs | 5μs |
| comp_1to2 | 18.70ms | 44.76ms | 30.42ms | 46.91ms | 15.75ms | 22.97ms |
| comp_1to4 | 6.15ms | 22.88ms | 28.79ms | 44.13ms | 31.52ms | 9.37ms |
| comp_1to8 | 6.17ms | 21.23ms | 24.77ms | 44.00ms | 8.04ms | 6.58ms |
| comp_1to1000 | 3.65ms | 15.50ms | 17.36ms | 38.04ms | 6.45ms | 4.53ms |
| update_1to1 | 5.84ms | 24.57ms | 41.61ms | 5.73ms | 8.26ms | 9.25ms |
| update_2to1 | 5.08ms | 11.32ms | 20.79ms | 2.89ms | 4.05ms | 4.63ms |
| update_4to1 | 2.67ms | 5.87ms | 10.23ms | 1.47ms | 2.10ms | 2.31ms |
| update_1000to1 | 24μs | 62μs | 126μs | 15μs | 20μs | 23μs |
| update_1to2 | 4.77ms | 11.79ms | 20.77ms | 2.96ms | 4.06ms | 4.83ms |
| update_1to4 | 2.05ms | 6.27ms | 10.23ms | 1.49ms | 2.06ms | 2.29ms |
| update_1to1000 | 46μs | 162μs | 209μs | 372μs | 200μs | 43μs |
| cellx1000 | 9.39ms | 71.67ms | 164.44ms | 5.16ms | 9.56ms | 9.60ms |
| cellx2500 | 20.26ms | 259.51ms | 462.12ms | 24.69ms | 25.97ms | 31.73ms |
| cellx5000 | 42.75ms | 595.36ms | 1.18s | 81.97ms | 65.87ms | 60.96ms |
| 10x5 - 2 sources - read 20.0% (simple) | 227.78ms | 2.11s | 2.61s (partial) | 245.10ms | 457.63ms | 512.01ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 176.56ms | 1.57s | 2.36s (partial) | 201.56ms | 282.00ms | 283.19ms |
| 1000x12 - 4 sources - dynamic (large) | 280.93ms | 1.89s | 4.10s (partial) | 343.86ms | 3.50s | 3.95s |
| 1000x5 - 25 sources (wide dense) | 400.05ms | 3.68s | 4.88s (partial) | 506.14ms | 2.60s | 3.42s |
| 5x500 - 3 sources (deep) | 195.94ms | 1.16s | 2.00s (partial) | 205.25ms | 232.00ms | 228.86ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 260.18ms | 1.77s | 2.78s (partial) | 273.18ms | 444.60ms | 484.15ms |

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
