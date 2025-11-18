# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.71s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 10.06s |
| 🥉 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.41s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.20s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.05s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.52s |

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
| avoidablePropagation | 212.00ms | 187.07ms | 146.79ms (fail) | 283.33ms | 208.66ms | 2.40s |
| broadPropagation | 459.40ms | 353.37ms | 7.31ms (fail) | 498.89ms | 448.78ms | 4.53s |
| deepPropagation | 171.77ms | 127.41ms | 136.43ms (fail) | 172.72ms | 174.41ms | 1.53s |
| diamond | 284.33ms | 229.80ms | 193.16ms (fail) | 357.17ms | 286.82ms | 2.43s |
| mux | 395.88ms | 359.16ms | 185.71ms (fail) | 426.41ms | 381.31ms | 1.90s |
| repeatedObservers | 46.52ms | 43.70ms | 54.51ms (fail) | 80.96ms | 40.23ms | 243.13ms |
| triangle | 102.00ms | 82.96ms | 76.96ms (fail) | 114.76ms | 100.66ms | 781.20ms |
| unstable | 78.15ms | 63.88ms | 345.40ms (fail) | 96.52ms | 70.61ms | 351.70ms |
| molBench | 497.57ms | 485.58ms | 1.05ms | 490.79ms | 480.03ms | 592.63ms |
| create_signals | 27.32ms | 25.81ms | 64.51ms | 101.97ms | 4.77ms | 58.30ms |
| comp_0to1 | 12.06ms | 9.51ms | 56.90ms | 37.20ms | 18.18ms | 21.73ms |
| comp_1to1 | 30.14ms | 4.35ms | 58.59ms | 40.79ms | 13.63ms | 52.14ms |
| comp_2to1 | 8.78ms | 2.35ms | 42.62ms | 38.18ms | 17.69ms | 25.97ms |
| comp_4to1 | 10.08ms | 10.53ms | 17.55ms | 14.09ms | 22.13ms | 22.71ms |
| comp_1000to1 | 5μs | 6μs | 52μs | 15μs | 4μs | 16μs |
| comp_1to2 | 26.69ms | 22.24ms | 48.57ms | 28.59ms | 24.20ms | 42.08ms |
| comp_1to4 | 15.22ms | 8.82ms | 48.42ms | 20.96ms | 22.30ms | 24.66ms |
| comp_1to8 | 6.97ms | 7.55ms | 46.48ms | 20.93ms | 11.36ms | 25.11ms |
| comp_1to1000 | 4.42ms | 3.90ms | 42.18ms | 14.79ms | 6.94ms | 16.29ms |
| update_1to1 | 9.29ms | 4.64ms | 6.12ms | 15.56ms | 8.72ms | 27.57ms |
| update_2to1 | 4.82ms | 2.35ms | 3.06ms | 7.86ms | 4.39ms | 13.64ms |
| update_4to1 | 2.42ms | 1.22ms | 1.55ms | 3.89ms | 2.18ms | 7.47ms |
| update_1000to1 | 23μs | 11μs | 16μs | 38μs | 22μs | 70μs |
| update_1to2 | 4.76ms | 2.34ms | 3.06ms | 8.06ms | 4.46ms | 13.76ms |
| update_1to4 | 2.51ms | 1.20ms | 1.59ms | 3.91ms | 2.22ms | 6.96ms |
| update_1to1000 | 63μs | 46μs | 404μs | 149μs | 40μs | 167μs |
| cellx1000 | 10.58ms | 8.15ms | 8.64ms | 15.93ms | 10.05ms | 113.68ms |
| cellx2500 | 52.60ms | 24.92ms | 35.46ms | 49.81ms | 32.00ms | 334.94ms |
| cellx5000 | 127.91ms | 67.22ms | 107.45ms | 146.41ms | 102.39ms | 705.37ms |
| 10x5 - 2 sources - read 20.0% (simple) | 514.87ms | 230.69ms | 240.38ms | 353.66ms | 427.02ms | 1.96s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 281.17ms | 172.46ms | 201.90ms | 246.01ms | 265.64ms | 1.46s |
| 1000x12 - 4 sources - dynamic (large) | 3.79s | 283.34ms | 354.32ms | 470.34ms | 3.67s | 1.87s |
| 1000x5 - 25 sources (wide dense) | 3.31s | 415.17ms | 526.04ms | 599.28ms | 2.52s | 3.58s |
| 5x500 - 3 sources (deep) | 233.88ms | 197.85ms | 202.84ms | 256.88ms | 230.04ms | 1.18s |
| 100x15 - 6 sources - dynamic (very dynamic) | 476.89ms | 273.13ms | 258.51ms | 388.95ms | 455.48ms | 1.72s |

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
