# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.65 | 100.0% | 35/35 | 3.72s |
| 🥈 | preact_signals | 0.30 | 100.0% | 35/35 | 9.90s |
| 🥉 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.20s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.37s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.50s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.45s |

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
| avoidablePropagation | 270.91ms | 206.04ms | 2.34s | 179.67ms | 214.21ms | 157.24ms (fail) |
| broadPropagation | 502.58ms | 457.52ms | 4.20s | 352.92ms | 457.55ms | 5.90ms (fail) |
| deepPropagation | 170.15ms | 175.65ms | 1.52s | 124.57ms | 176.53ms | 138.43ms (fail) |
| diamond | 352.37ms | 280.50ms | 2.43s | 242.72ms | 287.96ms | 182.60ms (fail) |
| mux | 437.73ms | 381.11ms | 1.80s | 374.78ms | 405.49ms | 193.06ms (fail) |
| repeatedObservers | 77.86ms | 38.35ms | 229.83ms | 44.84ms | 46.47ms | 52.65ms (fail) |
| triangle | 116.89ms | 98.44ms | 766.63ms | 83.88ms | 104.96ms | 77.94ms (fail) |
| unstable | 93.61ms | 70.91ms | 346.34ms | 60.77ms | 74.49ms | 348.94ms (fail) |
| molBench | 492.96ms | 490.84ms | 581.57ms | 492.10ms | 488.46ms | 1.24ms |
| create_signals | 51.86ms | 4.65ms | 90.74ms | 26.22ms | 24.32ms | 57.63ms |
| comp_0to1 | 26.55ms | 17.85ms | 15.26ms | 7.85ms | 11.79ms | 50.99ms |
| comp_1to1 | 38.12ms | 14.46ms | 43.47ms | 4.34ms | 26.72ms | 52.55ms |
| comp_2to1 | 36.36ms | 15.81ms | 33.36ms | 2.23ms | 9.50ms | 35.05ms |
| comp_4to1 | 12.84ms | 11.76ms | 16.43ms | 8.69ms | 2.21ms | 15.87ms |
| comp_1000to1 | 15μs | 4μs | 20μs | 4μs | 9μs | 41μs |
| comp_1to2 | 36.21ms | 18.56ms | 34.43ms | 12.04ms | 13.19ms | 43.79ms |
| comp_1to4 | 19.70ms | 7.40ms | 18.61ms | 13.11ms | 18.65ms | 42.95ms |
| comp_1to8 | 21.92ms | 7.89ms | 22.44ms | 3.96ms | 6.06ms | 41.94ms |
| comp_1to1000 | 14.69ms | 4.46ms | 14.82ms | 3.17ms | 5.60ms | 37.67ms |
| update_1to1 | 16.12ms | 8.24ms | 26.14ms | 11.37ms | 9.29ms | 5.73ms |
| update_2to1 | 7.91ms | 4.08ms | 12.24ms | 5.00ms | 4.66ms | 2.91ms |
| update_4to1 | 4.04ms | 2.06ms | 6.87ms | 2.76ms | 2.32ms | 1.47ms |
| update_1000to1 | 40μs | 20μs | 63μs | 18μs | 23μs | 15μs |
| update_1to2 | 8.06ms | 4.06ms | 13.34ms | 5.62ms | 4.86ms | 2.93ms |
| update_1to4 | 4.03ms | 2.06ms | 5.95ms | 2.48ms | 2.31ms | 1.48ms |
| update_1to1000 | 157μs | 49μs | 168μs | 55μs | 44μs | 387μs |
| cellx1000 | 11.14ms | 9.66ms | 70.84ms | 7.29ms | 9.46ms | 5.10ms |
| cellx2500 | 32.57ms | 25.71ms | 240.50ms | 19.59ms | 25.70ms | 25.94ms |
| cellx5000 | 71.49ms | 65.09ms | 560.41ms | 44.14ms | 62.27ms | 61.36ms |
| 10x5 - 2 sources - read 20.0% (simple) | 353.04ms | 443.36ms | 2.03s | 239.36ms | 522.38ms | 265.65ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 240.35ms | 270.39ms | 1.58s | 180.69ms | 284.40ms | 225.79ms |
| 1000x12 - 4 sources - dynamic (large) | 456.10ms | 3.50s | 1.91s | 282.20ms | 3.80s | 344.28ms |
| 1000x5 - 25 sources (wide dense) | 584.15ms | 2.58s | 3.62s | 420.50ms | 3.56s | 508.51ms |
| 5x500 - 3 sources (deep) | 256.80ms | 234.08ms | 1.17s | 194.69ms | 227.89ms | 204.57ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 380.37ms | 446.57ms | 1.74s | 269.24ms | 480.99ms | 259.16ms |

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
