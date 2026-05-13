# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.73s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.09s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.36s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.73s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.29s |
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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.30s | 199.68ms | 199.19ms | 211.40ms | 279.39ms | 152.97ms (fail) |
| broadPropagation | 4.33s | 467.46ms | 357.83ms | 459.38ms | 499.37ms | 5.93ms (fail) |
| deepPropagation | 1.58s | 171.86ms | 133.32ms | 176.98ms | 167.30ms | 140.26ms (fail) |
| diamond | 2.37s | 284.84ms | 244.46ms | 287.62ms | 351.83ms | 182.45ms (fail) |
| mux | 1.79s | 403.05ms | 365.01ms | 382.67ms | 424.89ms | 182.52ms (fail) |
| repeatedObservers | 230.53ms | 45.55ms | 44.88ms | 42.36ms | 80.55ms | 58.42ms (fail) |
| triangle | 774.57ms | 101.34ms | 116.59ms | 100.04ms | 114.67ms | 74.92ms (fail) |
| unstable | 345.00ms | 76.36ms | 61.78ms | 72.27ms | 95.79ms | 334.89ms (fail) |
| molBench | 586.33ms | 494.54ms | 481.76ms | 497.33ms | 490.49ms | 1.03ms |
| create_signals | 69.90ms | 26.55ms | 22.25ms | 11.10ms | 76.86ms | 66.15ms |
| comp_0to1 | 27.45ms | 11.79ms | 8.53ms | 16.66ms | 26.28ms | 54.91ms |
| comp_1to1 | 37.80ms | 27.42ms | 4.42ms | 6.94ms | 40.55ms | 63.44ms |
| comp_2to1 | 32.97ms | 9.38ms | 2.40ms | 10.63ms | 50.97ms | 44.27ms |
| comp_4to1 | 22.94ms | 1.93ms | 8.57ms | 14.00ms | 17.20ms | 19.25ms |
| comp_1000to1 | 15μs | 4μs | 3μs | 6μs | 15μs | 44μs |
| comp_1to2 | 41.24ms | 12.97ms | 15.54ms | 19.25ms | 38.83ms | 49.96ms |
| comp_1to4 | 18.12ms | 15.63ms | 5.50ms | 23.66ms | 20.03ms | 48.42ms |
| comp_1to8 | 24.40ms | 7.43ms | 4.67ms | 10.98ms | 23.97ms | 44.55ms |
| comp_1to1000 | 15.50ms | 4.04ms | 3.91ms | 7.00ms | 14.03ms | 40.40ms |
| update_1to1 | 21.16ms | 8.91ms | 4.64ms | 9.33ms | 15.88ms | 7.42ms |
| update_2to1 | 10.38ms | 4.44ms | 2.45ms | 4.66ms | 7.82ms | 7.64ms |
| update_4to1 | 6.10ms | 2.21ms | 1.26ms | 2.38ms | 3.94ms | 2.23ms |
| update_1000to1 | 52μs | 22μs | 11μs | 23μs | 40μs | 14μs |
| update_1to2 | 10.58ms | 4.43ms | 2.37ms | 4.53ms | 8.12ms | 5.17ms |
| update_1to4 | 5.30ms | 2.23ms | 1.23ms | 2.44ms | 3.96ms | 1.47ms |
| update_1to1000 | 154μs | 51μs | 48μs | 2.39ms | 149μs | 388μs |
| cellx1000 | 89.42ms | 10.68ms | 7.62ms | 9.86ms | 12.05ms | 6.87ms |
| cellx2500 | 293.63ms | 38.63ms | 21.33ms | 28.18ms | 37.81ms | 34.33ms |
| cellx5000 | 601.78ms | 73.47ms | 52.29ms | 73.10ms | 114.71ms | 100.40ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.97s | 501.64ms | 231.64ms | 547.57ms | 352.71ms | 239.22ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.50s | 279.34ms | 176.98ms | 303.67ms | 250.01ms | 209.19ms |
| 1000x12 - 4 sources - dynamic (large) | 1.96s | 3.76s | 283.99ms | 3.87s | 474.76ms | 355.72ms |
| 1000x5 - 25 sources (wide dense) | 3.34s | 3.34s | 412.63ms | 2.82s | 607.92ms | 514.70ms |
| 5x500 - 3 sources (deep) | 1.17s | 221.93ms | 190.87ms | 236.18ms | 261.11ms | 209.14ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.70s | 477.28ms | 263.84ms | 466.65ms | 393.30ms | 260.70ms |

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
