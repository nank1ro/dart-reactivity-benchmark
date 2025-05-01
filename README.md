# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.24s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.29s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.02s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.42s |
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
| Test Case | solidart(2.0-dev) | preact_signals | alien_signals | state_beacon | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 273.17ms | 205.20ms | 186.63ms | 151.75ms (fail) | 2.35s | 214.71ms |
| broadPropagation | 501.83ms | 457.50ms | 352.50ms | 6.36ms (fail) | 4.22s | 461.30ms |
| deepPropagation | 171.43ms | 179.55ms | 126.98ms | 142.09ms (fail) | 1.52s | 180.44ms |
| diamond | 351.76ms | 279.86ms | 236.48ms | 200.67ms (fail) | 2.40s | 290.53ms |
| mux | 438.19ms | 384.64ms | 372.52ms | 191.96ms (fail) | 1.84s | 410.14ms |
| repeatedObservers | 78.86ms | 38.83ms | 44.88ms | 53.56ms (fail) | 233.94ms | 46.52ms |
| triangle | 114.94ms | 103.86ms | 85.75ms | 79.78ms (fail) | 760.66ms | 99.93ms |
| unstable | 94.92ms | 70.43ms | 61.52ms | 338.17ms (fail) | 351.61ms | 72.37ms |
| molBench | 493.72ms | 491.35ms | 492.02ms | 1.03ms | 575.86ms | 488.51ms |
| create_signals | 92.01ms | 5.30ms | 26.31ms | 67.82ms | 62.04ms | 24.95ms |
| comp_0to1 | 31.05ms | 17.67ms | 7.23ms | 56.09ms | 15.21ms | 13.96ms |
| comp_1to1 | 46.31ms | 11.51ms | 4.17ms | 55.83ms | 43.75ms | 24.16ms |
| comp_2to1 | 23.82ms | 16.49ms | 2.24ms | 36.92ms | 22.11ms | 9.23ms |
| comp_4to1 | 16.94ms | 12.96ms | 7.75ms | 18.65ms | 30.61ms | 2.24ms |
| comp_1000to1 | 15μs | 5μs | 3μs | 42μs | 15μs | 6μs |
| comp_1to2 | 34.41ms | 26.25ms | 11.32ms | 45.79ms | 37.78ms | 16.43ms |
| comp_1to4 | 20.61ms | 23.29ms | 12.87ms | 43.31ms | 18.83ms | 13.44ms |
| comp_1to8 | 21.88ms | 5.86ms | 3.93ms | 42.33ms | 22.46ms | 6.97ms |
| comp_1to1000 | 14.40ms | 6.23ms | 3.22ms | 37.70ms | 15.32ms | 4.54ms |
| update_1to1 | 16.18ms | 8.20ms | 11.35ms | 5.74ms | 25.32ms | 9.26ms |
| update_2to1 | 7.92ms | 4.07ms | 4.95ms | 2.87ms | 13.10ms | 4.74ms |
| update_4to1 | 4.03ms | 2.11ms | 2.79ms | 1.46ms | 6.70ms | 2.34ms |
| update_1000to1 | 40μs | 50μs | 15μs | 15μs | 63μs | 23μs |
| update_1to2 | 8.22ms | 4.07ms | 5.70ms | 2.93ms | 13.32ms | 4.93ms |
| update_1to4 | 4.04ms | 2.05ms | 2.57ms | 1.46ms | 5.95ms | 2.36ms |
| update_1to1000 | 151μs | 1.03ms | 47μs | 373μs | 166μs | 44μs |
| cellx1000 | 13.63ms | 9.87ms | 7.73ms | 5.73ms | 76.07ms | 9.75ms |
| cellx2500 | 31.02ms | 25.77ms | 19.45ms | 29.95ms | 258.93ms | 31.02ms |
| cellx5000 | 65.87ms | 64.68ms | 43.96ms | 75.73ms | 556.47ms | 58.98ms |
| 10x5 - 2 sources - read 20.0% (simple) | 344.24ms | 445.86ms | 230.93ms | 250.43ms | 2.00s | 505.85ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 242.71ms | 276.49ms | 176.08ms | 202.18ms | 1.54s | 278.96ms |
| 1000x12 - 4 sources - dynamic (large) | 461.30ms | 3.55s | 280.98ms | 343.88ms | 1.96s | 3.78s |
| 1000x5 - 25 sources (wide dense) | 590.60ms | 2.60s | 405.76ms | 508.40ms | 3.60s | 3.52s |
| 5x500 - 3 sources (deep) | 253.50ms | 235.79ms | 190.68ms | 206.05ms | 1.14s | 229.83ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 373.55ms | 448.70ms | 267.88ms | 263.91ms | 1.71s | 473.58ms |

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
