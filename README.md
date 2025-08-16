# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.23s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.34s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.28s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.26s |
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
| Test Case | mobx | state_beacon | preact_signals | alien_signals | solidart(2.0-dev) | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.35s | 161.38ms (fail) | 202.48ms | 192.90ms | 260.27ms | 219.78ms |
| broadPropagation | 4.35s | 6.28ms (fail) | 465.98ms | 347.92ms | 499.33ms | 465.28ms |
| deepPropagation | 1.53s | 140.25ms (fail) | 180.60ms | 122.95ms | 162.82ms | 185.65ms |
| diamond | 2.41s | 183.52ms (fail) | 279.59ms | 235.83ms | 343.37ms | 286.76ms |
| mux | 1.81s | 194.42ms (fail) | 393.88ms | 374.69ms | 427.00ms | 415.79ms |
| repeatedObservers | 235.87ms | 52.68ms (fail) | 39.98ms | 43.73ms | 81.36ms | 47.35ms |
| triangle | 763.02ms | 75.35ms (fail) | 98.39ms | 89.44ms | 113.28ms | 100.69ms |
| unstable | 343.37ms | 340.28ms (fail) | 76.80ms | 60.25ms | 95.98ms | 76.16ms |
| molBench | 581.40ms | 982μs | 482.80ms | 489.25ms | 500.70ms | 484.88ms |
| create_signals | 79.29ms | 67.06ms | 4.62ms | 26.90ms | 91.92ms | 23.87ms |
| comp_0to1 | 19.41ms | 60.28ms | 17.00ms | 7.28ms | 35.03ms | 11.05ms |
| comp_1to1 | 25.00ms | 63.89ms | 11.01ms | 4.15ms | 42.47ms | 26.97ms |
| comp_2to1 | 8.93ms | 44.59ms | 11.66ms | 2.28ms | 27.31ms | 13.64ms |
| comp_4to1 | 28.61ms | 18.73ms | 16.13ms | 8.34ms | 11.42ms | 3.64ms |
| comp_1000to1 | 16μs | 46μs | 9μs | 5μs | 15μs | 5μs |
| comp_1to2 | 37.38ms | 49.58ms | 19.32ms | 19.45ms | 32.86ms | 13.08ms |
| comp_1to4 | 23.46ms | 47.81ms | 35.02ms | 5.43ms | 14.55ms | 11.47ms |
| comp_1to8 | 21.50ms | 47.33ms | 5.56ms | 6.73ms | 19.00ms | 6.71ms |
| comp_1to1000 | 15.26ms | 42.86ms | 6.58ms | 3.42ms | 13.83ms | 4.31ms |
| update_1to1 | 27.10ms | 6.01ms | 8.29ms | 10.08ms | 16.41ms | 10.27ms |
| update_2to1 | 12.80ms | 3.13ms | 4.40ms | 2.16ms | 8.03ms | 4.52ms |
| update_4to1 | 7.23ms | 1.65ms | 2.11ms | 1.19ms | 4.13ms | 2.54ms |
| update_1000to1 | 70μs | 15μs | 20μs | 10μs | 39μs | 25μs |
| update_1to2 | 13.33ms | 3.04ms | 4.07ms | 4.98ms | 8.36ms | 4.58ms |
| update_1to4 | 7.14ms | 1.55ms | 2.08ms | 2.34ms | 4.09ms | 2.55ms |
| update_1to1000 | 180μs | 416μs | 781μs | 46μs | 149μs | 43μs |
| cellx1000 | 70.25ms | 5.06ms | 9.59ms | 7.28ms | 11.87ms | 9.54ms |
| cellx2500 | 260.01ms | 22.14ms | 25.79ms | 19.52ms | 31.26ms | 30.93ms |
| cellx5000 | 577.54ms | 53.36ms | 69.09ms | 44.83ms | 69.70ms | 60.85ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.02s | 239.98ms | 452.35ms | 235.94ms | 352.49ms | 506.26ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.50s | 195.51ms | 278.18ms | 180.32ms | 248.23ms | 292.89ms |
| 1000x12 - 4 sources - dynamic (large) | 1.88s | 348.88ms | 3.68s | 284.94ms | 459.98ms | 3.75s |
| 1000x5 - 25 sources (wide dense) | 3.47s | 508.76ms | 2.70s | 398.82ms | 608.82ms | 3.57s |
| 5x500 - 3 sources (deep) | 1.10s | 203.90ms | 230.02ms | 192.71ms | 247.31ms | 227.13ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.66s | 260.01ms | 453.22ms | 266.15ms | 383.19ms | 470.76ms |

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
