# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.20s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.01s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 9.94s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.64s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.39s |

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
| avoidablePropagation | 272.92ms | 210.22ms | 2.30s | 195.95ms | 213.66ms | 155.66ms (fail) |
| broadPropagation | 506.99ms | 457.04ms | 4.25s | 353.24ms | 451.57ms | 6.02ms (fail) |
| deepPropagation | 166.24ms | 175.38ms | 1.54s | 125.14ms | 175.72ms | 139.89ms (fail) |
| diamond | 347.79ms | 299.94ms | 2.44s | 242.09ms | 294.21ms | 184.57ms (fail) |
| mux | 435.71ms | 390.34ms | 1.85s | 370.36ms | 409.33ms | 193.14ms (fail) |
| repeatedObservers | 78.11ms | 39.31ms | 235.60ms | 46.19ms | 46.76ms | 52.85ms (fail) |
| triangle | 115.24ms | 99.47ms | 780.35ms | 87.10ms | 101.31ms | 76.90ms (fail) |
| unstable | 94.04ms | 70.38ms | 362.57ms | 62.68ms | 74.48ms | 338.68ms (fail) |
| molBench | 494.67ms | 491.13ms | 584.93ms | 488.69ms | 488.85ms | 1.17ms |
| create_signals | 54.91ms | 4.47ms | 77.02ms | 24.76ms | 25.39ms | 59.88ms |
| comp_0to1 | 26.32ms | 23.09ms | 26.49ms | 7.95ms | 11.09ms | 52.56ms |
| comp_1to1 | 41.58ms | 15.67ms | 30.48ms | 4.16ms | 26.25ms | 53.70ms |
| comp_2to1 | 35.00ms | 23.70ms | 33.26ms | 2.22ms | 8.95ms | 35.95ms |
| comp_4to1 | 4.63ms | 13.62ms | 16.69ms | 7.64ms | 1.99ms | 16.24ms |
| comp_1000to1 | 28μs | 4μs | 15μs | 3μs | 5μs | 41μs |
| comp_1to2 | 26.44ms | 23.23ms | 34.31ms | 9.73ms | 14.26ms | 45.30ms |
| comp_1to4 | 22.72ms | 20.24ms | 17.36ms | 11.79ms | 11.61ms | 43.94ms |
| comp_1to8 | 22.34ms | 8.81ms | 19.30ms | 4.79ms | 8.56ms | 43.17ms |
| comp_1to1000 | 15.49ms | 11.24ms | 14.63ms | 3.52ms | 6.20ms | 39.98ms |
| update_1to1 | 16.22ms | 8.25ms | 22.53ms | 11.29ms | 9.21ms | 5.73ms |
| update_2to1 | 7.97ms | 4.09ms | 10.79ms | 5.02ms | 4.57ms | 2.87ms |
| update_4to1 | 4.07ms | 2.08ms | 5.89ms | 2.77ms | 2.31ms | 1.46ms |
| update_1000to1 | 40μs | 20μs | 62μs | 10μs | 23μs | 14μs |
| update_1to2 | 8.06ms | 4.15ms | 10.52ms | 5.54ms | 4.91ms | 2.94ms |
| update_1to4 | 4.06ms | 2.09ms | 5.61ms | 2.43ms | 2.35ms | 1.46ms |
| update_1to1000 | 148μs | 2.44ms | 162μs | 49μs | 42μs | 381μs |
| cellx1000 | 11.16ms | 9.49ms | 70.17ms | 7.31ms | 9.55ms | 5.71ms |
| cellx2500 | 32.54ms | 25.06ms | 251.07ms | 19.84ms | 32.32ms | 27.53ms |
| cellx5000 | 72.36ms | 64.75ms | 550.65ms | 41.10ms | 60.51ms | 58.17ms |
| 10x5 - 2 sources - read 20.0% (simple) | 354.55ms | 441.94ms | 2.02s | 234.21ms | 506.94ms | 246.40ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 243.27ms | 270.22ms | 1.56s | 180.77ms | 282.08ms | 199.68ms |
| 1000x12 - 4 sources - dynamic (large) | 462.86ms | 3.45s | 1.92s | 278.29ms | 3.74s | 334.32ms |
| 1000x5 - 25 sources (wide dense) | 590.14ms | 2.59s | 3.70s | 410.63ms | 3.28s | 503.76ms |
| 5x500 - 3 sources (deep) | 253.70ms | 235.10ms | 1.15s | 188.98ms | 230.91ms | 205.51ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 378.97ms | 443.91ms | 1.75s | 261.88ms | 477.80ms | 257.60ms |

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
