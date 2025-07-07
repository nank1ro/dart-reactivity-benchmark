# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.68s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.29s |
| 🥉 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.33s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.32s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.30s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.50s |

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
| Test Case | solidart(2.0-dev) | state_beacon | preact_signals | signals | mobx | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 279.79ms | 165.32ms (fail) | 202.02ms | 210.99ms | 2.35s | 183.08ms |
| broadPropagation | 523.15ms | 6.10ms (fail) | 503.08ms | 463.33ms | 4.51s | 345.19ms |
| deepPropagation | 177.57ms | 141.01ms (fail) | 180.80ms | 174.32ms | 1.59s | 122.82ms |
| diamond | 359.45ms | 181.49ms (fail) | 296.63ms | 282.23ms | 2.54s | 229.93ms |
| mux | 447.42ms | 194.94ms (fail) | 402.81ms | 414.20ms | 1.90s | 369.89ms |
| repeatedObservers | 81.63ms | 52.54ms (fail) | 41.33ms | 44.86ms | 236.15ms | 45.78ms |
| triangle | 119.19ms | 76.53ms (fail) | 103.76ms | 101.17ms | 782.38ms | 84.14ms |
| unstable | 97.30ms | 337.02ms (fail) | 73.95ms | 79.61ms | 356.75ms | 67.25ms |
| molBench | 494.68ms | 1.00ms | 489.15ms | 486.11ms | 578.07ms | 487.56ms |
| create_signals | 58.43ms | 59.89ms | 4.62ms | 26.87ms | 52.73ms | 28.05ms |
| comp_0to1 | 27.32ms | 53.85ms | 17.47ms | 12.21ms | 16.38ms | 7.20ms |
| comp_1to1 | 41.66ms | 55.83ms | 12.41ms | 28.74ms | 45.92ms | 4.25ms |
| comp_2to1 | 42.93ms | 35.97ms | 9.14ms | 17.81ms | 23.57ms | 2.33ms |
| comp_4to1 | 5.01ms | 16.90ms | 7.48ms | 4.05ms | 13.89ms | 10.07ms |
| comp_1000to1 | 20μs | 42μs | 6μs | 4μs | 16μs | 4μs |
| comp_1to2 | 29.29ms | 47.79ms | 16.57ms | 21.31ms | 34.29ms | 18.59ms |
| comp_1to4 | 25.77ms | 48.22ms | 26.30ms | 11.55ms | 23.98ms | 4.86ms |
| comp_1to8 | 25.70ms | 44.29ms | 6.92ms | 6.56ms | 24.40ms | 4.87ms |
| comp_1to1000 | 17.17ms | 38.35ms | 4.77ms | 4.18ms | 16.48ms | 4.33ms |
| update_1to1 | 16.17ms | 5.69ms | 8.60ms | 9.04ms | 23.25ms | 10.25ms |
| update_2to1 | 7.82ms | 3.12ms | 4.33ms | 4.48ms | 10.91ms | 2.31ms |
| update_4to1 | 4.09ms | 1.45ms | 2.17ms | 2.23ms | 7.14ms | 2.61ms |
| update_1000to1 | 40μs | 15μs | 21μs | 22μs | 71μs | 24μs |
| update_1to2 | 8.06ms | 2.87ms | 4.62ms | 4.47ms | 11.87ms | 5.08ms |
| update_1to4 | 4.10ms | 1.46ms | 2.17ms | 2.20ms | 7.16ms | 2.49ms |
| update_1to1000 | 171μs | 408μs | 168μs | 42μs | 188μs | 42μs |
| cellx1000 | 12.23ms | 5.73ms | 10.00ms | 10.11ms | 77.34ms | 7.33ms |
| cellx2500 | 36.99ms | 25.95ms | 30.79ms | 38.55ms | 260.03ms | 19.43ms |
| cellx5000 | 84.58ms | 93.12ms | 89.07ms | 92.39ms | 587.70ms | 45.35ms |
| 10x5 - 2 sources - read 20.0% (simple) | 363.75ms | 239.58ms | 436.03ms | 519.07ms | 2.07s | 234.09ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 243.65ms | 199.07ms | 267.95ms | 279.62ms | 1.55s | 178.78ms |
| 1000x12 - 4 sources - dynamic (large) | 466.25ms | 359.33ms | 3.67s | 3.74s | 2.01s | 283.66ms |
| 1000x5 - 25 sources (wide dense) | 589.92ms | 512.63ms | 2.69s | 3.52s | 3.66s | 415.51ms |
| 5x500 - 3 sources (deep) | 256.43ms | 209.37ms | 227.48ms | 227.40ms | 1.19s | 192.77ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 385.64ms | 284.04ms | 444.84ms | 479.02ms | 1.74s | 263.19ms |

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
