# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.30s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.01s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.36s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.35s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.45s |

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
| avoidablePropagation | 201.05ms | 146.95ms (fail) | 261.79ms | 210.52ms | 193.38ms | 2.32s |
| broadPropagation | 452.98ms | 6.24ms (fail) | 486.45ms | 460.81ms | 356.43ms | 4.27s |
| deepPropagation | 180.66ms | 141.30ms (fail) | 164.76ms | 181.60ms | 128.30ms | 1.54s |
| diamond | 282.70ms | 183.02ms (fail) | 358.99ms | 284.02ms | 235.49ms | 2.38s |
| mux | 392.32ms | 194.32ms (fail) | 431.42ms | 406.98ms | 380.50ms | 1.82s |
| repeatedObservers | 40.81ms | 52.58ms (fail) | 80.74ms | 46.21ms | 43.83ms | 232.28ms |
| triangle | 101.27ms | 84.75ms (fail) | 113.53ms | 100.90ms | 85.09ms | 770.40ms |
| unstable | 73.92ms | 340.31ms (fail) | 96.06ms | 76.13ms | 60.82ms | 337.63ms |
| molBench | 487.05ms | 946μs | 500.42ms | 484.70ms | 489.66ms | 581.47ms |
| create_signals | 5.36ms | 66.23ms | 92.12ms | 24.91ms | 24.12ms | 78.42ms |
| comp_0to1 | 18.53ms | 63.68ms | 36.41ms | 11.20ms | 7.41ms | 38.19ms |
| comp_1to1 | 15.13ms | 66.01ms | 51.55ms | 28.05ms | 4.16ms | 17.29ms |
| comp_2to1 | 16.51ms | 38.51ms | 42.20ms | 8.78ms | 2.32ms | 22.20ms |
| comp_4to1 | 13.18ms | 17.31ms | 4.33ms | 1.96ms | 8.58ms | 26.24ms |
| comp_1000to1 | 5μs | 45μs | 15μs | 5μs | 3μs | 15μs |
| comp_1to2 | 15.77ms | 48.52ms | 38.23ms | 13.09ms | 24.23ms | 35.74ms |
| comp_1to4 | 23.39ms | 47.52ms | 20.63ms | 11.79ms | 4.90ms | 25.66ms |
| comp_1to8 | 7.71ms | 46.23ms | 19.80ms | 6.71ms | 4.83ms | 21.45ms |
| comp_1to1000 | 8.99ms | 42.85ms | 14.05ms | 4.34ms | 3.18ms | 15.18ms |
| update_1to1 | 8.33ms | 6.04ms | 16.37ms | 10.25ms | 10.00ms | 28.32ms |
| update_2to1 | 4.37ms | 3.11ms | 8.11ms | 4.65ms | 2.11ms | 12.87ms |
| update_4to1 | 2.14ms | 1.54ms | 4.08ms | 2.59ms | 2.55ms | 7.06ms |
| update_1000to1 | 20μs | 15μs | 51μs | 25μs | 17μs | 68μs |
| update_1to2 | 4.07ms | 3.02ms | 8.31ms | 4.55ms | 4.07ms | 12.76ms |
| update_1to4 | 2.12ms | 1.55ms | 4.15ms | 2.61ms | 2.49ms | 6.81ms |
| update_1to1000 | 648μs | 431μs | 148μs | 41μs | 35μs | 171μs |
| cellx1000 | 9.85ms | 5.11ms | 12.39ms | 9.62ms | 8.15ms | 70.27ms |
| cellx2500 | 26.00ms | 27.55ms | 31.32ms | 31.70ms | 19.38ms | 267.77ms |
| cellx5000 | 72.27ms | 63.88ms | 78.49ms | 61.00ms | 43.73ms | 569.69ms |
| 10x5 - 2 sources - read 20.0% (simple) | 460.21ms | 236.21ms | 352.86ms | 510.59ms | 235.38ms | 2.04s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 275.14ms | 196.96ms | 247.74ms | 281.90ms | 172.73ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 3.73s | 337.37ms | 461.50ms | 3.76s | 278.98ms | 1.90s |
| 1000x5 - 25 sources (wide dense) | 2.73s | 508.62ms | 615.49ms | 3.26s | 406.80ms | 3.51s |
| 5x500 - 3 sources (deep) | 235.14ms | 206.97ms | 253.59ms | 222.63ms | 197.32ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 466.32ms | 262.42ms | 390.54ms | 484.07ms | 269.38ms | 1.72s |

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
