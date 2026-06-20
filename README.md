# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.66s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.27s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.19s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 9.90s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.98s |
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
| Test Case | preact_signals | state_beacon | signals | alien_signals | mobx | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 195.51ms | 148.01ms (fail) | 201.82ms | 185.86ms | 2.35s | 273.79ms |
| broadPropagation | 452.37ms | 6.05ms (fail) | 476.81ms | 345.92ms | 4.41s | 504.17ms |
| deepPropagation | 174.12ms | 139.24ms (fail) | 179.93ms | 125.15ms | 1.53s | 171.76ms |
| diamond | 287.13ms | 183.61ms (fail) | 281.58ms | 231.53ms | 2.34s | 366.46ms |
| mux | 376.32ms | 189.35ms (fail) | 393.63ms | 362.00ms | 1.79s | 423.31ms |
| repeatedObservers | 40.83ms | 52.98ms (fail) | 46.11ms | 43.12ms | 228.99ms | 79.85ms |
| triangle | 99.16ms | 80.62ms (fail) | 100.23ms | 83.01ms | 746.91ms | 116.66ms |
| unstable | 73.69ms | 338.00ms (fail) | 74.26ms | 59.05ms | 342.38ms | 96.35ms |
| molBench | 485.79ms | 1.52ms | 495.59ms | 488.66ms | 592.55ms | 492.18ms |
| create_signals | 5.57ms | 63.56ms | 25.82ms | 26.38ms | 84.54ms | 92.76ms |
| comp_0to1 | 18.02ms | 57.51ms | 11.76ms | 9.45ms | 43.41ms | 37.66ms |
| comp_1to1 | 18.51ms | 58.02ms | 25.55ms | 4.28ms | 31.96ms | 27.29ms |
| comp_2to1 | 20.12ms | 39.90ms | 11.49ms | 2.33ms | 39.30ms | 38.38ms |
| comp_4to1 | 11.67ms | 16.96ms | 2.10ms | 13.34ms | 17.26ms | 4.39ms |
| comp_1000to1 | 6μs | 47μs | 4μs | 6μs | 16μs | 14μs |
| comp_1to2 | 21.25ms | 48.74ms | 19.92ms | 20.19ms | 35.27ms | 33.98ms |
| comp_1to4 | 32.04ms | 49.08ms | 7.19ms | 7.68ms | 22.62ms | 14.83ms |
| comp_1to8 | 6.98ms | 46.84ms | 6.95ms | 4.08ms | 24.14ms | 19.13ms |
| comp_1to1000 | 6.91ms | 41.84ms | 4.42ms | 3.74ms | 15.44ms | 13.78ms |
| update_1to1 | 9.27ms | 5.80ms | 9.76ms | 9.99ms | 24.71ms | 15.91ms |
| update_2to1 | 4.66ms | 3.49ms | 4.92ms | 2.37ms | 12.89ms | 7.78ms |
| update_4to1 | 2.41ms | 1.49ms | 2.47ms | 2.47ms | 7.13ms | 4.16ms |
| update_1000to1 | 22μs | 15μs | 24μs | 10μs | 63μs | 39μs |
| update_1to2 | 4.70ms | 2.94ms | 4.86ms | 4.96ms | 13.96ms | 8.12ms |
| update_1to4 | 2.32ms | 1.55ms | 2.51ms | 1.46ms | 5.61ms | 4.01ms |
| update_1to1000 | 639μs | 402μs | 42μs | 51μs | 163μs | 145μs |
| cellx1000 | 10.00ms | 5.18ms | 11.71ms | 7.78ms | 72.58ms | 12.85ms |
| cellx2500 | 27.61ms | 23.04ms | 32.24ms | 21.66ms | 256.46ms | 32.97ms |
| cellx5000 | 72.32ms | 54.00ms | 60.73ms | 47.63ms | 577.35ms | 76.02ms |
| 10x5 - 2 sources - read 20.0% (simple) | 435.24ms | 272.24ms | 498.56ms | 231.84ms | 1.94s | 350.43ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 270.74ms | 204.92ms | 283.56ms | 176.09ms | 1.51s | 250.91ms |
| 1000x12 - 4 sources - dynamic (large) | 3.51s | 349.58ms | 3.84s | 280.87ms | 1.84s | 463.33ms |
| 1000x5 - 25 sources (wide dense) | 2.55s | 512.49ms | 3.37s | 404.50ms | 3.32s | 612.48ms |
| 5x500 - 3 sources (deep) | 230.43ms | 202.99ms | 223.40ms | 187.75ms | 1.10s | 244.44ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 450.60ms | 264.71ms | 478.93ms | 265.07ms | 1.66s | 381.91ms |

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
