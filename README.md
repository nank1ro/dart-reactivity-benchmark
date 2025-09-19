# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.24s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.16s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.33s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.33s |
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
| Test Case | preact_signals | state_beacon | solidart(2.0-dev) | signals | alien_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 207.02ms | 147.05ms (fail) | 259.88ms | 213.87ms | 192.04ms | 2.36s |
| broadPropagation | 462.57ms | 6.36ms (fail) | 486.50ms | 457.36ms | 351.03ms | 4.40s |
| deepPropagation | 184.55ms | 139.56ms (fail) | 162.92ms | 170.11ms | 126.34ms | 1.55s |
| diamond | 285.93ms | 186.28ms (fail) | 345.23ms | 281.96ms | 237.34ms | 2.40s |
| mux | 386.50ms | 195.61ms (fail) | 427.57ms | 404.50ms | 378.98ms | 1.82s |
| repeatedObservers | 40.08ms | 52.53ms (fail) | 80.77ms | 46.04ms | 43.49ms | 231.94ms |
| triangle | 99.16ms | 77.63ms (fail) | 113.60ms | 114.02ms | 84.84ms | 778.17ms |
| unstable | 74.96ms | 341.17ms (fail) | 95.30ms | 75.94ms | 59.58ms | 348.19ms |
| molBench | 485.04ms | 1.07ms | 497.81ms | 486.89ms | 488.82ms | 585.28ms |
| create_signals | 5.43ms | 62.94ms | 57.13ms | 25.04ms | 26.89ms | 88.21ms |
| comp_0to1 | 17.34ms | 56.37ms | 24.87ms | 11.74ms | 7.92ms | 15.92ms |
| comp_1to1 | 15.05ms | 64.54ms | 43.11ms | 28.43ms | 4.24ms | 41.40ms |
| comp_2to1 | 16.77ms | 38.63ms | 43.03ms | 8.46ms | 2.22ms | 33.87ms |
| comp_4to1 | 12.89ms | 16.70ms | 4.33ms | 3.77ms | 7.65ms | 15.30ms |
| comp_1000to1 | 5μs | 45μs | 18μs | 5μs | 6μs | 15μs |
| comp_1to2 | 14.29ms | 48.44ms | 36.59ms | 14.95ms | 17.78ms | 40.19ms |
| comp_1to4 | 26.47ms | 46.96ms | 14.66ms | 7.07ms | 9.03ms | 28.31ms |
| comp_1to8 | 6.15ms | 46.21ms | 19.08ms | 6.82ms | 3.72ms | 20.73ms |
| comp_1to1000 | 6.62ms | 41.96ms | 14.07ms | 4.41ms | 3.48ms | 15.43ms |
| update_1to1 | 8.26ms | 6.03ms | 16.35ms | 10.28ms | 10.04ms | 23.91ms |
| update_2to1 | 4.36ms | 3.62ms | 8.02ms | 4.53ms | 2.68ms | 12.65ms |
| update_4to1 | 2.15ms | 1.55ms | 4.10ms | 2.60ms | 2.53ms | 5.62ms |
| update_1000to1 | 20μs | 15μs | 40μs | 25μs | 10μs | 69μs |
| update_1to2 | 4.08ms | 3.04ms | 8.39ms | 4.49ms | 5.02ms | 13.30ms |
| update_1to4 | 2.10ms | 1.56ms | 4.14ms | 2.58ms | 2.37ms | 6.28ms |
| update_1to1000 | 960μs | 418μs | 149μs | 42μs | 46μs | 182μs |
| cellx1000 | 9.61ms | 5.56ms | 15.55ms | 10.96ms | 7.78ms | 79.18ms |
| cellx2500 | 27.03ms | 23.81ms | 33.97ms | 31.42ms | 20.46ms | 236.51ms |
| cellx5000 | 77.99ms | 63.38ms | 74.75ms | 60.82ms | 42.83ms | 588.64ms |
| 10x5 - 2 sources - read 20.0% (simple) | 447.27ms | 264.85ms | 377.73ms | 507.83ms | 237.53ms | 2.01s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 275.22ms | 203.83ms | 249.03ms | 285.42ms | 181.18ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 3.72s | 352.50ms | 465.86ms | 3.74s | 281.26ms | 1.74s |
| 1000x5 - 25 sources (wide dense) | 2.72s | 516.48ms | 610.58ms | 3.43s | 404.86ms | 3.50s |
| 5x500 - 3 sources (deep) | 228.87ms | 209.60ms | 254.21ms | 222.22ms | 193.95ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 451.92ms | 263.76ms | 386.18ms | 487.82ms | 268.84ms | 1.67s |

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
