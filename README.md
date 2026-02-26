# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.74s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.49s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 10.74s |
| 4 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.29s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.88s |
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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 199.53ms | 2.37s | 143.48ms (fail) | 201.38ms | 208.81ms | 274.70ms |
| broadPropagation | 468.81ms | 4.19s | 6.63ms (fail) | 356.82ms | 468.18ms | 501.52ms |
| deepPropagation | 172.19ms | 1.51s | 136.09ms (fail) | 123.91ms | 180.25ms | 164.59ms |
| diamond | 286.70ms | 2.41s | 183.38ms (fail) | 244.47ms | 288.33ms | 346.19ms |
| mux | 393.50ms | 1.77s | 188.79ms (fail) | 365.30ms | 367.47ms | 412.25ms |
| repeatedObservers | 45.85ms | 227.90ms | 55.33ms (fail) | 47.27ms | 41.82ms | 80.76ms |
| triangle | 103.10ms | 773.20ms | 76.97ms (fail) | 94.22ms | 100.85ms | 114.12ms |
| unstable | 75.84ms | 339.61ms | 335.33ms (fail) | 63.42ms | 71.67ms | 96.78ms |
| molBench | 493.71ms | 589.09ms | 1.15ms | 487.22ms | 495.47ms | 487.59ms |
| create_signals | 26.98ms | 68.95ms | 66.38ms | 28.61ms | 5.57ms | 76.21ms |
| comp_0to1 | 12.40ms | 26.95ms | 54.69ms | 8.22ms | 19.47ms | 25.58ms |
| comp_1to1 | 28.68ms | 56.50ms | 57.06ms | 4.37ms | 13.07ms | 38.69ms |
| comp_2to1 | 9.77ms | 24.51ms | 38.83ms | 2.34ms | 18.32ms | 37.26ms |
| comp_4to1 | 2.13ms | 28.97ms | 17.61ms | 8.69ms | 3.53ms | 16.50ms |
| comp_1000to1 | 5μs | 15μs | 46μs | 4μs | 4μs | 18μs |
| comp_1to2 | 25.22ms | 33.60ms | 49.49ms | 26.34ms | 10.88ms | 27.57ms |
| comp_1to4 | 12.29ms | 17.73ms | 45.42ms | 11.17ms | 19.12ms | 24.91ms |
| comp_1to8 | 6.15ms | 20.08ms | 44.13ms | 4.02ms | 8.34ms | 25.04ms |
| comp_1to1000 | 4.17ms | 14.95ms | 39.58ms | 3.55ms | 3.42ms | 14.45ms |
| update_1to1 | 8.94ms | 21.55ms | 9.54ms | 4.64ms | 8.94ms | 15.77ms |
| update_2to1 | 4.45ms | 11.36ms | 2.81ms | 2.35ms | 4.52ms | 7.84ms |
| update_4to1 | 2.25ms | 5.96ms | 2.61ms | 1.24ms | 2.27ms | 3.93ms |
| update_1000to1 | 22μs | 56μs | 14μs | 11μs | 23μs | 39μs |
| update_1to2 | 4.41ms | 10.56ms | 3.44ms | 2.35ms | 4.43ms | 8.03ms |
| update_1to4 | 2.26ms | 5.85ms | 1.42ms | 1.23ms | 2.38ms | 3.95ms |
| update_1to1000 | 41μs | 156μs | 380μs | 48μs | 52μs | 144μs |
| cellx1000 | 10.11ms | 76.58ms | 5.65ms | 7.73ms | 10.77ms | 12.82ms |
| cellx2500 | 36.37ms | 267.15ms | 27.60ms | 21.30ms | 32.23ms | 43.64ms |
| cellx5000 | 79.23ms | 567.39ms | 85.05ms | 53.87ms | 84.89ms | 107.74ms |
| 10x5 - 2 sources - read 20.0% (simple) | 499.40ms | 1.97s | 248.13ms | 238.94ms | 469.54ms | 349.01ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.33ms | 1.45s | 202.65ms | 185.08ms | 270.50ms | 253.56ms |
| 1000x12 - 4 sources - dynamic (large) | 3.51s | 1.91s | 354.70ms | 280.69ms | 3.78s | 465.16ms |
| 1000x5 - 25 sources (wide dense) | 3.23s | 3.36s | 514.29ms | 403.21ms | 2.79s | 605.60ms |
| 5x500 - 3 sources (deep) | 225.67ms | 1.11s | 206.30ms | 192.30ms | 235.11ms | 256.86ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 484.37ms | 1.63s | 258.88ms | 261.32ms | 458.70ms | 389.23ms |

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
