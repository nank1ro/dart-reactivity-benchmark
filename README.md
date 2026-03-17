# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.71s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.19s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.33s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.37s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.84s |
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
| avoidablePropagation | 206.01ms | 2.27s | 143.65ms (fail) | 197.40ms | 207.39ms | 272.89ms |
| broadPropagation | 456.06ms | 4.25s | 6.04ms (fail) | 365.30ms | 454.01ms | 499.80ms |
| deepPropagation | 178.37ms | 1.51s | 154.09ms (fail) | 127.41ms | 175.15ms | 164.30ms |
| diamond | 293.08ms | 2.33s | 184.29ms (fail) | 244.51ms | 286.32ms | 344.57ms |
| mux | 405.00ms | 1.76s | 180.19ms (fail) | 361.29ms | 382.51ms | 422.40ms |
| repeatedObservers | 45.31ms | 221.73ms | 55.48ms (fail) | 46.44ms | 41.85ms | 80.42ms |
| triangle | 101.79ms | 744.26ms | 77.49ms (fail) | 88.80ms | 99.37ms | 116.96ms |
| unstable | 74.92ms | 337.75ms | 338.34ms (fail) | 62.03ms | 71.93ms | 94.11ms |
| molBench | 493.45ms | 588.14ms | 958μs | 483.88ms | 494.03ms | 488.26ms |
| create_signals | 28.27ms | 71.11ms | 68.39ms | 28.29ms | 5.84ms | 79.55ms |
| comp_0to1 | 11.60ms | 27.94ms | 65.24ms | 8.21ms | 18.94ms | 27.41ms |
| comp_1to1 | 17.92ms | 50.41ms | 62.90ms | 4.40ms | 11.36ms | 49.33ms |
| comp_2to1 | 12.71ms | 24.03ms | 44.94ms | 2.56ms | 12.45ms | 40.97ms |
| comp_4to1 | 8.82ms | 22.02ms | 18.58ms | 8.47ms | 11.72ms | 15.16ms |
| comp_1000to1 | 5μs | 16μs | 47μs | 5μs | 4μs | 19μs |
| comp_1to2 | 21.06ms | 39.07ms | 53.80ms | 15.57ms | 26.21ms | 34.12ms |
| comp_1to4 | 13.38ms | 22.50ms | 49.22ms | 9.93ms | 22.58ms | 27.95ms |
| comp_1to8 | 7.89ms | 23.70ms | 49.52ms | 5.60ms | 11.44ms | 30.30ms |
| comp_1to1000 | 4.24ms | 15.23ms | 43.93ms | 4.08ms | 7.21ms | 14.89ms |
| update_1to1 | 8.90ms | 21.51ms | 7.24ms | 4.68ms | 9.06ms | 16.07ms |
| update_2to1 | 4.45ms | 10.42ms | 2.87ms | 2.35ms | 4.54ms | 8.03ms |
| update_4to1 | 2.43ms | 5.35ms | 1.84ms | 1.15ms | 2.29ms | 4.01ms |
| update_1000to1 | 22μs | 64μs | 14μs | 11μs | 27μs | 40μs |
| update_1to2 | 4.47ms | 10.39ms | 3.59ms | 2.38ms | 4.54ms | 8.35ms |
| update_1to4 | 2.37ms | 5.22ms | 1.46ms | 1.67ms | 2.41ms | 4.09ms |
| update_1to1000 | 45μs | 155μs | 425μs | 47μs | 811μs | 149μs |
| cellx1000 | 9.56ms | 71.93ms | 5.35ms | 7.36ms | 9.91ms | 20.39ms |
| cellx2500 | 31.62ms | 264.07ms | 29.74ms | 19.68ms | 25.96ms | 47.98ms |
| cellx5000 | 64.70ms | 595.94ms | 84.97ms | 41.61ms | 69.97ms | 113.94ms |
| 10x5 - 2 sources - read 20.0% (simple) | 493.27ms | 1.95s | 249.40ms | 240.18ms | 450.98ms | 350.07ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 287.68ms | 1.47s | 203.05ms | 183.63ms | 269.75ms | 254.48ms |
| 1000x12 - 4 sources - dynamic (large) | 3.72s | 1.91s | 343.99ms | 280.85ms | 3.73s | 457.78ms |
| 1000x5 - 25 sources (wide dense) | 3.48s | 3.32s | 514.97ms | 408.83ms | 2.77s | 601.36ms |
| 5x500 - 3 sources (deep) | 227.06ms | 1.13s | 214.63ms | 192.20ms | 233.97ms | 253.19ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 473.24ms | 1.76s | 258.35ms | 260.43ms | 450.51ms | 386.97ms |

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
