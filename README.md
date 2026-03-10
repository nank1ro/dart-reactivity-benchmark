# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.88s |
| 🥈 | signals | 0.28 | 100.0% | 35/35 | 11.07s |
| 🥉 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.51s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.97s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.29s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.63s |

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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 201.69ms | 2.42s | 160.11ms (fail) | 196.87ms | 206.20ms | 277.26ms |
| broadPropagation | 469.40ms | 4.40s | 6.53ms (fail) | 367.47ms | 472.73ms | 524.18ms |
| deepPropagation | 174.22ms | 1.56s | 141.16ms (fail) | 127.78ms | 186.45ms | 173.51ms |
| diamond | 285.96ms | 2.49s | 192.27ms (fail) | 244.96ms | 291.74ms | 355.18ms |
| mux | 404.75ms | 1.83s | 181.64ms (fail) | 376.64ms | 383.04ms | 433.15ms |
| repeatedObservers | 45.83ms | 235.78ms | 58.70ms (fail) | 44.64ms | 42.36ms | 80.79ms |
| triangle | 103.35ms | 791.54ms | 78.03ms (fail) | 89.44ms | 100.27ms | 115.63ms |
| unstable | 75.70ms | 356.25ms | 340.41ms (fail) | 62.27ms | 71.87ms | 96.23ms |
| molBench | 494.85ms | 588.23ms | 1.27ms | 490.36ms | 497.14ms | 493.75ms |
| create_signals | 28.44ms | 78.86ms | 62.25ms | 35.61ms | 5.77ms | 105.81ms |
| comp_0to1 | 13.20ms | 24.84ms | 55.40ms | 9.32ms | 19.43ms | 39.38ms |
| comp_1to1 | 27.21ms | 26.38ms | 62.86ms | 4.81ms | 11.59ms | 53.84ms |
| comp_2to1 | 8.68ms | 9.29ms | 39.43ms | 16.05ms | 12.54ms | 26.38ms |
| comp_4to1 | 2.62ms | 29.62ms | 18.05ms | 1.90ms | 13.78ms | 10.76ms |
| comp_1000to1 | 8μs | 22μs | 45μs | 6μs | 4μs | 15μs |
| comp_1to2 | 19.61ms | 41.78ms | 47.50ms | 11.33ms | 21.07ms | 28.59ms |
| comp_1to4 | 6.88ms | 30.00ms | 45.95ms | 8.38ms | 34.39ms | 20.94ms |
| comp_1to8 | 6.66ms | 26.54ms | 45.65ms | 7.08ms | 6.60ms | 21.54ms |
| comp_1to1000 | 4.25ms | 15.44ms | 41.67ms | 3.71ms | 5.95ms | 14.80ms |
| update_1to1 | 8.91ms | 21.92ms | 9.46ms | 4.68ms | 9.03ms | 15.78ms |
| update_2to1 | 4.46ms | 10.67ms | 2.85ms | 2.33ms | 4.59ms | 8.01ms |
| update_4to1 | 2.23ms | 5.47ms | 2.67ms | 1.17ms | 2.27ms | 3.92ms |
| update_1000to1 | 22μs | 52μs | 15μs | 11μs | 45μs | 39μs |
| update_1to2 | 4.45ms | 10.68ms | 4.20ms | 2.32ms | 4.47ms | 8.09ms |
| update_1to4 | 2.22ms | 5.28ms | 1.49ms | 1.16ms | 2.37ms | 4.03ms |
| update_1to1000 | 43μs | 157μs | 392μs | 34μs | 928μs | 145μs |
| cellx1000 | 10.54ms | 102.04ms | 6.05ms | 8.40ms | 11.64ms | 13.19ms |
| cellx2500 | 39.94ms | 309.01ms | 30.80ms | 24.28ms | 35.22ms | 49.52ms |
| cellx5000 | 97.79ms | 651.51ms | 78.97ms | 59.29ms | 111.94ms | 141.49ms |
| 10x5 - 2 sources - read 20.0% (simple) | 494.81ms | 2.07s | 267.51ms | 237.19ms | 455.71ms | 353.61ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 295.26ms | 1.53s | 233.92ms | 193.38ms | 297.04ms | 269.05ms |
| 1000x12 - 4 sources - dynamic (large) | 3.63s | 2.05s | 371.85ms | 311.45ms | 3.94s | 491.74ms |
| 1000x5 - 25 sources (wide dense) | 3.39s | 3.55s | 544.94ms | 440.03ms | 2.99s | 626.49ms |
| 5x500 - 3 sources (deep) | 227.86ms | 1.20s | 219.80ms | 213.80ms | 247.42ms | 261.93ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 493.46ms | 1.81s | 272.78ms | 277.26ms | 482.13ms | 391.42ms |

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
