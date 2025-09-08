# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.33s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.38s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.25s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.20s |
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
| Test Case | preact_signals | state_beacon | solidart(2.0-dev) | signals | alien_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 201.29ms | 161.36ms (fail) | 261.81ms | 216.07ms | 194.47ms | 2.38s |
| broadPropagation | 462.61ms | 6.50ms (fail) | 487.73ms | 464.45ms | 348.78ms | 4.23s |
| deepPropagation | 178.60ms | 137.90ms (fail) | 163.73ms | 174.01ms | 128.10ms | 1.54s |
| diamond | 278.45ms | 208.03ms (fail) | 365.39ms | 285.66ms | 235.62ms | 2.39s |
| mux | 395.09ms | 195.14ms (fail) | 433.92ms | 412.29ms | 378.61ms | 1.86s |
| repeatedObservers | 40.02ms | 52.77ms (fail) | 80.53ms | 46.30ms | 43.54ms | 231.79ms |
| triangle | 100.13ms | 81.31ms (fail) | 113.63ms | 98.78ms | 84.51ms | 759.02ms |
| unstable | 73.96ms | 338.70ms (fail) | 95.41ms | 75.87ms | 60.08ms | 345.77ms |
| molBench | 488.97ms | 939μs | 500.50ms | 486.32ms | 488.88ms | 582.62ms |
| create_signals | 5.48ms | 63.71ms | 99.59ms | 26.41ms | 27.54ms | 51.72ms |
| comp_0to1 | 17.90ms | 57.00ms | 34.23ms | 11.94ms | 7.17ms | 19.11ms |
| comp_1to1 | 14.94ms | 58.02ms | 52.97ms | 28.92ms | 4.26ms | 28.67ms |
| comp_2to1 | 19.76ms | 38.55ms | 37.92ms | 9.32ms | 2.22ms | 11.80ms |
| comp_4to1 | 14.50ms | 17.30ms | 12.38ms | 6.87ms | 7.66ms | 29.27ms |
| comp_1000to1 | 4μs | 45μs | 18μs | 8μs | 3μs | 15μs |
| comp_1to2 | 20.63ms | 49.28ms | 26.60ms | 21.96ms | 9.97ms | 36.12ms |
| comp_1to4 | 34.22ms | 47.00ms | 25.19ms | 12.51ms | 12.28ms | 19.09ms |
| comp_1to8 | 7.01ms | 46.30ms | 25.77ms | 6.55ms | 4.89ms | 21.42ms |
| comp_1to1000 | 5.99ms | 42.26ms | 14.24ms | 4.51ms | 3.56ms | 15.15ms |
| update_1to1 | 11.63ms | 6.01ms | 16.43ms | 10.23ms | 10.10ms | 26.29ms |
| update_2to1 | 4.42ms | 6.55ms | 8.02ms | 4.63ms | 2.70ms | 12.73ms |
| update_4to1 | 2.10ms | 1.56ms | 4.09ms | 2.53ms | 2.45ms | 6.87ms |
| update_1000to1 | 20μs | 15μs | 40μs | 25μs | 26μs | 70μs |
| update_1to2 | 4.10ms | 3.04ms | 8.39ms | 4.57ms | 4.95ms | 14.06ms |
| update_1to4 | 2.12ms | 1.55ms | 5.73ms | 2.54ms | 2.44ms | 5.30ms |
| update_1to1000 | 140μs | 423μs | 148μs | 42μs | 47μs | 171μs |
| cellx1000 | 9.80ms | 5.23ms | 13.68ms | 9.79ms | 7.79ms | 69.76ms |
| cellx2500 | 26.64ms | 26.78ms | 37.17ms | 33.71ms | 21.33ms | 256.27ms |
| cellx5000 | 74.60ms | 71.93ms | 102.57ms | 71.56ms | 46.55ms | 550.74ms |
| 10x5 - 2 sources - read 20.0% (simple) | 448.43ms | 258.44ms | 346.80ms | 509.68ms | 226.23ms | 1.99s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 273.02ms | 199.13ms | 247.87ms | 280.09ms | 174.40ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 3.75s | 343.62ms | 457.48ms | 3.78s | 279.33ms | 1.87s |
| 1000x5 - 25 sources (wide dense) | 2.72s | 517.48ms | 611.40ms | 3.46s | 407.63ms | 3.49s |
| 5x500 - 3 sources (deep) | 231.54ms | 205.53ms | 254.93ms | 224.23ms | 192.31ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 462.05ms | 260.55ms | 387.36ms | 475.15ms | 264.89ms | 1.68s |

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
