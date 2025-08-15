# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.76s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.34s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.37s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.60s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 28.28s |
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
| Test Case | mobx | state_beacon | preact_signals | alien_signals | solidart(2.0-dev) | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.41s | 155.08ms (fail) | 201.35ms | 193.24ms | 267.53ms | 213.90ms |
| broadPropagation | 4.40s | 6.75ms (fail) | 460.84ms | 357.71ms | 503.87ms | 465.96ms |
| deepPropagation | 1.57s | 142.05ms (fail) | 175.69ms | 129.28ms | 164.46ms | 179.54ms |
| diamond | 2.46s | 189.79ms (fail) | 278.58ms | 238.47ms | 347.94ms | 285.06ms |
| mux | 1.84s | 202.83ms (fail) | 396.53ms | 384.82ms | 439.99ms | 421.18ms |
| repeatedObservers | 232.86ms | 53.16ms (fail) | 40.93ms | 45.32ms | 81.43ms | 46.23ms |
| triangle | 771.39ms | 78.02ms (fail) | 99.47ms | 85.91ms | 116.19ms | 103.32ms |
| unstable | 349.49ms | 352.03ms (fail) | 73.79ms | 61.02ms | 96.73ms | 76.33ms |
| molBench | 592.62ms | 930μs | 494.68ms | 497.35ms | 508.06ms | 490.75ms |
| create_signals | 88.58ms | 65.59ms | 6.07ms | 22.89ms | 85.39ms | 32.67ms |
| comp_0to1 | 21.71ms | 59.62ms | 26.85ms | 9.01ms | 28.68ms | 12.76ms |
| comp_1to1 | 34.48ms | 59.48ms | 11.22ms | 5.33ms | 28.99ms | 19.87ms |
| comp_2to1 | 25.98ms | 40.53ms | 10.99ms | 3.04ms | 39.12ms | 10.05ms |
| comp_4to1 | 32.39ms | 18.55ms | 10.69ms | 9.56ms | 5.06ms | 2.39ms |
| comp_1000to1 | 22μs | 45μs | 10μs | 4μs | 15μs | 5μs |
| comp_1to2 | 34.19ms | 48.61ms | 19.91ms | 30.52ms | 40.77ms | 24.19ms |
| comp_1to4 | 23.91ms | 48.77ms | 32.23ms | 7.50ms | 22.81ms | 15.11ms |
| comp_1to8 | 27.54ms | 47.14ms | 8.42ms | 6.90ms | 28.41ms | 8.32ms |
| comp_1to1000 | 16.52ms | 41.99ms | 6.38ms | 4.70ms | 25.69ms | 5.13ms |
| update_1to1 | 28.62ms | 6.72ms | 8.28ms | 5.42ms | 16.42ms | 10.29ms |
| update_2to1 | 12.81ms | 3.51ms | 4.40ms | 2.64ms | 8.15ms | 4.53ms |
| update_4to1 | 7.64ms | 1.71ms | 2.12ms | 1.29ms | 4.07ms | 2.55ms |
| update_1000to1 | 69μs | 16μs | 20μs | 11μs | 40μs | 25μs |
| update_1to2 | 13.96ms | 3.17ms | 4.07ms | 2.51ms | 8.37ms | 4.55ms |
| update_1to4 | 7.10ms | 1.62ms | 2.09ms | 1.19ms | 4.08ms | 2.61ms |
| update_1to1000 | 189μs | 414μs | 50μs | 32μs | 160μs | 49μs |
| cellx1000 | 84.16ms | 5.59ms | 11.52ms | 7.30ms | 12.32ms | 9.90ms |
| cellx2500 | 326.97ms | 32.57ms | 30.28ms | 19.75ms | 35.31ms | 34.08ms |
| cellx5000 | 706.36ms | 95.02ms | 106.61ms | 45.71ms | 85.50ms | 75.42ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.04s | 237.66ms | 447.30ms | 236.41ms | 357.92ms | 521.13ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.56s | 196.94ms | 276.77ms | 178.24ms | 256.77ms | 278.37ms |
| 1000x12 - 4 sources - dynamic (large) | 1.95s | 343.81ms | 3.66s | 282.91ms | 460.57ms | 4.06s |
| 1000x5 - 25 sources (wide dense) | 3.66s | 523.87ms | 2.77s | 415.36ms | 611.48ms | 3.47s |
| 5x500 - 3 sources (deep) | 1.19s | 218.49ms | 235.63ms | 199.41ms | 260.23ms | 227.83ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.74s | 262.72ms | 457.05ms | 265.11ms | 388.69ms | 483.85ms |

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
