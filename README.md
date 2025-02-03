# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.70s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 9.71s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.01s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.36s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.81s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.49s |

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
| Test Case | solidart | mobx | state_beacon | signals | alien_signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.20s | 2.33s | 163.53ms (fail) | 211.15ms | 191.66ms | 210.51ms |
| broadPropagation | 5.61s | 4.34s | 6.08ms (fail) | 456.70ms | 347.23ms | 456.35ms |
| deepPropagation | 2.02s | 1.55s | 143.87ms (fail) | 176.35ms | 123.65ms | 175.84ms |
| diamond | 3.48s | 2.42s | 185.85ms (fail) | 285.94ms | 248.91ms | 274.51ms |
| mux | 2.08s | 1.86s | 193.41ms (fail) | 414.32ms | 379.14ms | 385.28ms |
| repeatedObservers | 213.43ms | 234.88ms | 55.72ms (fail) | 44.79ms | 43.95ms | 41.73ms |
| triangle | 1.22s | 766.75ms | 77.78ms (fail) | 102.62ms | 86.06ms | 98.97ms |
| unstable | 342.65ms | 348.46ms | 339.81ms (fail) | 78.29ms | 60.21ms | 69.93ms |
| molBench | 1.75s | 582.00ms | 1.07ms | 486.41ms | 473.92ms | 483.35ms |
| create_signals | 68.60ms | 70.89ms | 71.98ms | 40.15ms | 20.28ms | 4.80ms |
| comp_0to1 | 51.26ms | 20.09ms | 52.01ms | 16.04ms | 5.08ms | 17.05ms |
| comp_1to1 | 44.75ms | 30.11ms | 52.66ms | 24.24ms | 8.86ms | 14.56ms |
| comp_2to1 | 27.94ms | 16.86ms | 33.50ms | 13.73ms | 4.25ms | 18.90ms |
| comp_4to1 | 13.28ms | 18.41ms | 17.11ms | 2.04ms | 8.52ms | 9.48ms |
| comp_1000to1 | 2.18ms | 15μs | 43μs | 5μs | 3μs | 8μs |
| comp_1to2 | 32.30ms | 35.21ms | 45.83ms | 16.28ms | 13.86ms | 24.45ms |
| comp_1to4 | 28.95ms | 23.76ms | 43.17ms | 15.87ms | 8.35ms | 24.28ms |
| comp_1to8 | 24.06ms | 21.17ms | 43.47ms | 7.00ms | 3.82ms | 7.00ms |
| comp_1to1000 | 18.86ms | 15.57ms | 40.45ms | 6.73ms | 3.60ms | 4.61ms |
| update_1to1 | 43.56ms | 27.58ms | 8.94ms | 10.04ms | 4.35ms | 8.75ms |
| update_2to1 | 21.45ms | 14.24ms | 2.91ms | 4.73ms | 2.22ms | 4.36ms |
| update_4to1 | 10.86ms | 7.13ms | 2.07ms | 2.41ms | 1.16ms | 2.17ms |
| update_1000to1 | 117μs | 70μs | 15μs | 23μs | 11μs | 24μs |
| update_1to2 | 21.58ms | 14.16ms | 4.06ms | 4.73ms | 2.23ms | 4.35ms |
| update_1to4 | 11.13ms | 6.85ms | 1.49ms | 2.35ms | 1.17ms | 2.21ms |
| update_1to1000 | 261μs | 164μs | 409μs | 46μs | 49μs | 155μs |
| cellx1000 | 158.89ms | 72.42ms | 5.12ms | 9.78ms | 7.55ms | 9.87ms |
| cellx2500 | 488.10ms | 261.25ms | 18.48ms | 30.85ms | 20.11ms | 28.20ms |
| cellx5000 | 1.07s | 559.25ms | 56.44ms | 61.60ms | 43.48ms | 73.32ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.63s (partial) | 1.99s | 261.36ms | 517.67ms | 234.87ms | 425.13ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.37s (partial) | 1.51s | 206.76ms | 276.89ms | 181.18ms | 266.95ms |
| 1000x12 - 4 sources - dynamic (large) | 4.09s (partial) | 1.84s | 342.75ms | 3.43s | 286.23ms | 3.38s |
| 1000x5 - 25 sources (wide dense) | 4.89s (partial) | 3.51s | 517.58ms | 3.54s | 404.64ms | 2.52s |
| 5x500 - 3 sources (deep) | 2.02s (partial) | 1.15s | 232.47ms | 231.12ms | 207.85ms | 227.52ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.74s (partial) | 1.72s | 266.81ms | 481.79ms | 269.47ms | 443.16ms |

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
