# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.73s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.47s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.36s |
| 4 | signals | 0.24 | 100.0% | 35/35 | 11.25s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.66s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.45s |

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
| avoidablePropagation | 217.06ms | 199.90ms | 163.19ms (fail) | 259.69ms | 201.40ms | 2.35s |
| broadPropagation | 467.37ms | 351.18ms | 6.41ms (fail) | 497.52ms | 460.08ms | 4.29s |
| deepPropagation | 175.94ms | 123.10ms | 140.65ms (fail) | 162.12ms | 178.43ms | 1.56s |
| diamond | 281.96ms | 232.86ms | 185.98ms (fail) | 354.02ms | 278.76ms | 2.46s |
| mux | 412.40ms | 373.59ms | 192.02ms (fail) | 423.52ms | 388.95ms | 1.83s |
| repeatedObservers | 46.45ms | 43.81ms | 53.40ms (fail) | 80.33ms | 41.09ms | 237.17ms |
| triangle | 103.12ms | 83.74ms | 77.72ms (fail) | 112.47ms | 100.62ms | 785.61ms |
| unstable | 76.44ms | 60.67ms | 338.32ms (fail) | 95.32ms | 75.07ms | 350.90ms |
| molBench | 485.25ms | 489.67ms | 956μs | 501.31ms | 475.69ms | 585.14ms |
| create_signals | 25.87ms | 28.11ms | 62.75ms | 93.39ms | 7.03ms | 66.64ms |
| comp_0to1 | 12.40ms | 6.75ms | 56.26ms | 37.56ms | 18.22ms | 15.74ms |
| comp_1to1 | 28.57ms | 4.14ms | 57.54ms | 48.06ms | 12.80ms | 52.60ms |
| comp_2to1 | 18.57ms | 2.23ms | 38.59ms | 41.28ms | 19.66ms | 34.69ms |
| comp_4to1 | 6.89ms | 7.84ms | 17.23ms | 20.71ms | 3.54ms | 24.22ms |
| comp_1000to1 | 8μs | 4μs | 43μs | 17μs | 5μs | 15μs |
| comp_1to2 | 18.77ms | 14.45ms | 48.02ms | 31.37ms | 20.25ms | 36.00ms |
| comp_1to4 | 10.65ms | 12.88ms | 46.07ms | 21.58ms | 24.76ms | 20.90ms |
| comp_1to8 | 9.50ms | 4.67ms | 45.35ms | 22.72ms | 7.84ms | 24.07ms |
| comp_1to1000 | 7.36ms | 3.12ms | 41.15ms | 17.43ms | 4.90ms | 15.35ms |
| update_1to1 | 10.26ms | 9.98ms | 6.01ms | 16.42ms | 8.30ms | 28.63ms |
| update_2to1 | 6.59ms | 2.13ms | 3.08ms | 8.10ms | 4.34ms | 12.62ms |
| update_4to1 | 2.60ms | 2.47ms | 1.53ms | 4.09ms | 2.10ms | 6.62ms |
| update_1000to1 | 25μs | 20μs | 15μs | 40μs | 20μs | 54μs |
| update_1to2 | 4.61ms | 5.05ms | 3.01ms | 8.54ms | 4.06ms | 12.38ms |
| update_1to4 | 2.54ms | 2.37ms | 1.53ms | 4.12ms | 2.08ms | 7.05ms |
| update_1to1000 | 43μs | 48μs | 456μs | 149μs | 47μs | 167μs |
| cellx1000 | 10.30ms | 7.61ms | 5.52ms | 12.76ms | 10.11ms | 80.93ms |
| cellx2500 | 35.63ms | 20.59ms | 29.09ms | 39.29ms | 30.30ms | 292.25ms |
| cellx5000 | 87.31ms | 49.86ms | 65.80ms | 118.63ms | 84.65ms | 598.47ms |
| 10x5 - 2 sources - read 20.0% (simple) | 508.52ms | 238.67ms | 242.44ms | 351.53ms | 514.45ms | 2.03s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 282.06ms | 181.42ms | 197.85ms | 251.67ms | 292.04ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 3.76s | 286.74ms | 348.26ms | 468.15ms | 3.73s | 1.92s |
| 1000x5 - 25 sources (wide dense) | 3.44s | 424.17ms | 509.83ms | 610.98ms | 2.75s | 3.52s |
| 5x500 - 3 sources (deep) | 222.37ms | 193.50ms | 204.23ms | 254.75ms | 245.77ms | 1.15s |
| 100x15 - 6 sources - dynamic (very dynamic) | 476.14ms | 264.69ms | 261.08ms | 385.62ms | 477.96ms | 1.74s |

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
