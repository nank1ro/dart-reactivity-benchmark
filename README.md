# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.65 | 100.0% | 35/35 | 3.44s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 4.94s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 10.41s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 9.24s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 25.86s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.19s |

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
| avoidablePropagation | 256.35ms | 189.51ms | 2.27s | 170.77ms | 192.36ms | 139.43ms (fail) |
| broadPropagation | 477.17ms | 424.94ms | 4.02s | 326.27ms | 422.80ms | 5.55ms (fail) |
| deepPropagation | 159.52ms | 166.63ms | 1.43s | 114.81ms | 166.29ms | 129.60ms (fail) |
| diamond | 326.74ms | 261.18ms | 2.27s | 217.99ms | 270.86ms | 170.00ms (fail) |
| mux | 404.76ms | 359.36ms | 1.72s | 347.88ms | 382.57ms | 181.48ms (fail) |
| repeatedObservers | 76.89ms | 35.16ms | 210.33ms | 41.23ms | 44.13ms | 48.91ms (fail) |
| triangle | 110.38ms | 91.73ms | 706.06ms | 78.99ms | 97.20ms | 70.67ms (fail) |
| unstable | 88.56ms | 65.57ms | 325.73ms | 57.14ms | 69.21ms | 321.70ms (fail) |
| molBench | 455.42ms | 455.20ms | 537.33ms | 453.80ms | 453.62ms | 916μs |
| create_signals | 91.04ms | 4.35ms | 74.08ms | 22.63ms | 22.91ms | 64.20ms |
| comp_0to1 | 32.25ms | 16.80ms | 20.10ms | 7.46ms | 10.88ms | 52.97ms |
| comp_1to1 | 43.90ms | 11.20ms | 28.49ms | 3.93ms | 26.28ms | 53.49ms |
| comp_2to1 | 38.87ms | 10.85ms | 28.62ms | 2.10ms | 9.39ms | 38.75ms |
| comp_4to1 | 4.16ms | 11.01ms | 16.59ms | 8.13ms | 2.05ms | 16.88ms |
| comp_1000to1 | 14μs | 4μs | 19μs | 3μs | 5μs | 38μs |
| comp_1to2 | 39.05ms | 21.28ms | 32.94ms | 21.56ms | 18.62ms | 42.03ms |
| comp_1to4 | 19.11ms | 27.48ms | 17.63ms | 11.03ms | 9.32ms | 40.90ms |
| comp_1to8 | 21.22ms | 12.90ms | 21.75ms | 4.15ms | 6.80ms | 40.28ms |
| comp_1to1000 | 13.54ms | 7.07ms | 14.13ms | 3.49ms | 4.12ms | 36.69ms |
| update_1to1 | 14.89ms | 7.92ms | 22.57ms | 11.27ms | 8.65ms | 5.50ms |
| update_2to1 | 7.46ms | 3.93ms | 11.76ms | 5.17ms | 5.03ms | 2.88ms |
| update_4to1 | 3.76ms | 2.03ms | 5.56ms | 2.79ms | 2.19ms | 1.43ms |
| update_1000to1 | 40μs | 18μs | 53μs | 25μs | 21μs | 15μs |
| update_1to2 | 7.52ms | 3.75ms | 11.44ms | 5.49ms | 4.51ms | 2.94ms |
| update_1to4 | 3.88ms | 1.92ms | 5.68ms | 2.43ms | 2.14ms | 1.43ms |
| update_1to1000 | 148μs | 1.33ms | 153μs | 47μs | 43μs | 375μs |
| cellx1000 | 10.54ms | 8.84ms | 63.69ms | 6.91ms | 9.25ms | 4.93ms |
| cellx2500 | 28.53ms | 23.55ms | 225.44ms | 18.09ms | 31.13ms | 19.33ms |
| cellx5000 | 60.98ms | 60.19ms | 542.89ms | 38.58ms | 55.29ms | 62.33ms |
| 10x5 - 2 sources - read 20.0% (simple) | 337.43ms | 414.82ms | 1.88s | 211.58ms | 473.44ms | 225.98ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 229.52ms | 256.72ms | 1.44s | 164.84ms | 256.49ms | 189.54ms |
| 1000x12 - 4 sources - dynamic (large) | 429.74ms | 3.24s | 1.82s | 268.32ms | 3.50s | 315.67ms |
| 1000x5 - 25 sources (wide dense) | 557.52ms | 2.42s | 3.33s | 376.36ms | 3.19s | 466.93ms |
| 5x500 - 3 sources (deep) | 236.94ms | 216.68ms | 1.10s | 177.02ms | 214.71ms | 193.06ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 352.38ms | 409.78ms | 1.65s | 254.71ms | 443.28ms | 244.17ms |

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
