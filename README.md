# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.36s |
| 🥉 | preact_signals | 0.25 | 100.0% | 35/35 | 10.36s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.41s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.50s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.63s |

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
| avoidablePropagation | 217.45ms | 195.33ms | 168.03ms (fail) | 261.00ms | 201.99ms | 2.40s |
| broadPropagation | 464.50ms | 354.66ms | 6.58ms (fail) | 496.52ms | 462.03ms | 4.26s |
| deepPropagation | 181.69ms | 125.65ms | 143.81ms (fail) | 166.66ms | 177.87ms | 1.54s |
| diamond | 293.46ms | 238.81ms | 207.36ms (fail) | 361.77ms | 283.67ms | 2.48s |
| mux | 425.51ms | 374.88ms | 195.76ms (fail) | 427.20ms | 392.28ms | 1.82s |
| repeatedObservers | 46.46ms | 44.38ms | 52.61ms (fail) | 82.19ms | 40.48ms | 234.78ms |
| triangle | 106.12ms | 86.56ms | 86.74ms (fail) | 113.71ms | 99.20ms | 796.50ms |
| unstable | 76.89ms | 60.62ms | 342.87ms (fail) | 96.96ms | 74.20ms | 345.83ms |
| molBench | 485.89ms | 489.32ms | 940μs | 500.81ms | 488.63ms | 584.80ms |
| create_signals | 28.39ms | 27.89ms | 67.99ms | 101.43ms | 5.05ms | 80.82ms |
| comp_0to1 | 13.12ms | 8.06ms | 60.59ms | 36.01ms | 22.38ms | 20.09ms |
| comp_1to1 | 20.52ms | 4.33ms | 62.58ms | 54.31ms | 13.16ms | 26.49ms |
| comp_2to1 | 17.90ms | 2.33ms | 40.18ms | 46.75ms | 11.65ms | 20.85ms |
| comp_4to1 | 2.21ms | 7.53ms | 17.75ms | 4.50ms | 9.18ms | 14.72ms |
| comp_1000to1 | 6μs | 3μs | 45μs | 19μs | 7μs | 22μs |
| comp_1to2 | 19.90ms | 12.08ms | 50.03ms | 32.86ms | 23.08ms | 38.14ms |
| comp_1to4 | 9.86ms | 16.38ms | 48.92ms | 20.87ms | 26.95ms | 27.14ms |
| comp_1to8 | 10.04ms | 4.67ms | 45.35ms | 22.80ms | 6.53ms | 21.23ms |
| comp_1to1000 | 8.21ms | 3.28ms | 41.45ms | 14.58ms | 6.80ms | 15.15ms |
| update_1to1 | 10.39ms | 10.02ms | 6.00ms | 16.38ms | 8.36ms | 28.49ms |
| update_2to1 | 4.59ms | 2.22ms | 3.09ms | 8.06ms | 4.44ms | 10.74ms |
| update_4to1 | 2.58ms | 2.44ms | 1.51ms | 4.09ms | 2.09ms | 7.12ms |
| update_1000to1 | 23μs | 10μs | 15μs | 39μs | 20μs | 69μs |
| update_1to2 | 4.50ms | 5.02ms | 3.00ms | 8.37ms | 4.07ms | 14.18ms |
| update_1to4 | 2.54ms | 2.41ms | 1.51ms | 4.11ms | 2.09ms | 7.04ms |
| update_1to1000 | 59μs | 47μs | 426μs | 153μs | 841μs | 173μs |
| cellx1000 | 9.93ms | 7.32ms | 6.21ms | 12.49ms | 9.88ms | 75.40ms |
| cellx2500 | 35.68ms | 20.99ms | 29.09ms | 42.79ms | 30.49ms | 267.21ms |
| cellx5000 | 78.50ms | 50.13ms | 88.86ms | 107.36ms | 85.68ms | 557.03ms |
| 10x5 - 2 sources - read 20.0% (simple) | 512.83ms | 242.77ms | 279.58ms | 350.71ms | 452.28ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 287.22ms | 174.50ms | 213.56ms | 250.32ms | 288.70ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 3.75s | 283.53ms | 364.81ms | 466.61ms | 3.71s | 1.91s |
| 1000x5 - 25 sources (wide dense) | 3.58s | 404.67ms | 512.94ms | 607.59ms | 2.71s | 3.50s |
| 5x500 - 3 sources (deep) | 222.00ms | 190.72ms | 211.84ms | 254.63ms | 238.73ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 484.06ms | 265.99ms | 267.39ms | 383.34ms | 460.63ms | 1.71s |

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
