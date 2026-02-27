# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.31s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 10.95s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.49s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.66s |
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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 201.94ms | 2.25s | 144.03ms (fail) | 196.90ms | 208.37ms | 276.50ms |
| broadPropagation | 460.62ms | 4.18s | 6.57ms (fail) | 355.06ms | 452.15ms | 500.40ms |
| deepPropagation | 174.70ms | 1.51s | 136.88ms (fail) | 126.29ms | 178.78ms | 168.32ms |
| diamond | 284.56ms | 2.37s | 204.10ms (fail) | 247.30ms | 282.29ms | 349.59ms |
| mux | 405.26ms | 1.76s | 180.15ms (fail) | 364.61ms | 379.19ms | 423.30ms |
| repeatedObservers | 46.27ms | 221.50ms | 57.99ms (fail) | 44.77ms | 41.65ms | 80.47ms |
| triangle | 102.33ms | 734.22ms | 76.88ms (fail) | 88.47ms | 102.46ms | 114.25ms |
| unstable | 76.05ms | 329.43ms | 333.89ms (fail) | 62.44ms | 72.94ms | 96.27ms |
| molBench | 494.16ms | 586.55ms | 1.45ms | 486.35ms | 495.02ms | 490.80ms |
| create_signals | 27.70ms | 72.90ms | 69.93ms | 23.68ms | 4.91ms | 59.34ms |
| comp_0to1 | 11.97ms | 28.39ms | 60.35ms | 7.34ms | 19.19ms | 26.43ms |
| comp_1to1 | 25.02ms | 37.88ms | 58.73ms | 4.32ms | 12.99ms | 44.40ms |
| comp_2to1 | 8.53ms | 35.59ms | 38.36ms | 2.30ms | 18.47ms | 25.17ms |
| comp_4to1 | 1.89ms | 15.27ms | 19.35ms | 7.78ms | 9.68ms | 9.91ms |
| comp_1000to1 | 5μs | 14μs | 43μs | 3μs | 6μs | 16μs |
| comp_1to2 | 16.34ms | 40.76ms | 52.48ms | 15.30ms | 28.51ms | 31.39ms |
| comp_1to4 | 11.46ms | 18.04ms | 48.36ms | 9.21ms | 28.38ms | 20.99ms |
| comp_1to8 | 7.25ms | 21.13ms | 44.00ms | 3.83ms | 6.77ms | 22.62ms |
| comp_1to1000 | 6.29ms | 15.43ms | 39.27ms | 3.38ms | 5.53ms | 14.43ms |
| update_1to1 | 8.92ms | 21.39ms | 9.61ms | 4.63ms | 9.01ms | 15.68ms |
| update_2to1 | 4.48ms | 10.40ms | 2.85ms | 2.38ms | 4.55ms | 7.83ms |
| update_4to1 | 2.28ms | 5.35ms | 3.04ms | 1.22ms | 2.32ms | 4.02ms |
| update_1000to1 | 24μs | 51μs | 14μs | 11μs | 32μs | 39μs |
| update_1to2 | 4.42ms | 10.57ms | 4.63ms | 2.35ms | 4.45ms | 8.05ms |
| update_1to4 | 2.25ms | 5.28ms | 1.47ms | 1.22ms | 2.35ms | 3.95ms |
| update_1to1000 | 40μs | 156μs | 380μs | 47μs | 842μs | 148μs |
| cellx1000 | 10.02ms | 78.78ms | 5.56ms | 7.35ms | 9.88ms | 13.40ms |
| cellx2500 | 38.19ms | 281.20ms | 31.55ms | 23.06ms | 34.07ms | 45.70ms |
| cellx5000 | 89.26ms | 602.18ms | 82.31ms | 64.46ms | 88.80ms | 125.80ms |
| 10x5 - 2 sources - read 20.0% (simple) | 503.44ms | 1.91s | 239.17ms | 244.29ms | 450.61ms | 356.31ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.93ms | 1.47s | 205.60ms | 184.21ms | 277.85ms | 256.65ms |
| 1000x12 - 4 sources - dynamic (large) | 3.60s | 1.85s | 359.53ms | 283.59ms | 3.78s | 467.96ms |
| 1000x5 - 25 sources (wide dense) | 3.35s | 3.40s | 517.08ms | 406.01ms | 2.79s | 601.12ms |
| 5x500 - 3 sources (deep) | 222.38ms | 1.13s | 209.97ms | 190.63ms | 230.94ms | 259.04ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 475.68ms | 1.68s | 256.91ms | 262.31ms | 454.05ms | 385.06ms |

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
