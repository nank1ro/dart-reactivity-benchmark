# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.83s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.51s |
| 🥉 | preact_signals | 0.25 | 100.0% | 35/35 | 9.93s |
| 4 | signals | 0.24 | 100.0% | 35/35 | 11.20s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.97s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.40s |

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
| Test Case | preact_signals | solidart(2.0-dev) | mobx | alien_signals | state_beacon | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 220.55ms | 265.06ms | 2.30s | 185.35ms | 157.37ms (fail) | 210.60ms |
| broadPropagation | 518.63ms | 490.31ms | 4.17s | 357.71ms | 6.23ms (fail) | 527.72ms |
| deepPropagation | 190.82ms | 165.28ms | 1.50s | 117.08ms | 155.83ms (fail) | 190.89ms |
| diamond | 283.56ms | 380.00ms | 2.27s | 265.07ms | 187.33ms (fail) | 288.75ms |
| mux | 389.19ms | 429.24ms | 1.71s | 361.98ms | 185.91ms (fail) | 387.97ms |
| repeatedObservers | 41.31ms | 88.87ms | 230.62ms | 43.01ms | 54.34ms (fail) | 46.45ms |
| triangle | 105.60ms | 125.17ms | 724.65ms | 87.36ms | 79.24ms (fail) | 107.75ms |
| unstable | 72.93ms | 105.00ms | 340.52ms | 60.35ms | 342.61ms (fail) | 86.70ms |
| molBench | 546.66ms | 559.23ms | 639.93ms | 554.25ms | 1.06ms | 548.04ms |
| create_signals | 5.71ms | 58.55ms | 77.88ms | 30.40ms | 64.47ms | 29.59ms |
| comp_0to1 | 25.17ms | 27.27ms | 29.35ms | 7.98ms | 58.37ms | 12.93ms |
| comp_1to1 | 22.31ms | 30.50ms | 17.11ms | 4.07ms | 56.43ms | 27.83ms |
| comp_2to1 | 23.18ms | 37.74ms | 27.14ms | 2.16ms | 40.11ms | 12.81ms |
| comp_4to1 | 10.30ms | 4.34ms | 29.88ms | 13.01ms | 16.64ms | 9.33ms |
| comp_1000to1 | 5μs | 16μs | 15μs | 4μs | 41μs | 5μs |
| comp_1to2 | 31.28ms | 29.81ms | 40.46ms | 21.80ms | 45.05ms | 21.13ms |
| comp_1to4 | 30.09ms | 28.23ms | 24.05ms | 6.58ms | 44.87ms | 7.67ms |
| comp_1to8 | 7.46ms | 27.80ms | 25.27ms | 4.04ms | 42.20ms | 6.37ms |
| comp_1to1000 | 6.89ms | 14.84ms | 14.80ms | 3.46ms | 36.89ms | 4.00ms |
| update_1to1 | 8.48ms | 16.32ms | 23.56ms | 4.34ms | 6.21ms | 10.21ms |
| update_2to1 | 4.26ms | 8.16ms | 11.48ms | 2.30ms | 3.33ms | 5.05ms |
| update_4to1 | 2.12ms | 4.07ms | 5.86ms | 1.10ms | 1.59ms | 2.63ms |
| update_1000to1 | 21μs | 40μs | 56μs | 11μs | 17μs | 26μs |
| update_1to2 | 4.22ms | 8.46ms | 11.36ms | 2.25ms | 3.20ms | 5.09ms |
| update_1to4 | 2.18ms | 4.13ms | 5.77ms | 1.09ms | 1.63ms | 2.53ms |
| update_1to1000 | 55μs | 143μs | 157μs | 33μs | 352μs | 40μs |
| cellx1000 | 10.81ms | 17.19ms | 92.45ms | 7.22ms | 6.04ms | 10.19ms |
| cellx2500 | 38.38ms | 66.28ms | 310.02ms | 25.92ms | 30.75ms | 41.33ms |
| cellx5000 | 109.47ms | 178.45ms | 668.25ms | 75.24ms | 94.13ms | 102.72ms |
| 10x5 - 2 sources - read 20.0% (simple) | 424.19ms | 374.53ms | 2.00s | 282.44ms | 249.44ms | 495.05ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 262.59ms | 270.68ms | 1.42s | 184.06ms | 199.78ms | 272.39ms |
| 1000x12 - 4 sources - dynamic (large) | 3.32s | 430.44ms | 1.83s | 271.13ms | 324.45ms | 3.60s |
| 1000x5 - 25 sources (wide dense) | 2.54s | 643.13ms | 3.52s | 419.71ms | 464.85ms | 3.43s |
| 5x500 - 3 sources (deep) | 234.55ms | 269.13ms | 1.19s | 188.54ms | 203.45ms | 230.09ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 439.42ms | 351.99ms | 1.69s | 237.48ms | 236.93ms | 466.99ms |

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
