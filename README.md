# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.30s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.30s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.12s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.10s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| avoidablePropagation | 272.33ms | 201.30ms | 2.33s | 195.34ms | 146.89ms (fail) | 185.24ms |
| broadPropagation | 510.87ms | 505.13ms | 4.43s | 454.13ms | 6.40ms (fail) | 345.15ms |
| deepPropagation | 171.38ms | 171.11ms | 1.51s | 175.45ms | 138.83ms (fail) | 126.53ms |
| diamond | 360.80ms | 285.39ms | 2.37s | 282.17ms | 181.59ms (fail) | 233.98ms |
| mux | 427.13ms | 397.02ms | 1.77s | 389.74ms | 186.61ms (fail) | 357.37ms |
| repeatedObservers | 79.78ms | 45.55ms | 229.69ms | 40.75ms | 52.79ms (fail) | 43.41ms |
| triangle | 115.63ms | 99.64ms | 745.22ms | 99.68ms | 80.55ms (fail) | 85.28ms |
| unstable | 95.05ms | 72.48ms | 341.01ms | 73.87ms | 336.22ms (fail) | 59.15ms |
| molBench | 492.17ms | 496.07ms | 592.06ms | 485.00ms | 915μs | 488.58ms |
| create_signals | 54.31ms | 26.82ms | 75.89ms | 20.64ms | 64.83ms | 29.11ms |
| comp_0to1 | 25.30ms | 11.95ms | 29.96ms | 23.08ms | 56.08ms | 8.58ms |
| comp_1to1 | 27.71ms | 25.95ms | 33.41ms | 7.00ms | 61.99ms | 4.17ms |
| comp_2to1 | 38.66ms | 8.92ms | 24.90ms | 14.82ms | 38.12ms | 2.39ms |
| comp_4to1 | 4.25ms | 11.93ms | 25.12ms | 18.46ms | 16.26ms | 10.87ms |
| comp_1000to1 | 17μs | 5μs | 32μs | 4μs | 44μs | 4μs |
| comp_1to2 | 27.62ms | 18.96ms | 34.93ms | 29.88ms | 46.17ms | 13.93ms |
| comp_1to4 | 36.47ms | 20.90ms | 22.73ms | 30.03ms | 46.56ms | 9.18ms |
| comp_1to8 | 23.37ms | 6.74ms | 25.45ms | 7.49ms | 43.74ms | 6.39ms |
| comp_1to1000 | 14.18ms | 4.10ms | 15.75ms | 6.72ms | 39.91ms | 7.72ms |
| update_1to1 | 15.96ms | 9.72ms | 24.73ms | 9.45ms | 5.82ms | 10.03ms |
| update_2to1 | 7.76ms | 4.94ms | 11.61ms | 4.62ms | 2.96ms | 3.02ms |
| update_4to1 | 4.00ms | 2.44ms | 6.45ms | 2.40ms | 1.48ms | 2.41ms |
| update_1000to1 | 38μs | 24μs | 75μs | 23μs | 15μs | 10μs |
| update_1to2 | 8.12ms | 4.85ms | 13.89ms | 4.69ms | 2.92ms | 4.96ms |
| update_1to4 | 3.99ms | 2.48ms | 5.57ms | 2.35ms | 1.54ms | 1.13ms |
| update_1to1000 | 145μs | 71μs | 165μs | 746μs | 380μs | 49μs |
| cellx1000 | 11.71ms | 10.08ms | 82.57ms | 11.69ms | 5.50ms | 7.76ms |
| cellx2500 | 40.59ms | 36.18ms | 292.27ms | 45.15ms | 24.02ms | 20.36ms |
| cellx5000 | 112.94ms | 83.93ms | 648.01ms | 123.53ms | 66.83ms | 47.49ms |
| 10x5 - 2 sources - read 20.0% (simple) | 349.52ms | 501.94ms | 1.91s | 436.79ms | 263.39ms | 231.28ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 247.66ms | 285.64ms | 1.43s | 269.65ms | 204.51ms | 174.30ms |
| 1000x12 - 4 sources - dynamic (large) | 470.53ms | 3.84s | 1.88s | 3.61s | 350.49ms | 283.24ms |
| 1000x5 - 25 sources (wide dense) | 612.06ms | 3.39s | 3.35s | 2.56s | 515.75ms | 424.38ms |
| 5x500 - 3 sources (deep) | 252.93ms | 226.17ms | 1.15s | 230.69ms | 206.99ms | 190.29ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 384.04ms | 489.30ms | 1.68s | 454.88ms | 263.78ms | 275.14ms |

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
