# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.31s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 4.80s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 8.74s |
| 4 | signals | 0.28 | 100.0% | 35/35 | 9.17s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.02s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.05s |

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
| Test Case | solidart(2.0-dev) | alien_signals | state_beacon | preact_signals | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 241.78ms | 170.55ms | 133.58ms (fail) | 187.09ms | 2.28s | 198.91ms |
| broadPropagation | 462.64ms | 300.91ms | 5.60ms (fail) | 383.03ms | 4.06s | 390.12ms |
| deepPropagation | 151.48ms | 106.94ms | 155.42ms (fail) | 181.59ms | 1.42s | 176.94ms |
| diamond | 346.10ms | 232.37ms | 175.69ms (fail) | 255.79ms | 2.20s | 258.13ms |
| mux | 391.15ms | 330.69ms | 157.28ms (fail) | 325.56ms | 1.69s | 329.78ms |
| repeatedObservers | 72.42ms | 39.98ms | 45.81ms (fail) | 34.32ms | 223.69ms | 39.65ms |
| triangle | 111.46ms | 80.52ms | 74.93ms (fail) | 91.82ms | 744.14ms | 92.39ms |
| unstable | 96.20ms | 59.50ms | 321.50ms (fail) | 58.58ms | 316.00ms | 66.48ms |
| molBench | 370.85ms | 363.31ms | 813μs | 388.42ms | 453.12ms | 366.95ms |
| create_signals | 49.37ms | 27.35ms | 60.80ms | 6.59ms | 68.50ms | 25.25ms |
| comp_0to1 | 24.31ms | 9.35ms | 52.38ms | 19.08ms | 20.09ms | 11.56ms |
| comp_1to1 | 38.23ms | 6.11ms | 54.79ms | 9.69ms | 45.29ms | 20.89ms |
| comp_2to1 | 33.82ms | 3.24ms | 36.18ms | 18.37ms | 38.85ms | 9.38ms |
| comp_4to1 | 5.08ms | 8.99ms | 16.83ms | 9.03ms | 16.04ms | 2.67ms |
| comp_1000to1 | 17μs | 5μs | 42μs | 6μs | 26μs | 7μs |
| comp_1to2 | 32.60ms | 11.14ms | 47.26ms | 16.90ms | 34.97ms | 23.19ms |
| comp_1to4 | 22.98ms | 13.54ms | 46.64ms | 36.90ms | 25.84ms | 17.49ms |
| comp_1to8 | 20.39ms | 5.34ms | 46.30ms | 7.22ms | 24.84ms | 9.60ms |
| comp_1to1000 | 14.50ms | 4.98ms | 40.37ms | 6.04ms | 16.15ms | 7.63ms |
| update_1to1 | 14.40ms | 3.82ms | 4.47ms | 7.55ms | 19.38ms | 8.75ms |
| update_2to1 | 7.28ms | 1.93ms | 2.47ms | 3.83ms | 10.04ms | 4.24ms |
| update_4to1 | 3.56ms | 1.05ms | 1.15ms | 2.14ms | 5.33ms | 1.99ms |
| update_1000to1 | 39μs | 12μs | 12μs | 33μs | 45μs | 20μs |
| update_1to2 | 7.40ms | 1.98ms | 2.26ms | 3.93ms | 9.34ms | 4.03ms |
| update_1to4 | 3.62ms | 1.04ms | 1.11ms | 1.94ms | 5.05ms | 2.10ms |
| update_1to1000 | 154μs | 43μs | 391μs | 193μs | 169μs | 54μs |
| cellx1000 | 17.78ms | 8.96ms | 8.18ms | 11.09ms | 85.14ms | 11.28ms |
| cellx2500 | 49.28ms | 27.80ms | 27.32ms | 28.17ms | 263.77ms | 38.44ms |
| cellx5000 | 112.36ms | 63.33ms | 64.22ms | 76.69ms | 570.23ms | 74.64ms |
| 10x5 - 2 sources - read 20.0% (simple) | 362.04ms | 228.97ms | 226.78ms | 402.06ms | 2.00s | 425.06ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 252.47ms | 171.26ms | 172.67ms | 235.45ms | 1.46s | 239.50ms |
| 1000x12 - 4 sources - dynamic (large) | 369.96ms | 246.51ms | 270.38ms | 3.04s | 1.65s | 3.13s |
| 1000x5 - 25 sources (wide dense) | 534.60ms | 353.11ms | 376.78ms | 2.27s | 3.39s | 2.58s |
| 5x500 - 3 sources (deep) | 270.65ms | 203.77ms | 204.92ms | 226.52ms | 1.17s | 208.72ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 306.61ms | 222.41ms | 218.66ms | 392.33ms | 1.68s | 389.09ms |

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
