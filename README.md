# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.29s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.19s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.37s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.21s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.48s |

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
| Test Case | preact_signals | state_beacon | solidart(2.0-dev) | signals | alien_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 200.28ms | 154.93ms (fail) | 259.60ms | 219.97ms | 193.52ms | 2.33s |
| broadPropagation | 455.73ms | 6.52ms (fail) | 493.77ms | 460.55ms | 345.63ms | 4.33s |
| deepPropagation | 176.45ms | 140.03ms (fail) | 159.41ms | 178.68ms | 120.73ms | 1.54s |
| diamond | 276.97ms | 188.25ms (fail) | 349.33ms | 286.42ms | 232.52ms | 2.43s |
| mux | 389.07ms | 190.37ms (fail) | 436.45ms | 415.78ms | 378.14ms | 1.79s |
| repeatedObservers | 40.40ms | 52.93ms (fail) | 80.72ms | 45.19ms | 43.85ms | 227.00ms |
| triangle | 99.77ms | 84.32ms (fail) | 113.50ms | 102.58ms | 85.42ms | 781.29ms |
| unstable | 74.73ms | 373.35ms (fail) | 93.83ms | 76.39ms | 60.82ms | 340.35ms |
| molBench | 486.76ms | 1.10ms | 496.60ms | 480.11ms | 487.23ms | 582.17ms |
| create_signals | 5.30ms | 60.79ms | 97.12ms | 25.50ms | 26.82ms | 50.66ms |
| comp_0to1 | 17.63ms | 55.00ms | 37.55ms | 11.50ms | 6.74ms | 18.86ms |
| comp_1to1 | 14.81ms | 58.23ms | 52.91ms | 28.02ms | 4.16ms | 24.50ms |
| comp_2to1 | 15.24ms | 36.65ms | 40.42ms | 14.24ms | 2.18ms | 15.61ms |
| comp_4to1 | 11.27ms | 16.56ms | 19.75ms | 3.43ms | 8.39ms | 14.10ms |
| comp_1000to1 | 4μs | 44μs | 16μs | 5μs | 5μs | 21μs |
| comp_1to2 | 24.21ms | 47.49ms | 32.36ms | 17.14ms | 13.92ms | 36.91ms |
| comp_1to4 | 21.77ms | 46.97ms | 14.96ms | 19.76ms | 5.31ms | 25.31ms |
| comp_1to8 | 9.77ms | 45.49ms | 19.46ms | 6.56ms | 6.46ms | 23.69ms |
| comp_1to1000 | 12.41ms | 43.04ms | 14.63ms | 4.39ms | 3.42ms | 15.29ms |
| update_1to1 | 8.35ms | 6.01ms | 17.55ms | 10.20ms | 4.28ms | 27.28ms |
| update_2to1 | 4.36ms | 3.10ms | 8.77ms | 4.54ms | 2.15ms | 14.15ms |
| update_4to1 | 2.09ms | 1.54ms | 4.41ms | 2.58ms | 1.11ms | 6.26ms |
| update_1000to1 | 20μs | 25μs | 41μs | 25μs | 10μs | 69μs |
| update_1to2 | 4.08ms | 3.02ms | 8.85ms | 4.51ms | 2.17ms | 13.96ms |
| update_1to4 | 2.09ms | 1.53ms | 4.37ms | 2.55ms | 1.09ms | 7.01ms |
| update_1to1000 | 1.64ms | 407μs | 154μs | 43μs | 45μs | 172μs |
| cellx1000 | 10.05ms | 5.05ms | 14.01ms | 9.56ms | 7.20ms | 69.63ms |
| cellx2500 | 28.34ms | 21.42ms | 33.27ms | 30.82ms | 19.02ms | 242.60ms |
| cellx5000 | 72.97ms | 64.64ms | 74.74ms | 62.03ms | 42.27ms | 547.41ms |
| 10x5 - 2 sources - read 20.0% (simple) | 510.36ms | 248.33ms | 350.30ms | 514.96ms | 238.97ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 290.17ms | 195.72ms | 249.18ms | 280.19ms | 181.26ms | 1.48s |
| 1000x12 - 4 sources - dynamic (large) | 3.68s | 344.24ms | 461.40ms | 3.75s | 281.60ms | 1.87s |
| 1000x5 - 25 sources (wide dense) | 2.72s | 511.69ms | 610.83ms | 3.42s | 404.53ms | 3.46s |
| 5x500 - 3 sources (deep) | 245.92ms | 214.79ms | 252.48ms | 222.70ms | 194.96ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 461.19ms | 258.71ms | 388.60ms | 472.07ms | 261.92ms | 1.75s |

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
