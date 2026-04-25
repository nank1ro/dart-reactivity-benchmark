# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.72s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.13s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.35s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.55s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.06s |
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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.34s | 204.41ms | 198.85ms | 209.81ms | 274.48ms | 148.81ms (fail) |
| broadPropagation | 4.31s | 470.86ms | 354.14ms | 462.36ms | 494.60ms | 6.41ms (fail) |
| deepPropagation | 1.57s | 174.09ms | 125.36ms | 179.55ms | 165.12ms | 136.56ms (fail) |
| diamond | 2.49s | 288.30ms | 247.93ms | 282.92ms | 347.67ms | 187.37ms (fail) |
| mux | 1.79s | 403.94ms | 365.91ms | 374.69ms | 418.33ms | 183.35ms (fail) |
| repeatedObservers | 231.33ms | 46.04ms | 45.61ms | 43.09ms | 80.87ms | 56.37ms (fail) |
| triangle | 762.96ms | 103.35ms | 88.65ms | 100.49ms | 115.05ms | 75.63ms (fail) |
| unstable | 347.85ms | 76.81ms | 62.22ms | 72.48ms | 95.65ms | 336.32ms (fail) |
| molBench | 584.69ms | 494.31ms | 481.56ms | 496.69ms | 489.56ms | 1.02ms |
| create_signals | 78.77ms | 27.35ms | 29.07ms | 5.44ms | 104.02ms | 59.65ms |
| comp_0to1 | 27.80ms | 11.92ms | 8.04ms | 17.85ms | 35.75ms | 55.27ms |
| comp_1to1 | 43.97ms | 27.84ms | 4.36ms | 13.19ms | 48.88ms | 56.08ms |
| comp_2to1 | 38.33ms | 13.18ms | 2.33ms | 17.39ms | 45.29ms | 37.11ms |
| comp_4to1 | 16.66ms | 1.87ms | 8.51ms | 13.93ms | 7.53ms | 16.49ms |
| comp_1000to1 | 15μs | 4μs | 3μs | 4μs | 14μs | 44μs |
| comp_1to2 | 37.75ms | 17.52ms | 13.29ms | 24.33ms | 34.12ms | 49.68ms |
| comp_1to4 | 18.51ms | 9.86ms | 12.78ms | 21.90ms | 21.51ms | 48.93ms |
| comp_1to8 | 22.81ms | 6.32ms | 4.61ms | 8.18ms | 24.02ms | 46.05ms |
| comp_1to1000 | 14.63ms | 4.09ms | 3.14ms | 8.19ms | 14.43ms | 41.23ms |
| update_1to1 | 21.67ms | 9.00ms | 4.63ms | 9.39ms | 15.76ms | 8.45ms |
| update_2to1 | 11.41ms | 4.46ms | 2.38ms | 4.61ms | 7.85ms | 2.92ms |
| update_4to1 | 5.47ms | 2.30ms | 1.23ms | 2.33ms | 3.90ms | 2.97ms |
| update_1000to1 | 52μs | 22μs | 12μs | 23μs | 39μs | 14μs |
| update_1to2 | 10.67ms | 4.43ms | 2.50ms | 4.59ms | 8.06ms | 4.71ms |
| update_1to4 | 5.36ms | 2.30ms | 1.36ms | 2.46ms | 3.92ms | 1.59ms |
| update_1to1000 | 169μs | 67μs | 49μs | 2.39ms | 145μs | 396μs |
| cellx1000 | 73.92ms | 10.38ms | 7.37ms | 10.08ms | 12.77ms | 5.57ms |
| cellx2500 | 248.51ms | 38.59ms | 20.04ms | 30.00ms | 46.21ms | 23.92ms |
| cellx5000 | 561.46ms | 81.35ms | 52.06ms | 84.64ms | 137.33ms | 82.08ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.96s | 503.85ms | 237.33ms | 452.52ms | 350.06ms | 243.71ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.51s | 285.46ms | 181.13ms | 273.81ms | 254.81ms | 200.23ms |
| 1000x12 - 4 sources - dynamic (large) | 1.83s | 3.70s | 280.98ms | 3.84s | 467.55ms | 349.54ms |
| 1000x5 - 25 sources (wide dense) | 3.35s | 3.39s | 413.94ms | 2.80s | 592.11ms | 513.10ms |
| 5x500 - 3 sources (deep) | 1.11s | 241.59ms | 191.66ms | 234.67ms | 254.79ms | 206.35ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.64s | 469.43ms | 263.07ms | 449.46ms | 382.55ms | 259.36ms |

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
