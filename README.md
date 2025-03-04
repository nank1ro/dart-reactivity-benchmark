# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.74s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 10.15s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.35s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.50s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.01s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.47s |

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
| avoidablePropagation | 277.67ms | 208.07ms | 2.32s | 187.36ms | 216.88ms | 155.25ms (fail) |
| broadPropagation | 508.64ms | 469.68ms | 4.34s | 358.77ms | 467.29ms | 6.62ms (fail) |
| deepPropagation | 172.34ms | 183.77ms | 1.59s | 127.88ms | 181.00ms | 140.11ms (fail) |
| diamond | 354.57ms | 285.71ms | 2.42s | 235.43ms | 291.40ms | 198.26ms (fail) |
| mux | 446.46ms | 391.26ms | 1.86s | 377.88ms | 420.07ms | 199.69ms (fail) |
| repeatedObservers | 79.89ms | 38.92ms | 228.99ms | 46.45ms | 46.41ms | 53.22ms (fail) |
| triangle | 120.58ms | 100.05ms | 775.65ms | 86.48ms | 104.26ms | 79.07ms (fail) |
| unstable | 95.29ms | 70.95ms | 351.54ms | 61.76ms | 71.92ms | 346.55ms (fail) |
| molBench | 499.51ms | 495.75ms | 589.78ms | 496.78ms | 493.54ms | 953μs |
| create_signals | 80.20ms | 5.03ms | 84.31ms | 27.02ms | 30.82ms | 60.89ms |
| comp_0to1 | 38.46ms | 19.42ms | 43.63ms | 7.80ms | 13.06ms | 54.62ms |
| comp_1to1 | 50.99ms | 11.72ms | 19.48ms | 5.77ms | 29.70ms | 55.63ms |
| comp_2to1 | 22.46ms | 18.80ms | 20.33ms | 2.80ms | 10.47ms | 36.26ms |
| comp_4to1 | 11.49ms | 12.49ms | 29.50ms | 9.29ms | 2.48ms | 18.70ms |
| comp_1000to1 | 244μs | 8μs | 20μs | 6μs | 9μs | 42μs |
| comp_1to2 | 39.42ms | 27.22ms | 46.71ms | 21.18ms | 18.76ms | 45.68ms |
| comp_1to4 | 19.38ms | 29.33ms | 25.46ms | 5.72ms | 15.85ms | 44.14ms |
| comp_1to8 | 25.03ms | 7.37ms | 21.93ms | 5.47ms | 6.85ms | 42.46ms |
| comp_1to1000 | 14.77ms | 5.62ms | 15.71ms | 3.64ms | 4.58ms | 37.74ms |
| update_1to1 | 16.53ms | 8.17ms | 22.58ms | 9.86ms | 9.25ms | 5.73ms |
| update_2to1 | 7.98ms | 4.10ms | 12.25ms | 2.75ms | 4.59ms | 2.90ms |
| update_4to1 | 4.05ms | 2.08ms | 6.12ms | 1.81ms | 2.31ms | 1.53ms |
| update_1000to1 | 40μs | 20μs | 68μs | 13μs | 23μs | 17μs |
| update_1to2 | 8.28ms | 4.05ms | 10.58ms | 3.12ms | 4.91ms | 3.22ms |
| update_1to4 | 4.24ms | 2.45ms | 5.26ms | 1.41ms | 2.36ms | 1.49ms |
| update_1to1000 | 159μs | 186μs | 168μs | 49μs | 46μs | 381μs |
| cellx1000 | 11.76ms | 9.85ms | 71.28ms | 7.16ms | 9.73ms | 5.26ms |
| cellx2500 | 33.47ms | 28.23ms | 279.42ms | 20.98ms | 35.77ms | 26.70ms |
| cellx5000 | 79.20ms | 76.77ms | 600.51ms | 46.50ms | 82.98ms | 85.94ms |
| 10x5 - 2 sources - read 20.0% (simple) | 354.51ms | 476.42ms | 2.05s | 237.73ms | 521.38ms | 247.91ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 245.57ms | 285.33ms | 1.56s | 177.75ms | 280.32ms | 203.00ms |
| 1000x12 - 4 sources - dynamic (large) | 474.98ms | 3.56s | 1.96s | 290.88ms | 3.83s | 351.75ms |
| 1000x5 - 25 sources (wide dense) | 599.14ms | 2.63s | 3.66s | 410.93ms | 3.57s | 492.75ms |
| 5x500 - 3 sources (deep) | 262.90ms | 233.19ms | 1.17s | 193.25ms | 229.52ms | 205.92ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 385.91ms | 450.94ms | 1.82s | 269.11ms | 488.51ms | 260.09ms |

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
