# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.65s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.27s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.40s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.32s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 28.47s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.41s |

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
| Test Case | state_beacon | mobx | solidart(2.0-dev) | preact_signals | signals | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 163.46ms (fail) | 2.36s | 273.55ms | 202.14ms | 207.72ms | 182.49ms |
| broadPropagation | 6.39ms (fail) | 4.60s | 509.59ms | 450.02ms | 512.92ms | 341.76ms |
| deepPropagation | 142.56ms (fail) | 1.57s | 169.07ms | 177.66ms | 174.03ms | 125.58ms |
| diamond | 185.76ms (fail) | 2.48s | 363.18ms | 280.40ms | 302.43ms | 228.30ms |
| mux | 201.59ms (fail) | 1.88s | 437.92ms | 404.03ms | 411.23ms | 371.19ms |
| repeatedObservers | 57.59ms (fail) | 235.41ms | 81.53ms | 40.23ms | 46.97ms | 45.30ms |
| triangle | 77.49ms (fail) | 775.37ms | 118.70ms | 99.03ms | 104.87ms | 84.95ms |
| unstable | 337.10ms (fail) | 355.84ms | 98.14ms | 69.83ms | 81.63ms | 68.07ms |
| molBench | 858μs | 573.77ms | 492.96ms | 489.19ms | 491.42ms | 486.58ms |
| create_signals | 59.89ms | 67.69ms | 76.08ms | 4.68ms | 25.80ms | 28.21ms |
| comp_0to1 | 52.91ms | 44.01ms | 28.07ms | 17.82ms | 11.62ms | 8.29ms |
| comp_1to1 | 55.81ms | 38.67ms | 45.29ms | 12.48ms | 28.46ms | 4.20ms |
| comp_2to1 | 36.50ms | 34.65ms | 26.04ms | 12.93ms | 8.81ms | 2.36ms |
| comp_4to1 | 16.68ms | 17.77ms | 15.06ms | 25.77ms | 1.91ms | 7.67ms |
| comp_1000to1 | 40μs | 23μs | 17μs | 10μs | 5μs | 3μs |
| comp_1to2 | 45.03ms | 36.00ms | 29.95ms | 25.42ms | 21.94ms | 9.49ms |
| comp_1to4 | 43.38ms | 20.97ms | 22.91ms | 29.51ms | 9.21ms | 11.54ms |
| comp_1to8 | 42.07ms | 23.68ms | 24.29ms | 7.43ms | 10.70ms | 4.96ms |
| comp_1to1000 | 38.17ms | 16.32ms | 17.08ms | 6.01ms | 6.90ms | 3.50ms |
| update_1to1 | 5.93ms | 27.81ms | 15.99ms | 8.58ms | 8.90ms | 10.14ms |
| update_2to1 | 3.26ms | 10.93ms | 7.82ms | 4.33ms | 4.47ms | 2.24ms |
| update_4to1 | 1.52ms | 5.76ms | 3.99ms | 2.19ms | 2.26ms | 2.54ms |
| update_1000to1 | 16μs | 72μs | 40μs | 21μs | 23μs | 26μs |
| update_1to2 | 2.98ms | 11.23ms | 8.26ms | 4.67ms | 4.46ms | 3.72ms |
| update_1to4 | 1.51ms | 6.01ms | 4.02ms | 2.13ms | 2.23ms | 2.52ms |
| update_1to1000 | 380μs | 175μs | 170μs | 1.14ms | 43μs | 31μs |
| cellx1000 | 5.31ms | 72.41ms | 13.43ms | 9.86ms | 10.03ms | 7.87ms |
| cellx2500 | 24.50ms | 249.10ms | 36.26ms | 27.12ms | 34.97ms | 19.92ms |
| cellx5000 | 56.41ms | 564.79ms | 80.06ms | 70.68ms | 71.06ms | 44.42ms |
| 10x5 - 2 sources - read 20.0% (simple) | 239.55ms | 2.07s | 353.39ms | 446.64ms | 523.75ms | 226.16ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 204.18ms | 1.60s | 243.39ms | 276.79ms | 311.85ms | 172.69ms |
| 1000x12 - 4 sources - dynamic (large) | 339.85ms | 2.10s | 463.15ms | 3.71s | 4.00s | 278.17ms |
| 1000x5 - 25 sources (wide dense) | 501.29ms | 3.68s | 581.87ms | 2.72s | 3.24s | 408.12ms |
| 5x500 - 3 sources (deep) | 204.91ms | 1.19s | 251.33ms | 229.87ms | 225.15ms | 192.59ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 259.12ms | 1.75s | 382.17ms | 454.03ms | 504.10ms | 265.65ms |

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
