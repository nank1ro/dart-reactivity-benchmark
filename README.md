# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.20s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 10.93s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.40s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.19s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.51s |

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
| avoidablePropagation | 200.92ms | 2.28s | 146.42ms (fail) | 200.61ms | 207.14ms | 290.02ms |
| broadPropagation | 463.38ms | 4.15s | 8.73ms (fail) | 361.06ms | 452.87ms | 505.09ms |
| deepPropagation | 175.38ms | 1.50s | 157.50ms (fail) | 128.30ms | 177.57ms | 166.89ms |
| diamond | 294.01ms | 2.34s | 201.14ms (fail) | 246.59ms | 285.41ms | 340.30ms |
| mux | 399.64ms | 1.75s | 185.42ms (fail) | 367.92ms | 373.00ms | 409.71ms |
| repeatedObservers | 45.58ms | 225.73ms | 55.27ms (fail) | 45.53ms | 41.70ms | 80.82ms |
| triangle | 100.98ms | 738.26ms | 86.22ms (fail) | 88.22ms | 100.05ms | 119.49ms |
| unstable | 78.13ms | 342.46ms | 334.43ms (fail) | 61.37ms | 71.47ms | 95.86ms |
| molBench | 495.00ms | 587.36ms | 1.26ms | 481.62ms | 495.29ms | 490.85ms |
| create_signals | 26.03ms | 70.80ms | 68.65ms | 22.34ms | 4.71ms | 74.53ms |
| comp_0to1 | 11.20ms | 26.60ms | 62.16ms | 8.10ms | 18.33ms | 25.36ms |
| comp_1to1 | 26.89ms | 36.82ms | 55.02ms | 4.19ms | 14.33ms | 45.42ms |
| comp_2to1 | 16.87ms | 32.07ms | 36.42ms | 2.38ms | 17.16ms | 24.35ms |
| comp_4to1 | 1.87ms | 23.25ms | 16.53ms | 7.42ms | 8.75ms | 17.24ms |
| comp_1000to1 | 4μs | 15μs | 45μs | 3μs | 4μs | 14μs |
| comp_1to2 | 16.92ms | 34.58ms | 46.75ms | 10.41ms | 24.92ms | 34.64ms |
| comp_1to4 | 13.88ms | 28.51ms | 45.51ms | 9.21ms | 21.76ms | 19.11ms |
| comp_1to8 | 7.52ms | 21.75ms | 44.69ms | 4.95ms | 9.64ms | 21.53ms |
| comp_1to1000 | 5.80ms | 15.20ms | 40.65ms | 3.27ms | 10.43ms | 14.15ms |
| update_1to1 | 9.05ms | 22.14ms | 9.34ms | 4.64ms | 9.11ms | 15.59ms |
| update_2to1 | 4.46ms | 10.76ms | 2.88ms | 2.35ms | 4.52ms | 7.81ms |
| update_4to1 | 2.21ms | 5.45ms | 2.59ms | 1.16ms | 2.29ms | 3.91ms |
| update_1000to1 | 22μs | 55μs | 15μs | 11μs | 31μs | 39μs |
| update_1to2 | 4.45ms | 11.36ms | 4.32ms | 2.30ms | 4.46ms | 8.00ms |
| update_1to4 | 2.24ms | 5.42ms | 1.54ms | 1.17ms | 2.36ms | 3.92ms |
| update_1to1000 | 41μs | 155μs | 406μs | 29μs | 2.31ms | 144μs |
| cellx1000 | 9.91ms | 72.97ms | 5.27ms | 7.32ms | 9.87ms | 11.32ms |
| cellx2500 | 33.24ms | 219.83ms | 25.28ms | 19.60ms | 26.28ms | 31.09ms |
| cellx5000 | 62.71ms | 543.73ms | 67.92ms | 43.33ms | 69.62ms | 67.04ms |
| 10x5 - 2 sources - read 20.0% (simple) | 499.34ms | 1.93s | 261.21ms | 238.40ms | 451.31ms | 344.92ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.31ms | 1.45s | 204.36ms | 183.29ms | 271.92ms | 248.26ms |
| 1000x12 - 4 sources - dynamic (large) | 3.47s | 1.68s | 334.96ms | 285.25ms | 3.74s | 454.65ms |
| 1000x5 - 25 sources (wide dense) | 3.47s | 3.32s | 522.13ms | 414.83ms | 2.79s | 597.34ms |
| 5x500 - 3 sources (deep) | 224.86ms | 1.08s | 208.09ms | 192.69ms | 231.91ms | 251.38ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 474.32ms | 1.64s | 262.70ms | 264.44ms | 450.34ms | 380.16ms |

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
