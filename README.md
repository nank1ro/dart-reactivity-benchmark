# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.68s |
| 🥈 | signals | 0.25 | 100.0% | 35/35 | 11.34s |
| 🥉 | preact_signals | 0.25 | 100.0% | 35/35 | 10.28s |
| 4 | solidart(2.0-dev) | 0.24 | 100.0% | 35/35 | 5.49s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 27.87s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.43s |

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
| avoidablePropagation | 147.36ms (fail) | 2.36s | 276.43ms | 198.25ms | 210.26ms | 180.94ms |
| broadPropagation | 6.28ms (fail) | 4.47s | 513.39ms | 458.70ms | 464.74ms | 342.14ms |
| deepPropagation | 141.03ms (fail) | 1.59s | 167.75ms | 176.75ms | 174.31ms | 124.63ms |
| diamond | 182.79ms (fail) | 2.46s | 348.59ms | 281.62ms | 293.40ms | 229.78ms |
| mux | 192.53ms (fail) | 1.84s | 443.38ms | 399.61ms | 413.93ms | 370.06ms |
| repeatedObservers | 53.39ms (fail) | 236.33ms | 94.38ms | 39.57ms | 44.92ms | 45.22ms |
| triangle | 76.03ms (fail) | 786.56ms | 117.62ms | 97.60ms | 102.09ms | 85.97ms |
| unstable | 336.43ms (fail) | 353.87ms | 99.45ms | 69.84ms | 79.19ms | 67.34ms |
| molBench | 931μs | 572.93ms | 493.68ms | 488.45ms | 485.57ms | 483.42ms |
| create_signals | 69.32ms | 91.01ms | 105.79ms | 5.30ms | 26.14ms | 21.06ms |
| comp_0to1 | 61.95ms | 16.64ms | 32.91ms | 17.85ms | 11.45ms | 7.58ms |
| comp_1to1 | 62.86ms | 44.09ms | 49.78ms | 12.74ms | 36.60ms | 4.18ms |
| comp_2to1 | 39.14ms | 36.72ms | 49.07ms | 17.96ms | 16.40ms | 2.39ms |
| comp_4to1 | 17.34ms | 13.98ms | 15.38ms | 14.07ms | 1.88ms | 8.69ms |
| comp_1000to1 | 41μs | 21μs | 17μs | 4μs | 4μs | 3μs |
| comp_1to2 | 48.63ms | 39.11ms | 35.74ms | 21.45ms | 21.43ms | 15.66ms |
| comp_1to4 | 43.95ms | 26.05ms | 23.37ms | 27.80ms | 11.09ms | 5.16ms |
| comp_1to8 | 43.57ms | 27.02ms | 25.70ms | 7.07ms | 9.63ms | 5.52ms |
| comp_1to1000 | 38.71ms | 16.24ms | 17.34ms | 5.46ms | 4.34ms | 3.57ms |
| update_1to1 | 5.68ms | 23.87ms | 18.37ms | 8.67ms | 9.04ms | 10.33ms |
| update_2to1 | 3.13ms | 11.95ms | 7.85ms | 4.31ms | 5.28ms | 2.25ms |
| update_4to1 | 1.42ms | 6.98ms | 3.99ms | 2.18ms | 2.22ms | 2.59ms |
| update_1000to1 | 14μs | 71μs | 40μs | 21μs | 22μs | 24μs |
| update_1to2 | 2.96ms | 13.03ms | 9.35ms | 4.66ms | 4.47ms | 4.87ms |
| update_1to4 | 1.44ms | 6.98ms | 4.07ms | 2.17ms | 2.22ms | 2.56ms |
| update_1to1000 | 378μs | 175μs | 188μs | 896μs | 58μs | 46μs |
| cellx1000 | 5.94ms | 81.79ms | 17.08ms | 10.05ms | 9.76ms | 7.18ms |
| cellx2500 | 27.82ms | 268.24ms | 49.26ms | 29.68ms | 34.75ms | 19.88ms |
| cellx5000 | 92.69ms | 620.41ms | 172.78ms | 87.02ms | 70.25ms | 50.53ms |
| 10x5 - 2 sources - read 20.0% (simple) | 240.64ms | 2.07s | 351.13ms | 435.52ms | 522.40ms | 232.25ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 196.26ms | 1.54s | 242.21ms | 274.13ms | 289.47ms | 182.83ms |
| 1000x12 - 4 sources - dynamic (large) | 351.91ms | 1.87s | 473.28ms | 3.70s | 3.75s | 286.84ms |
| 1000x5 - 25 sources (wide dense) | 477.05ms | 3.49s | 587.60ms | 2.69s | 3.51s | 418.81ms |
| 5x500 - 3 sources (deep) | 205.64ms | 1.16s | 251.79ms | 225.29ms | 227.49ms | 190.62ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 256.73ms | 1.73s | 394.05ms | 457.82ms | 492.07ms | 260.68ms |

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
