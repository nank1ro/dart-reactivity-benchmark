# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.32s |
| 🥈 | preact_signals | 0.30 | 100.0% | 35/35 | 8.47s |
| 🥉 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 4.84s |
| 4 | signals | 0.28 | 100.0% | 35/35 | 9.19s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.01s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.06s |

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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 194.95ms | 167.42ms | 135.69ms (fail) | 246.73ms | 183.35ms | 2.23s |
| broadPropagation | 385.06ms | 301.61ms | 5.74ms (fail) | 453.75ms | 385.80ms | 4.10s |
| deepPropagation | 170.84ms | 108.31ms | 150.94ms (fail) | 150.16ms | 173.83ms | 1.44s |
| diamond | 259.51ms | 235.69ms | 177.46ms (fail) | 344.27ms | 252.35ms | 2.24s |
| mux | 330.57ms | 322.71ms | 157.50ms (fail) | 379.98ms | 320.49ms | 1.72s |
| repeatedObservers | 38.94ms | 40.21ms | 47.35ms (fail) | 72.57ms | 32.58ms | 218.04ms |
| triangle | 91.72ms | 79.90ms | 74.99ms (fail) | 112.32ms | 92.80ms | 739.33ms |
| unstable | 64.49ms | 58.79ms | 323.97ms (fail) | 97.30ms | 56.44ms | 316.64ms |
| molBench | 388.58ms | 365.01ms | 975μs | 396.11ms | 364.27ms | 478.67ms |
| create_signals | 27.71ms | 32.03ms | 68.00ms | 71.46ms | 6.51ms | 67.97ms |
| comp_0to1 | 11.16ms | 9.13ms | 50.51ms | 25.42ms | 19.54ms | 24.99ms |
| comp_1to1 | 32.26ms | 5.67ms | 53.76ms | 29.85ms | 18.93ms | 55.08ms |
| comp_2to1 | 8.07ms | 3.29ms | 43.64ms | 28.97ms | 11.87ms | 24.50ms |
| comp_4to1 | 3.20ms | 10.57ms | 18.44ms | 8.88ms | 9.94ms | 16.86ms |
| comp_1000to1 | 6μs | 6μs | 41μs | 19μs | 12μs | 19μs |
| comp_1to2 | 21.65ms | 18.24ms | 45.25ms | 41.12ms | 14.99ms | 39.13ms |
| comp_1to4 | 13.00ms | 6.69ms | 43.97ms | 29.34ms | 22.64ms | 24.35ms |
| comp_1to8 | 11.97ms | 6.54ms | 43.61ms | 24.50ms | 7.89ms | 23.57ms |
| comp_1to1000 | 5.51ms | 4.27ms | 38.69ms | 14.73ms | 5.32ms | 15.59ms |
| update_1to1 | 8.90ms | 3.88ms | 4.59ms | 14.33ms | 8.50ms | 19.57ms |
| update_2to1 | 4.47ms | 2.02ms | 2.43ms | 7.19ms | 4.17ms | 10.02ms |
| update_4to1 | 2.14ms | 1.00ms | 1.16ms | 3.57ms | 2.07ms | 5.11ms |
| update_1000to1 | 24μs | 10μs | 12μs | 37μs | 20μs | 49μs |
| update_1to2 | 4.38ms | 1.91ms | 2.33ms | 7.20ms | 4.59ms | 9.99ms |
| update_1to4 | 2.25ms | 967μs | 1.23ms | 3.62ms | 1.94ms | 4.84ms |
| update_1to1000 | 64μs | 41μs | 372μs | 145μs | 54μs | 161μs |
| cellx1000 | 11.31ms | 8.53ms | 8.42ms | 16.29ms | 10.88ms | 84.76ms |
| cellx2500 | 34.11ms | 26.30ms | 29.12ms | 45.90ms | 27.97ms | 253.86ms |
| cellx5000 | 69.09ms | 59.47ms | 65.68ms | 98.34ms | 72.83ms | 541.00ms |
| 10x5 - 2 sources - read 20.0% (simple) | 417.87ms | 226.24ms | 222.00ms | 360.56ms | 382.30ms | 2.00s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 237.36ms | 173.94ms | 172.76ms | 251.16ms | 234.41ms | 1.49s |
| 1000x12 - 4 sources - dynamic (large) | 3.14s | 251.39ms | 268.45ms | 370.21ms | 2.94s | 1.66s |
| 1000x5 - 25 sources (wide dense) | 2.58s | 356.81ms | 378.37ms | 542.96ms | 2.21s | 3.39s |
| 5x500 - 3 sources (deep) | 218.28ms | 206.04ms | 204.40ms | 281.26ms | 219.16ms | 1.11s |
| 100x15 - 6 sources - dynamic (very dynamic) | 401.19ms | 223.31ms | 219.91ms | 304.89ms | 374.74ms | 1.64s |

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
