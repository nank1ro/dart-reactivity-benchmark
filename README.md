# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.84s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 10.72s |
| 🥉 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.50s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 10.93s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.60s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.56s |

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
| Test Case | solidart(2.0-dev) | alien_signals | state_beacon | preact_signals | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 276.77ms | 196.64ms | 148.89ms (fail) | 222.19ms | 2.26s | 200.54ms |
| broadPropagation | 498.27ms | 357.73ms | 6.01ms (fail) | 461.14ms | 4.37s | 471.33ms |
| deepPropagation | 167.33ms | 130.60ms | 138.97ms (fail) | 175.80ms | 1.56s | 173.71ms |
| diamond | 345.96ms | 246.50ms | 180.72ms (fail) | 286.98ms | 2.38s | 290.00ms |
| mux | 436.88ms | 360.94ms | 182.26ms (fail) | 377.64ms | 1.78s | 409.29ms |
| repeatedObservers | 80.96ms | 46.51ms | 56.09ms (fail) | 43.03ms | 225.28ms | 45.67ms |
| triangle | 114.57ms | 89.13ms | 81.47ms (fail) | 100.28ms | 758.29ms | 100.89ms |
| unstable | 95.03ms | 63.43ms | 339.11ms (fail) | 72.67ms | 340.85ms | 75.73ms |
| molBench | 492.96ms | 485.19ms | 1.02ms | 498.73ms | 588.23ms | 497.30ms |
| create_signals | 81.81ms | 30.82ms | 70.08ms | 5.25ms | 59.74ms | 36.93ms |
| comp_0to1 | 36.98ms | 9.49ms | 60.01ms | 18.73ms | 15.66ms | 14.06ms |
| comp_1to1 | 62.70ms | 12.14ms | 60.52ms | 15.91ms | 51.73ms | 23.24ms |
| comp_2to1 | 23.98ms | 11.50ms | 40.74ms | 28.41ms | 37.80ms | 10.64ms |
| comp_4to1 | 9.54ms | 1.96ms | 18.89ms | 2.17ms | 35.13ms | 8.11ms |
| comp_1000to1 | 27μs | 5μs | 49μs | 6μs | 30μs | 5μs |
| comp_1to2 | 36.43ms | 8.35ms | 50.21ms | 11.67ms | 32.44ms | 26.63ms |
| comp_1to4 | 17.80ms | 11.74ms | 51.12ms | 32.55ms | 23.86ms | 12.90ms |
| comp_1to8 | 26.80ms | 4.78ms | 48.40ms | 16.25ms | 24.58ms | 7.83ms |
| comp_1to1000 | 14.85ms | 3.86ms | 43.82ms | 6.73ms | 15.85ms | 5.56ms |
| update_1to1 | 15.76ms | 4.66ms | 8.61ms | 9.07ms | 21.22ms | 8.94ms |
| update_2to1 | 7.86ms | 2.38ms | 2.87ms | 4.61ms | 10.43ms | 4.49ms |
| update_4to1 | 3.91ms | 1.22ms | 1.62ms | 2.30ms | 5.85ms | 2.29ms |
| update_1000to1 | 40μs | 11μs | 14μs | 23μs | 62μs | 22μs |
| update_1to2 | 7.85ms | 2.38ms | 3.54ms | 4.60ms | 10.45ms | 4.57ms |
| update_1to4 | 3.94ms | 1.22ms | 1.61ms | 2.40ms | 5.20ms | 2.24ms |
| update_1to1000 | 161μs | 47μs | 432μs | 49μs | 161μs | 48μs |
| cellx1000 | 18.77ms | 8.78ms | 7.12ms | 12.17ms | 114.23ms | 12.90ms |
| cellx2500 | 70.51ms | 33.23ms | 41.22ms | 44.37ms | 373.25ms | 54.17ms |
| cellx5000 | 216.04ms | 114.87ms | 114.01ms | 166.69ms | 759.20ms | 157.96ms |
| 10x5 - 2 sources - read 20.0% (simple) | 345.03ms | 236.16ms | 240.13ms | 463.38ms | 2.02s | 509.75ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 249.28ms | 178.04ms | 205.47ms | 277.70ms | 1.52s | 280.22ms |
| 1000x12 - 4 sources - dynamic (large) | 477.73ms | 296.43ms | 355.87ms | 3.85s | 1.86s | 3.52s |
| 1000x5 - 25 sources (wide dense) | 605.06ms | 414.31ms | 514.40ms | 2.81s | 3.43s | 3.25s |
| 5x500 - 3 sources (deep) | 263.40ms | 204.47ms | 221.85ms | 240.71ms | 1.17s | 225.83ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 396.98ms | 267.63ms | 263.35ms | 450.84ms | 1.73s | 484.33ms |

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
