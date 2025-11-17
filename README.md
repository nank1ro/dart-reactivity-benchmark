# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.33s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.33s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.08s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.41s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.48s |

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
| avoidablePropagation | 215.64ms | 187.73ms | 148.73ms (fail) | 276.31ms | 210.86ms | 2.39s |
| broadPropagation | 458.86ms | 353.04ms | 6.50ms (fail) | 507.03ms | 461.99ms | 4.42s |
| deepPropagation | 174.75ms | 128.51ms | 138.82ms (fail) | 170.23ms | 177.52ms | 1.52s |
| diamond | 287.17ms | 229.74ms | 179.42ms (fail) | 350.81ms | 284.05ms | 2.42s |
| mux | 391.13ms | 357.81ms | 179.29ms (fail) | 429.35ms | 389.06ms | 1.82s |
| repeatedObservers | 45.88ms | 43.37ms | 52.41ms (fail) | 80.56ms | 42.45ms | 231.28ms |
| triangle | 100.28ms | 83.64ms | 76.28ms (fail) | 116.71ms | 101.58ms | 758.81ms |
| unstable | 77.86ms | 62.05ms | 338.87ms (fail) | 96.22ms | 71.13ms | 351.33ms |
| molBench | 496.15ms | 484.74ms | 1.35ms | 490.47ms | 487.90ms | 590.53ms |
| create_signals | 26.23ms | 24.62ms | 66.72ms | 76.86ms | 5.41ms | 70.05ms |
| comp_0to1 | 12.06ms | 8.94ms | 55.77ms | 26.12ms | 17.95ms | 34.91ms |
| comp_1to1 | 26.43ms | 4.38ms | 61.17ms | 38.85ms | 12.25ms | 39.31ms |
| comp_2to1 | 11.16ms | 2.41ms | 41.98ms | 25.65ms | 11.78ms | 22.48ms |
| comp_4to1 | 4.37ms | 8.70ms | 16.81ms | 14.88ms | 14.19ms | 19.54ms |
| comp_1000to1 | 5μs | 4μs | 40μs | 18μs | 5μs | 15μs |
| comp_1to2 | 18.16ms | 15.00ms | 48.42ms | 39.35ms | 18.88ms | 34.71ms |
| comp_1to4 | 9.96ms | 5.81ms | 49.83ms | 21.20ms | 34.18ms | 26.39ms |
| comp_1to8 | 6.31ms | 4.84ms | 42.08ms | 21.23ms | 6.68ms | 23.32ms |
| comp_1to1000 | 4.30ms | 3.77ms | 37.82ms | 14.82ms | 6.28ms | 15.73ms |
| update_1to1 | 9.31ms | 4.63ms | 6.12ms | 15.54ms | 8.79ms | 27.17ms |
| update_2to1 | 4.73ms | 2.37ms | 3.08ms | 7.75ms | 4.54ms | 12.57ms |
| update_4to1 | 2.33ms | 1.23ms | 1.56ms | 3.86ms | 2.21ms | 7.01ms |
| update_1000to1 | 24μs | 21μs | 16μs | 38μs | 22μs | 67μs |
| update_1to2 | 4.62ms | 2.31ms | 3.06ms | 7.98ms | 4.36ms | 13.22ms |
| update_1to4 | 2.48ms | 1.23ms | 1.60ms | 3.90ms | 2.23ms | 6.78ms |
| update_1to1000 | 45μs | 50μs | 368μs | 148μs | 855μs | 160μs |
| cellx1000 | 11.32ms | 7.95ms | 5.69ms | 12.70ms | 10.23ms | 81.95ms |
| cellx2500 | 40.69ms | 24.00ms | 29.98ms | 42.86ms | 29.77ms | 283.10ms |
| cellx5000 | 99.24ms | 62.06ms | 95.05ms | 127.34ms | 88.97ms | 612.63ms |
| 10x5 - 2 sources - read 20.0% (simple) | 505.25ms | 261.62ms | 237.81ms | 350.64ms | 428.50ms | 1.97s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.59ms | 173.37ms | 197.65ms | 247.03ms | 274.57ms | 1.48s |
| 1000x12 - 4 sources - dynamic (large) | 3.74s | 281.69ms | 363.75ms | 469.73ms | 3.67s | 1.82s |
| 1000x5 - 25 sources (wide dense) | 3.56s | 411.20ms | 523.65ms | 605.54ms | 2.52s | 3.48s |
| 5x500 - 3 sources (deep) | 225.68ms | 191.32ms | 205.56ms | 256.59ms | 226.20ms | 1.12s |
| 100x15 - 6 sources - dynamic (very dynamic) | 472.43ms | 267.03ms | 261.60ms | 381.50ms | 453.13ms | 1.72s |

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
