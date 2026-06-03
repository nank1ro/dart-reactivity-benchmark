# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.26s |
| 🥉 | preact_signals | 0.30 | 100.0% | 35/35 | 9.88s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 11.10s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.64s |
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
| Test Case | solidart(2.0-dev) | signals | mobx | preact_signals | state_beacon | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 271.99ms | 203.13ms | 2.30s | 200.53ms | 147.27ms (fail) | 185.72ms |
| broadPropagation | 507.04ms | 515.58ms | 4.40s | 444.15ms | 6.31ms (fail) | 344.47ms |
| deepPropagation | 172.21ms | 179.17ms | 1.52s | 175.26ms | 138.44ms (fail) | 126.06ms |
| diamond | 375.32ms | 284.75ms | 2.32s | 283.50ms | 182.75ms (fail) | 229.57ms |
| mux | 425.96ms | 397.73ms | 1.77s | 378.86ms | 184.03ms (fail) | 356.58ms |
| repeatedObservers | 80.17ms | 45.62ms | 236.03ms | 40.75ms | 52.79ms (fail) | 43.17ms |
| triangle | 116.25ms | 100.39ms | 749.17ms | 100.64ms | 80.40ms (fail) | 84.57ms |
| unstable | 95.81ms | 72.50ms | 342.13ms | 72.96ms | 337.82ms (fail) | 59.28ms |
| molBench | 491.59ms | 495.18ms | 592.63ms | 484.52ms | 882μs | 488.45ms |
| create_signals | 72.66ms | 24.55ms | 87.27ms | 5.39ms | 70.43ms | 28.19ms |
| comp_0to1 | 35.27ms | 10.80ms | 46.28ms | 17.40ms | 59.83ms | 10.70ms |
| comp_1to1 | 49.52ms | 26.25ms | 32.09ms | 16.98ms | 61.77ms | 10.87ms |
| comp_2to1 | 9.82ms | 12.59ms | 23.34ms | 19.62ms | 38.73ms | 2.43ms |
| comp_4to1 | 16.07ms | 6.21ms | 19.15ms | 11.08ms | 17.76ms | 10.33ms |
| comp_1000to1 | 17μs | 5μs | 15μs | 6μs | 43μs | 3μs |
| comp_1to2 | 35.60ms | 26.71ms | 44.88ms | 33.28ms | 47.09ms | 20.30ms |
| comp_1to4 | 21.01ms | 19.05ms | 21.80ms | 19.04ms | 47.63ms | 8.81ms |
| comp_1to8 | 24.52ms | 6.32ms | 23.85ms | 7.56ms | 44.13ms | 5.94ms |
| comp_1to1000 | 14.33ms | 4.05ms | 15.61ms | 3.54ms | 39.69ms | 3.54ms |
| update_1to1 | 15.91ms | 10.13ms | 22.58ms | 9.41ms | 5.76ms | 10.03ms |
| update_2to1 | 7.76ms | 4.94ms | 11.89ms | 4.52ms | 3.00ms | 2.24ms |
| update_4to1 | 3.98ms | 2.49ms | 6.38ms | 2.41ms | 1.49ms | 2.48ms |
| update_1000to1 | 39μs | 24μs | 62μs | 23μs | 15μs | 18μs |
| update_1to2 | 7.94ms | 4.85ms | 14.08ms | 4.63ms | 2.91ms | 4.62ms |
| update_1to4 | 4.00ms | 2.52ms | 6.24ms | 2.39ms | 3.64ms | 1.65ms |
| update_1to1000 | 142μs | 41μs | 164μs | 48μs | 380μs | 34μs |
| cellx1000 | 11.70ms | 9.74ms | 70.33ms | 11.97ms | 5.35ms | 7.38ms |
| cellx2500 | 31.90ms | 31.34ms | 235.84ms | 25.48ms | 23.43ms | 19.56ms |
| cellx5000 | 69.30ms | 60.13ms | 545.90ms | 61.31ms | 71.44ms | 41.73ms |
| 10x5 - 2 sources - read 20.0% (simple) | 348.95ms | 495.88ms | 1.91s | 443.56ms | 245.08ms | 234.76ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 248.84ms | 282.11ms | 1.43s | 268.32ms | 203.62ms | 177.17ms |
| 1000x12 - 4 sources - dynamic (large) | 457.88ms | 3.63s | 1.80s | 3.52s | 344.73ms | 291.73ms |
| 1000x5 - 25 sources (wide dense) | 609.27ms | 3.44s | 3.32s | 2.52s | 512.19ms | 405.75ms |
| 5x500 - 3 sources (deep) | 246.21ms | 224.44ms | 1.07s | 230.57ms | 205.21ms | 189.26ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 377.07ms | 479.93ms | 1.64s | 449.18ms | 261.66ms | 265.25ms |

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
