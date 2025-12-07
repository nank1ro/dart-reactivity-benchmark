# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.31 | 100.0% | 35/35 | 5.33s |
| 🥉 | signals | 0.28 | 100.0% | 35/35 | 11.09s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.07s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.69s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.54s |

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
| avoidablePropagation | 214.41ms | 187.93ms | 146.22ms (fail) | 278.00ms | 208.54ms | 2.41s |
| broadPropagation | 465.45ms | 357.83ms | 6.44ms (fail) | 502.09ms | 453.28ms | 4.41s |
| deepPropagation | 171.36ms | 130.34ms | 140.48ms (fail) | 167.99ms | 180.12ms | 1.54s |
| diamond | 286.58ms | 232.86ms | 214.47ms (fail) | 354.23ms | 284.55ms | 2.43s |
| mux | 398.30ms | 364.41ms | 184.81ms (fail) | 419.42ms | 382.72ms | 1.89s |
| repeatedObservers | 46.08ms | 45.02ms | 54.21ms (fail) | 82.67ms | 40.78ms | 234.45ms |
| triangle | 105.28ms | 86.43ms | 85.14ms (fail) | 116.52ms | 100.79ms | 766.58ms |
| unstable | 77.16ms | 63.31ms | 335.73ms (fail) | 96.04ms | 69.55ms | 347.90ms |
| molBench | 502.44ms | 490.27ms | 999μs | 492.86ms | 483.77ms | 596.41ms |
| create_signals | 45.24ms | 29.00ms | 65.62ms | 93.35ms | 16.35ms | 74.60ms |
| comp_0to1 | 16.14ms | 11.79ms | 55.35ms | 29.96ms | 29.34ms | 16.18ms |
| comp_1to1 | 29.12ms | 9.81ms | 55.38ms | 51.72ms | 9.64ms | 43.93ms |
| comp_2to1 | 10.12ms | 17.57ms | 40.75ms | 27.44ms | 12.17ms | 26.46ms |
| comp_4to1 | 2.19ms | 1.98ms | 18.02ms | 11.27ms | 14.53ms | 27.26ms |
| comp_1000to1 | 7μs | 10μs | 41μs | 15μs | 8μs | 15μs |
| comp_1to2 | 28.18ms | 12.70ms | 44.95ms | 41.53ms | 29.77ms | 39.78ms |
| comp_1to4 | 11.30ms | 8.97ms | 47.15ms | 16.04ms | 23.43ms | 18.40ms |
| comp_1to8 | 8.09ms | 4.49ms | 43.82ms | 20.65ms | 7.91ms | 21.07ms |
| comp_1to1000 | 5.36ms | 4.32ms | 38.42ms | 14.78ms | 8.23ms | 15.89ms |
| update_1to1 | 9.29ms | 4.62ms | 6.58ms | 15.43ms | 8.90ms | 22.83ms |
| update_2to1 | 4.75ms | 2.58ms | 3.31ms | 7.74ms | 4.41ms | 10.37ms |
| update_4to1 | 2.36ms | 1.34ms | 1.58ms | 4.21ms | 2.22ms | 6.32ms |
| update_1000to1 | 23μs | 11μs | 16μs | 38μs | 22μs | 55μs |
| update_1to2 | 4.64ms | 2.90ms | 3.08ms | 7.90ms | 4.38ms | 10.97ms |
| update_1to4 | 2.52ms | 2.43ms | 1.59ms | 3.88ms | 2.28ms | 5.46ms |
| update_1to1000 | 50μs | 55μs | 370μs | 157μs | 2.95ms | 181μs |
| cellx1000 | 11.00ms | 9.74ms | 5.53ms | 12.72ms | 9.68ms | 88.62ms |
| cellx2500 | 39.91ms | 20.32ms | 31.98ms | 39.84ms | 25.70ms | 282.71ms |
| cellx5000 | 100.68ms | 45.77ms | 92.86ms | 100.95ms | 82.68ms | 619.94ms |
| 10x5 - 2 sources - read 20.0% (simple) | 519.23ms | 240.33ms | 251.03ms | 348.09ms | 443.25ms | 1.98s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 292.67ms | 176.42ms | 207.45ms | 246.29ms | 268.81ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 3.68s | 289.17ms | 351.06ms | 484.30ms | 3.65s | 1.98s |
| 1000x5 - 25 sources (wide dense) | 3.29s | 402.33ms | 526.60ms | 602.88ms | 2.53s | 3.45s |
| 5x500 - 3 sources (deep) | 227.08ms | 197.99ms | 215.27ms | 256.62ms | 229.50ms | 1.12s |
| 100x15 - 6 sources - dynamic (very dynamic) | 483.11ms | 266.36ms | 265.56ms | 382.19ms | 447.17ms | 1.68s |

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
