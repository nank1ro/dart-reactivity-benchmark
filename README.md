# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.72s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.30s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.42s |
| 4 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.40s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.75s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.63s |

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
| avoidablePropagation | 216.05ms | 192.84ms | 160.14ms (fail) | 263.36ms | 200.82ms | 2.33s |
| broadPropagation | 461.96ms | 352.07ms | 6.40ms (fail) | 491.94ms | 468.47ms | 4.37s |
| deepPropagation | 179.83ms | 125.13ms | 152.53ms (fail) | 164.16ms | 177.95ms | 1.57s |
| diamond | 288.23ms | 236.02ms | 201.58ms (fail) | 348.02ms | 279.85ms | 2.43s |
| mux | 411.58ms | 378.26ms | 200.36ms (fail) | 436.14ms | 391.06ms | 1.81s |
| repeatedObservers | 46.58ms | 43.84ms | 52.85ms (fail) | 81.62ms | 39.87ms | 229.00ms |
| triangle | 103.00ms | 82.55ms | 81.45ms (fail) | 112.76ms | 101.03ms | 773.29ms |
| unstable | 76.26ms | 60.46ms | 342.69ms (fail) | 96.09ms | 74.26ms | 344.44ms |
| molBench | 488.12ms | 490.05ms | 961μs | 499.69ms | 488.24ms | 584.21ms |
| create_signals | 26.96ms | 27.68ms | 65.10ms | 80.19ms | 5.36ms | 70.01ms |
| comp_0to1 | 13.90ms | 6.85ms | 58.60ms | 26.59ms | 18.39ms | 15.88ms |
| comp_1to1 | 17.69ms | 4.21ms | 59.11ms | 48.52ms | 12.96ms | 51.71ms |
| comp_2to1 | 9.12ms | 2.30ms | 40.95ms | 27.56ms | 17.96ms | 36.40ms |
| comp_4to1 | 1.98ms | 7.81ms | 18.38ms | 18.14ms | 11.34ms | 28.91ms |
| comp_1000to1 | 5μs | 3μs | 45μs | 15μs | 6μs | 16μs |
| comp_1to2 | 18.36ms | 15.60ms | 49.61ms | 35.22ms | 13.22ms | 38.07ms |
| comp_1to4 | 7.46ms | 5.59ms | 47.76ms | 21.74ms | 27.91ms | 18.73ms |
| comp_1to8 | 6.71ms | 4.69ms | 47.02ms | 20.21ms | 7.37ms | 21.13ms |
| comp_1to1000 | 4.39ms | 3.49ms | 42.43ms | 14.17ms | 5.98ms | 15.34ms |
| update_1to1 | 10.14ms | 10.29ms | 6.01ms | 16.27ms | 8.34ms | 26.70ms |
| update_2to1 | 4.53ms | 2.46ms | 3.15ms | 8.03ms | 4.37ms | 14.18ms |
| update_4to1 | 2.56ms | 2.62ms | 1.56ms | 4.12ms | 2.09ms | 7.59ms |
| update_1000to1 | 25μs | 18μs | 15μs | 40μs | 21μs | 69μs |
| update_1to2 | 4.51ms | 5.30ms | 3.06ms | 8.39ms | 4.08ms | 13.47ms |
| update_1to4 | 2.54ms | 2.03ms | 1.57ms | 4.11ms | 2.09ms | 7.06ms |
| update_1to1000 | 44μs | 35μs | 424μs | 150μs | 170μs | 172μs |
| cellx1000 | 10.76ms | 7.55ms | 6.95ms | 14.32ms | 10.01ms | 93.59ms |
| cellx2500 | 45.38ms | 23.10ms | 40.85ms | 47.11ms | 31.50ms | 289.79ms |
| cellx5000 | 99.73ms | 56.48ms | 106.76ms | 165.26ms | 96.41ms | 638.11ms |
| 10x5 - 2 sources - read 20.0% (simple) | 518.01ms | 237.52ms | 261.81ms | 354.38ms | 445.43ms | 2.00s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.90ms | 181.57ms | 197.74ms | 254.28ms | 275.17ms | 1.51s |
| 1000x12 - 4 sources - dynamic (large) | 3.79s | 285.25ms | 375.77ms | 468.38ms | 3.77s | 2.01s |
| 1000x5 - 25 sources (wide dense) | 3.45s | 409.70ms | 516.14ms | 615.96ms | 2.73s | 3.48s |
| 5x500 - 3 sources (deep) | 223.68ms | 194.09ms | 211.19ms | 254.82ms | 231.54ms | 1.16s |
| 100x15 - 6 sources - dynamic (very dynamic) | 478.70ms | 264.97ms | 269.30ms | 395.07ms | 461.65ms | 1.76s |

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
