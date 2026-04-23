# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.75s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 10.31s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.40s |
| 4 | signals | 0.24 | 100.0% | 35/35 | 11.08s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.53s |
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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.23s | 215.98ms | 184.74ms | 214.06ms | 269.74ms | 152.09ms (fail) |
| broadPropagation | 4.15s | 479.48ms | 353.89ms | 537.25ms | 494.88ms | 6.09ms (fail) |
| deepPropagation | 1.48s | 187.93ms | 122.69ms | 200.34ms | 163.95ms | 151.31ms (fail) |
| diamond | 2.21s | 282.95ms | 258.95ms | 288.90ms | 366.70ms | 191.15ms (fail) |
| mux | 1.72s | 381.78ms | 364.40ms | 385.69ms | 425.11ms | 187.91ms (fail) |
| repeatedObservers | 226.66ms | 46.25ms | 44.37ms | 42.06ms | 88.00ms | 54.82ms (fail) |
| triangle | 720.31ms | 106.21ms | 90.12ms | 105.17ms | 122.26ms | 80.83ms (fail) |
| unstable | 337.54ms | 77.77ms | 60.82ms | 72.82ms | 107.15ms | 343.00ms (fail) |
| molBench | 643.31ms | 547.88ms | 561.27ms | 549.33ms | 568.73ms | 1.05ms |
| create_signals | 91.64ms | 28.10ms | 26.77ms | 4.85ms | 92.66ms | 57.73ms |
| comp_0to1 | 16.01ms | 12.79ms | 8.53ms | 23.05ms | 43.75ms | 51.82ms |
| comp_1to1 | 53.69ms | 34.74ms | 4.05ms | 14.02ms | 39.16ms | 53.22ms |
| comp_2to1 | 26.07ms | 10.99ms | 2.29ms | 17.98ms | 40.26ms | 36.50ms |
| comp_4to1 | 18.61ms | 8.46ms | 11.22ms | 12.74ms | 10.20ms | 16.59ms |
| comp_1000to1 | 15μs | 6μs | 4μs | 5μs | 17μs | 40μs |
| comp_1to2 | 37.10ms | 16.94ms | 13.86ms | 19.74ms | 37.57ms | 42.83ms |
| comp_1to4 | 17.42ms | 10.00ms | 12.60ms | 19.06ms | 21.05ms | 42.45ms |
| comp_1to8 | 20.27ms | 11.34ms | 3.96ms | 6.68ms | 19.67ms | 40.07ms |
| comp_1to1000 | 14.63ms | 9.21ms | 2.92ms | 3.65ms | 14.11ms | 36.22ms |
| update_1to1 | 24.61ms | 9.54ms | 4.72ms | 9.53ms | 16.67ms | 6.02ms |
| update_2to1 | 12.43ms | 4.71ms | 2.40ms | 4.80ms | 8.38ms | 3.04ms |
| update_4to1 | 6.75ms | 2.46ms | 1.26ms | 2.39ms | 4.18ms | 1.53ms |
| update_1000to1 | 56μs | 23μs | 11μs | 23μs | 41μs | 16μs |
| update_1to2 | 11.98ms | 4.73ms | 2.42ms | 4.72ms | 8.52ms | 3.00ms |
| update_1to4 | 6.00ms | 2.41ms | 1.25ms | 2.37ms | 4.20ms | 1.54ms |
| update_1to1000 | 161μs | 40μs | 43μs | 37μs | 146μs | 351μs |
| cellx1000 | 77.35ms | 9.40ms | 6.91ms | 9.80ms | 11.54ms | 4.84ms |
| cellx2500 | 287.43ms | 31.67ms | 19.24ms | 27.63ms | 33.29ms | 25.96ms |
| cellx5000 | 628.51ms | 65.63ms | 44.26ms | 69.27ms | 78.32ms | 65.92ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.99s | 491.50ms | 244.10ms | 433.82ms | 371.84ms | 247.67ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.42s | 271.16ms | 192.21ms | 263.24ms | 270.46ms | 203.38ms |
| 1000x12 - 4 sources - dynamic (large) | 1.81s | 3.72s | 269.39ms | 3.47s | 425.06ms | 294.37ms |
| 1000x5 - 25 sources (wide dense) | 3.42s | 3.30s | 409.70ms | 2.81s | 637.64ms | 463.29ms |
| 5x500 - 3 sources (deep) | 1.14s | 231.45ms | 191.75ms | 249.60ms | 263.25ms | 198.89ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.69s | 464.54ms | 234.74ms | 439.44ms | 339.68ms | 238.16ms |

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
