# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.38s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.03s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.47s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.19s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.43s |

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
| avoidablePropagation | 271.32ms | 204.34ms | 2.40s | 186.50ms | 211.15ms | 149.31ms (fail) |
| broadPropagation | 505.90ms | 453.54ms | 4.34s | 360.87ms | 454.55ms | 6.23ms (fail) |
| deepPropagation | 169.21ms | 178.44ms | 1.53s | 126.12ms | 176.71ms | 138.83ms (fail) |
| diamond | 353.13ms | 278.66ms | 2.46s | 238.59ms | 292.15ms | 185.23ms (fail) |
| mux | 448.00ms | 382.35ms | 1.84s | 374.75ms | 409.61ms | 192.36ms (fail) |
| repeatedObservers | 78.34ms | 37.88ms | 240.16ms | 44.80ms | 46.16ms | 52.10ms (fail) |
| triangle | 135.09ms | 99.64ms | 768.57ms | 86.22ms | 104.84ms | 77.67ms (fail) |
| unstable | 94.14ms | 72.56ms | 354.39ms | 60.51ms | 72.92ms | 336.33ms (fail) |
| molBench | 492.20ms | 491.99ms | 581.46ms | 488.97ms | 488.07ms | 1.10ms |
| create_signals | 72.39ms | 4.66ms | 89.58ms | 23.65ms | 25.89ms | 67.15ms |
| comp_0to1 | 37.43ms | 17.54ms | 27.61ms | 8.20ms | 12.10ms | 56.49ms |
| comp_1to1 | 44.10ms | 11.24ms | 31.99ms | 4.20ms | 28.87ms | 53.94ms |
| comp_2to1 | 24.91ms | 11.70ms | 29.31ms | 2.28ms | 16.02ms | 36.48ms |
| comp_4to1 | 9.10ms | 9.94ms | 14.02ms | 7.70ms | 11.13ms | 16.64ms |
| comp_1000to1 | 19μs | 4μs | 25μs | 3μs | 5μs | 42μs |
| comp_1to2 | 36.22ms | 16.58ms | 29.81ms | 11.08ms | 15.72ms | 44.34ms |
| comp_1to4 | 18.66ms | 28.46ms | 35.54ms | 9.15ms | 14.64ms | 43.22ms |
| comp_1to8 | 25.61ms | 9.10ms | 21.72ms | 5.42ms | 9.54ms | 42.61ms |
| comp_1to1000 | 18.37ms | 8.65ms | 14.90ms | 3.53ms | 8.99ms | 38.15ms |
| update_1to1 | 16.12ms | 8.27ms | 21.33ms | 11.37ms | 9.30ms | 5.72ms |
| update_2to1 | 7.94ms | 4.05ms | 10.53ms | 4.97ms | 4.70ms | 2.89ms |
| update_4to1 | 4.08ms | 2.06ms | 5.66ms | 2.78ms | 2.35ms | 1.47ms |
| update_1000to1 | 40μs | 54μs | 54μs | 20μs | 23μs | 15μs |
| update_1to2 | 7.93ms | 4.14ms | 10.63ms | 5.60ms | 4.91ms | 2.96ms |
| update_1to4 | 4.05ms | 2.07ms | 5.25ms | 2.46ms | 2.30ms | 1.47ms |
| update_1to1000 | 151μs | 2.50ms | 174μs | 47μs | 44μs | 385μs |
| cellx1000 | 12.57ms | 11.09ms | 79.19ms | 7.84ms | 10.21ms | 5.59ms |
| cellx2500 | 45.55ms | 30.66ms | 292.84ms | 22.15ms | 36.53ms | 32.38ms |
| cellx5000 | 113.05ms | 96.29ms | 648.01ms | 52.31ms | 86.17ms | 68.16ms |
| 10x5 - 2 sources - read 20.0% (simple) | 356.82ms | 452.66ms | 2.10s | 234.13ms | 543.83ms | 238.51ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 246.97ms | 274.68ms | 1.55s | 178.36ms | 286.19ms | 201.71ms |
| 1000x12 - 4 sources - dynamic (large) | 474.73ms | 3.55s | 2.04s | 288.46ms | 3.94s | 362.08ms |
| 1000x5 - 25 sources (wide dense) | 600.26ms | 2.60s | 3.61s | 419.64ms | 3.44s | 502.74ms |
| 5x500 - 3 sources (deep) | 261.84ms | 233.11ms | 1.18s | 191.96ms | 229.13ms | 207.44ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 390.31ms | 447.06ms | 1.82s | 269.52ms | 485.10ms | 261.41ms |

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
