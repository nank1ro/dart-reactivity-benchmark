# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.63s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.48s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.39s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.42s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.40s |
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
| Test Case | state_beacon | alien_signals | mobx | solidart(2.0-dev) | signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 146.93ms (fail) | 186.98ms | 2.37s | 276.40ms | 209.25ms | 203.12ms |
| broadPropagation | 6.05ms (fail) | 346.72ms | 4.52s | 500.38ms | 449.78ms | 498.80ms |
| deepPropagation | 142.51ms (fail) | 122.80ms | 1.56s | 171.06ms | 176.06ms | 177.04ms |
| diamond | 186.96ms (fail) | 231.63ms | 2.48s | 346.89ms | 279.28ms | 297.80ms |
| mux | 198.42ms (fail) | 371.65ms | 1.87s | 444.99ms | 447.12ms | 406.19ms |
| repeatedObservers | 55.17ms (fail) | 45.77ms | 239.79ms | 81.15ms | 44.84ms | 41.27ms |
| triangle | 78.25ms (fail) | 85.97ms | 792.31ms | 116.86ms | 101.76ms | 105.73ms |
| unstable | 337.92ms (fail) | 67.23ms | 353.75ms | 97.99ms | 79.16ms | 73.89ms |
| molBench | 942μs | 383.47ms | 579.40ms | 493.55ms | 486.81ms | 491.53ms |
| create_signals | 61.57ms | 27.55ms | 91.89ms | 79.08ms | 26.88ms | 5.27ms |
| comp_0to1 | 54.73ms | 7.27ms | 17.59ms | 28.77ms | 11.94ms | 17.86ms |
| comp_1to1 | 60.75ms | 4.56ms | 50.61ms | 30.81ms | 27.82ms | 14.93ms |
| comp_2to1 | 39.69ms | 2.31ms | 35.10ms | 33.16ms | 11.87ms | 21.62ms |
| comp_4to1 | 17.02ms | 10.06ms | 15.02ms | 14.20ms | 2.00ms | 8.76ms |
| comp_1000to1 | 42μs | 4μs | 18μs | 17μs | 5μs | 4μs |
| comp_1to2 | 45.77ms | 12.38ms | 38.39ms | 50.85ms | 19.79ms | 24.86ms |
| comp_1to4 | 46.99ms | 11.82ms | 18.67ms | 22.96ms | 14.47ms | 22.28ms |
| comp_1to8 | 45.67ms | 5.33ms | 22.32ms | 23.77ms | 7.11ms | 9.43ms |
| comp_1to1000 | 38.95ms | 3.48ms | 16.37ms | 16.92ms | 4.22ms | 8.42ms |
| update_1to1 | 5.64ms | 10.34ms | 23.89ms | 16.00ms | 8.99ms | 8.79ms |
| update_2to1 | 3.13ms | 2.25ms | 12.18ms | 7.80ms | 4.53ms | 4.27ms |
| update_4to1 | 1.45ms | 2.66ms | 6.37ms | 4.10ms | 2.23ms | 2.20ms |
| update_1000to1 | 15μs | 24μs | 71μs | 40μs | 22μs | 21μs |
| update_1to2 | 2.86ms | 5.12ms | 12.08ms | 8.05ms | 4.54ms | 4.60ms |
| update_1to4 | 1.47ms | 2.50ms | 6.04ms | 4.03ms | 2.43ms | 2.16ms |
| update_1to1000 | 379μs | 33μs | 183μs | 170μs | 43μs | 2.90ms |
| cellx1000 | 6.00ms | 7.39ms | 87.80ms | 16.58ms | 9.69ms | 10.98ms |
| cellx2500 | 30.34ms | 23.25ms | 300.33ms | 55.62ms | 35.45ms | 34.90ms |
| cellx5000 | 69.96ms | 63.27ms | 639.89ms | 133.91ms | 83.56ms | 99.90ms |
| 10x5 - 2 sources - read 20.0% (simple) | 257.77ms | 238.35ms | 2.08s | 352.80ms | 572.75ms | 441.13ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 219.87ms | 187.81ms | 1.59s | 249.69ms | 286.27ms | 268.47ms |
| 1000x12 - 4 sources - dynamic (large) | 355.13ms | 286.85ms | 2.00s | 475.31ms | 3.78s | 3.72s |
| 1000x5 - 25 sources (wide dense) | 511.13ms | 415.36ms | 3.62s | 597.51ms | 3.56s | 2.70s |
| 5x500 - 3 sources (deep) | 207.19ms | 194.82ms | 1.21s | 253.27ms | 229.38ms | 231.42ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 265.92ms | 266.37ms | 1.73s | 385.69ms | 490.59ms | 455.95ms |

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
