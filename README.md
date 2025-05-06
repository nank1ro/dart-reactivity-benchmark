# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.77s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.41s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.51s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.17s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.84s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.48s |

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
| Test Case | solidart(2.0-dev) | preact_signals | alien_signals | state_beacon | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 275.31ms | 199.89ms | 187.60ms | 157.34ms (fail) | 2.34s | 216.49ms |
| broadPropagation | 499.31ms | 472.67ms | 362.14ms | 6.09ms (fail) | 4.28s | 461.31ms |
| deepPropagation | 169.83ms | 177.84ms | 126.32ms | 139.38ms (fail) | 1.51s | 180.14ms |
| diamond | 356.81ms | 278.63ms | 236.22ms | 190.56ms (fail) | 2.43s | 294.71ms |
| mux | 447.82ms | 386.93ms | 378.58ms | 193.59ms (fail) | 1.88s | 414.14ms |
| repeatedObservers | 78.07ms | 38.17ms | 45.48ms | 53.32ms (fail) | 231.85ms | 45.62ms |
| triangle | 120.19ms | 106.67ms | 84.36ms | 76.40ms (fail) | 780.19ms | 105.66ms |
| unstable | 94.04ms | 70.92ms | 60.93ms | 339.48ms (fail) | 357.48ms | 73.99ms |
| molBench | 493.16ms | 492.27ms | 489.23ms | 1.06ms | 581.94ms | 489.20ms |
| create_signals | 91.86ms | 5.30ms | 31.39ms | 70.14ms | 53.20ms | 27.20ms |
| comp_0to1 | 42.00ms | 17.92ms | 7.58ms | 58.74ms | 15.17ms | 14.74ms |
| comp_1to1 | 46.11ms | 14.29ms | 4.17ms | 56.64ms | 45.66ms | 28.28ms |
| comp_2to1 | 43.21ms | 16.85ms | 2.29ms | 37.27ms | 34.79ms | 16.36ms |
| comp_4to1 | 4.47ms | 13.88ms | 7.93ms | 17.12ms | 17.85ms | 2.25ms |
| comp_1000to1 | 15μs | 4μs | 3μs | 43μs | 21μs | 4μs |
| comp_1to2 | 36.93ms | 25.95ms | 11.32ms | 45.83ms | 34.62ms | 22.29ms |
| comp_1to4 | 20.02ms | 27.62ms | 8.90ms | 44.29ms | 17.30ms | 9.54ms |
| comp_1to8 | 25.11ms | 13.61ms | 5.45ms | 43.53ms | 21.00ms | 7.27ms |
| comp_1to1000 | 15.15ms | 7.42ms | 3.52ms | 38.69ms | 15.19ms | 5.40ms |
| update_1to1 | 16.19ms | 8.26ms | 11.42ms | 5.77ms | 24.03ms | 9.25ms |
| update_2to1 | 7.99ms | 4.16ms | 5.12ms | 2.87ms | 11.86ms | 4.62ms |
| update_4to1 | 4.08ms | 2.04ms | 2.83ms | 1.46ms | 6.01ms | 2.31ms |
| update_1000to1 | 40μs | 20μs | 23μs | 15μs | 63μs | 23μs |
| update_1to2 | 8.31ms | 4.08ms | 5.64ms | 2.93ms | 13.35ms | 4.91ms |
| update_1to4 | 4.15ms | 2.04ms | 2.39ms | 1.46ms | 5.61ms | 2.31ms |
| update_1to1000 | 151μs | 1.30ms | 34μs | 389μs | 163μs | 44μs |
| cellx1000 | 13.91ms | 10.16ms | 8.23ms | 6.26ms | 92.62ms | 11.13ms |
| cellx2500 | 46.15ms | 35.34ms | 26.63ms | 29.90ms | 297.61ms | 42.66ms |
| cellx5000 | 136.37ms | 112.64ms | 68.72ms | 80.84ms | 630.00ms | 112.32ms |
| 10x5 - 2 sources - read 20.0% (simple) | 342.30ms | 443.97ms | 233.58ms | 246.80ms | 2.03s | 523.30ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 245.88ms | 283.99ms | 176.41ms | 200.82ms | 1.54s | 287.82ms |
| 1000x12 - 4 sources - dynamic (large) | 477.52ms | 3.59s | 292.64ms | 356.85ms | 1.93s | 3.92s |
| 1000x5 - 25 sources (wide dense) | 604.10ms | 2.62s | 414.84ms | 506.58ms | 3.60s | 3.45s |
| 5x500 - 3 sources (deep) | 255.62ms | 235.23ms | 193.28ms | 203.66ms | 1.25s | 229.52ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 391.62ms | 452.76ms | 276.61ms | 259.13ms | 1.76s | 482.43ms |

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
