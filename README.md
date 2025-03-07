# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.29s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 9.95s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.37s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.43s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.44s |

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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 274.80ms | 205.06ms | 2.30s | 186.11ms | 212.40ms | 151.66ms (fail) |
| broadPropagation | 511.22ms | 453.11ms | 4.27s | 352.91ms | 461.26ms | 6.42ms (fail) |
| deepPropagation | 176.09ms | 180.81ms | 1.55s | 124.56ms | 180.61ms | 141.51ms (fail) |
| diamond | 358.63ms | 287.91ms | 2.36s | 237.12ms | 291.25ms | 195.50ms (fail) |
| mux | 439.96ms | 388.93ms | 1.81s | 376.75ms | 406.92ms | 190.68ms (fail) |
| repeatedObservers | 78.18ms | 39.06ms | 224.31ms | 45.44ms | 46.17ms | 52.39ms (fail) |
| triangle | 116.96ms | 103.05ms | 764.93ms | 84.03ms | 104.25ms | 76.12ms (fail) |
| unstable | 93.81ms | 71.56ms | 349.15ms | 60.59ms | 74.20ms | 336.81ms (fail) |
| molBench | 492.36ms | 492.33ms | 579.14ms | 490.85ms | 488.00ms | 1.08ms |
| create_signals | 52.97ms | 4.78ms | 59.31ms | 20.03ms | 25.58ms | 68.92ms |
| comp_0to1 | 26.98ms | 17.65ms | 18.61ms | 8.56ms | 12.13ms | 56.69ms |
| comp_1to1 | 28.52ms | 14.31ms | 30.19ms | 4.25ms | 18.81ms | 58.19ms |
| comp_2to1 | 37.17ms | 20.47ms | 22.12ms | 2.37ms | 17.76ms | 38.07ms |
| comp_4to1 | 4.55ms | 13.91ms | 14.51ms | 8.82ms | 3.53ms | 18.39ms |
| comp_1000to1 | 19μs | 4μs | 15μs | 4μs | 5μs | 46μs |
| comp_1to2 | 38.59ms | 18.30ms | 36.19ms | 19.19ms | 11.82ms | 49.35ms |
| comp_1to4 | 20.20ms | 36.54ms | 26.05ms | 4.90ms | 12.43ms | 47.81ms |
| comp_1to8 | 24.21ms | 8.04ms | 21.43ms | 4.97ms | 7.40ms | 47.17ms |
| comp_1to1000 | 15.14ms | 5.97ms | 15.18ms | 3.39ms | 4.55ms | 42.91ms |
| update_1to1 | 16.20ms | 8.25ms | 23.82ms | 11.25ms | 9.26ms | 5.73ms |
| update_2to1 | 7.97ms | 4.05ms | 12.13ms | 4.74ms | 4.59ms | 2.87ms |
| update_4to1 | 4.39ms | 2.10ms | 5.90ms | 2.77ms | 2.30ms | 1.47ms |
| update_1000to1 | 41μs | 27μs | 68μs | 10μs | 23μs | 15μs |
| update_1to2 | 8.10ms | 4.11ms | 12.23ms | 5.60ms | 5.02ms | 2.96ms |
| update_1to4 | 4.08ms | 2.11ms | 5.88ms | 1.73ms | 3.01ms | 1.50ms |
| update_1to1000 | 152μs | 187μs | 164μs | 47μs | 65μs | 428μs |
| cellx1000 | 11.17ms | 9.81ms | 77.82ms | 9.90ms | 9.58ms | 5.58ms |
| cellx2500 | 36.32ms | 28.04ms | 268.64ms | 20.04ms | 34.37ms | 25.17ms |
| cellx5000 | 89.02ms | 84.05ms | 568.15ms | 50.58ms | 74.26ms | 61.77ms |
| 10x5 - 2 sources - read 20.0% (simple) | 354.06ms | 441.39ms | 2.03s | 233.33ms | 504.79ms | 243.02ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 244.06ms | 277.38ms | 1.55s | 176.90ms | 278.58ms | 200.78ms |
| 1000x12 - 4 sources - dynamic (large) | 467.63ms | 3.47s | 1.91s | 291.02ms | 3.80s | 346.47ms |
| 1000x5 - 25 sources (wide dense) | 599.26ms | 2.58s | 3.61s | 411.33ms | 3.56s | 497.98ms |
| 5x500 - 3 sources (deep) | 253.65ms | 232.56ms | 1.16s | 192.77ms | 226.62ms | 205.09ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 399.48ms | 440.94ms | 1.74s | 269.18ms | 480.72ms | 260.49ms |

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
