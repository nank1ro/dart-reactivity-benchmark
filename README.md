# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.18s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 10.99s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.47s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.79s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.44s |

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
| avoidablePropagation | 204.09ms | 195.87ms | 162.88ms (fail) | 273.34ms | 205.53ms | 2.35s |
| broadPropagation | 461.13ms | 358.55ms | 6.14ms (fail) | 502.74ms | 451.19ms | 4.17s |
| deepPropagation | 169.52ms | 128.08ms | 155.68ms (fail) | 164.03ms | 177.80ms | 1.52s |
| diamond | 284.10ms | 247.14ms | 185.23ms (fail) | 348.31ms | 284.05ms | 2.40s |
| mux | 397.24ms | 362.36ms | 184.47ms (fail) | 414.15ms | 376.28ms | 1.77s |
| repeatedObservers | 45.90ms | 45.51ms | 56.41ms (fail) | 80.11ms | 41.16ms | 230.74ms |
| triangle | 99.73ms | 89.25ms | 76.48ms (fail) | 113.36ms | 100.73ms | 760.19ms |
| unstable | 79.01ms | 62.15ms | 335.85ms (fail) | 95.85ms | 71.78ms | 346.57ms |
| molBench | 494.28ms | 487.86ms | 1.15ms | 493.32ms | 497.33ms | 587.20ms |
| create_signals | 26.90ms | 28.01ms | 67.74ms | 52.19ms | 5.39ms | 80.19ms |
| comp_0to1 | 11.89ms | 7.84ms | 53.97ms | 24.50ms | 17.74ms | 39.81ms |
| comp_1to1 | 29.14ms | 4.37ms | 55.91ms | 31.18ms | 11.51ms | 17.74ms |
| comp_2to1 | 12.63ms | 2.28ms | 37.43ms | 24.40ms | 17.95ms | 13.23ms |
| comp_4to1 | 3.02ms | 8.46ms | 17.01ms | 17.19ms | 15.87ms | 34.70ms |
| comp_1000to1 | 5μs | 4μs | 45μs | 15μs | 4μs | 34μs |
| comp_1to2 | 23.98ms | 12.92ms | 47.52ms | 34.16ms | 15.61ms | 38.94ms |
| comp_1to4 | 14.77ms | 15.19ms | 45.35ms | 20.45ms | 23.88ms | 24.09ms |
| comp_1to8 | 6.82ms | 4.06ms | 44.45ms | 24.84ms | 7.35ms | 23.72ms |
| comp_1to1000 | 4.03ms | 3.19ms | 40.30ms | 14.25ms | 5.46ms | 14.94ms |
| update_1to1 | 8.92ms | 4.66ms | 7.43ms | 15.95ms | 8.91ms | 21.01ms |
| update_2to1 | 4.45ms | 2.33ms | 2.85ms | 7.95ms | 4.61ms | 10.59ms |
| update_4to1 | 2.27ms | 1.23ms | 2.44ms | 3.98ms | 2.26ms | 5.64ms |
| update_1000to1 | 22μs | 11μs | 14μs | 40μs | 23μs | 63μs |
| update_1to2 | 4.48ms | 2.34ms | 5.26ms | 8.17ms | 4.46ms | 10.37ms |
| update_1to4 | 2.24ms | 1.22ms | 1.46ms | 3.98ms | 2.34ms | 5.24ms |
| update_1to1000 | 40μs | 48μs | 403μs | 145μs | 422μs | 157μs |
| cellx1000 | 9.70ms | 7.52ms | 5.20ms | 11.85ms | 9.75ms | 65.55ms |
| cellx2500 | 33.94ms | 19.99ms | 23.33ms | 30.02ms | 26.42ms | 241.87ms |
| cellx5000 | 67.69ms | 42.85ms | 65.45ms | 64.18ms | 71.39ms | 574.07ms |
| 10x5 - 2 sources - read 20.0% (simple) | 501.02ms | 237.20ms | 241.42ms | 347.82ms | 451.05ms | 1.92s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.43ms | 176.77ms | 201.91ms | 258.20ms | 273.24ms | 1.50s |
| 1000x12 - 4 sources - dynamic (large) | 3.51s | 276.85ms | 336.25ms | 454.45ms | 3.81s | 1.83s |
| 1000x5 - 25 sources (wide dense) | 3.49s | 410.09ms | 513.46ms | 609.20ms | 2.79s | 3.39s |
| 5x500 - 3 sources (deep) | 232.46ms | 196.67ms | 206.64ms | 250.89ms | 235.40ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 474.59ms | 264.85ms | 256.66ms | 382.96ms | 452.53ms | 1.68s |

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
