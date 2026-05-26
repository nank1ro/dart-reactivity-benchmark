# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.70s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 9.91s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.41s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.30s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.99s |
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
| Test Case | preact_signals | solidart(2.0-dev) | mobx | alien_signals | state_beacon | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 197.38ms | 275.82ms | 2.41s | 185.70ms | 145.17ms (fail) | 201.21ms |
| broadPropagation | 447.70ms | 508.83ms | 4.45s | 343.67ms | 6.09ms (fail) | 449.67ms |
| deepPropagation | 175.73ms | 173.87ms | 1.52s | 135.63ms | 136.65ms (fail) | 168.96ms |
| diamond | 282.75ms | 362.32ms | 2.43s | 231.59ms | 180.49ms (fail) | 284.42ms |
| mux | 379.46ms | 422.74ms | 1.76s | 365.20ms | 183.06ms (fail) | 398.54ms |
| repeatedObservers | 40.93ms | 79.90ms | 239.18ms | 43.35ms | 52.87ms (fail) | 45.65ms |
| triangle | 98.57ms | 115.92ms | 749.04ms | 85.30ms | 79.18ms (fail) | 100.62ms |
| unstable | 74.15ms | 95.12ms | 342.21ms | 63.78ms | 337.00ms (fail) | 73.59ms |
| molBench | 484.07ms | 492.34ms | 592.00ms | 487.52ms | 1.17ms | 495.90ms |
| create_signals | 4.75ms | 82.65ms | 88.80ms | 29.41ms | 68.96ms | 26.85ms |
| comp_0to1 | 18.28ms | 56.68ms | 23.60ms | 8.20ms | 62.73ms | 11.88ms |
| comp_1to1 | 18.95ms | 48.61ms | 47.92ms | 4.81ms | 57.57ms | 27.28ms |
| comp_2to1 | 18.65ms | 42.44ms | 40.87ms | 2.48ms | 44.83ms | 12.94ms |
| comp_4to1 | 11.44ms | 9.30ms | 28.14ms | 13.52ms | 17.43ms | 5.27ms |
| comp_1000to1 | 4μs | 14μs | 32μs | 4μs | 41μs | 5μs |
| comp_1to2 | 38.88ms | 33.63ms | 34.67ms | 12.54ms | 49.38ms | 19.21ms |
| comp_1to4 | 27.53ms | 14.86ms | 22.63ms | 17.18ms | 50.67ms | 7.24ms |
| comp_1to8 | 8.37ms | 20.27ms | 23.51ms | 4.80ms | 44.74ms | 6.84ms |
| comp_1to1000 | 3.60ms | 14.04ms | 15.75ms | 3.34ms | 39.94ms | 4.03ms |
| update_1to1 | 9.73ms | 16.03ms | 25.12ms | 10.11ms | 5.78ms | 9.79ms |
| update_2to1 | 4.69ms | 7.78ms | 11.60ms | 2.30ms | 3.16ms | 4.99ms |
| update_4to1 | 2.41ms | 3.98ms | 6.50ms | 2.52ms | 1.44ms | 2.46ms |
| update_1000to1 | 23μs | 38μs | 55μs | 10μs | 15μs | 24μs |
| update_1to2 | 4.82ms | 8.26ms | 13.22ms | 4.98ms | 2.89ms | 4.86ms |
| update_1to4 | 2.39ms | 4.01ms | 6.31ms | 1.12ms | 1.49ms | 2.49ms |
| update_1to1000 | 61μs | 144μs | 170μs | 48μs | 390μs | 42μs |
| cellx1000 | 15.02ms | 13.33ms | 69.22ms | 7.50ms | 5.49ms | 12.90ms |
| cellx2500 | 28.24ms | 51.74ms | 258.89ms | 20.60ms | 27.65ms | 37.78ms |
| cellx5000 | 71.03ms | 128.30ms | 556.79ms | 49.56ms | 80.86ms | 81.27ms |
| 10x5 - 2 sources - read 20.0% (simple) | 443.38ms | 353.89ms | 1.91s | 244.55ms | 246.67ms | 498.20ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 271.50ms | 250.31ms | 1.43s | 173.65ms | 204.61ms | 290.92ms |
| 1000x12 - 4 sources - dynamic (large) | 3.52s | 469.95ms | 1.83s | 279.81ms | 352.58ms | 3.87s |
| 1000x5 - 25 sources (wide dense) | 2.53s | 613.19ms | 3.31s | 411.65ms | 511.05ms | 3.44s |
| 5x500 - 3 sources (deep) | 226.08ms | 249.35ms | 1.08s | 190.31ms | 206.65ms | 225.66ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 448.82ms | 387.81ms | 1.65s | 264.27ms | 258.47ms | 479.65ms |

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
