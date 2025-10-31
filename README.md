# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.24s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 10.36s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.23s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.71s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.50s |

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
| avoidablePropagation | 211.82ms | 196.97ms | 158.08ms (fail) | 259.21ms | 201.32ms | 2.38s |
| broadPropagation | 468.99ms | 352.91ms | 6.39ms (fail) | 495.55ms | 470.55ms | 4.37s |
| deepPropagation | 177.96ms | 130.91ms | 138.75ms (fail) | 165.71ms | 178.45ms | 1.54s |
| diamond | 281.64ms | 238.34ms | 187.48ms (fail) | 345.83ms | 278.59ms | 2.47s |
| mux | 408.49ms | 381.05ms | 191.96ms (fail) | 433.58ms | 395.12ms | 1.80s |
| repeatedObservers | 46.10ms | 43.64ms | 52.54ms (fail) | 80.91ms | 40.18ms | 238.77ms |
| triangle | 101.51ms | 84.75ms | 79.73ms (fail) | 115.32ms | 100.50ms | 778.74ms |
| unstable | 75.91ms | 60.00ms | 345.44ms (fail) | 95.36ms | 76.31ms | 357.62ms |
| molBench | 486.29ms | 490.22ms | 912μs | 494.37ms | 489.31ms | 585.64ms |
| create_signals | 26.16ms | 23.92ms | 70.62ms | 78.30ms | 5.66ms | 84.08ms |
| comp_0to1 | 11.96ms | 8.48ms | 63.86ms | 26.35ms | 17.91ms | 17.19ms |
| comp_1to1 | 18.47ms | 4.32ms | 64.03ms | 47.05ms | 14.62ms | 46.99ms |
| comp_2to1 | 11.16ms | 2.27ms | 48.15ms | 24.32ms | 16.58ms | 23.72ms |
| comp_4to1 | 9.62ms | 7.69ms | 16.86ms | 17.74ms | 12.53ms | 33.38ms |
| comp_1000to1 | 11μs | 4μs | 44μs | 16μs | 6μs | 28μs |
| comp_1to2 | 20.28ms | 10.61ms | 49.37ms | 32.00ms | 15.17ms | 36.63ms |
| comp_1to4 | 10.82ms | 12.55ms | 49.58ms | 21.43ms | 22.11ms | 22.45ms |
| comp_1to8 | 6.75ms | 4.82ms | 46.15ms | 22.33ms | 10.86ms | 24.39ms |
| comp_1to1000 | 4.44ms | 3.61ms | 41.57ms | 14.30ms | 6.04ms | 15.42ms |
| update_1to1 | 10.36ms | 9.95ms | 6.00ms | 17.51ms | 8.30ms | 22.30ms |
| update_2to1 | 4.56ms | 2.17ms | 3.10ms | 8.06ms | 4.37ms | 11.25ms |
| update_4to1 | 2.58ms | 2.44ms | 1.54ms | 4.09ms | 2.13ms | 6.12ms |
| update_1000to1 | 25μs | 26μs | 15μs | 40μs | 32μs | 67μs |
| update_1to2 | 4.50ms | 5.04ms | 3.04ms | 8.41ms | 4.09ms | 11.00ms |
| update_1to4 | 2.57ms | 2.15ms | 1.53ms | 4.08ms | 2.10ms | 5.56ms |
| update_1to1000 | 43μs | 47μs | 408μs | 149μs | 41μs | 169μs |
| cellx1000 | 9.62ms | 8.79ms | 5.20ms | 12.04ms | 9.64ms | 71.82ms |
| cellx2500 | 31.73ms | 21.24ms | 25.45ms | 33.33ms | 26.18ms | 272.32ms |
| cellx5000 | 64.72ms | 45.12ms | 89.09ms | 71.20ms | 79.69ms | 647.97ms |
| 10x5 - 2 sources - read 20.0% (simple) | 515.14ms | 239.26ms | 235.10ms | 346.13ms | 444.10ms | 2.03s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 281.46ms | 179.62ms | 195.87ms | 247.54ms | 276.71ms | 1.57s |
| 1000x12 - 4 sources - dynamic (large) | 3.77s | 286.48ms | 345.66ms | 459.18ms | 3.74s | 1.81s |
| 1000x5 - 25 sources (wide dense) | 3.46s | 405.61ms | 512.51ms | 619.92ms | 2.72s | 3.49s |
| 5x500 - 3 sources (deep) | 222.97ms | 205.12ms | 207.65ms | 252.61ms | 234.91ms | 1.15s |
| 100x15 - 6 sources - dynamic (very dynamic) | 470.85ms | 261.64ms | 259.26ms | 387.51ms | 458.01ms | 1.78s |

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
