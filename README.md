# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.65s |
| 🥈 | signals | 0.28 | 100.0% | 35/35 | 11.00s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 9.63s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.14s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.47s |
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
| Test Case | solidart | mobx | state_beacon | signals | alien_signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.20s | 2.28s | 152.28ms (fail) | 215.27ms | 189.86ms | 199.03ms |
| broadPropagation | 5.50s | 4.34s | 7.47ms (fail) | 456.89ms | 346.86ms | 456.77ms |
| deepPropagation | 2.02s | 1.54s | 165.11ms (fail) | 177.21ms | 119.51ms | 173.10ms |
| diamond | 3.50s | 2.44s | 193.23ms (fail) | 285.74ms | 246.97ms | 274.36ms |
| mux | 2.06s | 1.80s | 196.19ms (fail) | 413.87ms | 373.63ms | 381.01ms |
| repeatedObservers | 213.46ms | 245.45ms | 54.40ms (fail) | 44.84ms | 43.84ms | 40.87ms |
| triangle | 1.13s | 765.32ms | 76.65ms (fail) | 100.75ms | 85.14ms | 96.85ms |
| unstable | 345.33ms | 349.88ms | 333.29ms (fail) | 77.11ms | 60.87ms | 69.76ms |
| molBench | 1.74s | 585.12ms | 934μs | 484.08ms | 470.69ms | 480.34ms |
| create_signals | 60.70ms | 71.12ms | 61.96ms | 28.64ms | 20.41ms | 4.61ms |
| comp_0to1 | 39.52ms | 16.82ms | 54.23ms | 14.68ms | 4.96ms | 17.73ms |
| comp_1to1 | 44.88ms | 53.62ms | 51.63ms | 17.87ms | 11.27ms | 20.13ms |
| comp_2to1 | 31.86ms | 23.30ms | 32.69ms | 15.99ms | 17.51ms | 19.30ms |
| comp_4to1 | 13.80ms | 24.29ms | 17.10ms | 1.95ms | 3.32ms | 10.68ms |
| comp_1000to1 | 2.06ms | 20μs | 45μs | 5μs | 6μs | 7μs |
| comp_1to2 | 33.70ms | 33.44ms | 45.47ms | 12.61ms | 6.92ms | 23.69ms |
| comp_1to4 | 27.23ms | 18.63ms | 45.87ms | 11.44ms | 11.86ms | 29.30ms |
| comp_1to8 | 23.98ms | 21.15ms | 43.31ms | 7.53ms | 3.90ms | 7.13ms |
| comp_1to1000 | 18.92ms | 16.42ms | 39.85ms | 4.63ms | 3.65ms | 6.23ms |
| update_1to1 | 43.48ms | 27.94ms | 10.69ms | 9.36ms | 4.88ms | 8.76ms |
| update_2to1 | 21.31ms | 13.95ms | 2.89ms | 4.66ms | 2.54ms | 4.36ms |
| update_4to1 | 10.77ms | 7.47ms | 2.56ms | 2.38ms | 1.64ms | 2.21ms |
| update_1000to1 | 126μs | 79μs | 15μs | 23μs | 11μs | 37μs |
| update_1to2 | 21.43ms | 13.66ms | 3.42ms | 4.72ms | 2.21ms | 5.49ms |
| update_1to4 | 10.98ms | 6.79ms | 1.46ms | 2.35ms | 1.13ms | 2.23ms |
| update_1to1000 | 213μs | 164μs | 379μs | 44μs | 54μs | 823μs |
| cellx1000 | 149.24ms | 68.78ms | 5.20ms | 9.54ms | 7.56ms | 10.09ms |
| cellx2500 | 470.45ms | 260.96ms | 19.36ms | 30.56ms | 19.37ms | 25.09ms |
| cellx5000 | 1.05s | 552.54ms | 51.10ms | 61.23ms | 41.33ms | 67.27ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.65s (partial) | 2.03s | 243.26ms | 503.20ms | 233.21ms | 422.33ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.36s (partial) | 1.52s | 206.37ms | 297.12ms | 179.89ms | 280.84ms |
| 1000x12 - 4 sources - dynamic (large) | 4.03s (partial) | 1.76s | 338.57ms | 3.65s | 286.52ms | 3.31s |
| 1000x5 - 25 sources (wide dense) | 4.89s (partial) | 3.46s | 516.81ms | 3.35s | 400.52ms | 2.50s |
| 5x500 - 3 sources (deep) | 2.01s (partial) | 1.11s | 228.34ms | 224.79ms | 194.80ms | 229.18ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.75s (partial) | 1.69s | 264.65ms | 474.45ms | 256.47ms | 447.24ms |

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
