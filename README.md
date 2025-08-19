# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.30s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 10.48s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.38s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.48s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.61s |

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
| avoidablePropagation | 2.34s | 167.31ms (fail) | 201.12ms | 191.17ms | 259.49ms | 214.13ms |
| broadPropagation | 4.42s | 6.86ms (fail) | 455.84ms | 354.49ms | 502.13ms | 455.46ms |
| deepPropagation | 1.56s | 145.59ms (fail) | 178.34ms | 128.88ms | 161.40ms | 177.99ms |
| diamond | 2.40s | 203.63ms (fail) | 279.48ms | 235.79ms | 354.16ms | 281.27ms |
| mux | 1.83s | 193.76ms (fail) | 386.83ms | 379.36ms | 442.29ms | 404.89ms |
| repeatedObservers | 228.07ms | 52.61ms (fail) | 40.16ms | 43.92ms | 81.04ms | 46.39ms |
| triangle | 757.29ms | 80.23ms (fail) | 98.19ms | 84.55ms | 114.07ms | 102.38ms |
| unstable | 340.35ms | 377.47ms (fail) | 74.09ms | 61.45ms | 96.56ms | 76.05ms |
| molBench | 583.20ms | 985μs | 488.53ms | 489.92ms | 498.71ms | 484.98ms |
| create_signals | 50.80ms | 71.63ms | 5.34ms | 26.79ms | 80.77ms | 24.66ms |
| comp_0to1 | 18.69ms | 60.30ms | 17.54ms | 8.06ms | 25.83ms | 11.53ms |
| comp_1to1 | 29.22ms | 65.40ms | 12.51ms | 4.35ms | 48.09ms | 28.47ms |
| comp_2to1 | 20.82ms | 40.79ms | 8.53ms | 2.27ms | 23.96ms | 21.66ms |
| comp_4to1 | 14.75ms | 18.88ms | 8.20ms | 9.46ms | 13.20ms | 6.17ms |
| comp_1000to1 | 23μs | 45μs | 5μs | 5μs | 14μs | 8μs |
| comp_1to2 | 37.14ms | 50.75ms | 24.48ms | 20.64ms | 25.01ms | 17.63ms |
| comp_1to4 | 23.84ms | 48.78ms | 32.32ms | 6.70ms | 14.44ms | 10.32ms |
| comp_1to8 | 21.77ms | 47.04ms | 7.98ms | 4.42ms | 19.82ms | 7.06ms |
| comp_1to1000 | 15.09ms | 42.32ms | 7.14ms | 3.45ms | 14.28ms | 4.35ms |
| update_1to1 | 21.90ms | 6.01ms | 8.37ms | 11.86ms | 16.41ms | 10.22ms |
| update_2to1 | 10.84ms | 3.10ms | 4.44ms | 2.22ms | 8.09ms | 4.56ms |
| update_4to1 | 5.50ms | 1.53ms | 2.06ms | 2.46ms | 4.10ms | 2.55ms |
| update_1000to1 | 53μs | 15μs | 20μs | 13μs | 40μs | 25μs |
| update_1to2 | 10.70ms | 3.02ms | 4.08ms | 4.99ms | 8.36ms | 4.51ms |
| update_1to4 | 5.37ms | 1.55ms | 2.09ms | 2.41ms | 4.13ms | 2.57ms |
| update_1to1000 | 168μs | 416μs | 147μs | 47μs | 150μs | 44μs |
| cellx1000 | 75.12ms | 5.62ms | 9.73ms | 7.12ms | 13.75ms | 9.79ms |
| cellx2500 | 287.32ms | 28.58ms | 30.59ms | 19.75ms | 38.20ms | 34.60ms |
| cellx5000 | 553.95ms | 88.40ms | 90.00ms | 47.08ms | 100.14ms | 76.86ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.03s | 254.58ms | 519.28ms | 236.03ms | 357.75ms | 511.82ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.53s | 198.06ms | 295.39ms | 175.71ms | 249.44ms | 282.37ms |
| 1000x12 - 4 sources - dynamic (large) | 1.92s | 361.38ms | 3.74s | 283.31ms | 467.23ms | 3.76s |
| 1000x5 - 25 sources (wide dense) | 3.49s | 515.11ms | 2.72s | 403.38ms | 611.99ms | 3.60s |
| 5x500 - 3 sources (deep) | 1.15s | 206.69ms | 245.61ms | 189.42ms | 259.33ms | 222.28ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.70s | 258.39ms | 470.10ms | 260.90ms | 388.88ms | 483.67ms |

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
