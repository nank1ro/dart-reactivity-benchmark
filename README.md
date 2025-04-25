# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.65 | 100.0% | 35/35 | 3.72s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.56s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.09s |
| 4 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.40s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.63s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| Test Case | solidart(2.0-dev) | preact_signals | alien_signals | state_beacon | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 269.70ms | 208.85ms | 185.22ms | 150.17ms (fail) | 2.35s | 207.42ms |
| broadPropagation | 506.86ms | 459.72ms | 354.42ms | 5.82ms (fail) | 4.33s | 454.70ms |
| deepPropagation | 168.40ms | 181.21ms | 122.61ms | 137.69ms (fail) | 1.52s | 174.41ms |
| diamond | 347.17ms | 276.20ms | 232.93ms | 175.33ms (fail) | 2.42s | 283.01ms |
| mux | 436.17ms | 385.04ms | 376.59ms | 192.31ms (fail) | 1.83s | 404.12ms |
| repeatedObservers | 77.78ms | 38.30ms | 45.09ms | 52.30ms (fail) | 228.09ms | 47.59ms |
| triangle | 117.30ms | 99.08ms | 88.83ms | 75.93ms (fail) | 769.51ms | 100.64ms |
| unstable | 93.57ms | 70.58ms | 60.99ms | 339.81ms (fail) | 352.25ms | 72.27ms |
| molBench | 493.01ms | 491.25ms | 492.62ms | 1.09ms | 585.41ms | 489.94ms |
| create_signals | 94.01ms | 5.45ms | 29.51ms | 70.05ms | 74.47ms | 26.18ms |
| comp_0to1 | 36.27ms | 17.85ms | 8.06ms | 62.67ms | 26.43ms | 13.86ms |
| comp_1to1 | 52.80ms | 11.81ms | 4.33ms | 59.56ms | 37.61ms | 19.76ms |
| comp_2to1 | 43.72ms | 17.09ms | 2.33ms | 43.89ms | 37.60ms | 11.71ms |
| comp_4to1 | 17.03ms | 12.31ms | 7.78ms | 18.52ms | 14.38ms | 1.92ms |
| comp_1000to1 | 15μs | 4μs | 3μs | 41μs | 22μs | 4μs |
| comp_1to2 | 36.62ms | 16.28ms | 11.20ms | 44.94ms | 36.74ms | 22.81ms |
| comp_1to4 | 20.94ms | 26.62ms | 12.73ms | 44.00ms | 20.24ms | 9.54ms |
| comp_1to8 | 23.52ms | 5.94ms | 4.06ms | 43.07ms | 23.77ms | 6.50ms |
| comp_1to1000 | 14.78ms | 6.66ms | 3.29ms | 37.98ms | 15.19ms | 4.76ms |
| update_1to1 | 16.19ms | 8.16ms | 11.37ms | 5.72ms | 23.98ms | 9.81ms |
| update_2to1 | 7.99ms | 4.07ms | 5.12ms | 2.90ms | 12.20ms | 4.58ms |
| update_4to1 | 4.04ms | 2.08ms | 2.83ms | 1.49ms | 6.60ms | 2.32ms |
| update_1000to1 | 40μs | 20μs | 24μs | 15μs | 68μs | 22μs |
| update_1to2 | 8.09ms | 4.06ms | 5.64ms | 2.96ms | 12.88ms | 4.93ms |
| update_1to4 | 4.04ms | 2.07ms | 2.49ms | 1.48ms | 6.31ms | 2.31ms |
| update_1to1000 | 149μs | 1.22ms | 47μs | 381μs | 203μs | 43μs |
| cellx1000 | 13.50ms | 10.08ms | 7.39ms | 5.97ms | 87.14ms | 9.95ms |
| cellx2500 | 46.34ms | 33.79ms | 21.70ms | 31.11ms | 286.30ms | 39.34ms |
| cellx5000 | 145.07ms | 99.09ms | 63.70ms | 83.68ms | 605.98ms | 86.94ms |
| 10x5 - 2 sources - read 20.0% (simple) | 349.97ms | 447.95ms | 231.21ms | 237.46ms | 2.04s | 495.00ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 244.17ms | 274.48ms | 177.99ms | 215.38ms | 1.55s | 278.86ms |
| 1000x12 - 4 sources - dynamic (large) | 474.79ms | 3.57s | 282.09ms | 355.15ms | 1.92s | 4.02s |
| 1000x5 - 25 sources (wide dense) | 599.08ms | 2.62s | 414.31ms | 492.02ms | 3.52s | 3.54s |
| 5x500 - 3 sources (deep) | 259.10ms | 231.55ms | 189.62ms | 208.91ms | 1.18s | 230.32ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 378.02ms | 450.33ms | 266.42ms | 259.87ms | 1.71s | 477.86ms |

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
