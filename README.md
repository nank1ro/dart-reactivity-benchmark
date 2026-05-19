# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.67s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 9.88s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.35s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.37s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.77s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.41s |

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
| Test Case | preact_signals | solidart(2.0-dev) | mobx | alien_signals | state_beacon | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 195.12ms | 272.14ms | 2.36s | 187.65ms | 144.63ms (fail) | 201.75ms |
| broadPropagation | 441.76ms | 515.62ms | 4.44s | 352.45ms | 6.41ms (fail) | 451.34ms |
| deepPropagation | 176.38ms | 172.79ms | 1.49s | 128.87ms | 137.89ms (fail) | 171.13ms |
| diamond | 279.28ms | 361.61ms | 2.37s | 230.32ms | 181.55ms (fail) | 287.35ms |
| mux | 383.75ms | 431.43ms | 1.77s | 355.71ms | 188.64ms (fail) | 399.99ms |
| repeatedObservers | 40.79ms | 80.06ms | 236.09ms | 43.18ms | 52.76ms (fail) | 45.55ms |
| triangle | 98.64ms | 116.91ms | 746.28ms | 82.91ms | 85.14ms (fail) | 100.92ms |
| unstable | 72.80ms | 95.50ms | 347.37ms | 58.13ms | 336.52ms (fail) | 73.11ms |
| molBench | 483.93ms | 490.25ms | 591.50ms | 487.06ms | 913μs | 496.35ms |
| create_signals | 5.32ms | 103.72ms | 69.81ms | 28.83ms | 62.44ms | 25.42ms |
| comp_0to1 | 17.89ms | 36.41ms | 30.80ms | 9.35ms | 54.57ms | 10.96ms |
| comp_1to1 | 13.32ms | 42.27ms | 31.61ms | 4.21ms | 55.38ms | 48.61ms |
| comp_2to1 | 18.70ms | 42.77ms | 36.76ms | 2.37ms | 37.75ms | 12.76ms |
| comp_4to1 | 15.33ms | 13.24ms | 17.03ms | 11.37ms | 16.05ms | 5.53ms |
| comp_1000to1 | 5μs | 15μs | 15μs | 3μs | 43μs | 5μs |
| comp_1to2 | 20.32ms | 33.32ms | 36.67ms | 21.11ms | 45.11ms | 33.63ms |
| comp_1to4 | 30.45ms | 21.09ms | 17.78ms | 8.13ms | 45.89ms | 19.70ms |
| comp_1to8 | 7.16ms | 23.12ms | 20.16ms | 4.16ms | 43.43ms | 6.35ms |
| comp_1to1000 | 6.57ms | 13.91ms | 15.15ms | 3.45ms | 38.69ms | 4.05ms |
| update_1to1 | 9.45ms | 16.02ms | 23.21ms | 10.22ms | 5.78ms | 9.91ms |
| update_2to1 | 4.55ms | 7.84ms | 11.15ms | 2.31ms | 2.95ms | 4.97ms |
| update_4to1 | 2.49ms | 4.03ms | 7.13ms | 2.52ms | 1.48ms | 2.48ms |
| update_1000to1 | 22μs | 39μs | 68μs | 18μs | 15μs | 24μs |
| update_1to2 | 4.68ms | 8.58ms | 13.04ms | 4.96ms | 2.90ms | 4.87ms |
| update_1to4 | 2.31ms | 4.12ms | 5.30ms | 1.55ms | 1.52ms | 2.50ms |
| update_1to1000 | 58μs | 145μs | 168μs | 52μs | 374μs | 41μs |
| cellx1000 | 9.72ms | 15.64ms | 74.07ms | 8.67ms | 5.83ms | 9.67ms |
| cellx2500 | 25.71ms | 30.99ms | 261.76ms | 19.60ms | 24.16ms | 32.23ms |
| cellx5000 | 64.90ms | 67.33ms | 579.05ms | 42.72ms | 59.50ms | 64.71ms |
| 10x5 - 2 sources - read 20.0% (simple) | 437.12ms | 358.46ms | 1.90s | 233.39ms | 251.91ms | 498.00ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 271.52ms | 253.34ms | 1.44s | 177.11ms | 202.97ms | 282.21ms |
| 1000x12 - 4 sources - dynamic (large) | 3.51s | 469.18ms | 1.80s | 282.28ms | 334.22ms | 3.89s |
| 1000x5 - 25 sources (wide dense) | 2.54s | 610.74ms | 3.28s | 409.32ms | 509.72ms | 3.47s |
| 5x500 - 3 sources (deep) | 230.13ms | 250.57ms | 1.09s | 193.11ms | 204.38ms | 222.37ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 452.67ms | 384.15ms | 1.65s | 263.65ms | 265.77ms | 482.59ms |

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
