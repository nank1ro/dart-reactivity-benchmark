# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.68s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.36s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.28s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.39s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.80s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| Test Case | solidart(2.0-dev) | state_beacon | preact_signals | signals | mobx | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 289.76ms | 180.70ms (fail) | 201.83ms | 204.83ms | 2.35s | 191.27ms |
| broadPropagation | 516.68ms | 5.92ms (fail) | 453.63ms | 447.00ms | 4.44s | 345.15ms |
| deepPropagation | 172.24ms | 140.51ms (fail) | 175.23ms | 172.09ms | 1.55s | 124.03ms |
| diamond | 369.66ms | 182.84ms (fail) | 285.38ms | 286.34ms | 2.49s | 231.32ms |
| mux | 444.76ms | 194.98ms (fail) | 403.43ms | 412.27ms | 1.82s | 370.51ms |
| repeatedObservers | 82.10ms | 52.45ms (fail) | 40.36ms | 45.14ms | 236.07ms | 46.14ms |
| triangle | 118.96ms | 76.25ms (fail) | 99.04ms | 100.19ms | 786.48ms | 84.74ms |
| unstable | 98.66ms | 338.68ms (fail) | 69.68ms | 79.09ms | 355.74ms | 66.86ms |
| molBench | 493.94ms | 1.18ms | 485.02ms | 485.88ms | 579.19ms | 482.30ms |
| create_signals | 99.92ms | 65.26ms | 4.55ms | 25.06ms | 72.13ms | 26.77ms |
| comp_0to1 | 36.09ms | 62.02ms | 17.31ms | 11.73ms | 29.11ms | 8.04ms |
| comp_1to1 | 52.55ms | 61.08ms | 14.36ms | 27.05ms | 44.65ms | 4.20ms |
| comp_2to1 | 38.37ms | 40.64ms | 16.74ms | 9.28ms | 35.14ms | 2.39ms |
| comp_4to1 | 5.00ms | 18.64ms | 14.01ms | 1.96ms | 14.33ms | 10.11ms |
| comp_1000to1 | 17μs | 41μs | 4μs | 6μs | 23μs | 4μs |
| comp_1to2 | 34.21ms | 44.96ms | 18.02ms | 18.48ms | 37.65ms | 18.73ms |
| comp_1to4 | 22.81ms | 43.72ms | 31.90ms | 17.14ms | 19.87ms | 5.11ms |
| comp_1to8 | 22.73ms | 43.47ms | 6.66ms | 7.13ms | 24.80ms | 4.70ms |
| comp_1to1000 | 16.83ms | 38.69ms | 4.70ms | 4.32ms | 16.16ms | 3.27ms |
| update_1to1 | 15.99ms | 5.69ms | 8.69ms | 8.93ms | 25.61ms | 8.06ms |
| update_2to1 | 7.79ms | 3.17ms | 4.24ms | 4.49ms | 12.72ms | 4.19ms |
| update_4to1 | 4.08ms | 1.47ms | 2.16ms | 2.21ms | 6.61ms | 2.08ms |
| update_1000to1 | 40μs | 15μs | 21μs | 22μs | 72μs | 21μs |
| update_1to2 | 7.99ms | 2.87ms | 4.65ms | 4.49ms | 10.91ms | 4.91ms |
| update_1to4 | 4.07ms | 1.46ms | 2.17ms | 2.21ms | 5.77ms | 2.55ms |
| update_1to1000 | 190μs | 383μs | 229μs | 42μs | 175μs | 46μs |
| cellx1000 | 12.15ms | 5.39ms | 9.84ms | 10.37ms | 77.46ms | 9.23ms |
| cellx2500 | 34.25ms | 29.75ms | 29.89ms | 35.28ms | 278.36ms | 19.33ms |
| cellx5000 | 83.05ms | 68.20ms | 76.63ms | 69.49ms | 577.03ms | 46.83ms |
| 10x5 - 2 sources - read 20.0% (simple) | 352.17ms | 237.09ms | 437.10ms | 509.87ms | 2.05s | 231.78ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 244.03ms | 200.67ms | 274.63ms | 278.34ms | 1.52s | 179.26ms |
| 1000x12 - 4 sources - dynamic (large) | 465.14ms | 342.60ms | 3.71s | 3.81s | 1.92s | 286.14ms |
| 1000x5 - 25 sources (wide dense) | 576.56ms | 504.48ms | 2.69s | 3.59s | 3.58s | 409.42ms |
| 5x500 - 3 sources (deep) | 249.73ms | 203.05ms | 226.11ms | 225.55ms | 1.18s | 194.98ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 383.78ms | 259.42ms | 454.41ms | 478.42ms | 1.66s | 260.27ms |

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
