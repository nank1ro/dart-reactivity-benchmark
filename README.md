# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.37s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 9.99s |
| 4 | signals | 0.28 | 100.0% | 35/35 | 11.48s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.66s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.42s |

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
| avoidablePropagation | 272.22ms | 205.14ms | 2.32s | 186.67ms | 208.48ms | 161.14ms (fail) |
| broadPropagation | 500.67ms | 455.84ms | 4.31s | 352.35ms | 453.23ms | 6.23ms (fail) |
| deepPropagation | 168.87ms | 179.87ms | 1.56s | 126.38ms | 178.98ms | 136.74ms (fail) |
| diamond | 354.47ms | 280.42ms | 2.42s | 233.72ms | 285.32ms | 197.21ms (fail) |
| mux | 433.17ms | 387.52ms | 1.86s | 368.93ms | 408.75ms | 189.10ms (fail) |
| repeatedObservers | 81.00ms | 38.33ms | 225.34ms | 44.74ms | 46.77ms | 52.84ms (fail) |
| triangle | 114.92ms | 100.68ms | 779.29ms | 86.29ms | 101.79ms | 77.76ms (fail) |
| unstable | 97.15ms | 71.91ms | 352.46ms | 60.34ms | 74.42ms | 338.85ms (fail) |
| molBench | 492.90ms | 493.75ms | 580.16ms | 492.81ms | 488.26ms | 1.08ms |
| create_signals | 58.10ms | 4.70ms | 49.62ms | 26.63ms | 26.69ms | 61.40ms |
| comp_0to1 | 27.18ms | 17.49ms | 18.42ms | 11.60ms | 12.35ms | 55.22ms |
| comp_1to1 | 40.95ms | 11.08ms | 28.02ms | 8.04ms | 27.69ms | 56.95ms |
| comp_2to1 | 37.04ms | 13.45ms | 11.28ms | 15.28ms | 11.57ms | 37.53ms |
| comp_4to1 | 4.57ms | 8.76ms | 17.22ms | 1.69ms | 2.23ms | 16.77ms |
| comp_1000to1 | 15μs | 4μs | 34μs | 6μs | 5μs | 44μs |
| comp_1to2 | 34.00ms | 22.43ms | 36.94ms | 9.37ms | 14.69ms | 47.56ms |
| comp_1to4 | 16.05ms | 29.05ms | 22.20ms | 8.21ms | 11.92ms | 46.68ms |
| comp_1to8 | 23.72ms | 13.81ms | 24.77ms | 6.52ms | 7.16ms | 46.04ms |
| comp_1to1000 | 15.97ms | 8.57ms | 15.20ms | 3.44ms | 4.52ms | 41.95ms |
| update_1to1 | 16.11ms | 8.31ms | 21.77ms | 11.37ms | 9.28ms | 5.72ms |
| update_2to1 | 7.93ms | 4.07ms | 10.92ms | 5.01ms | 4.60ms | 2.86ms |
| update_4to1 | 4.08ms | 2.08ms | 6.60ms | 2.82ms | 2.36ms | 1.43ms |
| update_1000to1 | 67μs | 20μs | 68μs | 22μs | 23μs | 15μs |
| update_1to2 | 8.31ms | 4.05ms | 11.48ms | 5.59ms | 4.99ms | 2.93ms |
| update_1to4 | 4.04ms | 2.07ms | 5.71ms | 2.46ms | 2.37ms | 1.43ms |
| update_1to1000 | 153μs | 789μs | 181μs | 45μs | 43μs | 420μs |
| cellx1000 | 15.60ms | 9.57ms | 71.69ms | 7.41ms | 9.92ms | 5.05ms |
| cellx2500 | 58.97ms | 25.25ms | 253.38ms | 22.33ms | 37.09ms | 25.65ms |
| cellx5000 | 184.06ms | 63.07ms | 571.23ms | 60.57ms | 67.68ms | 53.71ms |
| 10x5 - 2 sources - read 20.0% (simple) | 348.58ms | 448.70ms | 2.02s | 230.65ms | 568.00ms | 251.54ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 243.65ms | 278.16ms | 1.55s | 176.42ms | 283.79ms | 199.90ms |
| 1000x12 - 4 sources - dynamic (large) | 475.72ms | 3.53s | 1.93s | 290.09ms | 3.83s | 334.57ms |
| 1000x5 - 25 sources (wide dense) | 594.90ms | 2.59s | 3.59s | 412.63ms | 3.59s | 494.62ms |
| 5x500 - 3 sources (deep) | 255.26ms | 223.24ms | 1.23s | 195.84ms | 228.48ms | 205.41ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 380.13ms | 445.39ms | 1.75s | 264.91ms | 479.38ms | 260.74ms |

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
