# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.27s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.34s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.53s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.26s |
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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 212.29ms | 195.43ms | 148.24ms (fail) | 261.99ms | 201.14ms | 2.38s |
| broadPropagation | 459.83ms | 355.23ms | 6.46ms (fail) | 486.25ms | 457.50ms | 4.47s |
| deepPropagation | 180.06ms | 123.21ms | 140.85ms (fail) | 164.13ms | 178.55ms | 1.54s |
| diamond | 281.63ms | 234.33ms | 187.07ms (fail) | 351.18ms | 282.09ms | 2.43s |
| mux | 407.28ms | 376.78ms | 198.31ms (fail) | 427.57ms | 392.63ms | 1.90s |
| repeatedObservers | 46.23ms | 43.46ms | 52.71ms (fail) | 81.27ms | 41.25ms | 233.20ms |
| triangle | 100.12ms | 85.02ms | 78.30ms (fail) | 114.94ms | 101.34ms | 799.57ms |
| unstable | 75.75ms | 59.68ms | 339.56ms (fail) | 94.57ms | 74.40ms | 348.52ms |
| molBench | 485.47ms | 490.85ms | 931μs | 495.76ms | 486.57ms | 583.36ms |
| create_signals | 25.72ms | 20.83ms | 66.98ms | 78.23ms | 5.42ms | 73.84ms |
| comp_0to1 | 11.88ms | 9.34ms | 59.94ms | 26.26ms | 17.72ms | 25.51ms |
| comp_1to1 | 27.26ms | 4.29ms | 68.18ms | 42.79ms | 12.76ms | 32.62ms |
| comp_2to1 | 9.06ms | 2.32ms | 38.81ms | 24.32ms | 17.70ms | 19.14ms |
| comp_4to1 | 1.99ms | 8.03ms | 17.39ms | 14.66ms | 12.69ms | 27.91ms |
| comp_1000to1 | 4μs | 6μs | 44μs | 15μs | 4μs | 15μs |
| comp_1to2 | 22.32ms | 12.81ms | 48.98ms | 33.37ms | 29.11ms | 40.53ms |
| comp_1to4 | 9.67ms | 12.93ms | 47.97ms | 14.47ms | 22.51ms | 26.59ms |
| comp_1to8 | 8.91ms | 4.16ms | 47.23ms | 21.63ms | 12.33ms | 24.53ms |
| comp_1to1000 | 6.97ms | 3.17ms | 42.30ms | 14.28ms | 9.63ms | 15.38ms |
| update_1to1 | 10.27ms | 10.03ms | 6.00ms | 16.32ms | 8.32ms | 28.58ms |
| update_2to1 | 4.56ms | 2.20ms | 3.10ms | 9.17ms | 4.42ms | 10.70ms |
| update_4to1 | 2.52ms | 2.47ms | 1.55ms | 4.11ms | 2.07ms | 7.60ms |
| update_1000to1 | 25μs | 10μs | 15μs | 40μs | 20μs | 68μs |
| update_1to2 | 4.63ms | 5.04ms | 3.04ms | 8.41ms | 4.07ms | 13.36ms |
| update_1to4 | 2.52ms | 2.41ms | 1.55ms | 4.10ms | 2.06ms | 6.32ms |
| update_1to1000 | 43μs | 49μs | 416μs | 148μs | 1.61ms | 175μs |
| cellx1000 | 9.79ms | 8.40ms | 5.58ms | 16.47ms | 10.12ms | 77.88ms |
| cellx2500 | 34.44ms | 20.10ms | 31.78ms | 46.94ms | 28.62ms | 279.48ms |
| cellx5000 | 72.41ms | 48.67ms | 77.62ms | 92.72ms | 81.62ms | 648.70ms |
| 10x5 - 2 sources - read 20.0% (simple) | 510.26ms | 240.31ms | 243.88ms | 353.67ms | 524.44ms | 2.11s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.22ms | 179.75ms | 196.84ms | 247.83ms | 292.34ms | 1.60s |
| 1000x12 - 4 sources - dynamic (large) | 3.75s | 279.46ms | 363.72ms | 469.56ms | 3.75s | 2.04s |
| 1000x5 - 25 sources (wide dense) | 3.58s | 411.88ms | 510.65ms | 607.65ms | 2.74s | 3.55s |
| 5x500 - 3 sources (deep) | 224.25ms | 196.41ms | 207.59ms | 254.85ms | 249.44ms | 1.16s |
| 100x15 - 6 sources - dynamic (very dynamic) | 474.43ms | 262.89ms | 262.56ms | 392.71ms | 473.91ms | 1.77s |

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
