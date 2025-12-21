# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.38s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.08s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.29s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.40s |
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
| avoidablePropagation | 208.82ms | 189.47ms | 147.86ms (fail) | 277.14ms | 207.78ms | 2.37s |
| broadPropagation | 449.22ms | 351.22ms | 6.28ms (fail) | 521.54ms | 469.84ms | 4.39s |
| deepPropagation | 171.60ms | 138.48ms | 138.66ms (fail) | 168.04ms | 177.21ms | 1.50s |
| diamond | 299.31ms | 231.15ms | 182.58ms (fail) | 354.98ms | 286.37ms | 2.38s |
| mux | 390.55ms | 357.71ms | 180.69ms (fail) | 420.89ms | 371.86ms | 1.87s |
| repeatedObservers | 46.19ms | 43.59ms | 52.92ms (fail) | 80.75ms | 40.49ms | 230.41ms |
| triangle | 101.07ms | 85.14ms | 75.47ms (fail) | 122.07ms | 100.97ms | 756.38ms |
| unstable | 78.04ms | 61.78ms | 335.72ms (fail) | 95.72ms | 70.12ms | 340.95ms |
| molBench | 496.40ms | 485.46ms | 934μs | 490.13ms | 483.94ms | 590.41ms |
| create_signals | 27.29ms | 27.29ms | 66.06ms | 84.00ms | 5.30ms | 82.63ms |
| comp_0to1 | 12.08ms | 9.13ms | 57.47ms | 26.17ms | 18.05ms | 20.64ms |
| comp_1to1 | 28.24ms | 8.74ms | 53.70ms | 44.55ms | 11.79ms | 34.84ms |
| comp_2to1 | 9.80ms | 4.51ms | 36.62ms | 37.82ms | 19.13ms | 9.48ms |
| comp_4to1 | 2.29ms | 8.69ms | 16.19ms | 4.30ms | 8.83ms | 29.23ms |
| comp_1000to1 | 5μs | 4μs | 40μs | 15μs | 6μs | 22μs |
| comp_1to2 | 13.99ms | 14.87ms | 43.97ms | 27.75ms | 30.45ms | 33.08ms |
| comp_1to4 | 12.56ms | 9.28ms | 43.74ms | 25.94ms | 31.25ms | 24.84ms |
| comp_1to8 | 6.76ms | 4.02ms | 41.77ms | 24.46ms | 9.69ms | 24.95ms |
| comp_1to1000 | 4.32ms | 3.57ms | 38.15ms | 14.79ms | 10.04ms | 15.53ms |
| update_1to1 | 9.35ms | 5.07ms | 6.18ms | 15.54ms | 8.87ms | 26.57ms |
| update_2to1 | 4.96ms | 2.41ms | 3.05ms | 7.77ms | 4.32ms | 12.76ms |
| update_4to1 | 2.33ms | 1.15ms | 1.55ms | 3.87ms | 2.25ms | 7.39ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 71μs |
| update_1to2 | 4.63ms | 2.27ms | 3.07ms | 7.91ms | 4.35ms | 13.68ms |
| update_1to4 | 2.54ms | 1.16ms | 1.58ms | 3.91ms | 2.22ms | 6.94ms |
| update_1to1000 | 44μs | 29μs | 393μs | 147μs | 2.15ms | 191μs |
| cellx1000 | 10.41ms | 7.66ms | 6.29ms | 14.30ms | 11.42ms | 98.97ms |
| cellx2500 | 40.70ms | 22.70ms | 33.49ms | 49.42ms | 44.01ms | 291.70ms |
| cellx5000 | 97.71ms | 65.42ms | 100.08ms | 137.80ms | 124.63ms | 659.98ms |
| 10x5 - 2 sources - read 20.0% (simple) | 507.50ms | 235.45ms | 237.41ms | 347.05ms | 469.84ms | 1.97s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 281.52ms | 173.07ms | 197.13ms | 248.06ms | 270.02ms | 1.48s |
| 1000x12 - 4 sources - dynamic (large) | 3.78s | 280.72ms | 349.67ms | 477.18ms | 3.77s | 1.90s |
| 1000x5 - 25 sources (wide dense) | 3.28s | 413.06ms | 508.60ms | 594.50ms | 2.56s | 3.43s |
| 5x500 - 3 sources (deep) | 227.75ms | 192.08ms | 204.17ms | 258.50ms | 225.54ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 475.92ms | 265.11ms | 258.95ms | 390.50ms | 446.18ms | 1.67s |

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
