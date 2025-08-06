# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.67s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.67s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.30s |
| 4 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.36s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.08s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.45s |

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
| avoidablePropagation | 167.48ms (fail) | 2.43s | 276.37ms | 198.49ms | 207.44ms | 185.71ms |
| broadPropagation | 6.04ms (fail) | 4.45s | 506.06ms | 496.50ms | 452.85ms | 345.65ms |
| deepPropagation | 140.03ms (fail) | 1.57s | 168.69ms | 177.05ms | 175.15ms | 125.64ms |
| diamond | 184.17ms (fail) | 2.57s | 356.87ms | 297.28ms | 279.43ms | 229.99ms |
| mux | 191.39ms (fail) | 1.85s | 445.10ms | 401.64ms | 451.19ms | 365.98ms |
| repeatedObservers | 52.34ms (fail) | 240.71ms | 81.61ms | 41.23ms | 44.57ms | 45.51ms |
| triangle | 75.88ms (fail) | 787.21ms | 120.33ms | 102.86ms | 101.52ms | 84.89ms |
| unstable | 337.02ms (fail) | 362.73ms | 98.20ms | 74.73ms | 79.11ms | 67.22ms |
| molBench | 916μs | 573.87ms | 493.69ms | 489.20ms | 485.91ms | 487.20ms |
| create_signals | 69.07ms | 87.45ms | 79.48ms | 5.29ms | 26.14ms | 26.89ms |
| comp_0to1 | 56.92ms | 36.51ms | 28.21ms | 17.54ms | 11.52ms | 8.81ms |
| comp_1to1 | 63.03ms | 29.57ms | 37.68ms | 13.38ms | 20.24ms | 4.16ms |
| comp_2to1 | 41.88ms | 9.21ms | 40.32ms | 12.63ms | 8.46ms | 2.33ms |
| comp_4to1 | 18.30ms | 18.14ms | 14.50ms | 14.50ms | 2.83ms | 7.51ms |
| comp_1000to1 | 40μs | 21μs | 18μs | 5μs | 8μs | 4μs |
| comp_1to2 | 48.16ms | 41.04ms | 30.20ms | 17.82ms | 14.37ms | 10.56ms |
| comp_1to4 | 47.06ms | 24.61ms | 17.08ms | 33.16ms | 7.05ms | 12.02ms |
| comp_1to8 | 42.82ms | 22.84ms | 23.76ms | 7.11ms | 6.74ms | 4.89ms |
| comp_1to1000 | 38.69ms | 16.57ms | 17.28ms | 4.69ms | 4.18ms | 3.47ms |
| update_1to1 | 5.63ms | 26.19ms | 15.97ms | 8.63ms | 8.90ms | 10.28ms |
| update_2to1 | 3.05ms | 13.57ms | 7.78ms | 4.32ms | 4.50ms | 2.71ms |
| update_4to1 | 1.43ms | 7.07ms | 3.98ms | 2.15ms | 2.24ms | 2.51ms |
| update_1000to1 | 14μs | 71μs | 39μs | 21μs | 22μs | 26μs |
| update_1to2 | 2.88ms | 12.57ms | 8.03ms | 4.63ms | 4.49ms | 5.07ms |
| update_1to4 | 1.42ms | 6.94ms | 4.03ms | 2.17ms | 2.24ms | 2.46ms |
| update_1to1000 | 378μs | 177μs | 183μs | 158μs | 42μs | 47μs |
| cellx1000 | 5.36ms | 76.59ms | 14.80ms | 9.90ms | 10.62ms | 7.16ms |
| cellx2500 | 22.35ms | 275.41ms | 45.53ms | 27.89ms | 31.97ms | 19.44ms |
| cellx5000 | 83.98ms | 562.10ms | 146.29ms | 78.11ms | 69.26ms | 53.79ms |
| 10x5 - 2 sources - read 20.0% (simple) | 240.34ms | 2.08s | 352.26ms | 438.36ms | 511.24ms | 226.93ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 198.82ms | 1.55s | 242.96ms | 268.68ms | 279.91ms | 173.78ms |
| 1000x12 - 4 sources - dynamic (large) | 340.76ms | 1.91s | 465.75ms | 3.69s | 4.07s | 284.07ms |
| 1000x5 - 25 sources (wide dense) | 500.48ms | 3.57s | 589.83ms | 2.69s | 3.59s | 410.76ms |
| 5x500 - 3 sources (deep) | 208.12ms | 1.16s | 244.15ms | 228.68ms | 225.26ms | 188.86ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 257.71ms | 1.71s | 383.57ms | 449.37ms | 483.61ms | 264.02ms |

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
