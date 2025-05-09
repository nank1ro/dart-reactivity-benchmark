# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.34s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.02s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 11.35s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.84s |
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
| Test Case | preact_signals | mobx | state_beacon | solidart(2.0-dev) | alien_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 205.92ms | 2.32s | 151.72ms (fail) | 276.84ms | 189.80ms | 209.99ms |
| broadPropagation | 464.11ms | 4.33s | 6.04ms (fail) | 514.73ms | 361.92ms | 468.26ms |
| deepPropagation | 179.35ms | 1.53s | 142.06ms (fail) | 168.76ms | 125.99ms | 184.27ms |
| diamond | 282.46ms | 2.42s | 181.86ms (fail) | 358.05ms | 231.88ms | 295.98ms |
| mux | 382.98ms | 1.88s | 195.54ms (fail) | 440.31ms | 371.20ms | 413.98ms |
| repeatedObservers | 39.60ms | 229.68ms | 53.00ms (fail) | 79.90ms | 44.85ms | 46.63ms |
| triangle | 98.45ms | 774.38ms | 77.71ms (fail) | 116.19ms | 85.36ms | 104.86ms |
| unstable | 70.83ms | 350.93ms | 340.47ms (fail) | 95.40ms | 60.55ms | 74.93ms |
| molBench | 492.12ms | 582.48ms | 1.25ms | 493.76ms | 491.11ms | 489.68ms |
| create_signals | 5.21ms | 88.75ms | 68.80ms | 68.16ms | 28.46ms | 26.23ms |
| comp_0to1 | 18.44ms | 24.58ms | 55.25ms | 25.69ms | 7.11ms | 12.40ms |
| comp_1to1 | 14.36ms | 45.22ms | 57.06ms | 38.14ms | 4.22ms | 27.84ms |
| comp_2to1 | 10.73ms | 24.63ms | 39.62ms | 24.86ms | 2.40ms | 9.45ms |
| comp_4to1 | 9.31ms | 18.50ms | 17.95ms | 15.16ms | 8.75ms | 2.06ms |
| comp_1000to1 | 6μs | 23μs | 43μs | 15μs | 5μs | 5μs |
| comp_1to2 | 18.82ms | 35.01ms | 46.63ms | 31.02ms | 21.04ms | 23.29ms |
| comp_1to4 | 24.39ms | 17.63ms | 45.46ms | 21.00ms | 7.07ms | 9.65ms |
| comp_1to8 | 7.13ms | 20.69ms | 45.17ms | 25.29ms | 4.63ms | 9.50ms |
| comp_1to1000 | 6.83ms | 15.25ms | 38.47ms | 15.14ms | 3.55ms | 7.53ms |
| update_1to1 | 8.20ms | 24.71ms | 5.75ms | 16.29ms | 11.24ms | 9.35ms |
| update_2to1 | 4.04ms | 11.46ms | 2.91ms | 7.97ms | 5.09ms | 4.68ms |
| update_4to1 | 2.07ms | 5.82ms | 1.50ms | 4.04ms | 2.79ms | 2.33ms |
| update_1000to1 | 20μs | 69μs | 15μs | 40μs | 24μs | 22μs |
| update_1to2 | 4.14ms | 10.79ms | 2.99ms | 8.19ms | 5.63ms | 4.89ms |
| update_1to4 | 2.08ms | 5.58ms | 1.49ms | 4.05ms | 2.46ms | 2.35ms |
| update_1to1000 | 937μs | 173μs | 399μs | 151μs | 49μs | 44μs |
| cellx1000 | 10.31ms | 83.09ms | 7.83ms | 14.58ms | 7.58ms | 10.02ms |
| cellx2500 | 33.80ms | 295.64ms | 49.20ms | 44.30ms | 20.88ms | 35.28ms |
| cellx5000 | 81.26ms | 645.99ms | 112.24ms | 108.00ms | 48.42ms | 80.71ms |
| 10x5 - 2 sources - read 20.0% (simple) | 444.57ms | 2.06s | 235.83ms | 354.81ms | 242.75ms | 504.85ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 269.15ms | 1.56s | 200.42ms | 243.41ms | 182.25ms | 276.11ms |
| 1000x12 - 4 sources - dynamic (large) | 3.54s | 1.95s | 361.21ms | 476.00ms | 289.29ms | 3.75s |
| 1000x5 - 25 sources (wide dense) | 2.60s | 3.53s | 506.02ms | 601.06ms | 423.86ms | 3.53s |
| 5x500 - 3 sources (deep) | 234.68ms | 1.19s | 209.08ms | 263.00ms | 191.98ms | 228.46ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 449.46ms | 1.76s | 263.80ms | 389.76ms | 266.25ms | 484.29ms |

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
