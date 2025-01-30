# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.77 | 100.0% | 35/35 | 3.68s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 9.71s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.09s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.54s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.90s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| Test Case | solidart | mobx | state_beacon | signals | alien_signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.20s | 2.34s | 154.34ms (fail) | 210.15ms | 203.68ms | 211.04ms |
| broadPropagation | 5.52s | 4.40s | 6.12ms (fail) | 462.77ms | 350.03ms | 457.11ms |
| deepPropagation | 2.00s | 1.56s | 138.06ms (fail) | 177.78ms | 123.31ms | 172.98ms |
| diamond | 3.48s | 2.46s | 185.27ms (fail) | 282.77ms | 236.34ms | 273.41ms |
| mux | 2.06s | 1.84s | 197.86ms (fail) | 412.24ms | 380.00ms | 385.09ms |
| repeatedObservers | 217.57ms | 233.62ms | 53.92ms (fail) | 44.63ms | 43.78ms | 40.92ms |
| triangle | 1.15s | 785.02ms | 79.56ms (fail) | 103.72ms | 87.11ms | 97.52ms |
| unstable | 347.09ms | 346.95ms | 335.94ms (fail) | 77.53ms | 59.32ms | 69.82ms |
| molBench | 1.75s | 587.90ms | 1.10ms | 487.76ms | 484.84ms | 483.77ms |
| create_signals | 79.18ms | 75.10ms | 72.16ms | 32.31ms | 20.37ms | 4.66ms |
| comp_0to1 | 33.44ms | 15.30ms | 56.74ms | 14.89ms | 5.03ms | 16.98ms |
| comp_1to1 | 41.29ms | 43.05ms | 53.51ms | 18.36ms | 11.56ms | 16.47ms |
| comp_2to1 | 24.23ms | 21.13ms | 33.40ms | 12.64ms | 14.45ms | 21.33ms |
| comp_4to1 | 18.55ms | 22.24ms | 17.03ms | 4.60ms | 1.77ms | 13.45ms |
| comp_1000to1 | 4.32ms | 17μs | 46μs | 5μs | 5μs | 6μs |
| comp_1to2 | 26.58ms | 32.34ms | 45.68ms | 22.90ms | 8.81ms | 13.68ms |
| comp_1to4 | 28.02ms | 17.72ms | 43.21ms | 15.50ms | 11.49ms | 25.43ms |
| comp_1to8 | 23.21ms | 19.58ms | 43.60ms | 6.93ms | 4.90ms | 6.80ms |
| comp_1to1000 | 19.17ms | 15.54ms | 40.44ms | 5.79ms | 3.54ms | 4.58ms |
| update_1to1 | 42.84ms | 27.91ms | 8.28ms | 9.48ms | 4.43ms | 8.75ms |
| update_2to1 | 21.91ms | 13.85ms | 2.95ms | 4.68ms | 2.68ms | 4.35ms |
| update_4to1 | 10.76ms | 7.48ms | 2.39ms | 2.34ms | 1.13ms | 2.21ms |
| update_1000to1 | 115μs | 76μs | 14μs | 23μs | 11μs | 21μs |
| update_1to2 | 21.46ms | 13.89ms | 3.44ms | 4.74ms | 2.19ms | 4.36ms |
| update_1to4 | 10.98ms | 6.85ms | 1.50ms | 2.38ms | 1.14ms | 2.21ms |
| update_1to1000 | 241μs | 162μs | 400μs | 45μs | 38μs | 189μs |
| cellx1000 | 155.28ms | 71.20ms | 5.09ms | 11.48ms | 7.36ms | 10.03ms |
| cellx2500 | 467.92ms | 247.25ms | 18.55ms | 36.36ms | 19.48ms | 25.93ms |
| cellx5000 | 1.06s | 549.54ms | 57.28ms | 79.39ms | 41.68ms | 84.01ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.64s (partial) | 2.03s | 249.54ms | 560.47ms | 223.06ms | 428.28ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.39s (partial) | 1.51s | 207.12ms | 275.96ms | 173.47ms | 275.63ms |
| 1000x12 - 4 sources - dynamic (large) | 4.12s (partial) | 1.84s | 335.72ms | 3.64s | 282.70ms | 3.35s |
| 1000x5 - 25 sources (wide dense) | 5.13s (partial) | 3.53s | 515.81ms | 3.36s | 397.30ms | 2.52s |
| 5x500 - 3 sources (deep) | 2.05s (partial) | 1.13s | 232.82ms | 230.46ms | 203.63ms | 227.08ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.76s (partial) | 1.73s | 259.75ms | 482.38ms | 266.39ms | 448.40ms |

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
