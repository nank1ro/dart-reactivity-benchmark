# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.24s |
| 🥉 | preact_signals | 0.30 | 100.0% | 35/35 | 10.33s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 11.17s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.57s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.51s |

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
| avoidablePropagation | 202.51ms | 149.95ms (fail) | 262.07ms | 214.13ms | 192.30ms | 2.34s |
| broadPropagation | 455.26ms | 6.47ms (fail) | 496.66ms | 461.38ms | 352.44ms | 4.44s |
| deepPropagation | 181.38ms | 143.44ms (fail) | 164.43ms | 173.75ms | 125.44ms | 1.57s |
| diamond | 283.07ms | 202.22ms (fail) | 344.14ms | 293.10ms | 236.13ms | 2.43s |
| mux | 385.06ms | 191.89ms (fail) | 434.26ms | 410.20ms | 377.04ms | 1.85s |
| repeatedObservers | 41.02ms | 53.61ms (fail) | 80.69ms | 44.19ms | 43.53ms | 226.88ms |
| triangle | 98.97ms | 86.48ms (fail) | 113.60ms | 102.78ms | 86.87ms | 775.43ms |
| unstable | 74.66ms | 344.55ms (fail) | 95.77ms | 72.43ms | 62.18ms | 341.68ms |
| molBench | 480.88ms | 1.24ms | 498.51ms | 486.08ms | 489.77ms | 583.54ms |
| create_signals | 5.26ms | 61.01ms | 55.76ms | 25.00ms | 23.37ms | 72.52ms |
| comp_0to1 | 17.27ms | 55.49ms | 24.99ms | 11.31ms | 7.42ms | 25.96ms |
| comp_1to1 | 10.70ms | 56.87ms | 43.77ms | 28.53ms | 4.28ms | 18.22ms |
| comp_2to1 | 11.78ms | 38.71ms | 23.98ms | 10.73ms | 2.28ms | 11.87ms |
| comp_4to1 | 9.73ms | 16.82ms | 13.72ms | 6.71ms | 9.97ms | 20.81ms |
| comp_1000to1 | 4μs | 44μs | 15μs | 7μs | 5μs | 17μs |
| comp_1to2 | 26.35ms | 47.60ms | 46.71ms | 21.26ms | 17.00ms | 42.06ms |
| comp_1to4 | 25.48ms | 45.98ms | 19.63ms | 7.27ms | 9.00ms | 29.99ms |
| comp_1to8 | 12.86ms | 45.17ms | 19.80ms | 6.53ms | 6.96ms | 23.39ms |
| comp_1to1000 | 5.25ms | 41.49ms | 14.15ms | 4.57ms | 3.50ms | 15.90ms |
| update_1to1 | 8.36ms | 6.06ms | 16.23ms | 10.25ms | 10.20ms | 26.38ms |
| update_2to1 | 4.42ms | 3.15ms | 8.05ms | 4.54ms | 2.12ms | 13.55ms |
| update_4to1 | 2.07ms | 1.55ms | 4.09ms | 2.59ms | 2.54ms | 5.86ms |
| update_1000to1 | 20μs | 15μs | 40μs | 25μs | 23μs | 69μs |
| update_1to2 | 4.09ms | 3.06ms | 8.24ms | 4.52ms | 5.04ms | 13.22ms |
| update_1to4 | 2.06ms | 1.55ms | 4.03ms | 2.56ms | 2.17ms | 7.02ms |
| update_1to1000 | 44μs | 410μs | 147μs | 43μs | 47μs | 186μs |
| cellx1000 | 9.96ms | 5.10ms | 15.13ms | 9.61ms | 7.78ms | 76.73ms |
| cellx2500 | 27.13ms | 26.86ms | 34.20ms | 31.71ms | 20.01ms | 229.39ms |
| cellx5000 | 73.12ms | 63.58ms | 74.50ms | 64.91ms | 48.85ms | 573.32ms |
| 10x5 - 2 sources - read 20.0% (simple) | 447.79ms | 257.92ms | 349.36ms | 511.92ms | 239.81ms | 2.07s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 272.98ms | 206.69ms | 247.75ms | 281.72ms | 180.19ms | 1.51s |
| 1000x12 - 4 sources - dynamic (large) | 3.75s | 356.56ms | 460.50ms | 3.76s | 281.42ms | 1.79s |
| 1000x5 - 25 sources (wide dense) | 2.72s | 517.40ms | 615.00ms | 3.42s | 409.25ms | 3.56s |
| 5x500 - 3 sources (deep) | 228.68ms | 207.91ms | 261.26ms | 219.19ms | 191.23ms | 1.15s |
| 100x15 - 6 sources - dynamic (very dynamic) | 452.78ms | 263.43ms | 385.74ms | 467.70ms | 270.24ms | 1.73s |

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
