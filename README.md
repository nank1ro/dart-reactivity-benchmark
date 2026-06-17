# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.37s |
| 🥉 | preact_signals | 0.24 | 100.0% | 35/35 | 9.83s |
| 4 | signals | 0.24 | 100.0% | 35/35 | 10.91s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.89s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.38s |

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
| Test Case | preact_signals | state_beacon | signals | alien_signals | mobx | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 213.62ms | 154.42ms (fail) | 211.37ms | 185.83ms | 2.33s | 267.95ms |
| broadPropagation | 517.81ms | 6.02ms (fail) | 475.35ms | 359.58ms | 4.19s | 485.04ms |
| deepPropagation | 194.01ms | 154.89ms (fail) | 186.20ms | 116.09ms | 1.48s | 169.83ms |
| diamond | 286.92ms | 186.99ms (fail) | 290.37ms | 263.99ms | 2.32s | 375.81ms |
| mux | 392.31ms | 187.78ms (fail) | 393.23ms | 363.65ms | 1.73s | 430.69ms |
| repeatedObservers | 41.50ms | 54.24ms (fail) | 46.76ms | 44.71ms | 231.06ms | 88.90ms |
| triangle | 105.44ms | 78.89ms (fail) | 108.41ms | 87.46ms | 725.82ms | 122.30ms |
| unstable | 73.84ms | 342.35ms (fail) | 80.10ms | 61.13ms | 340.66ms | 106.91ms |
| molBench | 547.15ms | 1.01ms | 547.66ms | 552.68ms | 642.42ms | 559.72ms |
| create_signals | 4.95ms | 69.53ms | 29.67ms | 30.00ms | 97.60ms | 58.76ms |
| comp_0to1 | 20.36ms | 60.73ms | 12.82ms | 9.46ms | 15.84ms | 26.38ms |
| comp_1to1 | 21.22ms | 62.00ms | 36.85ms | 4.15ms | 44.03ms | 46.35ms |
| comp_2to1 | 17.45ms | 39.10ms | 12.81ms | 2.26ms | 25.74ms | 42.06ms |
| comp_4to1 | 12.82ms | 18.39ms | 8.97ms | 14.25ms | 27.48ms | 4.54ms |
| comp_1000to1 | 4μs | 39μs | 4μs | 4μs | 15μs | 15μs |
| comp_1to2 | 27.89ms | 44.35ms | 19.43ms | 20.89ms | 38.35ms | 36.03ms |
| comp_1to4 | 32.78ms | 44.05ms | 7.59ms | 5.78ms | 19.15ms | 22.02ms |
| comp_1to8 | 6.89ms | 41.00ms | 6.17ms | 4.09ms | 22.65ms | 23.04ms |
| comp_1to1000 | 6.30ms | 36.31ms | 4.00ms | 3.53ms | 14.71ms | 14.65ms |
| update_1to1 | 8.51ms | 6.27ms | 10.39ms | 4.41ms | 23.25ms | 16.29ms |
| update_2to1 | 4.24ms | 3.17ms | 5.38ms | 2.28ms | 11.54ms | 8.08ms |
| update_4to1 | 2.12ms | 1.71ms | 2.56ms | 1.13ms | 5.91ms | 4.08ms |
| update_1000to1 | 23μs | 16μs | 33μs | 11μs | 57μs | 40μs |
| update_1to2 | 4.24ms | 3.13ms | 5.15ms | 2.28ms | 11.48ms | 8.29ms |
| update_1to4 | 2.15ms | 1.58ms | 2.68ms | 1.14ms | 5.71ms | 4.04ms |
| update_1to1000 | 616μs | 355μs | 40μs | 38μs | 168μs | 142μs |
| cellx1000 | 9.98ms | 4.69ms | 9.55ms | 8.29ms | 74.69ms | 11.39ms |
| cellx2500 | 27.30ms | 24.90ms | 37.04ms | 20.27ms | 261.96ms | 32.79ms |
| cellx5000 | 74.54ms | 81.60ms | 70.84ms | 47.14ms | 607.29ms | 77.91ms |
| 10x5 - 2 sources - read 20.0% (simple) | 422.96ms | 249.55ms | 484.83ms | 241.20ms | 2.01s | 379.59ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 263.49ms | 200.50ms | 270.52ms | 187.28ms | 1.43s | 272.51ms |
| 1000x12 - 4 sources - dynamic (large) | 3.31s | 313.35ms | 3.53s | 264.55ms | 1.83s | 425.46ms |
| 1000x5 - 25 sources (wide dense) | 2.51s | 464.77ms | 3.30s | 414.94ms | 3.47s | 639.53ms |
| 5x500 - 3 sources (deep) | 233.84ms | 203.79ms | 228.23ms | 190.93ms | 1.16s | 268.52ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 429.85ms | 234.74ms | 465.80ms | 236.26ms | 1.69s | 344.85ms |

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
