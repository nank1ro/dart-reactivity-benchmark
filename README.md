# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.41s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.74s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.10s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.71s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.52s |

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
| avoidablePropagation | 275.78ms | 204.88ms | 2.44s | 185.69ms | 208.72ms | 156.58ms (fail) |
| broadPropagation | 514.03ms | 456.16ms | 4.29s | 352.19ms | 457.04ms | 6.22ms (fail) |
| deepPropagation | 175.46ms | 181.39ms | 1.52s | 124.62ms | 176.16ms | 139.86ms (fail) |
| diamond | 354.48ms | 288.77ms | 2.47s | 239.82ms | 288.70ms | 189.73ms (fail) |
| mux | 449.21ms | 382.62ms | 1.87s | 370.63ms | 413.97ms | 190.39ms (fail) |
| repeatedObservers | 79.61ms | 38.29ms | 235.70ms | 44.74ms | 46.74ms | 52.24ms (fail) |
| triangle | 118.10ms | 101.98ms | 792.99ms | 86.63ms | 104.75ms | 76.41ms (fail) |
| unstable | 93.88ms | 70.94ms | 362.10ms | 61.19ms | 71.05ms | 340.48ms (fail) |
| molBench | 493.55ms | 491.79ms | 586.91ms | 491.58ms | 488.81ms | 1.11ms |
| create_signals | 75.94ms | 4.59ms | 81.84ms | 23.47ms | 26.93ms | 64.50ms |
| comp_0to1 | 29.33ms | 17.86ms | 15.38ms | 9.78ms | 12.53ms | 55.35ms |
| comp_1to1 | 28.37ms | 14.31ms | 42.34ms | 4.11ms | 29.59ms | 59.19ms |
| comp_2to1 | 47.96ms | 16.14ms | 35.10ms | 2.31ms | 10.36ms | 44.35ms |
| comp_4to1 | 4.53ms | 13.75ms | 17.66ms | 8.19ms | 3.33ms | 17.14ms |
| comp_1000to1 | 15μs | 4μs | 24μs | 4μs | 5μs | 41μs |
| comp_1to2 | 33.85ms | 24.48ms | 37.20ms | 9.83ms | 16.53ms | 46.30ms |
| comp_1to4 | 33.43ms | 22.59ms | 19.40ms | 11.86ms | 13.26ms | 46.39ms |
| comp_1to8 | 24.93ms | 9.34ms | 23.16ms | 4.91ms | 7.46ms | 43.58ms |
| comp_1to1000 | 14.78ms | 8.59ms | 14.99ms | 3.23ms | 4.55ms | 37.96ms |
| update_1to1 | 15.84ms | 8.43ms | 22.24ms | 11.37ms | 9.22ms | 5.75ms |
| update_2to1 | 7.78ms | 4.09ms | 10.74ms | 5.02ms | 4.57ms | 2.88ms |
| update_4to1 | 3.93ms | 2.06ms | 5.94ms | 2.79ms | 2.31ms | 1.47ms |
| update_1000to1 | 39μs | 20μs | 61μs | 10μs | 23μs | 15μs |
| update_1to2 | 7.90ms | 4.14ms | 11.46ms | 5.62ms | 4.91ms | 2.98ms |
| update_1to4 | 3.95ms | 2.08ms | 5.80ms | 2.42ms | 2.31ms | 1.48ms |
| update_1to1000 | 162μs | 2.48ms | 156μs | 49μs | 45μs | 375μs |
| cellx1000 | 15.92ms | 11.08ms | 77.03ms | 7.72ms | 11.58ms | 8.68ms |
| cellx2500 | 62.16ms | 39.26ms | 267.91ms | 26.55ms | 57.46ms | 37.97ms |
| cellx5000 | 144.94ms | 111.71ms | 597.86ms | 64.38ms | 132.86ms | 106.98ms |
| 10x5 - 2 sources - read 20.0% (simple) | 351.51ms | 440.79ms | 2.02s | 231.12ms | 532.44ms | 263.45ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 243.03ms | 275.53ms | 1.53s | 178.38ms | 286.52ms | 201.14ms |
| 1000x12 - 4 sources - dynamic (large) | 468.79ms | 3.55s | 1.90s | 290.57ms | 4.00s | 360.13ms |
| 1000x5 - 25 sources (wide dense) | 597.29ms | 2.62s | 3.55s | 416.30ms | 3.59s | 491.58ms |
| 5x500 - 3 sources (deep) | 256.14ms | 232.07ms | 1.16s | 191.09ms | 232.32ms | 208.78ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 382.53ms | 450.45ms | 1.71s | 263.78ms | 494.58ms | 259.49ms |

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
