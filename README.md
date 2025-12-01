# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.64s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 9.91s |
| 🥉 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.23s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 10.71s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.11s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.42s |

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
| avoidablePropagation | 218.84ms | 192.16ms | 144.59ms (fail) | 280.85ms | 205.72ms | 2.40s |
| broadPropagation | 448.86ms | 352.83ms | 6.38ms (fail) | 512.70ms | 455.54ms | 4.46s |
| deepPropagation | 172.95ms | 128.51ms | 140.49ms (fail) | 170.56ms | 178.14ms | 1.49s |
| diamond | 284.21ms | 234.38ms | 185.51ms (fail) | 356.76ms | 292.77ms | 2.42s |
| mux | 380.23ms | 358.10ms | 179.37ms (fail) | 419.82ms | 375.81ms | 1.84s |
| repeatedObservers | 46.90ms | 43.36ms | 52.39ms (fail) | 80.50ms | 40.78ms | 231.16ms |
| triangle | 101.99ms | 87.15ms | 83.59ms (fail) | 114.56ms | 103.17ms | 758.79ms |
| unstable | 78.00ms | 63.88ms | 337.77ms (fail) | 94.87ms | 73.10ms | 348.64ms |
| molBench | 496.39ms | 484.96ms | 941μs | 490.96ms | 484.35ms | 588.98ms |
| create_signals | 23.92ms | 24.46ms | 64.12ms | 74.31ms | 5.33ms | 65.25ms |
| comp_0to1 | 10.78ms | 11.35ms | 54.67ms | 25.14ms | 17.52ms | 15.07ms |
| comp_1to1 | 18.47ms | 4.33ms | 60.39ms | 31.01ms | 13.00ms | 40.17ms |
| comp_2to1 | 9.48ms | 2.26ms | 41.18ms | 40.58ms | 8.87ms | 32.51ms |
| comp_4to1 | 2.16ms | 7.35ms | 17.84ms | 4.43ms | 13.42ms | 13.00ms |
| comp_1000to1 | 5μs | 3μs | 41μs | 18μs | 4μs | 39μs |
| comp_1to2 | 19.35ms | 16.20ms | 48.01ms | 32.23ms | 16.10ms | 34.93ms |
| comp_1to4 | 9.82ms | 11.85ms | 44.12ms | 21.25ms | 26.31ms | 21.15ms |
| comp_1to8 | 6.53ms | 6.20ms | 43.97ms | 23.37ms | 6.44ms | 23.22ms |
| comp_1to1000 | 4.10ms | 3.63ms | 38.36ms | 14.79ms | 5.29ms | 14.47ms |
| update_1to1 | 9.45ms | 5.18ms | 6.13ms | 15.83ms | 8.83ms | 23.66ms |
| update_2to1 | 4.77ms | 2.33ms | 3.21ms | 7.82ms | 4.38ms | 13.50ms |
| update_4to1 | 2.28ms | 1.21ms | 1.53ms | 3.90ms | 2.26ms | 7.18ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 69μs |
| update_1to2 | 4.58ms | 3.21ms | 3.08ms | 8.06ms | 4.39ms | 13.73ms |
| update_1to4 | 2.49ms | 1.20ms | 1.57ms | 3.90ms | 2.22ms | 6.36ms |
| update_1to1000 | 53μs | 37μs | 374μs | 153μs | 48μs | 171μs |
| cellx1000 | 9.59ms | 7.28ms | 5.59ms | 11.94ms | 10.03ms | 68.87ms |
| cellx2500 | 31.84ms | 19.21ms | 25.97ms | 31.86ms | 25.36ms | 248.66ms |
| cellx5000 | 62.09ms | 40.13ms | 81.18ms | 68.80ms | 67.50ms | 553.75ms |
| 10x5 - 2 sources - read 20.0% (simple) | 497.56ms | 229.25ms | 236.35ms | 347.41ms | 445.81ms | 1.92s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 283.49ms | 172.80ms | 197.60ms | 249.47ms | 273.43ms | 1.47s |
| 1000x12 - 4 sources - dynamic (large) | 3.51s | 271.40ms | 341.73ms | 455.68ms | 3.59s | 1.84s |
| 1000x5 - 25 sources (wide dense) | 3.26s | 403.47ms | 515.27ms | 591.62ms | 2.49s | 3.40s |
| 5x500 - 3 sources (deep) | 225.16ms | 189.43ms | 206.18ms | 265.65ms | 223.77ms | 1.09s |
| 100x15 - 6 sources - dynamic (very dynamic) | 478.00ms | 263.43ms | 254.74ms | 380.24ms | 446.02ms | 1.67s |

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
