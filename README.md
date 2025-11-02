# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.22s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.21s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.34s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.43s |
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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 216.57ms | 193.18ms | 165.40ms (fail) | 263.20ms | 201.89ms | 2.38s |
| broadPropagation | 456.35ms | 355.57ms | 6.47ms (fail) | 493.89ms | 453.28ms | 4.30s |
| deepPropagation | 177.86ms | 125.92ms | 139.19ms (fail) | 161.26ms | 178.86ms | 1.54s |
| diamond | 288.47ms | 234.62ms | 205.87ms (fail) | 349.18ms | 278.48ms | 2.43s |
| mux | 409.62ms | 378.97ms | 195.54ms (fail) | 429.33ms | 388.47ms | 1.83s |
| repeatedObservers | 46.26ms | 43.41ms | 52.58ms (fail) | 81.01ms | 40.05ms | 236.17ms |
| triangle | 102.83ms | 85.21ms | 78.14ms (fail) | 112.24ms | 99.09ms | 775.93ms |
| unstable | 76.79ms | 61.02ms | 342.43ms (fail) | 95.73ms | 73.76ms | 348.07ms |
| molBench | 487.72ms | 488.67ms | 940μs | 501.53ms | 487.05ms | 587.04ms |
| create_signals | 25.89ms | 28.70ms | 61.55ms | 56.67ms | 18.12ms | 68.03ms |
| comp_0to1 | 11.81ms | 8.09ms | 54.60ms | 24.24ms | 19.70ms | 27.23ms |
| comp_1to1 | 27.80ms | 4.25ms | 56.09ms | 48.92ms | 7.16ms | 45.15ms |
| comp_2to1 | 9.50ms | 2.22ms | 37.46ms | 24.37ms | 9.86ms | 22.94ms |
| comp_4to1 | 2.23ms | 9.79ms | 16.54ms | 10.24ms | 8.34ms | 13.18ms |
| comp_1000to1 | 5μs | 3μs | 43μs | 27μs | 4μs | 15μs |
| comp_1to2 | 14.03ms | 17.53ms | 47.36ms | 32.75ms | 26.69ms | 36.90ms |
| comp_1to4 | 12.21ms | 6.85ms | 45.62ms | 16.80ms | 27.26ms | 23.00ms |
| comp_1to8 | 6.82ms | 4.74ms | 45.02ms | 22.40ms | 8.36ms | 22.98ms |
| comp_1to1000 | 4.50ms | 3.56ms | 41.14ms | 17.68ms | 7.49ms | 14.83ms |
| update_1to1 | 10.45ms | 10.07ms | 6.01ms | 16.43ms | 8.34ms | 28.56ms |
| update_2to1 | 4.78ms | 2.19ms | 3.08ms | 8.04ms | 4.37ms | 14.21ms |
| update_4to1 | 2.62ms | 2.47ms | 1.51ms | 4.09ms | 2.09ms | 7.79ms |
| update_1000to1 | 26μs | 17μs | 15μs | 40μs | 20μs | 69μs |
| update_1to2 | 4.70ms | 5.00ms | 3.02ms | 8.16ms | 4.07ms | 13.24ms |
| update_1to4 | 2.60ms | 2.42ms | 1.52ms | 4.10ms | 2.09ms | 5.57ms |
| update_1to1000 | 43μs | 36μs | 446μs | 149μs | 1.05ms | 171μs |
| cellx1000 | 9.63ms | 7.34ms | 5.17ms | 13.15ms | 9.72ms | 72.00ms |
| cellx2500 | 34.45ms | 21.40ms | 23.87ms | 37.42ms | 28.20ms | 249.76ms |
| cellx5000 | 77.58ms | 45.84ms | 57.45ms | 78.53ms | 84.68ms | 541.17ms |
| 10x5 - 2 sources - read 20.0% (simple) | 513.24ms | 234.49ms | 265.35ms | 348.81ms | 451.99ms | 2.01s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.50ms | 175.79ms | 202.70ms | 252.31ms | 276.79ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 3.74s | 286.50ms | 349.69ms | 465.64ms | 3.73s | 1.90s |
| 1000x5 - 25 sources (wide dense) | 3.44s | 411.76ms | 512.21ms | 605.45ms | 2.71s | 3.47s |
| 5x500 - 3 sources (deep) | 228.76ms | 188.79ms | 207.51ms | 253.72ms | 233.03ms | 1.16s |
| 100x15 - 6 sources - dynamic (very dynamic) | 482.04ms | 266.11ms | 262.65ms | 382.18ms | 458.14ms | 1.71s |

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
