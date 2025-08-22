# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.75s |
| 🥈 | preact_signals | 0.26 | 100.0% | 35/35 | 10.40s |
| 🥉 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.48s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.49s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.87s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.52s |

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
| Test Case | mobx | state_beacon | preact_signals | alien_signals | solidart(2.0-dev) | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.34s | 165.62ms (fail) | 201.13ms | 194.46ms | 276.06ms | 212.07ms |
| broadPropagation | 4.46s | 6.63ms (fail) | 458.96ms | 354.98ms | 496.35ms | 469.86ms |
| deepPropagation | 1.57s | 141.06ms (fail) | 176.07ms | 123.83ms | 161.83ms | 180.87ms |
| diamond | 2.40s | 190.18ms (fail) | 281.55ms | 234.46ms | 361.90ms | 283.02ms |
| mux | 1.83s | 198.75ms (fail) | 394.57ms | 380.69ms | 448.58ms | 417.06ms |
| repeatedObservers | 228.01ms | 52.59ms (fail) | 40.31ms | 43.69ms | 81.04ms | 46.02ms |
| triangle | 778.64ms | 83.79ms (fail) | 98.48ms | 90.87ms | 114.11ms | 100.88ms |
| unstable | 341.27ms | 339.68ms (fail) | 74.63ms | 60.00ms | 95.29ms | 75.92ms |
| molBench | 584.44ms | 965μs | 487.69ms | 490.67ms | 500.81ms | 486.10ms |
| create_signals | 82.34ms | 63.27ms | 4.60ms | 21.83ms | 98.95ms | 26.16ms |
| comp_0to1 | 21.91ms | 56.56ms | 17.78ms | 7.69ms | 38.51ms | 12.31ms |
| comp_1to1 | 17.59ms | 58.62ms | 12.76ms | 4.22ms | 47.21ms | 29.00ms |
| comp_2to1 | 20.25ms | 39.46ms | 9.51ms | 2.30ms | 24.80ms | 19.95ms |
| comp_4to1 | 15.43ms | 17.46ms | 14.34ms | 10.02ms | 15.20ms | 6.45ms |
| comp_1000to1 | 15μs | 44μs | 7μs | 4μs | 17μs | 9μs |
| comp_1to2 | 37.11ms | 48.38ms | 17.02ms | 11.73ms | 26.81ms | 15.76ms |
| comp_1to4 | 26.72ms | 47.15ms | 30.51ms | 13.31ms | 25.37ms | 7.30ms |
| comp_1to8 | 25.63ms | 46.51ms | 7.22ms | 4.13ms | 25.59ms | 6.67ms |
| comp_1to1000 | 15.39ms | 42.01ms | 6.71ms | 3.19ms | 14.30ms | 4.40ms |
| update_1to1 | 22.53ms | 6.01ms | 8.26ms | 10.00ms | 16.07ms | 10.17ms |
| update_2to1 | 11.21ms | 3.10ms | 4.49ms | 2.19ms | 7.97ms | 4.49ms |
| update_4to1 | 6.20ms | 1.53ms | 2.10ms | 2.47ms | 5.75ms | 2.56ms |
| update_1000to1 | 57μs | 15μs | 20μs | 20μs | 75μs | 25μs |
| update_1to2 | 11.18ms | 3.01ms | 4.07ms | 5.01ms | 13.30ms | 4.54ms |
| update_1to4 | 5.66ms | 1.53ms | 2.09ms | 2.55ms | 5.02ms | 2.54ms |
| update_1to1000 | 170μs | 422μs | 994μs | 50μs | 151μs | 45μs |
| cellx1000 | 81.62ms | 6.15ms | 10.76ms | 7.93ms | 13.72ms | 10.82ms |
| cellx2500 | 274.69ms | 34.27ms | 32.86ms | 25.19ms | 58.74ms | 38.83ms |
| cellx5000 | 609.17ms | 78.52ms | 109.25ms | 61.34ms | 141.67ms | 113.84ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.03s | 243.90ms | 442.54ms | 238.01ms | 351.33ms | 499.61ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.55s | 197.69ms | 275.25ms | 181.31ms | 253.51ms | 279.42ms |
| 1000x12 - 4 sources - dynamic (large) | 2.08s | 367.73ms | 3.73s | 285.05ms | 478.17ms | 3.80s |
| 1000x5 - 25 sources (wide dense) | 3.49s | 506.29ms | 2.75s | 407.68ms | 621.07ms | 3.60s |
| 5x500 - 3 sources (deep) | 1.17s | 209.56ms | 231.36ms | 196.05ms | 267.44ms | 224.76ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.74s | 262.66ms | 463.40ms | 273.55ms | 394.52ms | 499.08ms |

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
