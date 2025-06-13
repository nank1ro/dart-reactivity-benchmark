# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.68s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.17s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.35s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.34s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.83s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.47s |

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
| Test Case | solidart(2.0-dev) | signals | mobx | preact_signals | state_beacon | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 277.67ms | 204.81ms | 2.32s | 198.27ms | 165.19ms (fail) | 185.52ms |
| broadPropagation | 500.80ms | 467.75ms | 4.45s | 496.44ms | 6.29ms (fail) | 345.37ms |
| deepPropagation | 169.65ms | 174.25ms | 1.57s | 177.72ms | 140.31ms (fail) | 124.40ms |
| diamond | 353.87ms | 276.99ms | 2.47s | 296.66ms | 205.49ms (fail) | 228.63ms |
| mux | 450.69ms | 405.13ms | 1.86s | 400.42ms | 191.93ms (fail) | 370.84ms |
| repeatedObservers | 81.53ms | 44.38ms | 232.12ms | 41.17ms | 52.75ms (fail) | 45.45ms |
| triangle | 118.66ms | 102.15ms | 772.85ms | 103.30ms | 83.31ms (fail) | 84.38ms |
| unstable | 98.90ms | 79.45ms | 351.39ms | 73.37ms | 349.28ms (fail) | 67.03ms |
| molBench | 493.13ms | 485.25ms | 572.00ms | 489.31ms | 855μs | 486.78ms |
| create_signals | 97.18ms | 25.52ms | 70.72ms | 5.16ms | 72.09ms | 28.98ms |
| comp_0to1 | 37.42ms | 11.47ms | 28.30ms | 17.40ms | 55.83ms | 7.71ms |
| comp_1to1 | 40.18ms | 22.37ms | 50.89ms | 12.57ms | 62.61ms | 4.25ms |
| comp_2to1 | 38.23ms | 10.80ms | 22.54ms | 11.21ms | 38.91ms | 2.38ms |
| comp_4to1 | 5.01ms | 2.04ms | 16.84ms | 12.84ms | 18.30ms | 8.64ms |
| comp_1000to1 | 17μs | 4μs | 16μs | 4μs | 42μs | 4μs |
| comp_1to2 | 39.15ms | 23.25ms | 35.70ms | 18.84ms | 47.03ms | 15.68ms |
| comp_1to4 | 22.78ms | 14.05ms | 18.17ms | 33.69ms | 46.75ms | 5.61ms |
| comp_1to8 | 22.57ms | 6.64ms | 21.03ms | 6.78ms | 42.49ms | 4.40ms |
| comp_1to1000 | 17.13ms | 4.17ms | 16.30ms | 5.47ms | 39.00ms | 3.50ms |
| update_1to1 | 15.95ms | 9.00ms | 25.86ms | 8.59ms | 5.76ms | 10.29ms |
| update_2to1 | 7.80ms | 4.48ms | 13.04ms | 4.40ms | 3.13ms | 2.27ms |
| update_4to1 | 3.99ms | 2.22ms | 7.26ms | 2.18ms | 1.47ms | 2.52ms |
| update_1000to1 | 39μs | 22μs | 70μs | 21μs | 14μs | 24μs |
| update_1to2 | 8.01ms | 4.58ms | 12.26ms | 4.64ms | 2.86ms | 5.12ms |
| update_1to4 | 4.00ms | 2.23ms | 7.11ms | 2.17ms | 1.47ms | 2.49ms |
| update_1to1000 | 171μs | 43μs | 185μs | 1.04ms | 378μs | 31μs |
| cellx1000 | 12.21ms | 9.71ms | 76.51ms | 9.86ms | 5.33ms | 7.14ms |
| cellx2500 | 36.38ms | 34.36ms | 265.45ms | 30.15ms | 24.36ms | 20.50ms |
| cellx5000 | 98.10ms | 67.54ms | 607.36ms | 86.03ms | 76.01ms | 48.17ms |
| 10x5 - 2 sources - read 20.0% (simple) | 353.38ms | 508.30ms | 2.09s | 435.54ms | 239.39ms | 229.04ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 244.41ms | 280.42ms | 1.49s | 275.02ms | 199.95ms | 182.34ms |
| 1000x12 - 4 sources - dynamic (large) | 463.09ms | 3.75s | 1.90s | 3.70s | 338.53ms | 283.50ms |
| 1000x5 - 25 sources (wide dense) | 587.27ms | 3.43s | 3.58s | 2.69s | 493.73ms | 413.47ms |
| 5x500 - 3 sources (deep) | 262.31ms | 225.63ms | 1.17s | 232.29ms | 205.48ms | 191.36ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 384.63ms | 481.30ms | 1.72s | 452.16ms | 258.30ms | 264.07ms |

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
