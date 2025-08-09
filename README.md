# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.32s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.29s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.35s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.45s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.41s |

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
| avoidablePropagation | 2.30s | 166.09ms (fail) | 204.61ms | 184.00ms | 276.71ms | 207.73ms |
| broadPropagation | 4.48s | 6.37ms (fail) | 457.39ms | 345.31ms | 510.32ms | 455.49ms |
| deepPropagation | 1.54s | 143.75ms (fail) | 174.25ms | 124.78ms | 170.36ms | 172.69ms |
| diamond | 2.40s | 187.92ms (fail) | 279.02ms | 230.13ms | 353.23ms | 281.78ms |
| mux | 1.87s | 196.39ms (fail) | 399.97ms | 374.10ms | 447.64ms | 449.43ms |
| repeatedObservers | 234.14ms | 52.83ms (fail) | 40.18ms | 45.29ms | 81.19ms | 44.37ms |
| triangle | 756.50ms | 77.05ms (fail) | 98.22ms | 84.45ms | 118.52ms | 102.89ms |
| unstable | 354.20ms | 334.35ms (fail) | 70.05ms | 67.26ms | 97.75ms | 78.66ms |
| molBench | 572.15ms | 920μs | 486.24ms | 487.82ms | 493.36ms | 486.85ms |
| create_signals | 73.87ms | 60.52ms | 5.21ms | 26.79ms | 69.29ms | 26.34ms |
| comp_0to1 | 25.71ms | 53.49ms | 17.11ms | 8.61ms | 30.67ms | 11.89ms |
| comp_1to1 | 18.68ms | 59.09ms | 14.48ms | 4.54ms | 48.59ms | 23.82ms |
| comp_2to1 | 18.46ms | 36.60ms | 19.10ms | 2.34ms | 11.47ms | 8.47ms |
| comp_4to1 | 18.15ms | 17.13ms | 9.14ms | 10.36ms | 14.16ms | 1.85ms |
| comp_1000to1 | 16μs | 41μs | 15μs | 4μs | 23μs | 5μs |
| comp_1to2 | 36.21ms | 45.03ms | 17.42ms | 11.32ms | 38.29ms | 12.81ms |
| comp_1to4 | 24.69ms | 43.81ms | 29.52ms | 11.54ms | 19.55ms | 9.29ms |
| comp_1to8 | 27.01ms | 42.96ms | 7.96ms | 5.28ms | 24.54ms | 8.71ms |
| comp_1to1000 | 16.32ms | 38.43ms | 7.35ms | 5.39ms | 16.82ms | 6.95ms |
| update_1to1 | 24.69ms | 5.65ms | 8.65ms | 9.53ms | 15.92ms | 9.08ms |
| update_2to1 | 11.34ms | 3.12ms | 4.44ms | 2.31ms | 7.83ms | 4.64ms |
| update_4to1 | 7.17ms | 1.45ms | 2.20ms | 2.63ms | 4.04ms | 2.23ms |
| update_1000to1 | 72μs | 15μs | 21μs | 25μs | 48μs | 22μs |
| update_1to2 | 12.48ms | 2.84ms | 4.69ms | 5.10ms | 7.91ms | 4.65ms |
| update_1to4 | 5.53ms | 1.46ms | 2.19ms | 2.44ms | 3.99ms | 2.30ms |
| update_1to1000 | 183μs | 382μs | 404μs | 47μs | 170μs | 43μs |
| cellx1000 | 78.77ms | 5.46ms | 10.25ms | 8.00ms | 14.67ms | 9.79ms |
| cellx2500 | 269.90ms | 24.36ms | 33.50ms | 23.28ms | 40.25ms | 35.20ms |
| cellx5000 | 565.93ms | 60.23ms | 105.82ms | 58.76ms | 97.70ms | 84.48ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.01s | 244.53ms | 440.96ms | 230.05ms | 350.92ms | 513.99ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.49s | 201.80ms | 268.09ms | 173.23ms | 255.33ms | 280.20ms |
| 1000x12 - 4 sources - dynamic (large) | 1.88s | 349.94ms | 3.75s | 281.35ms | 466.07ms | 4.02s |
| 1000x5 - 25 sources (wide dense) | 3.50s | 478.56ms | 2.69s | 417.29ms | 587.18ms | 3.23s |
| 5x500 - 3 sources (deep) | 1.16s | 206.86ms | 227.10ms | 188.28ms | 264.34ms | 226.45ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.68s | 261.58ms | 464.71ms | 267.69ms | 385.25ms | 481.01ms |

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
