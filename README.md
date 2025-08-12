# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.64s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.17s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.24s |
| 4 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.31s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 27.81s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.42s |

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
| Test Case | mobx | state_beacon | preact_signals | alien_signals | solidart(2.0-dev) | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.36s | 167.86ms (fail) | 196.07ms | 182.67ms | 275.03ms | 206.49ms |
| broadPropagation | 4.42s | 6.28ms (fail) | 459.24ms | 342.02ms | 503.52ms | 454.00ms |
| deepPropagation | 1.54s | 150.41ms (fail) | 177.86ms | 122.93ms | 170.06ms | 167.72ms |
| diamond | 2.46s | 190.37ms (fail) | 282.62ms | 228.47ms | 352.77ms | 279.80ms |
| mux | 1.82s | 193.10ms (fail) | 404.44ms | 370.73ms | 441.58ms | 447.28ms |
| repeatedObservers | 236.50ms | 52.40ms (fail) | 39.97ms | 45.34ms | 81.31ms | 44.94ms |
| triangle | 781.99ms | 77.54ms (fail) | 98.91ms | 84.33ms | 118.43ms | 101.55ms |
| unstable | 351.63ms | 341.02ms (fail) | 70.42ms | 66.94ms | 96.58ms | 79.62ms |
| molBench | 587.04ms | 854μs | 487.55ms | 487.64ms | 493.89ms | 486.24ms |
| create_signals | 87.40ms | 59.23ms | 5.21ms | 25.45ms | 89.54ms | 25.27ms |
| comp_0to1 | 16.13ms | 52.53ms | 17.28ms | 7.05ms | 51.27ms | 11.57ms |
| comp_1to1 | 48.28ms | 54.60ms | 14.05ms | 4.20ms | 51.93ms | 34.66ms |
| comp_2to1 | 23.74ms | 35.58ms | 20.66ms | 2.29ms | 38.42ms | 8.61ms |
| comp_4to1 | 31.10ms | 16.08ms | 14.84ms | 8.61ms | 14.12ms | 1.87ms |
| comp_1000to1 | 28μs | 41μs | 5μs | 3μs | 27μs | 5μs |
| comp_1to2 | 34.08ms | 44.43ms | 17.48ms | 15.44ms | 29.50ms | 14.72ms |
| comp_1to4 | 22.56ms | 44.06ms | 33.95ms | 4.95ms | 27.35ms | 8.27ms |
| comp_1to8 | 23.76ms | 42.27ms | 6.99ms | 4.32ms | 25.53ms | 10.37ms |
| comp_1to1000 | 16.18ms | 38.47ms | 4.63ms | 3.42ms | 17.33ms | 6.34ms |
| update_1to1 | 25.02ms | 5.69ms | 8.66ms | 9.39ms | 16.36ms | 9.04ms |
| update_2to1 | 11.51ms | 3.14ms | 4.35ms | 2.97ms | 8.04ms | 4.46ms |
| update_4to1 | 6.41ms | 1.47ms | 2.13ms | 2.70ms | 4.17ms | 2.24ms |
| update_1000to1 | 67μs | 15μs | 24μs | 24μs | 41μs | 22μs |
| update_1to2 | 11.91ms | 2.88ms | 4.64ms | 5.23ms | 8.07ms | 4.47ms |
| update_1to4 | 5.88ms | 1.48ms | 2.17ms | 2.47ms | 4.06ms | 2.22ms |
| update_1to1000 | 185μs | 374μs | 127μs | 47μs | 186μs | 57μs |
| cellx1000 | 71.74ms | 5.16ms | 9.67ms | 7.18ms | 11.87ms | 9.53ms |
| cellx2500 | 250.33ms | 27.82ms | 25.89ms | 19.18ms | 33.43ms | 31.14ms |
| cellx5000 | 558.20ms | 60.47ms | 66.47ms | 43.86ms | 66.88ms | 59.84ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.03s | 253.79ms | 435.56ms | 236.43ms | 361.46ms | 512.89ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.53s | 198.78ms | 273.92ms | 174.81ms | 243.61ms | 281.56ms |
| 1000x12 - 4 sources - dynamic (large) | 2.02s | 333.40ms | 3.69s | 275.83ms | 455.54ms | 3.75s |
| 1000x5 - 25 sources (wide dense) | 3.57s | 499.01ms | 2.68s | 406.02ms | 587.57ms | 3.41s |
| 5x500 - 3 sources (deep) | 1.14s | 202.94ms | 229.03ms | 188.06ms | 252.50ms | 223.99ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.70s | 257.51ms | 447.88ms | 262.56ms | 377.32ms | 484.95ms |

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
