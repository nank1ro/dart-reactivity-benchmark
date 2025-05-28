# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.68s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.34s |
| 🥉 | preact_signals | 0.25 | 100.0% | 35/35 | 11.07s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.51s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.56s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.39s |

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
| Test Case | state_beacon | alien_signals | mobx | solidart(2.0-dev) | signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 168.80ms (fail) | 184.66ms | 2.31s | 275.04ms | 208.83ms | 201.79ms |
| broadPropagation | 5.82ms (fail) | 344.56ms | 4.43s | 504.06ms | 458.65ms | 457.48ms |
| deepPropagation | 138.93ms (fail) | 125.95ms | 1.55s | 172.67ms | 172.57ms | 178.78ms |
| diamond | 179.89ms (fail) | 233.83ms | 2.43s | 350.19ms | 280.81ms | 288.97ms |
| mux | 194.26ms (fail) | 374.29ms | 1.82s | 448.05ms | 412.88ms | 400.52ms |
| repeatedObservers | 54.87ms (fail) | 46.24ms | 233.06ms | 81.92ms | 45.22ms | 39.88ms |
| triangle | 82.76ms (fail) | 87.21ms | 767.47ms | 119.63ms | 100.83ms | 98.58ms |
| unstable | 336.36ms (fail) | 67.45ms | 348.46ms | 98.11ms | 79.33ms | 70.97ms |
| molBench | 1.13ms | 483.76ms | 571.78ms | 495.09ms | 485.64ms | 487.61ms |
| create_signals | 59.30ms | 28.01ms | 68.91ms | 94.84ms | 24.59ms | 4.76ms |
| comp_0to1 | 52.56ms | 6.68ms | 16.20ms | 35.58ms | 11.01ms | 17.49ms |
| comp_1to1 | 54.29ms | 4.21ms | 40.25ms | 46.62ms | 26.21ms | 14.21ms |
| comp_2to1 | 35.80ms | 2.33ms | 23.81ms | 47.90ms | 12.21ms | 18.10ms |
| comp_4to1 | 16.03ms | 8.12ms | 17.36ms | 13.74ms | 7.03ms | 17.81ms |
| comp_1000to1 | 42μs | 3μs | 23μs | 31μs | 8μs | 6μs |
| comp_1to2 | 44.63ms | 19.23ms | 36.04ms | 29.05ms | 17.19ms | 15.87ms |
| comp_1to4 | 43.60ms | 11.08ms | 22.93ms | 25.61ms | 17.35ms | 26.12ms |
| comp_1to8 | 42.13ms | 4.02ms | 23.22ms | 25.62ms | 6.20ms | 6.95ms |
| comp_1to1000 | 38.36ms | 3.35ms | 16.11ms | 16.95ms | 4.11ms | 4.57ms |
| update_1to1 | 5.69ms | 10.74ms | 25.42ms | 15.95ms | 8.91ms | 8.92ms |
| update_2to1 | 3.13ms | 2.29ms | 13.97ms | 7.87ms | 4.64ms | 4.34ms |
| update_4to1 | 1.46ms | 2.70ms | 6.99ms | 3.99ms | 2.25ms | 2.23ms |
| update_1000to1 | 14μs | 24μs | 70μs | 39μs | 23μs | 21μs |
| update_1to2 | 2.86ms | 5.30ms | 13.17ms | 8.02ms | 4.65ms | 4.54ms |
| update_1to4 | 1.46ms | 2.61ms | 5.55ms | 4.01ms | 2.22ms | 2.18ms |
| update_1to1000 | 373μs | 28μs | 173μs | 169μs | 42μs | 151μs |
| cellx1000 | 5.09ms | 7.24ms | 76.79ms | 11.84ms | 9.62ms | 9.66ms |
| cellx2500 | 25.14ms | 19.22ms | 253.65ms | 32.73ms | 31.30ms | 25.27ms |
| cellx5000 | 59.47ms | 41.96ms | 583.81ms | 70.23ms | 62.72ms | 63.83ms |
| 10x5 - 2 sources - read 20.0% (simple) | 249.79ms | 231.78ms | 2.02s | 363.43ms | 594.00ms | 638.05ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 197.42ms | 172.82ms | 1.52s | 243.48ms | 319.24ms | 363.81ms |
| 1000x12 - 4 sources - dynamic (large) | 332.38ms | 279.09ms | 1.94s | 463.27ms | 3.89s | 4.04s |
| 1000x5 - 25 sources (wide dense) | 497.10ms | 410.86ms | 3.56s | 592.14ms | 3.47s | 2.83s |
| 5x500 - 3 sources (deep) | 204.24ms | 191.55ms | 1.13s | 255.36ms | 227.64ms | 232.05ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 257.42ms | 262.26ms | 1.68s | 389.32ms | 508.17ms | 502.88ms |

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
