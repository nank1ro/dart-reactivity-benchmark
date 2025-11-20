# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.69s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 9.97s |
| 🥉 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.25s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.41s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.48s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.43s |

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
| avoidablePropagation | 228.36ms | 189.72ms | 154.01ms (fail) | 275.57ms | 207.90ms | 2.38s |
| broadPropagation | 461.00ms | 351.77ms | 6.46ms (fail) | 499.06ms | 468.69ms | 4.45s |
| deepPropagation | 171.85ms | 139.31ms | 138.63ms (fail) | 167.94ms | 177.38ms | 1.52s |
| diamond | 297.71ms | 236.58ms | 180.61ms (fail) | 355.20ms | 285.02ms | 2.39s |
| mux | 394.48ms | 373.29ms | 181.41ms (fail) | 416.59ms | 370.25ms | 1.85s |
| repeatedObservers | 46.84ms | 44.20ms | 54.13ms (fail) | 80.46ms | 40.63ms | 228.85ms |
| triangle | 101.29ms | 89.88ms | 83.07ms (fail) | 114.85ms | 101.60ms | 750.21ms |
| unstable | 83.95ms | 61.92ms | 339.74ms (fail) | 95.13ms | 71.21ms | 343.39ms |
| molBench | 496.09ms | 486.25ms | 1.02ms | 489.58ms | 480.44ms | 591.13ms |
| create_signals | 25.82ms | 27.02ms | 68.96ms | 100.04ms | 5.62ms | 51.63ms |
| comp_0to1 | 11.15ms | 8.05ms | 60.25ms | 29.38ms | 17.71ms | 15.56ms |
| comp_1to1 | 18.14ms | 4.22ms | 55.39ms | 47.52ms | 11.91ms | 51.20ms |
| comp_2to1 | 8.73ms | 2.29ms | 41.55ms | 36.18ms | 18.86ms | 41.28ms |
| comp_4to1 | 7.68ms | 10.24ms | 16.25ms | 11.41ms | 8.52ms | 27.07ms |
| comp_1000to1 | 4μs | 5μs | 44μs | 15μs | 5μs | 25μs |
| comp_1to2 | 13.20ms | 20.17ms | 44.15ms | 27.65ms | 15.86ms | 37.46ms |
| comp_1to4 | 10.60ms | 7.00ms | 43.66ms | 21.53ms | 20.22ms | 22.59ms |
| comp_1to8 | 6.75ms | 4.36ms | 41.61ms | 20.30ms | 7.14ms | 23.36ms |
| comp_1to1000 | 4.26ms | 3.39ms | 38.17ms | 14.93ms | 3.88ms | 15.68ms |
| update_1to1 | 9.38ms | 4.62ms | 6.10ms | 15.61ms | 9.06ms | 28.76ms |
| update_2to1 | 4.71ms | 2.31ms | 3.06ms | 7.76ms | 4.51ms | 12.04ms |
| update_4to1 | 2.34ms | 1.20ms | 1.57ms | 3.87ms | 2.24ms | 7.03ms |
| update_1000to1 | 23μs | 11μs | 16μs | 39μs | 22μs | 69μs |
| update_1to2 | 4.62ms | 3.36ms | 3.11ms | 7.92ms | 4.51ms | 12.27ms |
| update_1to4 | 2.54ms | 1.19ms | 1.59ms | 3.87ms | 2.23ms | 6.92ms |
| update_1to1000 | 43μs | 40μs | 377μs | 145μs | 48μs | 160μs |
| cellx1000 | 9.90ms | 8.52ms | 6.14ms | 12.72ms | 10.88ms | 71.08ms |
| cellx2500 | 33.10ms | 19.15ms | 23.59ms | 37.65ms | 25.78ms | 254.13ms |
| cellx5000 | 63.10ms | 46.17ms | 64.56ms | 67.94ms | 63.34ms | 604.95ms |
| 10x5 - 2 sources - read 20.0% (simple) | 507.06ms | 234.12ms | 245.19ms | 346.29ms | 434.68ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 277.87ms | 173.40ms | 197.43ms | 244.97ms | 265.26ms | 1.47s |
| 1000x12 - 4 sources - dynamic (large) | 3.84s | 273.83ms | 351.40ms | 463.01ms | 3.66s | 1.91s |
| 1000x5 - 25 sources (wide dense) | 3.56s | 408.00ms | 522.31ms | 593.89ms | 2.51s | 3.51s |
| 5x500 - 3 sources (deep) | 226.43ms | 189.79ms | 201.10ms | 263.01ms | 220.41ms | 1.12s |
| 100x15 - 6 sources - dynamic (very dynamic) | 475.39ms | 264.74ms | 254.35ms | 379.90ms | 449.43ms | 1.68s |

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
