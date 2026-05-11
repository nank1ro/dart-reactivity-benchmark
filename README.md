# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.74s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.19s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 10.48s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 10.80s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.05s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.45s |

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
| avoidablePropagation | 2.28s | 203.64ms | 199.36ms | 205.64ms | 277.41ms | 150.18ms (fail) |
| broadPropagation | 4.41s | 469.98ms | 361.62ms | 456.18ms | 494.50ms | 5.96ms (fail) |
| deepPropagation | 1.55s | 171.22ms | 126.80ms | 175.06ms | 163.82ms | 141.73ms (fail) |
| diamond | 2.31s | 288.62ms | 245.36ms | 285.31ms | 337.19ms | 194.80ms (fail) |
| mux | 1.77s | 401.96ms | 365.63ms | 370.25ms | 414.21ms | 191.94ms (fail) |
| repeatedObservers | 230.41ms | 45.62ms | 47.25ms | 42.29ms | 81.12ms | 55.75ms (fail) |
| triangle | 763.28ms | 101.84ms | 89.16ms | 99.25ms | 115.95ms | 78.85ms (fail) |
| unstable | 345.03ms | 75.61ms | 63.01ms | 72.47ms | 95.58ms | 334.04ms (fail) |
| molBench | 590.27ms | 494.04ms | 481.69ms | 496.70ms | 491.62ms | 1.13ms |
| create_signals | 65.53ms | 26.92ms | 28.24ms | 9.28ms | 74.30ms | 66.71ms |
| comp_0to1 | 26.02ms | 11.68ms | 7.21ms | 17.11ms | 26.13ms | 54.19ms |
| comp_1to1 | 40.47ms | 32.73ms | 4.29ms | 6.97ms | 25.55ms | 57.28ms |
| comp_2to1 | 37.66ms | 8.45ms | 2.35ms | 10.41ms | 37.79ms | 36.36ms |
| comp_4to1 | 20.53ms | 1.90ms | 8.56ms | 21.61ms | 11.85ms | 16.72ms |
| comp_1000to1 | 23μs | 4μs | 5μs | 6μs | 14μs | 42μs |
| comp_1to2 | 34.36ms | 18.85ms | 19.05ms | 15.73ms | 26.51ms | 46.53ms |
| comp_1to4 | 20.24ms | 10.95ms | 10.99ms | 12.10ms | 20.09ms | 45.74ms |
| comp_1to8 | 23.74ms | 7.41ms | 5.31ms | 9.59ms | 22.47ms | 44.22ms |
| comp_1to1000 | 15.02ms | 7.25ms | 3.67ms | 3.73ms | 14.02ms | 40.62ms |
| update_1to1 | 21.93ms | 8.95ms | 4.67ms | 9.27ms | 15.69ms | 10.03ms |
| update_2to1 | 11.35ms | 4.44ms | 2.37ms | 4.63ms | 7.83ms | 2.85ms |
| update_4to1 | 6.08ms | 2.25ms | 1.21ms | 2.34ms | 3.92ms | 2.50ms |
| update_1000to1 | 58μs | 22μs | 11μs | 23μs | 39μs | 15μs |
| update_1to2 | 10.69ms | 4.40ms | 2.33ms | 4.61ms | 8.09ms | 4.34ms |
| update_1to4 | 5.86ms | 2.27ms | 1.21ms | 2.43ms | 3.93ms | 1.47ms |
| update_1to1000 | 153μs | 54μs | 52μs | 52μs | 147μs | 380μs |
| cellx1000 | 71.09ms | 9.74ms | 7.43ms | 10.05ms | 11.85ms | 5.44ms |
| cellx2500 | 250.32ms | 35.32ms | 19.81ms | 31.57ms | 37.91ms | 23.45ms |
| cellx5000 | 587.92ms | 72.45ms | 45.38ms | 69.62ms | 80.19ms | 74.23ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.97s | 499.77ms | 234.38ms | 453.86ms | 342.04ms | 239.52ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.54s | 281.95ms | 178.29ms | 272.55ms | 248.66ms | 198.45ms |
| 1000x12 - 4 sources - dynamic (large) | 1.88s | 3.51s | 281.95ms | 3.83s | 468.31ms | 337.11ms |
| 1000x5 - 25 sources (wide dense) | 3.38s | 3.28s | 414.89ms | 2.80s | 595.80ms | 518.56ms |
| 5x500 - 3 sources (deep) | 1.13s | 221.66ms | 201.88ms | 236.93ms | 255.48ms | 208.43ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.65s | 484.95ms | 271.75ms | 449.33ms | 384.60ms | 257.21ms |

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
