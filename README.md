# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.68s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.42s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.34s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.26s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.60s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.47s |

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
| Test Case | state_beacon | mobx | solidart(2.0-dev) | preact_signals | signals | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 166.82ms (fail) | 2.32s | 286.94ms | 211.96ms | 206.84ms | 194.92ms |
| broadPropagation | 5.80ms (fail) | 4.41s | 502.58ms | 452.91ms | 448.68ms | 342.69ms |
| deepPropagation | 136.96ms (fail) | 1.56s | 172.12ms | 176.35ms | 172.85ms | 124.89ms |
| diamond | 189.48ms (fail) | 2.43s | 348.97ms | 278.67ms | 279.25ms | 229.13ms |
| mux | 190.94ms (fail) | 1.85s | 442.54ms | 402.17ms | 405.41ms | 376.68ms |
| repeatedObservers | 52.45ms (fail) | 231.92ms | 82.80ms | 39.68ms | 44.63ms | 45.34ms |
| triangle | 75.76ms (fail) | 768.10ms | 121.23ms | 98.59ms | 100.85ms | 85.21ms |
| unstable | 335.67ms (fail) | 351.78ms | 98.55ms | 69.85ms | 80.24ms | 67.53ms |
| molBench | 979μs | 584.44ms | 493.63ms | 490.13ms | 485.46ms | 486.30ms |
| create_signals | 61.11ms | 51.85ms | 76.01ms | 5.26ms | 24.57ms | 27.96ms |
| comp_0to1 | 53.95ms | 19.79ms | 38.98ms | 17.36ms | 10.63ms | 7.72ms |
| comp_1to1 | 56.25ms | 30.35ms | 47.76ms | 10.99ms | 27.12ms | 4.20ms |
| comp_2to1 | 36.65ms | 9.15ms | 37.59ms | 10.75ms | 8.40ms | 2.33ms |
| comp_4to1 | 16.39ms | 31.12ms | 5.09ms | 20.61ms | 1.84ms | 8.42ms |
| comp_1000to1 | 42μs | 23μs | 26μs | 5μs | 5μs | 5μs |
| comp_1to2 | 46.40ms | 32.71ms | 37.98ms | 25.23ms | 15.41ms | 13.12ms |
| comp_1to4 | 44.69ms | 25.49ms | 23.39ms | 24.63ms | 8.11ms | 8.66ms |
| comp_1to8 | 43.47ms | 24.59ms | 24.96ms | 5.35ms | 9.47ms | 5.44ms |
| comp_1to1000 | 39.64ms | 16.34ms | 17.18ms | 5.77ms | 4.50ms | 3.41ms |
| update_1to1 | 5.64ms | 27.17ms | 15.97ms | 8.54ms | 8.94ms | 10.35ms |
| update_2to1 | 3.11ms | 10.91ms | 7.81ms | 4.22ms | 4.55ms | 2.35ms |
| update_4to1 | 1.47ms | 7.47ms | 4.05ms | 2.16ms | 2.24ms | 2.52ms |
| update_1000to1 | 15μs | 71μs | 40μs | 22μs | 22μs | 24μs |
| update_1to2 | 2.89ms | 11.58ms | 8.04ms | 4.69ms | 4.47ms | 5.08ms |
| update_1to4 | 1.47ms | 6.13ms | 4.04ms | 2.15ms | 2.23ms | 2.48ms |
| update_1to1000 | 385μs | 173μs | 172μs | 851μs | 43μs | 45μs |
| cellx1000 | 5.24ms | 77.35ms | 13.18ms | 9.70ms | 9.50ms | 7.13ms |
| cellx2500 | 24.88ms | 284.80ms | 35.67ms | 26.53ms | 31.62ms | 19.88ms |
| cellx5000 | 70.29ms | 579.59ms | 93.39ms | 73.31ms | 67.33ms | 45.95ms |
| 10x5 - 2 sources - read 20.0% (simple) | 254.79ms | 2.06s | 358.29ms | 437.87ms | 518.46ms | 230.04ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 221.64ms | 1.51s | 244.46ms | 269.99ms | 278.98ms | 176.89ms |
| 1000x12 - 4 sources - dynamic (large) | 349.47ms | 1.87s | 460.63ms | 3.69s | 3.88s | 281.54ms |
| 1000x5 - 25 sources (wide dense) | 506.30ms | 3.54s | 590.68ms | 2.70s | 3.56s | 411.74ms |
| 5x500 - 3 sources (deep) | 203.57ms | 1.16s | 260.98ms | 229.25ms | 224.15ms | 187.19ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 270.31ms | 1.73s | 381.95ms | 450.92ms | 486.43ms | 265.43ms |

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
