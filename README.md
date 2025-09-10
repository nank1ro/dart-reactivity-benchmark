# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.29s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.38s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.60s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.39s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.50s |

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
| avoidablePropagation | 201.27ms | 162.11ms (fail) | 258.96ms | 213.02ms | 195.49ms | 2.36s |
| broadPropagation | 481.13ms | 6.93ms (fail) | 494.48ms | 465.71ms | 352.50ms | 4.38s |
| deepPropagation | 181.88ms | 141.18ms (fail) | 165.41ms | 181.41ms | 127.15ms | 1.54s |
| diamond | 282.36ms | 206.98ms (fail) | 355.69ms | 287.32ms | 236.72ms | 2.41s |
| mux | 394.61ms | 191.33ms (fail) | 435.16ms | 412.39ms | 381.88ms | 1.83s |
| repeatedObservers | 40.68ms | 52.58ms (fail) | 80.61ms | 47.40ms | 43.73ms | 231.43ms |
| triangle | 99.25ms | 79.93ms (fail) | 114.88ms | 101.42ms | 91.24ms | 774.06ms |
| unstable | 74.59ms | 343.60ms (fail) | 95.74ms | 77.07ms | 59.52ms | 347.00ms |
| molBench | 487.86ms | 963μs | 479.08ms | 489.17ms | 490.19ms | 581.70ms |
| create_signals | 5.40ms | 66.55ms | 95.73ms | 24.72ms | 24.36ms | 89.03ms |
| comp_0to1 | 17.71ms | 58.29ms | 29.32ms | 11.54ms | 8.65ms | 28.39ms |
| comp_1to1 | 15.00ms | 57.96ms | 49.74ms | 27.21ms | 4.14ms | 45.82ms |
| comp_2to1 | 20.18ms | 37.77ms | 36.29ms | 8.66ms | 2.31ms | 22.38ms |
| comp_4to1 | 11.42ms | 16.93ms | 19.79ms | 1.92ms | 7.58ms | 27.38ms |
| comp_1000to1 | 6μs | 44μs | 16μs | 5μs | 3μs | 25μs |
| comp_1to2 | 17.61ms | 48.58ms | 31.98ms | 23.13ms | 13.50ms | 38.74ms |
| comp_1to4 | 26.40ms | 46.89ms | 21.30ms | 9.20ms | 15.87ms | 23.03ms |
| comp_1to8 | 5.36ms | 46.34ms | 22.53ms | 11.91ms | 4.87ms | 23.78ms |
| comp_1to1000 | 6.99ms | 41.58ms | 14.72ms | 7.22ms | 3.53ms | 15.50ms |
| update_1to1 | 8.35ms | 6.25ms | 17.54ms | 10.26ms | 10.12ms | 26.66ms |
| update_2to1 | 4.35ms | 3.10ms | 8.50ms | 4.68ms | 2.17ms | 13.11ms |
| update_4to1 | 2.12ms | 1.55ms | 4.34ms | 2.58ms | 2.46ms | 7.08ms |
| update_1000to1 | 20μs | 15μs | 42μs | 25μs | 26μs | 71μs |
| update_1to2 | 4.07ms | 3.01ms | 8.91ms | 5.52ms | 4.94ms | 13.98ms |
| update_1to4 | 2.12ms | 1.54ms | 4.38ms | 2.60ms | 2.43ms | 6.46ms |
| update_1to1000 | 870μs | 425μs | 154μs | 42μs | 35μs | 172μs |
| cellx1000 | 10.16ms | 5.28ms | 12.17ms | 9.55ms | 7.20ms | 68.88ms |
| cellx2500 | 32.35ms | 27.50ms | 31.91ms | 32.23ms | 19.50ms | 246.37ms |
| cellx5000 | 72.31ms | 63.16ms | 70.37ms | 64.43ms | 43.92ms | 539.24ms |
| 10x5 - 2 sources - read 20.0% (simple) | 517.95ms | 248.28ms | 358.00ms | 519.26ms | 241.66ms | 2.01s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 289.45ms | 200.22ms | 249.95ms | 283.97ms | 178.42ms | 1.55s |
| 1000x12 - 4 sources - dynamic (large) | 3.82s | 342.89ms | 470.37ms | 3.76s | 283.87ms | 1.86s |
| 1000x5 - 25 sources (wide dense) | 2.74s | 515.52ms | 606.47ms | 3.58s | 406.09ms | 3.48s |
| 5x500 - 3 sources (deep) | 248.63ms | 213.25ms | 256.09ms | 225.89ms | 192.69ms | 1.12s |
| 100x15 - 6 sources - dynamic (very dynamic) | 475.08ms | 260.06ms | 386.96ms | 490.53ms | 259.52ms | 1.70s |

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
