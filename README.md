# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.67s |
| 🥈 | signals | 0.25 | 100.0% | 35/35 | 11.56s |
| 🥉 | preact_signals | 0.25 | 100.0% | 35/35 | 10.40s |
| 4 | solidart(2.0-dev) | 0.24 | 100.0% | 35/35 | 5.52s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.37s |
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
| Test Case | state_beacon | mobx | solidart(2.0-dev) | preact_signals | signals | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 172.45ms (fail) | 2.35s | 273.39ms | 201.11ms | 205.79ms | 187.30ms |
| broadPropagation | 6.99ms (fail) | 4.56s | 503.58ms | 502.28ms | 472.35ms | 344.17ms |
| deepPropagation | 144.93ms (fail) | 1.56s | 170.30ms | 176.74ms | 168.54ms | 119.99ms |
| diamond | 205.35ms (fail) | 2.44s | 351.39ms | 298.70ms | 280.07ms | 230.71ms |
| mux | 194.26ms (fail) | 1.83s | 452.15ms | 400.55ms | 413.49ms | 378.73ms |
| repeatedObservers | 52.85ms (fail) | 234.34ms | 81.40ms | 41.42ms | 44.65ms | 45.42ms |
| triangle | 81.91ms (fail) | 767.73ms | 124.82ms | 102.71ms | 103.31ms | 84.70ms |
| unstable | 337.54ms (fail) | 352.98ms | 97.29ms | 73.91ms | 78.94ms | 68.05ms |
| molBench | 923μs | 575.44ms | 495.55ms | 487.59ms | 485.74ms | 487.57ms |
| create_signals | 65.26ms | 72.10ms | 73.53ms | 5.23ms | 26.97ms | 24.06ms |
| comp_0to1 | 62.05ms | 28.76ms | 31.56ms | 17.61ms | 12.35ms | 8.37ms |
| comp_1to1 | 60.37ms | 39.31ms | 55.71ms | 14.44ms | 21.01ms | 4.34ms |
| comp_2to1 | 43.42ms | 24.69ms | 29.69ms | 18.99ms | 9.09ms | 2.39ms |
| comp_4to1 | 17.54ms | 20.62ms | 18.66ms | 14.32ms | 3.24ms | 7.62ms |
| comp_1000to1 | 42μs | 21μs | 22μs | 5μs | 7μs | 4μs |
| comp_1to2 | 46.55ms | 38.90ms | 44.55ms | 19.00ms | 16.31ms | 10.21ms |
| comp_1to4 | 47.57ms | 20.23ms | 26.15ms | 34.49ms | 14.34ms | 11.52ms |
| comp_1to8 | 44.35ms | 24.75ms | 30.59ms | 6.59ms | 14.43ms | 4.90ms |
| comp_1to1000 | 38.56ms | 16.36ms | 18.04ms | 6.21ms | 4.21ms | 3.59ms |
| update_1to1 | 5.69ms | 25.54ms | 16.46ms | 8.89ms | 8.90ms | 10.31ms |
| update_2to1 | 3.10ms | 12.74ms | 7.96ms | 4.37ms | 4.50ms | 2.27ms |
| update_4to1 | 1.41ms | 6.26ms | 4.11ms | 2.18ms | 2.26ms | 2.49ms |
| update_1000to1 | 14μs | 64μs | 41μs | 22μs | 22μs | 24μs |
| update_1to2 | 2.85ms | 12.64ms | 7.87ms | 4.50ms | 4.45ms | 5.09ms |
| update_1to4 | 1.41ms | 6.12ms | 4.07ms | 2.19ms | 2.23ms | 2.46ms |
| update_1to1000 | 396μs | 187μs | 176μs | 896μs | 43μs | 41μs |
| cellx1000 | 5.88ms | 81.14ms | 17.68ms | 9.99ms | 11.08ms | 7.20ms |
| cellx2500 | 29.71ms | 267.49ms | 74.05ms | 33.23ms | 38.11ms | 20.55ms |
| cellx5000 | 92.36ms | 601.18ms | 182.24ms | 109.68ms | 86.95ms | 49.52ms |
| 10x5 - 2 sources - read 20.0% (simple) | 256.11ms | 2.03s | 368.19ms | 438.41ms | 524.47ms | 231.03ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 201.33ms | 1.63s | 247.47ms | 278.44ms | 288.65ms | 178.78ms |
| 1000x12 - 4 sources - dynamic (large) | 350.94ms | 2.10s | 473.93ms | 3.69s | 3.75s | 276.99ms |
| 1000x5 - 25 sources (wide dense) | 480.25ms | 3.69s | 593.89ms | 2.72s | 3.63s | 407.79ms |
| 5x500 - 3 sources (deep) | 204.78ms | 1.19s | 255.48ms | 226.34ms | 351.94ms | 187.25ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 258.87ms | 1.78s | 389.88ms | 450.76ms | 482.61ms | 263.03ms |

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
