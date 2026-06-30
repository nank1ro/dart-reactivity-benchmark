# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.68s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.42s |
| 🥉 | preact_signals | 0.25 | 100.0% | 35/35 | 9.97s |
| 4 | signals | 0.24 | 100.0% | 35/35 | 11.26s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.06s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.53s |

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
| avoidablePropagation | 199.49ms | 145.87ms (fail) | 201.68ms | 186.31ms | 2.38s | 272.90ms |
| broadPropagation | 443.42ms | 6.48ms (fail) | 450.16ms | 347.37ms | 4.40s | 507.41ms |
| deepPropagation | 175.05ms | 139.38ms (fail) | 175.64ms | 125.91ms | 1.50s | 172.09ms |
| diamond | 284.26ms | 184.25ms (fail) | 284.09ms | 229.15ms | 2.36s | 367.32ms |
| mux | 380.32ms | 194.04ms (fail) | 394.77ms | 359.22ms | 1.76s | 428.92ms |
| repeatedObservers | 40.63ms | 52.93ms (fail) | 45.79ms | 43.34ms | 234.26ms | 79.73ms |
| triangle | 98.08ms | 84.30ms (fail) | 101.43ms | 83.79ms | 754.79ms | 117.46ms |
| unstable | 72.88ms | 336.99ms (fail) | 73.82ms | 59.56ms | 346.64ms | 98.08ms |
| molBench | 484.86ms | 896μs | 496.85ms | 487.85ms | 591.87ms | 489.91ms |
| create_signals | 5.50ms | 62.46ms | 26.26ms | 30.78ms | 71.77ms | 78.28ms |
| comp_0to1 | 24.10ms | 56.30ms | 12.66ms | 9.17ms | 35.02ms | 36.03ms |
| comp_1to1 | 25.66ms | 57.19ms | 25.97ms | 4.42ms | 48.70ms | 44.59ms |
| comp_2to1 | 18.76ms | 39.39ms | 18.84ms | 2.51ms | 36.83ms | 9.85ms |
| comp_4to1 | 11.58ms | 19.53ms | 9.99ms | 10.72ms | 25.87ms | 17.48ms |
| comp_1000to1 | 4μs | 43μs | 8μs | 4μs | 15μs | 71μs |
| comp_1to2 | 28.41ms | 50.01ms | 28.34ms | 13.82ms | 36.87ms | 42.17ms |
| comp_1to4 | 39.41ms | 46.64ms | 17.07ms | 9.80ms | 18.06ms | 18.66ms |
| comp_1to8 | 8.68ms | 44.44ms | 6.82ms | 4.09ms | 21.04ms | 25.71ms |
| comp_1to1000 | 6.71ms | 42.11ms | 4.13ms | 3.82ms | 15.54ms | 14.44ms |
| update_1to1 | 9.51ms | 5.80ms | 10.17ms | 9.96ms | 22.97ms | 16.08ms |
| update_2to1 | 4.64ms | 3.03ms | 5.08ms | 2.24ms | 12.13ms | 7.80ms |
| update_4to1 | 2.33ms | 1.53ms | 2.54ms | 2.49ms | 6.26ms | 3.99ms |
| update_1000to1 | 36μs | 16μs | 29μs | 10μs | 68μs | 39μs |
| update_1to2 | 4.70ms | 2.98ms | 5.08ms | 3.70ms | 11.49ms | 8.06ms |
| update_1to4 | 2.33ms | 2.50ms | 2.67ms | 1.08ms | 5.41ms | 4.00ms |
| update_1to1000 | 558μs | 392μs | 45μs | 35μs | 170μs | 232μs |
| cellx1000 | 10.10ms | 7.88ms | 11.29ms | 8.21ms | 85.97ms | 13.18ms |
| cellx2500 | 36.42ms | 31.92ms | 42.52ms | 23.52ms | 285.00ms | 49.16ms |
| cellx5000 | 103.15ms | 86.99ms | 112.31ms | 53.21ms | 648.79ms | 146.43ms |
| 10x5 - 2 sources - read 20.0% (simple) | 435.26ms | 273.37ms | 510.03ms | 234.83ms | 1.91s | 355.88ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 271.86ms | 203.80ms | 281.96ms | 175.26ms | 1.47s | 256.26ms |
| 1000x12 - 4 sources - dynamic (large) | 3.52s | 359.62ms | 3.66s | 286.62ms | 1.86s | 473.18ms |
| 1000x5 - 25 sources (wide dense) | 2.53s | 517.63ms | 3.53s | 415.23ms | 3.35s | 614.74ms |
| 5x500 - 3 sources (deep) | 229.54ms | 207.71ms | 225.73ms | 191.11ms | 1.10s | 251.73ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 453.02ms | 266.01ms | 487.11ms | 262.53ms | 1.66s | 395.56ms |

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
