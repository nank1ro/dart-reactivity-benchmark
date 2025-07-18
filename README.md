# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.30s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.47s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.32s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.66s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.43s |

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
| avoidablePropagation | 164.32ms (fail) | 2.41s | 272.93ms | 198.04ms | 229.57ms | 186.10ms |
| broadPropagation | 5.81ms (fail) | 4.36s | 505.60ms | 451.06ms | 444.80ms | 344.96ms |
| deepPropagation | 139.53ms (fail) | 1.55s | 167.91ms | 177.23ms | 169.28ms | 120.26ms |
| diamond | 181.06ms (fail) | 2.50s | 349.77ms | 280.45ms | 277.78ms | 226.50ms |
| mux | 192.63ms (fail) | 1.84s | 442.65ms | 405.84ms | 408.62ms | 368.23ms |
| repeatedObservers | 52.89ms (fail) | 242.68ms | 81.43ms | 39.61ms | 44.42ms | 45.39ms |
| triangle | 82.90ms (fail) | 774.57ms | 116.93ms | 99.33ms | 100.17ms | 84.80ms |
| unstable | 336.08ms (fail) | 356.11ms | 98.74ms | 69.99ms | 79.30ms | 67.01ms |
| molBench | 906μs | 588.20ms | 493.51ms | 488.88ms | 485.90ms | 484.54ms |
| create_signals | 66.43ms | 83.43ms | 75.04ms | 5.19ms | 25.93ms | 28.39ms |
| comp_0to1 | 55.77ms | 22.70ms | 28.18ms | 17.41ms | 11.71ms | 6.73ms |
| comp_1to1 | 61.53ms | 32.15ms | 38.24ms | 11.25ms | 27.86ms | 4.20ms |
| comp_2to1 | 44.36ms | 26.43ms | 37.83ms | 17.79ms | 10.47ms | 2.33ms |
| comp_4to1 | 16.63ms | 16.66ms | 11.07ms | 13.96ms | 8.70ms | 7.72ms |
| comp_1000to1 | 41μs | 21μs | 17μs | 4μs | 5μs | 3μs |
| comp_1to2 | 45.06ms | 41.47ms | 30.62ms | 19.03ms | 17.98ms | 10.50ms |
| comp_1to4 | 43.20ms | 24.42ms | 23.63ms | 26.38ms | 9.40ms | 11.38ms |
| comp_1to8 | 42.61ms | 24.11ms | 25.72ms | 7.15ms | 6.32ms | 4.92ms |
| comp_1to1000 | 38.51ms | 16.72ms | 16.99ms | 5.87ms | 4.54ms | 3.51ms |
| update_1to1 | 5.66ms | 25.23ms | 16.07ms | 8.72ms | 8.96ms | 10.29ms |
| update_2to1 | 3.10ms | 12.65ms | 7.82ms | 4.35ms | 4.47ms | 2.35ms |
| update_4to1 | 1.41ms | 6.14ms | 4.01ms | 2.16ms | 2.24ms | 2.49ms |
| update_1000to1 | 15μs | 66μs | 40μs | 21μs | 22μs | 26μs |
| update_1to2 | 2.86ms | 12.83ms | 7.98ms | 4.65ms | 4.45ms | 5.04ms |
| update_1to4 | 1.41ms | 6.04ms | 4.02ms | 2.17ms | 2.22ms | 2.59ms |
| update_1to1000 | 387μs | 176μs | 171μs | 1.01ms | 41μs | 48μs |
| cellx1000 | 5.42ms | 75.71ms | 14.79ms | 9.76ms | 9.67ms | 8.08ms |
| cellx2500 | 29.12ms | 246.79ms | 31.86ms | 25.89ms | 33.64ms | 20.34ms |
| cellx5000 | 66.13ms | 554.80ms | 72.17ms | 68.02ms | 64.62ms | 46.21ms |
| 10x5 - 2 sources - read 20.0% (simple) | 238.04ms | 2.02s | 399.76ms | 450.18ms | 515.19ms | 229.35ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 202.79ms | 1.51s | 242.78ms | 272.97ms | 279.46ms | 174.69ms |
| 1000x12 - 4 sources - dynamic (large) | 343.85ms | 1.90s | 460.29ms | 3.75s | 3.89s | 284.38ms |
| 1000x5 - 25 sources (wide dense) | 495.44ms | 3.50s | 586.19ms | 2.70s | 3.58s | 412.48ms |
| 5x500 - 3 sources (deep) | 205.58ms | 1.17s | 251.16ms | 232.75ms | 225.73ms | 191.98ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 259.45ms | 1.71s | 381.07ms | 453.92ms | 494.36ms | 270.74ms |

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
