# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.68s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 9.75s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.31s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.26s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 40.23s |
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
| Test Case | solidart | mobx | state_beacon | signals | alien_signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.28s | 2.31s | 150.98ms (fail) | 207.13ms | 185.17ms | 211.34ms |
| broadPropagation | 5.63s | 4.37s | 6.01ms (fail) | 456.94ms | 344.50ms | 450.54ms |
| deepPropagation | 2.03s | 1.54s | 139.88ms (fail) | 176.44ms | 121.03ms | 174.85ms |
| diamond | 3.55s | 2.42s | 188.04ms (fail) | 290.54ms | 249.80ms | 273.02ms |
| mux | 2.11s | 1.84s | 192.12ms (fail) | 411.57ms | 379.55ms | 383.72ms |
| repeatedObservers | 215.27ms | 232.92ms | 53.57ms (fail) | 45.09ms | 43.60ms | 41.17ms |
| triangle | 1.14s | 777.06ms | 79.09ms (fail) | 106.07ms | 89.45ms | 98.12ms |
| unstable | 356.03ms | 347.00ms | 340.81ms (fail) | 77.45ms | 59.57ms | 69.73ms |
| molBench | 1.75s | 587.28ms | 927μs | 486.42ms | 477.55ms | 483.29ms |
| create_signals | 60.97ms | 64.53ms | 68.80ms | 33.52ms | 20.11ms | 4.65ms |
| comp_0to1 | 39.41ms | 21.36ms | 49.77ms | 14.70ms | 5.06ms | 16.99ms |
| comp_1to1 | 43.88ms | 47.07ms | 53.17ms | 19.08ms | 10.77ms | 16.05ms |
| comp_2to1 | 29.39ms | 28.39ms | 35.98ms | 10.07ms | 4.24ms | 19.11ms |
| comp_4to1 | 13.19ms | 14.17ms | 17.66ms | 4.98ms | 8.49ms | 13.21ms |
| comp_1000to1 | 2.19ms | 15μs | 47μs | 5μs | 4μs | 4μs |
| comp_1to2 | 34.16ms | 34.54ms | 46.32ms | 21.75ms | 14.09ms | 24.51ms |
| comp_1to4 | 27.89ms | 18.33ms | 43.85ms | 9.80ms | 9.03ms | 24.38ms |
| comp_1to8 | 24.07ms | 20.50ms | 44.46ms | 7.03ms | 4.01ms | 5.29ms |
| comp_1to1000 | 19.11ms | 15.53ms | 40.55ms | 4.70ms | 3.81ms | 6.64ms |
| update_1to1 | 43.57ms | 26.05ms | 9.62ms | 9.35ms | 4.39ms | 8.74ms |
| update_2to1 | 21.50ms | 10.54ms | 2.89ms | 4.66ms | 2.67ms | 4.35ms |
| update_4to1 | 10.84ms | 7.10ms | 2.53ms | 2.39ms | 1.13ms | 2.28ms |
| update_1000to1 | 117μs | 64μs | 14μs | 23μs | 11μs | 22μs |
| update_1to2 | 21.83ms | 11.08ms | 3.48ms | 4.74ms | 2.65ms | 4.35ms |
| update_1to4 | 11.03ms | 5.55ms | 1.49ms | 2.35ms | 1.13ms | 2.20ms |
| update_1to1000 | 222μs | 163μs | 403μs | 46μs | 39μs | 944μs |
| cellx1000 | 171.76ms | 80.37ms | 5.36ms | 10.08ms | 7.43ms | 9.68ms |
| cellx2500 | 524.88ms | 264.40ms | 19.33ms | 36.24ms | 20.28ms | 26.00ms |
| cellx5000 | 1.13s | 576.17ms | 57.99ms | 85.56ms | 43.32ms | 70.49ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.65s (partial) | 1.98s | 240.90ms | 523.19ms | 231.82ms | 420.47ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.48s (partial) | 1.53s | 206.20ms | 277.72ms | 175.42ms | 277.28ms |
| 1000x12 - 4 sources - dynamic (large) | 4.15s (partial) | 1.77s | 340.56ms | 3.69s | 280.16ms | 3.40s |
| 1000x5 - 25 sources (wide dense) | 4.87s (partial) | 3.50s | 519.94ms | 3.55s | 407.28ms | 2.52s |
| 5x500 - 3 sources (deep) | 2.00s (partial) | 1.12s | 237.66ms | 229.47ms | 204.21ms | 228.89ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.78s (partial) | 1.69s | 265.92ms | 493.08ms | 270.08ms | 454.92ms |

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
