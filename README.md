# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.74s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.20s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.12s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.40s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.83s |
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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.27s | 200.11ms | 198.61ms | 209.64ms | 272.54ms | 147.59ms (fail) |
| broadPropagation | 4.28s | 465.51ms | 360.39ms | 457.51ms | 492.12ms | 5.77ms (fail) |
| deepPropagation | 1.55s | 176.59ms | 134.10ms | 174.03ms | 165.47ms | 138.63ms (fail) |
| diamond | 2.37s | 294.72ms | 245.44ms | 282.56ms | 339.64ms | 181.88ms (fail) |
| mux | 1.76s | 399.55ms | 364.65ms | 374.93ms | 417.20ms | 179.84ms (fail) |
| repeatedObservers | 227.30ms | 45.51ms | 45.66ms | 42.69ms | 80.40ms | 58.54ms (fail) |
| triangle | 764.10ms | 102.18ms | 89.68ms | 100.05ms | 112.78ms | 78.44ms (fail) |
| unstable | 350.43ms | 76.13ms | 62.26ms | 72.05ms | 95.31ms | 335.49ms (fail) |
| molBench | 583.49ms | 494.34ms | 481.14ms | 496.93ms | 491.54ms | 1.10ms |
| create_signals | 84.46ms | 25.51ms | 27.30ms | 5.34ms | 88.90ms | 59.47ms |
| comp_0to1 | 20.54ms | 10.99ms | 6.74ms | 17.85ms | 35.27ms | 57.89ms |
| comp_1to1 | 36.52ms | 26.83ms | 4.23ms | 13.57ms | 27.24ms | 57.37ms |
| comp_2to1 | 27.86ms | 7.79ms | 2.33ms | 16.57ms | 37.71ms | 37.36ms |
| comp_4to1 | 25.08ms | 1.79ms | 10.73ms | 14.73ms | 19.88ms | 17.62ms |
| comp_1000to1 | 15μs | 5μs | 6μs | 4μs | 14μs | 48μs |
| comp_1to2 | 34.87ms | 19.46ms | 19.89ms | 17.78ms | 30.49ms | 49.09ms |
| comp_1to4 | 18.20ms | 12.57ms | 6.99ms | 33.64ms | 20.27ms | 49.04ms |
| comp_1to8 | 19.78ms | 8.17ms | 4.33ms | 8.07ms | 21.61ms | 48.78ms |
| comp_1to1000 | 14.74ms | 4.08ms | 3.49ms | 5.06ms | 14.58ms | 44.02ms |
| update_1to1 | 21.15ms | 8.97ms | 4.63ms | 9.19ms | 15.70ms | 8.36ms |
| update_2to1 | 10.52ms | 4.46ms | 2.33ms | 4.72ms | 7.85ms | 2.84ms |
| update_4to1 | 5.59ms | 2.22ms | 1.18ms | 2.37ms | 3.92ms | 1.96ms |
| update_1000to1 | 52μs | 22μs | 11μs | 23μs | 39μs | 15μs |
| update_1to2 | 10.46ms | 4.43ms | 2.33ms | 4.53ms | 8.04ms | 4.64ms |
| update_1to4 | 5.21ms | 2.21ms | 1.17ms | 2.43ms | 3.93ms | 1.45ms |
| update_1to1000 | 154μs | 42μs | 30μs | 173μs | 148μs | 422μs |
| cellx1000 | 70.16ms | 9.86ms | 7.40ms | 9.86ms | 11.34ms | 5.18ms |
| cellx2500 | 248.79ms | 32.59ms | 19.52ms | 25.99ms | 30.95ms | 21.04ms |
| cellx5000 | 562.98ms | 75.11ms | 44.42ms | 66.46ms | 66.45ms | 70.50ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.97s | 510.40ms | 242.46ms | 451.90ms | 344.78ms | 239.06ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.50s | 280.76ms | 185.52ms | 272.28ms | 247.65ms | 203.22ms |
| 1000x12 - 4 sources - dynamic (large) | 1.81s | 3.73s | 279.68ms | 3.73s | 457.67ms | 339.88ms |
| 1000x5 - 25 sources (wide dense) | 3.38s | 3.39s | 412.62ms | 2.79s | 595.55ms | 515.05ms |
| 5x500 - 3 sources (deep) | 1.12s | 228.72ms | 196.56ms | 232.03ms | 255.42ms | 206.77ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.68s | 473.72ms | 272.25ms | 449.73ms | 384.18ms | 263.10ms |

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
