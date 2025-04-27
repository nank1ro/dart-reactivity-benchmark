# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.81s |
| 🥈 | preact_signals | 0.31 | 100.0% | 35/35 | 10.06s |
| 🥉 | signals | 0.28 | 100.0% | 35/35 | 11.71s |
| 4 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.46s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.20s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.49s |

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
| avoidablePropagation | 276.07ms | 205.63ms | 192.59ms | 150.41ms (fail) | 2.36s | 214.47ms |
| broadPropagation | 507.92ms | 502.07ms | 358.86ms | 6.48ms (fail) | 4.31s | 453.27ms |
| deepPropagation | 174.25ms | 178.38ms | 126.32ms | 144.02ms (fail) | 1.54s | 175.65ms |
| diamond | 359.15ms | 273.49ms | 235.79ms | 186.14ms (fail) | 2.44s | 289.36ms |
| mux | 445.72ms | 388.08ms | 373.51ms | 192.74ms (fail) | 1.87s | 421.72ms |
| repeatedObservers | 78.27ms | 38.09ms | 45.49ms | 53.41ms (fail) | 228.24ms | 46.86ms |
| triangle | 117.77ms | 98.73ms | 91.71ms | 80.48ms (fail) | 791.55ms | 103.64ms |
| unstable | 94.26ms | 71.59ms | 61.02ms | 343.78ms (fail) | 353.67ms | 75.06ms |
| molBench | 492.63ms | 493.32ms | 492.40ms | 948μs | 581.47ms | 488.78ms |
| create_signals | 74.65ms | 16.49ms | 27.95ms | 60.84ms | 55.18ms | 26.79ms |
| comp_0to1 | 32.25ms | 15.51ms | 7.83ms | 53.51ms | 15.38ms | 12.58ms |
| comp_1to1 | 55.09ms | 7.09ms | 4.24ms | 54.88ms | 46.33ms | 19.17ms |
| comp_2to1 | 30.90ms | 10.16ms | 2.30ms | 37.51ms | 35.81ms | 17.58ms |
| comp_4to1 | 22.43ms | 8.59ms | 9.11ms | 16.52ms | 15.19ms | 4.88ms |
| comp_1000to1 | 19μs | 5μs | 6μs | 42μs | 15μs | 5μs |
| comp_1to2 | 35.77ms | 15.87ms | 19.75ms | 45.14ms | 35.18ms | 23.53ms |
| comp_1to4 | 27.27ms | 30.98ms | 7.07ms | 43.91ms | 17.85ms | 9.74ms |
| comp_1to8 | 27.80ms | 7.72ms | 7.46ms | 43.10ms | 21.07ms | 6.56ms |
| comp_1to1000 | 15.23ms | 5.54ms | 3.91ms | 38.03ms | 14.80ms | 4.67ms |
| update_1to1 | 16.30ms | 8.31ms | 11.33ms | 5.72ms | 22.19ms | 9.29ms |
| update_2to1 | 7.93ms | 4.11ms | 5.14ms | 2.90ms | 11.16ms | 4.60ms |
| update_4to1 | 4.09ms | 2.06ms | 3.05ms | 1.48ms | 6.39ms | 2.31ms |
| update_1000to1 | 40μs | 20μs | 19μs | 15μs | 53μs | 23μs |
| update_1to2 | 7.95ms | 4.05ms | 5.61ms | 2.94ms | 11.73ms | 4.93ms |
| update_1to4 | 4.07ms | 2.02ms | 2.43ms | 1.50ms | 5.94ms | 2.33ms |
| update_1to1000 | 164μs | 159μs | 48μs | 379μs | 160μs | 44μs |
| cellx1000 | 15.52ms | 10.70ms | 9.34ms | 7.30ms | 93.14ms | 10.20ms |
| cellx2500 | 70.47ms | 35.15ms | 27.94ms | 32.90ms | 296.59ms | 40.28ms |
| cellx5000 | 163.86ms | 100.24ms | 90.66ms | 98.79ms | 633.48ms | 96.41ms |
| 10x5 - 2 sources - read 20.0% (simple) | 353.65ms | 439.58ms | 233.36ms | 240.87ms | 2.07s | 504.66ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 243.27ms | 268.94ms | 175.89ms | 204.54ms | 1.55s | 285.81ms |
| 1000x12 - 4 sources - dynamic (large) | 481.20ms | 3.52s | 289.81ms | 350.74ms | 1.96s | 4.02s |
| 1000x5 - 25 sources (wide dense) | 593.08ms | 2.61s | 421.14ms | 511.55ms | 3.65s | 3.63s |
| 5x500 - 3 sources (deep) | 253.71ms | 234.16ms | 197.78ms | 210.01ms | 1.34s | 227.87ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 378.12ms | 453.58ms | 269.44ms | 261.89ms | 1.80s | 479.80ms |

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
