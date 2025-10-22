# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.74s |
| 🥈 | solidart(2.0-dev) | 0.31 | 100.0% | 35/35 | 5.24s |
| 🥉 | preact_signals | 0.29 | 100.0% | 35/35 | 10.30s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 11.36s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.45s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.69s |

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
| avoidablePropagation | 213.93ms | 193.56ms | 164.67ms (fail) | 259.39ms | 200.90ms | 2.39s |
| broadPropagation | 461.07ms | 358.05ms | 6.43ms (fail) | 485.60ms | 469.12ms | 4.33s |
| deepPropagation | 172.94ms | 127.48ms | 141.55ms (fail) | 165.29ms | 179.12ms | 1.53s |
| diamond | 282.76ms | 237.53ms | 204.23ms (fail) | 345.88ms | 277.28ms | 2.44s |
| mux | 406.90ms | 380.86ms | 190.38ms (fail) | 437.56ms | 388.33ms | 1.84s |
| repeatedObservers | 46.00ms | 43.50ms | 52.57ms (fail) | 80.63ms | 40.10ms | 239.22ms |
| triangle | 101.32ms | 88.78ms | 82.86ms (fail) | 113.97ms | 99.16ms | 764.79ms |
| unstable | 75.56ms | 59.81ms | 375.88ms (fail) | 95.26ms | 74.72ms | 353.42ms |
| molBench | 485.62ms | 490.56ms | 1.09ms | 499.69ms | 488.91ms | 584.39ms |
| create_signals | 25.33ms | 27.18ms | 74.95ms | 100.06ms | 5.12ms | 69.05ms |
| comp_0to1 | 11.24ms | 7.71ms | 66.06ms | 33.76ms | 21.92ms | 28.43ms |
| comp_1to1 | 27.16ms | 4.23ms | 69.54ms | 46.05ms | 12.06ms | 40.10ms |
| comp_2to1 | 17.07ms | 2.24ms | 43.50ms | 36.86ms | 12.64ms | 29.09ms |
| comp_4to1 | 9.88ms | 7.60ms | 17.02ms | 4.32ms | 11.75ms | 32.07ms |
| comp_1000to1 | 5μs | 3μs | 50μs | 15μs | 4μs | 15μs |
| comp_1to2 | 21.91ms | 10.40ms | 52.51ms | 31.84ms | 30.30ms | 36.02ms |
| comp_1to4 | 12.25ms | 11.97ms | 51.87ms | 14.30ms | 32.77ms | 21.27ms |
| comp_1to8 | 6.95ms | 4.67ms | 51.12ms | 18.82ms | 7.82ms | 22.43ms |
| comp_1to1000 | 4.41ms | 3.45ms | 46.88ms | 14.56ms | 6.66ms | 14.78ms |
| update_1to1 | 10.23ms | 10.06ms | 7.55ms | 16.30ms | 8.46ms | 22.73ms |
| update_2to1 | 4.52ms | 2.24ms | 4.85ms | 8.89ms | 4.39ms | 11.68ms |
| update_4to1 | 2.52ms | 2.48ms | 1.93ms | 4.13ms | 2.11ms | 5.59ms |
| update_1000to1 | 25μs | 27μs | 16μs | 40μs | 20μs | 57μs |
| update_1to2 | 4.51ms | 5.02ms | 3.80ms | 8.38ms | 4.11ms | 11.04ms |
| update_1to4 | 2.55ms | 2.39ms | 1.91ms | 4.09ms | 2.10ms | 5.47ms |
| update_1to1000 | 43μs | 49μs | 409μs | 160μs | 146μs | 166μs |
| cellx1000 | 9.59ms | 7.62ms | 5.09ms | 13.67ms | 9.51ms | 74.79ms |
| cellx2500 | 31.73ms | 19.98ms | 24.25ms | 31.60ms | 25.86ms | 253.93ms |
| cellx5000 | 61.19ms | 44.15ms | 63.44ms | 69.95ms | 67.55ms | 583.75ms |
| 10x5 - 2 sources - read 20.0% (simple) | 501.10ms | 243.14ms | 255.53ms | 357.91ms | 441.06ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.00ms | 181.34ms | 211.41ms | 249.03ms | 271.37ms | 1.50s |
| 1000x12 - 4 sources - dynamic (large) | 3.96s | 284.02ms | 367.64ms | 453.15ms | 3.69s | 1.88s |
| 1000x5 - 25 sources (wide dense) | 3.41s | 410.61ms | 570.33ms | 608.00ms | 2.71s | 3.49s |
| 5x500 - 3 sources (deep) | 225.54ms | 193.54ms | 204.36ms | 245.59ms | 231.52ms | 1.12s |
| 100x15 - 6 sources - dynamic (very dynamic) | 481.34ms | 269.19ms | 277.37ms | 384.59ms | 466.93ms | 1.70s |

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
