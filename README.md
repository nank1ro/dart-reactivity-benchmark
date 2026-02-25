# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.60s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.07s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 10.70s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.20s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.24s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.34s |

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
| avoidablePropagation | 194.79ms | 189.50ms | 163.70ms (fail) | 272.22ms | 201.13ms | 2.25s |
| broadPropagation | 455.80ms | 346.18ms | 6.02ms (fail) | 492.71ms | 438.08ms | 4.15s |
| deepPropagation | 170.37ms | 116.42ms | 129.97ms (fail) | 159.04ms | 177.00ms | 1.50s |
| diamond | 277.51ms | 231.82ms | 173.22ms (fail) | 339.74ms | 277.40ms | 2.31s |
| mux | 372.76ms | 350.44ms | 180.92ms (fail) | 412.45ms | 368.67ms | 1.74s |
| repeatedObservers | 44.71ms | 41.88ms | 55.80ms (fail) | 77.14ms | 39.45ms | 221.31ms |
| triangle | 102.09ms | 85.49ms | 90.13ms (fail) | 112.58ms | 93.80ms | 752.08ms |
| unstable | 74.64ms | 59.15ms | 323.96ms (fail) | 92.75ms | 68.42ms | 324.50ms |
| molBench | 472.98ms | 471.63ms | 1.09ms | 484.92ms | 478.62ms | 565.11ms |
| create_signals | 24.69ms | 27.11ms | 60.81ms | 55.59ms | 15.86ms | 67.87ms |
| comp_0to1 | 10.87ms | 6.90ms | 52.62ms | 24.66ms | 14.41ms | 25.64ms |
| comp_1to1 | 25.81ms | 4.27ms | 50.44ms | 30.11ms | 6.70ms | 30.86ms |
| comp_2to1 | 12.35ms | 2.16ms | 35.14ms | 22.99ms | 11.63ms | 25.85ms |
| comp_4to1 | 2.33ms | 10.61ms | 16.01ms | 15.82ms | 11.10ms | 16.00ms |
| comp_1000to1 | 5μs | 5μs | 43μs | 18μs | 4μs | 16μs |
| comp_1to2 | 19.57ms | 17.54ms | 44.69ms | 32.28ms | 20.71ms | 33.41ms |
| comp_1to4 | 9.29ms | 4.54ms | 43.72ms | 13.87ms | 29.84ms | 17.50ms |
| comp_1to8 | 12.41ms | 4.77ms | 43.08ms | 18.02ms | 5.66ms | 19.31ms |
| comp_1to1000 | 5.87ms | 3.04ms | 39.12ms | 13.62ms | 5.46ms | 17.21ms |
| update_1to1 | 8.87ms | 4.29ms | 7.14ms | 15.17ms | 9.01ms | 21.54ms |
| update_2to1 | 4.51ms | 2.19ms | 2.82ms | 7.63ms | 4.56ms | 12.87ms |
| update_4to1 | 2.22ms | 1.19ms | 1.93ms | 3.85ms | 2.30ms | 5.71ms |
| update_1000to1 | 23μs | 11μs | 15μs | 39μs | 23μs | 53μs |
| update_1to2 | 4.51ms | 2.35ms | 4.08ms | 7.93ms | 4.42ms | 10.70ms |
| update_1to4 | 2.17ms | 1.23ms | 1.41ms | 3.91ms | 2.36ms | 5.30ms |
| update_1to1000 | 37μs | 45μs | 405μs | 157μs | 895μs | 165μs |
| cellx1000 | 9.30ms | 8.96ms | 6.07ms | 12.04ms | 9.54ms | 68.55ms |
| cellx2500 | 30.31ms | 20.11ms | 25.68ms | 30.80ms | 24.67ms | 245.25ms |
| cellx5000 | 59.06ms | 40.47ms | 57.64ms | 62.64ms | 65.53ms | 531.15ms |
| 10x5 - 2 sources - read 20.0% (simple) | 487.54ms | 229.50ms | 238.11ms | 348.92ms | 442.68ms | 1.93s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 273.84ms | 174.89ms | 198.13ms | 246.38ms | 266.58ms | 1.44s |
| 1000x12 - 4 sources - dynamic (large) | 3.44s | 286.28ms | 326.24ms | 448.52ms | 3.70s | 1.82s |
| 1000x5 - 25 sources (wide dense) | 3.41s | 399.12ms | 503.77ms | 590.45ms | 2.73s | 3.34s |
| 5x500 - 3 sources (deep) | 218.37ms | 193.30ms | 208.30ms | 253.91ms | 228.06ms | 1.09s |
| 100x15 - 6 sources - dynamic (very dynamic) | 471.69ms | 261.60ms | 252.22ms | 370.95ms | 442.58ms | 1.66s |

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
