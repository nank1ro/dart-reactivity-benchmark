# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.68s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.34s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.16s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.07s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.15s |
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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 224.59ms | 190.61ms | 148.55ms (fail) | 286.33ms | 207.78ms | 2.36s |
| broadPropagation | 454.92ms | 351.43ms | 6.36ms (fail) | 504.44ms | 453.86ms | 4.44s |
| deepPropagation | 167.49ms | 126.52ms | 142.07ms (fail) | 170.06ms | 176.72ms | 1.52s |
| diamond | 287.56ms | 233.23ms | 193.38ms (fail) | 364.84ms | 286.26ms | 2.39s |
| mux | 392.64ms | 359.97ms | 182.66ms (fail) | 415.38ms | 373.16ms | 1.84s |
| repeatedObservers | 46.08ms | 43.49ms | 52.74ms (fail) | 81.75ms | 40.79ms | 226.19ms |
| triangle | 101.15ms | 82.60ms | 77.87ms (fail) | 115.87ms | 107.85ms | 753.86ms |
| unstable | 77.34ms | 61.52ms | 340.80ms (fail) | 96.11ms | 69.79ms | 337.62ms |
| molBench | 495.35ms | 484.73ms | 1.10ms | 490.49ms | 482.28ms | 588.21ms |
| create_signals | 26.27ms | 27.60ms | 57.15ms | 79.38ms | 11.52ms | 69.58ms |
| comp_0to1 | 12.06ms | 7.89ms | 52.29ms | 26.08ms | 29.50ms | 28.21ms |
| comp_1to1 | 26.16ms | 4.26ms | 53.62ms | 27.28ms | 6.99ms | 41.94ms |
| comp_2to1 | 23.59ms | 2.48ms | 36.07ms | 30.69ms | 26.51ms | 23.27ms |
| comp_4to1 | 3.82ms | 8.71ms | 16.40ms | 12.11ms | 9.91ms | 28.44ms |
| comp_1000to1 | 4μs | 4μs | 40μs | 15μs | 10μs | 27μs |
| comp_1to2 | 22.55ms | 10.84ms | 44.57ms | 32.14ms | 31.50ms | 37.14ms |
| comp_1to4 | 10.04ms | 13.33ms | 44.01ms | 20.18ms | 33.10ms | 18.06ms |
| comp_1to8 | 8.60ms | 4.51ms | 43.17ms | 24.05ms | 6.07ms | 21.04ms |
| comp_1to1000 | 5.37ms | 3.29ms | 38.37ms | 14.74ms | 5.69ms | 15.87ms |
| update_1to1 | 9.43ms | 4.65ms | 6.10ms | 15.63ms | 8.79ms | 21.78ms |
| update_2to1 | 4.74ms | 2.37ms | 3.07ms | 7.79ms | 4.36ms | 10.62ms |
| update_4to1 | 2.44ms | 1.40ms | 1.55ms | 3.88ms | 2.28ms | 5.64ms |
| update_1000to1 | 23μs | 11μs | 16μs | 39μs | 22μs | 52μs |
| update_1to2 | 4.63ms | 2.28ms | 3.07ms | 8.10ms | 4.83ms | 10.59ms |
| update_1to4 | 2.53ms | 1.18ms | 1.59ms | 3.93ms | 2.27ms | 5.22ms |
| update_1to1000 | 44μs | 32μs | 391μs | 145μs | 946μs | 157μs |
| cellx1000 | 10.19ms | 14.64ms | 5.20ms | 13.13ms | 11.46ms | 79.23ms |
| cellx2500 | 41.75ms | 20.64ms | 25.44ms | 44.23ms | 31.73ms | 266.60ms |
| cellx5000 | 104.02ms | 55.01ms | 84.09ms | 118.31ms | 102.43ms | 617.02ms |
| 10x5 - 2 sources - read 20.0% (simple) | 510.31ms | 236.22ms | 238.16ms | 361.54ms | 429.10ms | 1.95s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 281.59ms | 173.81ms | 203.18ms | 247.66ms | 278.54ms | 1.45s |
| 1000x12 - 4 sources - dynamic (large) | 3.55s | 276.63ms | 354.39ms | 472.58ms | 3.67s | 1.83s |
| 1000x5 - 25 sources (wide dense) | 3.54s | 407.42ms | 512.13ms | 591.84ms | 2.49s | 3.35s |
| 5x500 - 3 sources (deep) | 222.95ms | 190.83ms | 204.00ms | 264.87ms | 226.37ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 485.35ms | 272.44ms | 260.19ms | 392.69ms | 444.89ms | 1.69s |

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
