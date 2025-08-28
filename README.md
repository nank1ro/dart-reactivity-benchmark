# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.28s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.35s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.22s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.48s |
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
| avoidablePropagation | 205.39ms | 159.49ms (fail) | 263.34ms | 213.63ms | 192.31ms | 2.36s |
| broadPropagation | 457.43ms | 6.33ms (fail) | 497.38ms | 465.26ms | 351.84ms | 4.38s |
| deepPropagation | 179.08ms | 141.32ms (fail) | 163.30ms | 171.34ms | 125.22ms | 1.55s |
| diamond | 282.70ms | 200.94ms (fail) | 352.62ms | 287.65ms | 234.59ms | 2.44s |
| mux | 396.74ms | 191.51ms (fail) | 431.42ms | 409.79ms | 383.57ms | 1.83s |
| repeatedObservers | 40.39ms | 52.65ms (fail) | 80.96ms | 46.31ms | 44.29ms | 234.28ms |
| triangle | 99.97ms | 83.10ms (fail) | 113.31ms | 104.33ms | 84.83ms | 794.14ms |
| unstable | 76.52ms | 339.87ms (fail) | 96.44ms | 76.07ms | 60.62ms | 348.19ms |
| molBench | 490.21ms | 1.21ms | 500.61ms | 486.04ms | 490.45ms | 585.37ms |
| create_signals | 5.40ms | 61.83ms | 100.68ms | 25.26ms | 23.02ms | 59.57ms |
| comp_0to1 | 18.01ms | 55.56ms | 32.17ms | 11.40ms | 7.27ms | 15.60ms |
| comp_1to1 | 11.03ms | 57.12ms | 42.64ms | 27.96ms | 4.20ms | 48.62ms |
| comp_2to1 | 12.85ms | 37.83ms | 47.60ms | 17.49ms | 2.26ms | 30.72ms |
| comp_4to1 | 14.21ms | 16.77ms | 13.74ms | 9.95ms | 8.67ms | 23.53ms |
| comp_1000to1 | 5μs | 44μs | 24μs | 5μs | 5μs | 35μs |
| comp_1to2 | 18.34ms | 47.96ms | 26.61ms | 21.87ms | 14.49ms | 30.16ms |
| comp_1to4 | 32.78ms | 46.22ms | 20.16ms | 12.47ms | 6.17ms | 33.52ms |
| comp_1to8 | 7.42ms | 45.45ms | 23.19ms | 7.04ms | 7.06ms | 24.46ms |
| comp_1to1000 | 6.03ms | 41.37ms | 13.97ms | 4.43ms | 3.45ms | 16.03ms |
| update_1to1 | 9.44ms | 6.08ms | 16.35ms | 10.19ms | 10.14ms | 25.45ms |
| update_2to1 | 4.61ms | 3.38ms | 8.03ms | 4.51ms | 2.19ms | 12.08ms |
| update_4to1 | 2.58ms | 1.53ms | 4.12ms | 2.52ms | 2.48ms | 7.09ms |
| update_1000to1 | 38μs | 15μs | 40μs | 25μs | 27μs | 70μs |
| update_1to2 | 4.63ms | 3.02ms | 8.43ms | 4.50ms | 4.95ms | 11.86ms |
| update_1to4 | 2.21ms | 1.53ms | 4.11ms | 2.45ms | 2.11ms | 5.85ms |
| update_1to1000 | 153μs | 412μs | 149μs | 43μs | 46μs | 172μs |
| cellx1000 | 9.72ms | 5.30ms | 11.92ms | 9.74ms | 7.25ms | 77.96ms |
| cellx2500 | 32.61ms | 28.15ms | 32.91ms | 32.74ms | 19.23ms | 258.36ms |
| cellx5000 | 75.61ms | 68.41ms | 74.95ms | 65.20ms | 42.65ms | 571.25ms |
| 10x5 - 2 sources - read 20.0% (simple) | 461.27ms | 260.43ms | 348.70ms | 514.56ms | 239.22ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 287.29ms | 205.13ms | 248.33ms | 281.21ms | 179.65ms | 1.50s |
| 1000x12 - 4 sources - dynamic (large) | 3.68s | 346.30ms | 462.01ms | 3.75s | 284.97ms | 1.88s |
| 1000x5 - 25 sources (wide dense) | 2.73s | 513.72ms | 602.35ms | 3.44s | 411.76ms | 3.49s |
| 5x500 - 3 sources (deep) | 236.39ms | 211.37ms | 254.94ms | 224.90ms | 196.87ms | 1.12s |
| 100x15 - 6 sources - dynamic (very dynamic) | 461.86ms | 266.72ms | 380.57ms | 472.67ms | 260.76ms | 1.71s |

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
