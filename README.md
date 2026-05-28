# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.68s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.40s |
| 🥉 | signals | 0.29 | 100.0% | 35/35 | 11.36s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 9.85s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.19s |
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
| Test Case | solidart(2.0-dev) | signals | mobx | preact_signals | state_beacon | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 277.57ms | 201.60ms | 2.34s | 194.78ms | 145.04ms (fail) | 185.71ms |
| broadPropagation | 510.77ms | 519.02ms | 4.43s | 444.44ms | 6.16ms (fail) | 346.64ms |
| deepPropagation | 171.75ms | 180.05ms | 1.50s | 173.75ms | 136.90ms (fail) | 124.13ms |
| diamond | 382.37ms | 283.06ms | 2.43s | 280.34ms | 180.12ms (fail) | 231.01ms |
| mux | 424.56ms | 399.19ms | 1.79s | 383.81ms | 189.48ms (fail) | 360.59ms |
| repeatedObservers | 80.00ms | 45.62ms | 232.97ms | 40.77ms | 53.12ms (fail) | 43.32ms |
| triangle | 114.14ms | 100.19ms | 748.14ms | 100.75ms | 80.73ms (fail) | 85.51ms |
| unstable | 95.01ms | 72.09ms | 343.81ms | 73.53ms | 337.34ms (fail) | 59.10ms |
| molBench | 492.04ms | 495.82ms | 592.94ms | 484.98ms | 932μs | 488.37ms |
| create_signals | 92.53ms | 25.60ms | 72.18ms | 5.42ms | 62.52ms | 28.77ms |
| comp_0to1 | 36.92ms | 11.39ms | 33.72ms | 17.77ms | 56.26ms | 12.22ms |
| comp_1to1 | 27.57ms | 25.75ms | 31.45ms | 21.86ms | 56.41ms | 11.18ms |
| comp_2to1 | 43.00ms | 11.28ms | 44.58ms | 23.80ms | 38.30ms | 7.52ms |
| comp_4to1 | 14.24ms | 2.04ms | 28.57ms | 10.78ms | 16.79ms | 7.14ms |
| comp_1000to1 | 14μs | 5μs | 21μs | 4μs | 43μs | 4μs |
| comp_1to2 | 32.36ms | 21.11ms | 35.17ms | 32.24ms | 46.67ms | 14.49ms |
| comp_1to4 | 20.08ms | 7.18ms | 23.66ms | 35.30ms | 46.95ms | 8.71ms |
| comp_1to8 | 23.55ms | 6.24ms | 25.20ms | 8.56ms | 44.43ms | 3.87ms |
| comp_1to1000 | 14.35ms | 4.03ms | 15.46ms | 6.30ms | 40.38ms | 3.57ms |
| update_1to1 | 16.09ms | 9.75ms | 24.48ms | 9.51ms | 5.76ms | 10.13ms |
| update_2to1 | 7.78ms | 4.95ms | 11.88ms | 5.13ms | 3.21ms | 2.78ms |
| update_4to1 | 3.99ms | 2.51ms | 6.87ms | 2.40ms | 1.49ms | 2.48ms |
| update_1000to1 | 39μs | 24μs | 67μs | 22μs | 27μs | 25μs |
| update_1to2 | 8.20ms | 4.88ms | 12.79ms | 4.68ms | 3.03ms | 4.98ms |
| update_1to4 | 4.09ms | 2.49ms | 6.80ms | 2.31ms | 1.53ms | 1.67ms |
| update_1to1000 | 146μs | 42μs | 162μs | 627μs | 388μs | 33μs |
| cellx1000 | 13.05ms | 10.11ms | 80.49ms | 12.18ms | 5.89ms | 7.57ms |
| cellx2500 | 42.28ms | 37.94ms | 292.64ms | 34.18ms | 29.86ms | 22.38ms |
| cellx5000 | 111.02ms | 88.45ms | 627.55ms | 89.12ms | 79.49ms | 53.61ms |
| 10x5 - 2 sources - read 20.0% (simple) | 350.04ms | 496.12ms | 1.92s | 433.55ms | 243.92ms | 226.95ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 249.22ms | 283.29ms | 1.46s | 268.24ms | 203.70ms | 173.01ms |
| 1000x12 - 4 sources - dynamic (large) | 478.98ms | 3.87s | 1.84s | 3.45s | 355.25ms | 287.53ms |
| 1000x5 - 25 sources (wide dense) | 614.09ms | 3.44s | 3.38s | 2.53s | 515.98ms | 415.21ms |
| 5x500 - 3 sources (deep) | 251.59ms | 224.78ms | 1.13s | 234.25ms | 206.46ms | 190.20ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 392.00ms | 482.88ms | 1.67s | 440.21ms | 271.59ms | 262.78ms |

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
