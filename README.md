# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.22s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.02s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.35s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.48s |
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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 273.04ms | 204.62ms | 2.31s | 186.17ms | 211.43ms | 152.29ms (fail) |
| broadPropagation | 507.32ms | 463.28ms | 4.20s | 358.75ms | 457.04ms | 6.37ms (fail) |
| deepPropagation | 169.98ms | 178.91ms | 1.51s | 126.77ms | 172.76ms | 142.06ms (fail) |
| diamond | 352.29ms | 279.28ms | 2.36s | 237.58ms | 288.89ms | 182.98ms (fail) |
| mux | 437.22ms | 386.06ms | 1.81s | 376.03ms | 406.80ms | 188.57ms (fail) |
| repeatedObservers | 79.70ms | 37.92ms | 228.62ms | 45.45ms | 46.73ms | 52.12ms (fail) |
| triangle | 116.68ms | 104.90ms | 762.92ms | 85.08ms | 101.20ms | 78.38ms (fail) |
| unstable | 95.36ms | 75.83ms | 347.46ms | 59.80ms | 72.80ms | 353.06ms (fail) |
| molBench | 447.01ms | 490.89ms | 577.82ms | 491.67ms | 488.48ms | 1.03ms |
| create_signals | 70.51ms | 4.62ms | 80.97ms | 26.03ms | 25.68ms | 66.14ms |
| comp_0to1 | 26.69ms | 23.42ms | 37.41ms | 7.76ms | 12.36ms | 52.21ms |
| comp_1to1 | 27.10ms | 11.19ms | 28.44ms | 4.21ms | 27.34ms | 53.31ms |
| comp_2to1 | 32.63ms | 14.47ms | 11.56ms | 2.33ms | 13.38ms | 35.31ms |
| comp_4to1 | 13.75ms | 12.73ms | 28.63ms | 8.65ms | 3.56ms | 16.20ms |
| comp_1000to1 | 15μs | 8μs | 15μs | 4μs | 6μs | 41μs |
| comp_1to2 | 27.79ms | 18.09ms | 48.54ms | 15.99ms | 13.62ms | 44.63ms |
| comp_1to4 | 20.46ms | 36.78ms | 23.68ms | 5.38ms | 11.61ms | 43.74ms |
| comp_1to8 | 24.24ms | 7.81ms | 25.18ms | 5.46ms | 6.98ms | 42.93ms |
| comp_1to1000 | 14.88ms | 5.50ms | 15.33ms | 3.55ms | 4.51ms | 38.44ms |
| update_1to1 | 16.16ms | 8.22ms | 24.46ms | 10.61ms | 9.18ms | 5.73ms |
| update_2to1 | 7.94ms | 4.05ms | 12.76ms | 3.92ms | 4.56ms | 2.88ms |
| update_4to1 | 4.03ms | 2.05ms | 6.32ms | 2.79ms | 2.31ms | 1.47ms |
| update_1000to1 | 41μs | 20μs | 63μs | 10μs | 23μs | 15μs |
| update_1to2 | 8.08ms | 4.06ms | 12.27ms | 5.70ms | 4.89ms | 2.94ms |
| update_1to4 | 4.03ms | 2.18ms | 5.90ms | 1.40ms | 2.31ms | 1.48ms |
| update_1to1000 | 149μs | 156μs | 170μs | 50μs | 68μs | 371μs |
| cellx1000 | 11.50ms | 9.77ms | 89.30ms | 8.84ms | 9.85ms | 5.31ms |
| cellx2500 | 32.30ms | 27.33ms | 294.19ms | 19.72ms | 36.88ms | 27.04ms |
| cellx5000 | 67.35ms | 74.92ms | 627.49ms | 42.32ms | 81.10ms | 56.48ms |
| 10x5 - 2 sources - read 20.0% (simple) | 356.69ms | 440.18ms | 2.01s | 232.45ms | 525.34ms | 262.20ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 257.09ms | 273.74ms | 1.55s | 177.03ms | 278.45ms | 221.62ms |
| 1000x12 - 4 sources - dynamic (large) | 465.74ms | 3.50s | 1.94s | 283.02ms | 3.74s | 354.38ms |
| 1000x5 - 25 sources (wide dense) | 591.02ms | 2.64s | 3.60s | 408.00ms | 3.58s | 513.13ms |
| 5x500 - 3 sources (deep) | 255.46ms | 229.97ms | 1.18s | 192.45ms | 226.66ms | 203.63ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 407.45ms | 449.69ms | 1.73s | 264.03ms | 476.67ms | 268.44ms |

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
