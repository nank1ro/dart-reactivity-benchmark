# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.72s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 10.31s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.38s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.67s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.31s |
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
| Test Case | state_beacon | mobx | solidart(2.0-dev) | preact_signals | signals | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 179.87ms (fail) | 2.39s | 276.63ms | 199.36ms | 211.21ms | 186.67ms |
| broadPropagation | 6.54ms (fail) | 4.50s | 510.02ms | 448.65ms | 458.17ms | 353.47ms |
| deepPropagation | 143.21ms (fail) | 1.58s | 167.52ms | 177.37ms | 171.93ms | 120.39ms |
| diamond | 188.22ms (fail) | 2.53s | 359.23ms | 279.00ms | 278.08ms | 233.07ms |
| mux | 194.37ms (fail) | 1.86s | 441.58ms | 403.95ms | 448.53ms | 369.37ms |
| repeatedObservers | 52.85ms (fail) | 242.41ms | 81.19ms | 39.95ms | 44.36ms | 45.47ms |
| triangle | 88.77ms (fail) | 787.98ms | 117.54ms | 98.66ms | 100.61ms | 83.66ms |
| unstable | 340.00ms (fail) | 362.10ms | 97.34ms | 70.08ms | 79.32ms | 67.13ms |
| molBench | 913μs | 577.58ms | 493.27ms | 490.89ms | 486.28ms | 482.98ms |
| create_signals | 65.50ms | 69.50ms | 93.19ms | 5.29ms | 25.91ms | 28.14ms |
| comp_0to1 | 55.14ms | 16.57ms | 53.69ms | 18.22ms | 12.19ms | 8.35ms |
| comp_1to1 | 57.47ms | 41.30ms | 43.16ms | 10.65ms | 28.12ms | 4.26ms |
| comp_2to1 | 37.53ms | 36.04ms | 38.69ms | 18.51ms | 11.87ms | 2.31ms |
| comp_4to1 | 16.72ms | 18.16ms | 8.88ms | 8.43ms | 1.99ms | 8.12ms |
| comp_1000to1 | 42μs | 22μs | 17μs | 6μs | 6μs | 4μs |
| comp_1to2 | 46.36ms | 38.96ms | 34.53ms | 12.69ms | 22.96ms | 10.91ms |
| comp_1to4 | 44.87ms | 20.77ms | 17.37ms | 28.38ms | 17.88ms | 12.18ms |
| comp_1to8 | 43.66ms | 24.70ms | 23.22ms | 7.00ms | 19.28ms | 5.06ms |
| comp_1to1000 | 38.96ms | 16.31ms | 17.41ms | 4.89ms | 4.86ms | 3.60ms |
| update_1to1 | 5.65ms | 23.83ms | 16.07ms | 8.71ms | 9.00ms | 10.31ms |
| update_2to1 | 3.86ms | 12.69ms | 7.82ms | 4.29ms | 4.46ms | 2.33ms |
| update_4to1 | 1.45ms | 6.73ms | 4.05ms | 2.17ms | 2.28ms | 2.51ms |
| update_1000to1 | 15μs | 60μs | 39μs | 21μs | 22μs | 25μs |
| update_1to2 | 2.85ms | 11.88ms | 8.04ms | 4.59ms | 4.46ms | 5.09ms |
| update_1to4 | 1.45ms | 6.24ms | 4.02ms | 2.17ms | 2.22ms | 2.47ms |
| update_1to1000 | 383μs | 170μs | 173μs | 165μs | 43μs | 48μs |
| cellx1000 | 5.77ms | 87.54ms | 12.81ms | 10.04ms | 10.95ms | 8.79ms |
| cellx2500 | 32.72ms | 296.34ms | 41.76ms | 34.80ms | 38.21ms | 23.07ms |
| cellx5000 | 85.89ms | 621.66ms | 130.72ms | 102.51ms | 78.81ms | 58.80ms |
| 10x5 - 2 sources - read 20.0% (simple) | 251.62ms | 2.04s | 351.43ms | 438.42ms | 512.55ms | 229.45ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 198.99ms | 1.57s | 243.39ms | 273.40ms | 281.53ms | 179.73ms |
| 1000x12 - 4 sources - dynamic (large) | 349.30ms | 2.09s | 463.87ms | 3.73s | 4.01s | 297.03ms |
| 1000x5 - 25 sources (wide dense) | 496.88ms | 3.55s | 591.84ms | 2.70s | 3.58s | 420.58ms |
| 5x500 - 3 sources (deep) | 206.14ms | 1.15s | 247.23ms | 229.77ms | 224.70ms | 188.85ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 256.23ms | 1.73s | 383.68ms | 452.10ms | 484.53ms | 263.80ms |

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
