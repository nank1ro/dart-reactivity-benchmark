# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.22s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.17s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.48s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.62s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.48s |

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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 203.12ms | 2.29s | 146.09ms (fail) | 193.80ms | 209.33ms | 273.99ms |
| broadPropagation | 451.40ms | 4.26s | 6.24ms (fail) | 358.07ms | 467.53ms | 515.85ms |
| deepPropagation | 168.18ms | 1.50s | 139.16ms (fail) | 128.52ms | 178.43ms | 166.16ms |
| diamond | 283.46ms | 2.36s | 200.37ms (fail) | 246.59ms | 292.16ms | 347.82ms |
| mux | 394.51ms | 1.74s | 184.77ms (fail) | 363.85ms | 377.97ms | 413.49ms |
| repeatedObservers | 45.55ms | 231.51ms | 54.82ms (fail) | 46.50ms | 41.91ms | 80.35ms |
| triangle | 101.71ms | 743.35ms | 77.61ms (fail) | 87.99ms | 102.82ms | 115.05ms |
| unstable | 75.14ms | 340.00ms | 338.44ms (fail) | 62.46ms | 72.44ms | 95.36ms |
| molBench | 492.99ms | 586.85ms | 1.30ms | 487.32ms | 495.89ms | 493.26ms |
| create_signals | 26.48ms | 88.43ms | 69.06ms | 28.34ms | 5.52ms | 54.12ms |
| comp_0to1 | 11.73ms | 26.77ms | 59.48ms | 9.10ms | 18.57ms | 25.61ms |
| comp_1to1 | 18.14ms | 48.98ms | 62.36ms | 4.22ms | 11.00ms | 40.59ms |
| comp_2to1 | 16.63ms | 31.99ms | 36.53ms | 2.34ms | 13.34ms | 41.59ms |
| comp_4to1 | 5.96ms | 20.99ms | 16.91ms | 7.66ms | 15.56ms | 17.75ms |
| comp_1000to1 | 5μs | 15μs | 44μs | 3μs | 8μs | 15μs |
| comp_1to2 | 21.32ms | 35.02ms | 45.77ms | 10.55ms | 19.01ms | 35.65ms |
| comp_1to4 | 13.43ms | 24.08ms | 45.22ms | 9.62ms | 29.47ms | 20.84ms |
| comp_1to8 | 6.80ms | 22.54ms | 43.91ms | 5.16ms | 7.08ms | 22.13ms |
| comp_1to1000 | 4.30ms | 15.08ms | 39.69ms | 3.52ms | 5.92ms | 14.47ms |
| update_1to1 | 8.97ms | 21.69ms | 7.54ms | 4.70ms | 8.97ms | 15.64ms |
| update_2to1 | 4.47ms | 11.18ms | 2.83ms | 2.31ms | 4.55ms | 7.86ms |
| update_4to1 | 2.26ms | 5.70ms | 2.77ms | 1.16ms | 2.25ms | 3.92ms |
| update_1000to1 | 21μs | 71μs | 14μs | 11μs | 35μs | 39μs |
| update_1to2 | 4.44ms | 10.68ms | 4.93ms | 2.34ms | 4.45ms | 8.16ms |
| update_1to4 | 2.29ms | 5.88ms | 1.46ms | 1.17ms | 2.65ms | 3.93ms |
| update_1to1000 | 42μs | 156μs | 405μs | 29μs | 906μs | 147μs |
| cellx1000 | 9.81ms | 71.42ms | 5.29ms | 8.97ms | 10.04ms | 11.85ms |
| cellx2500 | 33.93ms | 251.19ms | 23.52ms | 19.82ms | 27.03ms | 34.21ms |
| cellx5000 | 68.78ms | 555.32ms | 79.18ms | 42.55ms | 71.70ms | 74.45ms |
| 10x5 - 2 sources - read 20.0% (simple) | 509.45ms | 1.93s | 253.38ms | 241.50ms | 451.59ms | 342.54ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 282.80ms | 1.46s | 204.72ms | 188.36ms | 286.15ms | 248.42ms |
| 1000x12 - 4 sources - dynamic (large) | 3.84s | 1.84s | 336.88ms | 278.75ms | 3.77s | 458.78ms |
| 1000x5 - 25 sources (wide dense) | 3.35s | 3.36s | 516.84ms | 409.58ms | 2.79s | 594.37ms |
| 5x500 - 3 sources (deep) | 224.94ms | 1.10s | 208.59ms | 191.19ms | 234.60ms | 254.53ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 488.45ms | 1.63s | 260.35ms | 263.43ms | 451.69ms | 382.12ms |

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
