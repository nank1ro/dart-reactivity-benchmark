# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.69s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.26s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.27s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.45s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.51s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.57s |

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
| avoidablePropagation | 200.55ms | 162.33ms (fail) | 274.28ms | 211.93ms | 193.85ms | 2.33s |
| broadPropagation | 470.88ms | 6.40ms (fail) | 484.78ms | 459.11ms | 351.60ms | 4.39s |
| deepPropagation | 180.53ms | 142.53ms (fail) | 165.67ms | 169.52ms | 127.52ms | 1.53s |
| diamond | 278.73ms | 213.71ms (fail) | 351.58ms | 282.62ms | 236.15ms | 2.41s |
| mux | 388.47ms | 199.30ms (fail) | 431.31ms | 413.62ms | 377.18ms | 1.85s |
| repeatedObservers | 39.99ms | 52.59ms (fail) | 81.84ms | 46.32ms | 44.62ms | 233.00ms |
| triangle | 98.66ms | 88.92ms (fail) | 113.59ms | 103.20ms | 84.43ms | 764.31ms |
| unstable | 73.57ms | 339.80ms (fail) | 96.04ms | 75.83ms | 59.62ms | 343.88ms |
| molBench | 488.91ms | 1.38ms | 497.83ms | 485.66ms | 489.34ms | 582.68ms |
| create_signals | 5.26ms | 67.40ms | 58.40ms | 25.37ms | 25.09ms | 74.51ms |
| comp_0to1 | 17.95ms | 59.47ms | 24.53ms | 11.22ms | 8.06ms | 25.87ms |
| comp_1to1 | 13.86ms | 63.43ms | 40.36ms | 28.55ms | 4.26ms | 18.24ms |
| comp_2to1 | 21.84ms | 46.12ms | 28.55ms | 9.32ms | 2.34ms | 13.26ms |
| comp_4to1 | 12.13ms | 18.10ms | 15.90ms | 9.72ms | 8.85ms | 15.29ms |
| comp_1000to1 | 9μs | 45μs | 302μs | 5μs | 3μs | 23μs |
| comp_1to2 | 27.55ms | 51.04ms | 44.92ms | 16.69ms | 15.44ms | 40.09ms |
| comp_1to4 | 37.47ms | 46.56ms | 16.46ms | 11.46ms | 5.40ms | 27.11ms |
| comp_1to8 | 7.08ms | 46.77ms | 21.56ms | 6.50ms | 4.51ms | 26.31ms |
| comp_1to1000 | 7.20ms | 41.32ms | 14.72ms | 4.47ms | 3.42ms | 16.27ms |
| update_1to1 | 8.29ms | 6.01ms | 20.48ms | 10.16ms | 10.08ms | 28.68ms |
| update_2to1 | 4.38ms | 6.76ms | 8.01ms | 4.51ms | 2.15ms | 14.14ms |
| update_4to1 | 2.06ms | 1.51ms | 4.07ms | 2.47ms | 2.48ms | 7.57ms |
| update_1000to1 | 21μs | 15μs | 40μs | 25μs | 24μs | 69μs |
| update_1to2 | 4.08ms | 3.02ms | 8.25ms | 4.51ms | 4.98ms | 14.02ms |
| update_1to4 | 2.05ms | 1.54ms | 4.75ms | 2.60ms | 2.39ms | 7.15ms |
| update_1to1000 | 909μs | 419μs | 295μs | 43μs | 36μs | 183μs |
| cellx1000 | 9.79ms | 5.87ms | 12.18ms | 9.66ms | 8.25ms | 83.36ms |
| cellx2500 | 32.69ms | 27.72ms | 39.39ms | 31.69ms | 19.46ms | 288.20ms |
| cellx5000 | 93.32ms | 85.49ms | 88.06ms | 65.36ms | 45.99ms | 614.87ms |
| 10x5 - 2 sources - read 20.0% (simple) | 454.26ms | 247.20ms | 354.23ms | 515.23ms | 227.15ms | 2.04s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 281.12ms | 202.41ms | 252.85ms | 280.71ms | 174.60ms | 1.54s |
| 1000x12 - 4 sources - dynamic (large) | 3.74s | 349.16ms | 461.81ms | 3.76s | 282.27ms | 1.82s |
| 1000x5 - 25 sources (wide dense) | 2.75s | 513.50ms | 610.67ms | 3.50s | 410.31ms | 3.48s |
| 5x500 - 3 sources (deep) | 230.56ms | 214.67ms | 251.88ms | 221.54ms | 190.48ms | 1.17s |
| 100x15 - 6 sources - dynamic (very dynamic) | 460.19ms | 259.10ms | 385.59ms | 481.50ms | 267.60ms | 1.71s |

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
