# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.34s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.23s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.55s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.95s |
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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 199.91ms | 2.29s | 149.81ms (fail) | 198.35ms | 209.82ms | 282.80ms |
| broadPropagation | 463.49ms | 4.25s | 6.15ms (fail) | 355.50ms | 468.00ms | 503.92ms |
| deepPropagation | 174.87ms | 1.54s | 139.47ms (fail) | 128.24ms | 175.46ms | 165.38ms |
| diamond | 286.98ms | 2.39s | 175.39ms (fail) | 244.64ms | 295.06ms | 348.87ms |
| mux | 402.33ms | 1.75s | 183.75ms (fail) | 364.31ms | 375.48ms | 433.19ms |
| repeatedObservers | 45.65ms | 227.23ms | 55.15ms (fail) | 45.35ms | 41.59ms | 80.39ms |
| triangle | 100.49ms | 756.76ms | 77.75ms (fail) | 89.04ms | 108.58ms | 114.26ms |
| unstable | 75.50ms | 347.28ms | 337.53ms (fail) | 61.98ms | 72.34ms | 95.07ms |
| molBench | 497.94ms | 583.31ms | 1.34ms | 487.13ms | 496.76ms | 487.30ms |
| create_signals | 28.08ms | 85.07ms | 76.50ms | 29.36ms | 5.68ms | 101.88ms |
| comp_0to1 | 12.23ms | 36.02ms | 59.87ms | 8.30ms | 18.51ms | 36.41ms |
| comp_1to1 | 28.38ms | 17.56ms | 59.40ms | 4.33ms | 13.81ms | 37.19ms |
| comp_2to1 | 15.79ms | 24.77ms | 43.83ms | 2.37ms | 16.43ms | 42.88ms |
| comp_4to1 | 1.92ms | 19.35ms | 19.48ms | 7.64ms | 9.04ms | 13.23ms |
| comp_1000to1 | 5μs | 25μs | 46μs | 4μs | 4μs | 14μs |
| comp_1to2 | 17.15ms | 37.14ms | 47.38ms | 16.37ms | 25.68ms | 32.88ms |
| comp_1to4 | 10.19ms | 24.73ms | 46.91ms | 5.61ms | 22.92ms | 14.73ms |
| comp_1to8 | 6.42ms | 24.56ms | 44.99ms | 4.86ms | 9.11ms | 19.71ms |
| comp_1to1000 | 4.23ms | 15.41ms | 41.13ms | 3.65ms | 8.44ms | 13.93ms |
| update_1to1 | 8.96ms | 21.51ms | 7.66ms | 4.64ms | 8.98ms | 15.64ms |
| update_2to1 | 4.45ms | 10.81ms | 2.87ms | 2.38ms | 4.67ms | 7.85ms |
| update_4to1 | 2.29ms | 5.71ms | 2.76ms | 1.24ms | 2.35ms | 3.91ms |
| update_1000to1 | 22μs | 82μs | 14μs | 22μs | 23μs | 39μs |
| update_1to2 | 4.44ms | 10.46ms | 4.42ms | 2.37ms | 4.50ms | 8.22ms |
| update_1to4 | 2.28ms | 5.65ms | 1.48ms | 1.26ms | 2.38ms | 3.94ms |
| update_1to1000 | 74μs | 153μs | 385μs | 63μs | 2.77ms | 148μs |
| cellx1000 | 10.75ms | 77.79ms | 6.15ms | 8.77ms | 10.43ms | 15.65ms |
| cellx2500 | 37.72ms | 308.76ms | 29.63ms | 19.94ms | 31.48ms | 39.49ms |
| cellx5000 | 87.30ms | 608.19ms | 65.67ms | 48.76ms | 83.14ms | 114.88ms |
| 10x5 - 2 sources - read 20.0% (simple) | 494.48ms | 2.01s | 245.28ms | 247.76ms | 477.62ms | 346.94ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.61ms | 1.49s | 203.93ms | 179.05ms | 279.10ms | 248.81ms |
| 1000x12 - 4 sources - dynamic (large) | 3.83s | 1.86s | 347.00ms | 278.98ms | 3.78s | 467.72ms |
| 1000x5 - 25 sources (wide dense) | 3.39s | 3.33s | 515.57ms | 411.26ms | 2.79s | 603.13ms |
| 5x500 - 3 sources (deep) | 224.94ms | 1.12s | 211.18ms | 193.44ms | 236.50ms | 255.63ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 482.59ms | 1.67s | 275.26ms | 265.67ms | 454.44ms | 388.76ms |

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
