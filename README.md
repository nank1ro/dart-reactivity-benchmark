# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.31 | 100.0% | 35/35 | 5.32s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 10.42s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.53s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.53s |
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
| avoidablePropagation | 214.13ms | 192.90ms | 165.53ms (fail) | 270.39ms | 201.53ms | 2.39s |
| broadPropagation | 452.65ms | 353.21ms | 6.45ms (fail) | 501.02ms | 459.93ms | 4.39s |
| deepPropagation | 175.51ms | 125.29ms | 138.75ms (fail) | 163.02ms | 179.26ms | 1.58s |
| diamond | 285.09ms | 237.25ms | 190.94ms (fail) | 348.01ms | 280.51ms | 2.45s |
| mux | 410.66ms | 379.99ms | 200.09ms (fail) | 448.78ms | 391.45ms | 1.81s |
| repeatedObservers | 46.30ms | 43.70ms | 52.59ms (fail) | 80.71ms | 41.44ms | 239.90ms |
| triangle | 100.49ms | 85.70ms | 77.79ms (fail) | 114.05ms | 99.56ms | 782.28ms |
| unstable | 75.51ms | 59.95ms | 373.69ms (fail) | 95.46ms | 74.66ms | 344.06ms |
| molBench | 487.59ms | 489.69ms | 1.15ms | 492.53ms | 489.61ms | 582.84ms |
| create_signals | 27.10ms | 27.70ms | 62.20ms | 76.99ms | 4.65ms | 51.84ms |
| comp_0to1 | 11.86ms | 11.18ms | 56.09ms | 25.57ms | 18.41ms | 16.00ms |
| comp_1to1 | 29.73ms | 10.68ms | 58.42ms | 47.54ms | 15.53ms | 46.18ms |
| comp_2to1 | 16.70ms | 7.09ms | 39.19ms | 24.32ms | 19.51ms | 31.37ms |
| comp_4to1 | 11.82ms | 7.34ms | 17.13ms | 9.09ms | 11.62ms | 14.00ms |
| comp_1000to1 | 5μs | 4μs | 45μs | 18μs | 23μs | 19μs |
| comp_1to2 | 23.24ms | 14.34ms | 50.60ms | 26.61ms | 18.76ms | 40.57ms |
| comp_1to4 | 15.35ms | 8.76ms | 51.50ms | 20.54ms | 25.93ms | 19.77ms |
| comp_1to8 | 7.00ms | 3.77ms | 46.16ms | 22.49ms | 8.52ms | 23.41ms |
| comp_1to1000 | 4.47ms | 3.56ms | 41.25ms | 14.08ms | 6.38ms | 14.89ms |
| update_1to1 | 11.25ms | 10.07ms | 6.01ms | 16.43ms | 8.35ms | 27.65ms |
| update_2to1 | 5.14ms | 2.50ms | 3.10ms | 8.03ms | 4.42ms | 13.54ms |
| update_4to1 | 2.80ms | 2.45ms | 1.57ms | 4.08ms | 2.05ms | 7.32ms |
| update_1000to1 | 30μs | 26μs | 15μs | 39μs | 20μs | 69μs |
| update_1to2 | 4.98ms | 5.02ms | 3.03ms | 8.39ms | 4.05ms | 13.50ms |
| update_1to4 | 2.81ms | 2.48ms | 1.55ms | 4.11ms | 2.07ms | 7.05ms |
| update_1to1000 | 45μs | 33μs | 433μs | 149μs | 170μs | 174μs |
| cellx1000 | 10.30ms | 7.52ms | 7.19ms | 12.71ms | 10.61ms | 78.58ms |
| cellx2500 | 37.62ms | 20.97ms | 29.87ms | 37.45ms | 36.13ms | 281.10ms |
| cellx5000 | 79.37ms | 46.34ms | 87.90ms | 117.02ms | 87.83ms | 603.96ms |
| 10x5 - 2 sources - read 20.0% (simple) | 516.51ms | 227.89ms | 239.64ms | 351.99ms | 446.53ms | 2.03s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 285.01ms | 174.32ms | 196.35ms | 247.59ms | 278.53ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 3.80s | 280.24ms | 349.93ms | 469.95ms | 3.74s | 1.79s |
| 1000x5 - 25 sources (wide dense) | 3.67s | 411.09ms | 500.17ms | 606.08ms | 2.76s | 3.49s |
| 5x500 - 3 sources (deep) | 222.73ms | 192.39ms | 207.74ms | 254.76ms | 234.15ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 480.69ms | 267.21ms | 259.95ms | 395.30ms | 453.74ms | 1.70s |

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
