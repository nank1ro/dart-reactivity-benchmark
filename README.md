# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.78s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 9.88s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.40s |
| 4 | signals | 0.22 | 100.0% | 35/35 | 11.70s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.59s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.30s |

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
| avoidablePropagation | 218.75ms | 186.51ms | 153.30ms (fail) | 271.39ms | 230.78ms | 2.24s |
| broadPropagation | 496.92ms | 355.64ms | 6.32ms (fail) | 501.73ms | 507.23ms | 4.15s |
| deepPropagation | 185.78ms | 117.78ms | 148.37ms (fail) | 165.06ms | 206.68ms | 1.48s |
| diamond | 293.06ms | 265.50ms | 186.37ms (fail) | 371.72ms | 304.69ms | 2.19s |
| mux | 388.99ms | 370.75ms | 184.92ms (fail) | 425.80ms | 389.52ms | 1.72s |
| repeatedObservers | 47.34ms | 43.61ms | 53.78ms (fail) | 88.91ms | 43.27ms | 225.57ms |
| triangle | 105.68ms | 88.62ms | 80.82ms (fail) | 121.97ms | 111.77ms | 727.32ms |
| unstable | 80.99ms | 62.23ms | 341.01ms (fail) | 108.41ms | 74.14ms | 338.14ms |
| molBench | 548.39ms | 551.82ms | 1.11ms | 554.24ms | 563.49ms | 642.91ms |
| create_signals | 29.51ms | 27.06ms | 60.41ms | 81.59ms | 5.71ms | 76.09ms |
| comp_0to1 | 12.84ms | 7.57ms | 51.17ms | 26.84ms | 19.72ms | 27.98ms |
| comp_1to1 | 34.38ms | 4.05ms | 53.55ms | 31.84ms | 13.94ms | 33.34ms |
| comp_2to1 | 23.51ms | 2.26ms | 37.13ms | 46.27ms | 18.98ms | 27.35ms |
| comp_4to1 | 32.16ms | 9.24ms | 17.02ms | 4.68ms | 15.01ms | 27.54ms |
| comp_1000to1 | 8μs | 4μs | 40μs | 19μs | 5μs | 15μs |
| comp_1to2 | 18.75ms | 17.46ms | 42.88ms | 29.00ms | 22.10ms | 37.93ms |
| comp_1to4 | 13.31ms | 6.77ms | 42.60ms | 26.15ms | 18.42ms | 17.06ms |
| comp_1to8 | 9.16ms | 4.25ms | 39.97ms | 23.66ms | 7.01ms | 20.78ms |
| comp_1to1000 | 4.10ms | 3.32ms | 35.74ms | 14.79ms | 4.43ms | 14.63ms |
| update_1to1 | 9.49ms | 4.72ms | 6.50ms | 16.23ms | 8.46ms | 23.50ms |
| update_2to1 | 4.73ms | 2.43ms | 3.59ms | 8.10ms | 4.25ms | 11.51ms |
| update_4to1 | 2.38ms | 1.23ms | 1.68ms | 4.06ms | 2.14ms | 6.54ms |
| update_1000to1 | 23μs | 19μs | 17μs | 40μs | 21μs | 79μs |
| update_1to2 | 4.74ms | 2.34ms | 3.20ms | 8.34ms | 4.25ms | 11.64ms |
| update_1to4 | 2.36ms | 1.22ms | 1.67ms | 4.09ms | 2.14ms | 5.83ms |
| update_1to1000 | 41μs | 27μs | 365μs | 146μs | 43μs | 154μs |
| cellx1000 | 10.10ms | 6.96ms | 4.85ms | 11.10ms | 10.12ms | 97.69ms |
| cellx2500 | 30.53ms | 21.68ms | 22.90ms | 34.45ms | 28.00ms | 331.78ms |
| cellx5000 | 96.25ms | 52.36ms | 62.96ms | 96.80ms | 75.27ms | 634.66ms |
| 10x5 - 2 sources - read 20.0% (simple) | 502.36ms | 230.99ms | 248.40ms | 373.23ms | 424.67ms | 1.99s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 271.77ms | 189.98ms | 202.41ms | 274.45ms | 264.01ms | 1.41s |
| 1000x12 - 4 sources - dynamic (large) | 3.82s | 270.85ms | 303.60ms | 430.15ms | 3.30s | 1.86s |
| 1000x5 - 25 sources (wide dense) | 3.71s | 448.64ms | 462.78ms | 641.99ms | 2.53s | 3.39s |
| 5x500 - 3 sources (deep) | 233.70ms | 188.70ms | 199.39ms | 263.20ms | 239.39ms | 1.15s |
| 100x15 - 6 sources - dynamic (very dynamic) | 469.95ms | 231.48ms | 237.99ms | 343.04ms | 434.08ms | 1.67s |

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
