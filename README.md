# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.26s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.30s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.44s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.12s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.40s |

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
| avoidablePropagation | 275.49ms | 214.62ms | 2.35s | 202.96ms | 150.75ms (fail) | 184.77ms |
| broadPropagation | 504.38ms | 443.88ms | 4.70s | 457.53ms | 6.51ms (fail) | 344.78ms |
| deepPropagation | 170.90ms | 178.64ms | 1.56s | 177.92ms | 144.95ms (fail) | 120.85ms |
| diamond | 353.86ms | 278.60ms | 2.51s | 281.21ms | 187.03ms (fail) | 231.94ms |
| mux | 444.38ms | 410.44ms | 1.87s | 404.43ms | 192.27ms (fail) | 366.58ms |
| repeatedObservers | 81.31ms | 45.31ms | 236.77ms | 40.08ms | 52.73ms (fail) | 45.42ms |
| triangle | 117.79ms | 100.43ms | 774.96ms | 99.38ms | 77.78ms (fail) | 83.89ms |
| unstable | 97.72ms | 79.09ms | 355.91ms | 70.19ms | 335.97ms (fail) | 67.41ms |
| molBench | 493.86ms | 485.06ms | 577.61ms | 487.92ms | 950μs | 484.50ms |
| create_signals | 74.53ms | 25.40ms | 87.41ms | 5.16ms | 63.27ms | 27.98ms |
| comp_0to1 | 27.70ms | 11.63ms | 36.62ms | 17.09ms | 60.22ms | 6.61ms |
| comp_1to1 | 29.41ms | 21.21ms | 18.45ms | 14.25ms | 61.89ms | 4.11ms |
| comp_2to1 | 46.40ms | 15.09ms | 9.59ms | 17.14ms | 35.39ms | 2.28ms |
| comp_4to1 | 20.39ms | 2.77ms | 18.56ms | 14.40ms | 16.30ms | 8.43ms |
| comp_1000to1 | 17μs | 5μs | 23μs | 4μs | 41μs | 4μs |
| comp_1to2 | 33.58ms | 15.33ms | 33.48ms | 17.91ms | 44.31ms | 15.12ms |
| comp_1to4 | 22.79ms | 16.89ms | 24.27ms | 35.04ms | 42.72ms | 4.77ms |
| comp_1to8 | 24.36ms | 6.32ms | 25.02ms | 8.68ms | 41.77ms | 4.56ms |
| comp_1to1000 | 17.14ms | 4.31ms | 16.30ms | 4.93ms | 37.97ms | 3.40ms |
| update_1to1 | 16.08ms | 8.91ms | 28.05ms | 8.59ms | 5.74ms | 10.43ms |
| update_2to1 | 7.80ms | 4.48ms | 13.02ms | 4.26ms | 3.10ms | 2.32ms |
| update_4to1 | 4.00ms | 2.23ms | 6.89ms | 2.19ms | 1.41ms | 2.59ms |
| update_1000to1 | 40μs | 22μs | 69μs | 21μs | 14μs | 24μs |
| update_1to2 | 8.07ms | 4.50ms | 12.49ms | 4.84ms | 2.82ms | 5.18ms |
| update_1to4 | 4.00ms | 2.23ms | 7.32ms | 2.19ms | 1.45ms | 2.47ms |
| update_1to1000 | 170μs | 41μs | 172μs | 148μs | 384μs | 57μs |
| cellx1000 | 12.08ms | 9.56ms | 71.69ms | 9.68ms | 5.69ms | 7.16ms |
| cellx2500 | 32.38ms | 31.79ms | 255.19ms | 26.45ms | 22.07ms | 19.04ms |
| cellx5000 | 72.12ms | 63.13ms | 570.23ms | 72.17ms | 57.60ms | 44.74ms |
| 10x5 - 2 sources - read 20.0% (simple) | 354.10ms | 510.04ms | 2.03s | 447.46ms | 253.13ms | 235.85ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 242.10ms | 291.44ms | 1.57s | 283.05ms | 199.60ms | 177.95ms |
| 1000x12 - 4 sources - dynamic (large) | 463.77ms | 3.92s | 1.90s | 3.71s | 329.67ms | 286.37ms |
| 1000x5 - 25 sources (wide dense) | 578.78ms | 3.54s | 3.56s | 2.70s | 500.37ms | 412.23ms |
| 5x500 - 3 sources (deep) | 251.37ms | 227.50ms | 1.16s | 230.68ms | 202.40ms | 189.62ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 378.60ms | 471.14ms | 1.71s | 451.72ms | 259.32ms | 263.06ms |

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
