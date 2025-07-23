# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.66s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 10.44s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.23s |
| 4 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.33s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.80s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.39s |

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
| avoidablePropagation | 147.26ms (fail) | 2.32s | 276.41ms | 202.09ms | 205.66ms | 181.53ms |
| broadPropagation | 5.70ms (fail) | 4.47s | 505.38ms | 496.87ms | 452.64ms | 347.57ms |
| deepPropagation | 146.56ms (fail) | 1.56s | 169.17ms | 181.27ms | 179.11ms | 120.10ms |
| diamond | 184.75ms (fail) | 2.51s | 351.63ms | 301.92ms | 279.90ms | 235.03ms |
| mux | 191.79ms (fail) | 1.89s | 447.68ms | 399.27ms | 408.49ms | 369.32ms |
| repeatedObservers | 52.48ms (fail) | 230.12ms | 81.88ms | 41.00ms | 44.82ms | 45.54ms |
| triangle | 85.19ms (fail) | 778.33ms | 125.13ms | 102.28ms | 100.02ms | 84.76ms |
| unstable | 336.18ms (fail) | 352.97ms | 97.74ms | 73.74ms | 79.69ms | 66.81ms |
| molBench | 1.20ms | 575.10ms | 494.04ms | 490.73ms | 487.74ms | 485.55ms |
| create_signals | 60.00ms | 76.70ms | 73.88ms | 5.20ms | 25.62ms | 24.71ms |
| comp_0to1 | 53.71ms | 29.79ms | 30.61ms | 17.33ms | 11.48ms | 6.70ms |
| comp_1to1 | 55.92ms | 18.49ms | 45.50ms | 12.42ms | 18.13ms | 4.16ms |
| comp_2to1 | 36.26ms | 13.23ms | 17.00ms | 20.76ms | 18.04ms | 2.50ms |
| comp_4to1 | 16.39ms | 23.65ms | 9.57ms | 9.35ms | 6.68ms | 8.26ms |
| comp_1000to1 | 43μs | 23μs | 301μs | 5μs | 6μs | 4μs |
| comp_1to2 | 45.78ms | 32.17ms | 41.31ms | 15.11ms | 22.73ms | 12.32ms |
| comp_1to4 | 44.31ms | 25.49ms | 25.65ms | 24.45ms | 7.17ms | 13.04ms |
| comp_1to8 | 43.14ms | 23.85ms | 26.25ms | 7.17ms | 6.32ms | 4.54ms |
| comp_1to1000 | 39.29ms | 16.55ms | 17.59ms | 4.74ms | 4.07ms | 3.17ms |
| update_1to1 | 5.66ms | 24.76ms | 16.23ms | 8.58ms | 8.84ms | 10.30ms |
| update_2to1 | 3.10ms | 11.91ms | 7.87ms | 4.36ms | 4.46ms | 2.25ms |
| update_4to1 | 1.44ms | 6.53ms | 4.04ms | 2.15ms | 2.26ms | 2.57ms |
| update_1000to1 | 14μs | 88μs | 42μs | 21μs | 21μs | 24μs |
| update_1to2 | 2.84ms | 10.97ms | 7.88ms | 4.63ms | 4.46ms | 5.08ms |
| update_1to4 | 1.44ms | 5.67ms | 4.04ms | 2.15ms | 2.25ms | 2.66ms |
| update_1to1000 | 385μs | 174μs | 175μs | 127μs | 43μs | 31μs |
| cellx1000 | 5.23ms | 71.00ms | 14.16ms | 10.72ms | 9.64ms | 7.28ms |
| cellx2500 | 22.58ms | 255.35ms | 39.66ms | 26.23ms | 31.41ms | 19.60ms |
| cellx5000 | 59.98ms | 555.49ms | 88.74ms | 71.58ms | 62.61ms | 42.34ms |
| 10x5 - 2 sources - read 20.0% (simple) | 242.93ms | 2.04s | 359.70ms | 477.69ms | 561.91ms | 229.75ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 200.21ms | 1.50s | 244.03ms | 281.15ms | 295.45ms | 180.78ms |
| 1000x12 - 4 sources - dynamic (large) | 334.49ms | 1.93s | 469.85ms | 3.72s | 3.85s | 283.13ms |
| 1000x5 - 25 sources (wide dense) | 498.99ms | 3.58s | 591.29ms | 2.73s | 3.34s | 403.12ms |
| 5x500 - 3 sources (deep) | 205.68ms | 1.14s | 254.63ms | 230.40ms | 223.12ms | 189.80ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 259.80ms | 1.71s | 386.72ms | 460.23ms | 484.28ms | 263.35ms |

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
