# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.66s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.38s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.23s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.20s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.63s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.37s |

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
| Test Case | solidart(2.0-dev) | signals | mobx | preact_signals | state_beacon | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 299.38ms | 215.58ms | 2.33s | 198.45ms | 149.31ms (fail) | 184.59ms |
| broadPropagation | 511.11ms | 457.16ms | 4.36s | 450.60ms | 5.86ms (fail) | 343.60ms |
| deepPropagation | 171.34ms | 175.20ms | 1.55s | 176.99ms | 137.86ms (fail) | 125.44ms |
| diamond | 358.84ms | 285.87ms | 2.44s | 279.36ms | 182.30ms (fail) | 228.88ms |
| mux | 440.97ms | 412.30ms | 1.83s | 399.11ms | 194.98ms (fail) | 371.27ms |
| repeatedObservers | 82.66ms | 45.49ms | 232.49ms | 40.14ms | 55.58ms (fail) | 45.48ms |
| triangle | 120.45ms | 104.75ms | 783.07ms | 98.78ms | 79.03ms (fail) | 85.02ms |
| unstable | 98.90ms | 79.51ms | 353.23ms | 70.59ms | 337.73ms (fail) | 67.60ms |
| molBench | 493.83ms | 486.33ms | 584.97ms | 482.37ms | 895μs | 480.71ms |
| create_signals | 77.10ms | 24.75ms | 51.33ms | 5.17ms | 60.48ms | 28.21ms |
| comp_0to1 | 33.91ms | 13.06ms | 16.62ms | 17.25ms | 52.40ms | 7.01ms |
| comp_1to1 | 40.55ms | 29.52ms | 45.76ms | 14.39ms | 54.06ms | 4.20ms |
| comp_2to1 | 41.58ms | 8.71ms | 33.46ms | 22.41ms | 37.38ms | 2.33ms |
| comp_4to1 | 9.77ms | 2.06ms | 18.81ms | 13.97ms | 16.36ms | 8.51ms |
| comp_1000to1 | 17μs | 4μs | 16μs | 5μs | 41μs | 4μs |
| comp_1to2 | 33.70ms | 22.04ms | 36.46ms | 17.71ms | 46.54ms | 14.90ms |
| comp_1to4 | 17.52ms | 12.25ms | 18.83ms | 35.06ms | 47.03ms | 5.18ms |
| comp_1to8 | 22.12ms | 9.20ms | 21.44ms | 7.82ms | 42.16ms | 4.48ms |
| comp_1to1000 | 16.89ms | 5.08ms | 18.24ms | 5.03ms | 38.46ms | 3.43ms |
| update_1to1 | 16.02ms | 8.97ms | 23.56ms | 8.67ms | 5.66ms | 10.26ms |
| update_2to1 | 7.81ms | 4.45ms | 11.19ms | 4.40ms | 3.10ms | 2.27ms |
| update_4to1 | 4.03ms | 2.26ms | 6.04ms | 2.18ms | 1.41ms | 2.54ms |
| update_1000to1 | 40μs | 22μs | 69μs | 21μs | 14μs | 25μs |
| update_1to2 | 8.03ms | 4.47ms | 11.98ms | 4.59ms | 2.81ms | 5.03ms |
| update_1to4 | 4.02ms | 2.26ms | 6.02ms | 2.17ms | 1.42ms | 2.46ms |
| update_1to1000 | 170μs | 41μs | 179μs | 147μs | 374μs | 38μs |
| cellx1000 | 11.90ms | 9.48ms | 75.94ms | 9.71ms | 5.05ms | 8.50ms |
| cellx2500 | 32.93ms | 31.29ms | 266.72ms | 26.06ms | 23.83ms | 20.11ms |
| cellx5000 | 73.42ms | 60.24ms | 550.88ms | 66.95ms | 72.05ms | 43.46ms |
| 10x5 - 2 sources - read 20.0% (simple) | 360.39ms | 516.29ms | 2.05s | 446.22ms | 244.07ms | 235.92ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 247.52ms | 294.08ms | 1.52s | 269.21ms | 202.23ms | 178.35ms |
| 1000x12 - 4 sources - dynamic (large) | 465.60ms | 3.75s | 1.90s | 3.66s | 337.23ms | 278.89ms |
| 1000x5 - 25 sources (wide dense) | 606.69ms | 3.46s | 3.62s | 2.69s | 476.59ms | 412.33ms |
| 5x500 - 3 sources (deep) | 283.58ms | 223.80ms | 1.16s | 226.98ms | 203.43ms | 188.35ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 386.80ms | 487.12ms | 1.69s | 447.15ms | 256.89ms | 262.76ms |

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
