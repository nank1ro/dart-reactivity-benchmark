# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.73s |
| 🥈 | signals | 0.29 | 100.0% | 35/35 | 10.88s |
| 🥉 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.24s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.31s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.87s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.39s |

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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.30s | 199.73ms | 198.50ms | 205.76ms | 275.47ms | 147.68ms (fail) |
| broadPropagation | 4.26s | 466.30ms | 357.68ms | 453.40ms | 505.20ms | 6.00ms (fail) |
| deepPropagation | 1.53s | 172.68ms | 132.06ms | 180.65ms | 166.70ms | 137.57ms (fail) |
| diamond | 2.33s | 288.16ms | 245.33ms | 297.86ms | 354.75ms | 176.46ms (fail) |
| mux | 1.77s | 405.08ms | 363.43ms | 371.02ms | 422.96ms | 177.45ms (fail) |
| repeatedObservers | 229.69ms | 46.04ms | 45.59ms | 41.90ms | 80.48ms | 56.94ms (fail) |
| triangle | 777.87ms | 101.73ms | 88.54ms | 100.17ms | 114.32ms | 75.84ms (fail) |
| unstable | 345.32ms | 76.22ms | 62.98ms | 71.98ms | 95.22ms | 335.24ms (fail) |
| molBench | 588.83ms | 493.37ms | 481.00ms | 497.01ms | 489.60ms | 1.06ms |
| create_signals | 67.41ms | 26.05ms | 24.76ms | 5.30ms | 74.36ms | 61.47ms |
| comp_0to1 | 25.61ms | 11.34ms | 6.90ms | 17.57ms | 27.86ms | 56.13ms |
| comp_1to1 | 42.84ms | 24.11ms | 4.29ms | 13.54ms | 44.81ms | 56.66ms |
| comp_2to1 | 29.63ms | 12.70ms | 2.33ms | 16.86ms | 41.99ms | 36.95ms |
| comp_4to1 | 22.63ms | 2.02ms | 10.76ms | 14.73ms | 12.47ms | 16.82ms |
| comp_1000to1 | 15μs | 4μs | 3μs | 4μs | 18μs | 71μs |
| comp_1to2 | 37.90ms | 17.55ms | 15.13ms | 19.28ms | 29.14ms | 48.25ms |
| comp_1to4 | 23.51ms | 7.22ms | 9.06ms | 33.81ms | 22.21ms | 47.15ms |
| comp_1to8 | 22.22ms | 6.46ms | 5.98ms | 6.30ms | 23.93ms | 45.78ms |
| comp_1to1000 | 15.10ms | 4.01ms | 4.17ms | 5.93ms | 17.09ms | 42.30ms |
| update_1to1 | 22.04ms | 8.90ms | 11.78ms | 9.20ms | 16.51ms | 10.71ms |
| update_2to1 | 11.39ms | 4.45ms | 6.20ms | 4.60ms | 8.20ms | 2.83ms |
| update_4to1 | 5.75ms | 2.29ms | 2.88ms | 2.30ms | 4.09ms | 2.05ms |
| update_1000to1 | 56μs | 22μs | 25μs | 23μs | 41μs | 14μs |
| update_1to2 | 10.93ms | 4.44ms | 5.84ms | 4.56ms | 8.39ms | 4.42ms |
| update_1to4 | 5.77ms | 2.28ms | 2.97ms | 2.35ms | 4.12ms | 1.45ms |
| update_1to1000 | 155μs | 41μs | 30μs | 943μs | 152μs | 420μs |
| cellx1000 | 70.98ms | 11.28ms | 7.39ms | 9.90ms | 11.72ms | 5.27ms |
| cellx2500 | 244.02ms | 31.85ms | 19.87ms | 27.95ms | 31.39ms | 25.52ms |
| cellx5000 | 552.18ms | 62.06ms | 48.95ms | 68.43ms | 73.05ms | 66.73ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.98s | 512.62ms | 239.26ms | 451.03ms | 346.12ms | 238.66ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.48s | 281.56ms | 182.40ms | 271.63ms | 247.87ms | 197.97ms |
| 1000x12 - 4 sources - dynamic (large) | 1.87s | 3.69s | 275.90ms | 3.69s | 461.98ms | 335.53ms |
| 1000x5 - 25 sources (wide dense) | 3.42s | 3.21s | 412.80ms | 2.74s | 594.03ms | 512.40ms |
| 5x500 - 3 sources (deep) | 1.11s | 222.51ms | 193.35ms | 231.78ms | 253.03ms | 204.70ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.65s | 472.59ms | 264.97ms | 446.79ms | 381.50ms | 255.59ms |

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
