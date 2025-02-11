# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.71s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 9.65s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.01s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.29s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.54s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.54s |

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
| avoidablePropagation | 2.18s | 2.32s | 164.84ms (fail) | 209.72ms | 189.34ms | 202.50ms |
| broadPropagation | 5.52s | 4.37s | 6.59ms (fail) | 457.50ms | 351.31ms | 457.85ms |
| deepPropagation | 2.00s | 1.55s | 143.93ms (fail) | 176.71ms | 118.07ms | 172.46ms |
| diamond | 3.46s | 2.44s | 208.13ms (fail) | 284.43ms | 237.24ms | 275.45ms |
| mux | 2.07s | 1.82s | 195.01ms (fail) | 419.66ms | 382.02ms | 386.37ms |
| repeatedObservers | 214.75ms | 232.40ms | 53.55ms (fail) | 44.84ms | 43.59ms | 41.67ms |
| triangle | 1.16s | 792.97ms | 80.53ms (fail) | 102.13ms | 86.52ms | 99.59ms |
| unstable | 351.26ms | 348.14ms | 336.94ms (fail) | 76.63ms | 59.57ms | 67.92ms |
| molBench | 1.75s | 589.71ms | 939μs | 486.13ms | 486.01ms | 483.66ms |
| create_signals | 77.60ms | 66.45ms | 63.37ms | 29.69ms | 20.28ms | 4.57ms |
| comp_0to1 | 39.62ms | 20.90ms | 49.13ms | 13.44ms | 5.04ms | 16.86ms |
| comp_1to1 | 46.97ms | 24.50ms | 53.48ms | 25.25ms | 11.41ms | 15.37ms |
| comp_2to1 | 21.33ms | 9.35ms | 37.64ms | 10.90ms | 15.15ms | 10.04ms |
| comp_4to1 | 15.30ms | 22.38ms | 17.56ms | 1.95ms | 2.48ms | 10.88ms |
| comp_1000to1 | 1.78ms | 22μs | 45μs | 8μs | 3μs | 4μs |
| comp_1to2 | 21.04ms | 30.76ms | 46.36ms | 19.73ms | 12.93ms | 19.21ms |
| comp_1to4 | 38.78ms | 25.88ms | 44.51ms | 11.60ms | 11.08ms | 20.73ms |
| comp_1to8 | 26.50ms | 27.62ms | 44.44ms | 7.03ms | 3.88ms | 7.17ms |
| comp_1to1000 | 19.26ms | 15.07ms | 40.51ms | 4.63ms | 3.48ms | 5.89ms |
| update_1to1 | 42.93ms | 27.74ms | 7.07ms | 11.29ms | 4.39ms | 8.85ms |
| update_2to1 | 21.77ms | 13.83ms | 2.93ms | 4.76ms | 2.20ms | 4.36ms |
| update_4to1 | 10.65ms | 7.03ms | 1.57ms | 2.38ms | 1.14ms | 2.19ms |
| update_1000to1 | 114μs | 80μs | 15μs | 23μs | 11μs | 21μs |
| update_1to2 | 21.44ms | 13.85ms | 3.95ms | 4.74ms | 2.28ms | 4.35ms |
| update_1to4 | 10.89ms | 6.83ms | 1.48ms | 2.38ms | 1.50ms | 2.18ms |
| update_1to1000 | 224μs | 163μs | 403μs | 45μs | 43μs | 880μs |
| cellx1000 | 160.55ms | 73.75ms | 6.11ms | 9.65ms | 9.88ms | 9.63ms |
| cellx2500 | 487.45ms | 263.64ms | 21.67ms | 31.14ms | 20.34ms | 28.43ms |
| cellx5000 | 1.08s | 566.08ms | 65.13ms | 63.76ms | 47.53ms | 66.42ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.63s (partial) | 2.00s | 257.05ms | 510.56ms | 235.14ms | 431.36ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.38s (partial) | 1.52s | 206.87ms | 275.81ms | 179.82ms | 266.85ms |
| 1000x12 - 4 sources - dynamic (large) | 4.09s (partial) | 1.78s | 356.95ms | 3.64s | 290.31ms | 3.35s |
| 1000x5 - 25 sources (wide dense) | 4.85s (partial) | 3.49s | 519.54ms | 3.36s | 408.50ms | 2.51s |
| 5x500 - 3 sources (deep) | 1.99s (partial) | 1.13s | 234.13ms | 227.49ms | 196.07ms | 223.92ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.75s (partial) | 1.69s | 265.01ms | 485.82ms | 266.52ms | 440.46ms |

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
