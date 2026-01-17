# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.65s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 10.84s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.29s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 9.99s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.10s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| avoidablePropagation | 214.33ms | 197.78ms | 146.52ms (fail) | 295.17ms | 201.08ms | 2.32s |
| broadPropagation | 465.72ms | 353.62ms | 6.08ms (fail) | 499.79ms | 453.50ms | 4.49s |
| deepPropagation | 175.28ms | 135.29ms | 144.61ms (fail) | 171.22ms | 176.62ms | 1.51s |
| diamond | 285.71ms | 231.77ms | 188.88ms (fail) | 355.80ms | 281.99ms | 2.38s |
| mux | 393.50ms | 351.93ms | 183.76ms (fail) | 426.46ms | 377.36ms | 1.86s |
| repeatedObservers | 46.17ms | 44.17ms | 54.80ms (fail) | 80.91ms | 40.31ms | 227.80ms |
| triangle | 104.67ms | 84.25ms | 79.46ms (fail) | 115.50ms | 100.18ms | 737.98ms |
| unstable | 79.20ms | 62.65ms | 336.80ms (fail) | 97.71ms | 69.53ms | 341.85ms |
| molBench | 495.46ms | 485.35ms | 1.17ms | 494.31ms | 483.32ms | 590.05ms |
| create_signals | 25.92ms | 22.76ms | 65.48ms | 98.53ms | 4.82ms | 51.51ms |
| comp_0to1 | 15.09ms | 8.88ms | 57.39ms | 36.38ms | 17.80ms | 15.01ms |
| comp_1to1 | 18.01ms | 4.20ms | 56.62ms | 45.68ms | 13.71ms | 42.20ms |
| comp_2to1 | 10.97ms | 2.34ms | 36.77ms | 37.29ms | 17.69ms | 35.12ms |
| comp_4to1 | 1.92ms | 8.05ms | 17.12ms | 11.89ms | 13.87ms | 13.49ms |
| comp_1000to1 | 5μs | 4μs | 44μs | 16μs | 5μs | 16μs |
| comp_1to2 | 17.77ms | 10.32ms | 46.46ms | 33.09ms | 21.20ms | 35.56ms |
| comp_1to4 | 12.23ms | 12.64ms | 46.86ms | 20.57ms | 20.76ms | 17.30ms |
| comp_1to8 | 6.20ms | 4.88ms | 44.64ms | 22.46ms | 7.95ms | 19.84ms |
| comp_1to1000 | 4.29ms | 3.54ms | 40.58ms | 14.44ms | 6.71ms | 14.54ms |
| update_1to1 | 9.63ms | 4.67ms | 6.11ms | 15.71ms | 8.75ms | 25.84ms |
| update_2to1 | 4.79ms | 2.37ms | 3.04ms | 7.84ms | 4.54ms | 12.88ms |
| update_4to1 | 2.31ms | 1.16ms | 1.56ms | 3.92ms | 2.22ms | 7.21ms |
| update_1000to1 | 24μs | 20μs | 16μs | 39μs | 22μs | 70μs |
| update_1to2 | 4.73ms | 3.05ms | 3.12ms | 8.01ms | 4.37ms | 13.86ms |
| update_1to4 | 2.93ms | 1.24ms | 1.58ms | 3.90ms | 2.25ms | 6.96ms |
| update_1to1000 | 43μs | 50μs | 406μs | 149μs | 599μs | 160μs |
| cellx1000 | 9.80ms | 7.28ms | 5.23ms | 11.98ms | 9.75ms | 75.96ms |
| cellx2500 | 31.93ms | 19.26ms | 27.54ms | 34.44ms | 26.29ms | 271.22ms |
| cellx5000 | 62.00ms | 43.38ms | 63.28ms | 76.40ms | 72.90ms | 620.85ms |
| 10x5 - 2 sources - read 20.0% (simple) | 506.00ms | 236.48ms | 249.72ms | 346.50ms | 432.86ms | 1.93s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.15ms | 175.10ms | 208.60ms | 244.12ms | 272.22ms | 1.47s |
| 1000x12 - 4 sources - dynamic (large) | 3.58s | 274.92ms | 340.96ms | 461.13ms | 3.70s | 1.77s |
| 1000x5 - 25 sources (wide dense) | 3.27s | 406.74ms | 526.87ms | 588.37ms | 2.47s | 3.42s |
| 5x500 - 3 sources (deep) | 223.44ms | 189.77ms | 204.53ms | 253.08ms | 227.57ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 474.91ms | 262.34ms | 261.90ms | 382.00ms | 450.69ms | 1.67s |

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
