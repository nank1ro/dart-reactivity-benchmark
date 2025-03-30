# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.29s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.16s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.51s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.64s |
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
| avoidablePropagation | 270.62ms | 198.06ms | 2.38s | 188.82ms | 212.72ms | 150.67ms (fail) |
| broadPropagation | 501.92ms | 458.27ms | 4.23s | 354.11ms | 459.94ms | 5.78ms (fail) |
| deepPropagation | 170.69ms | 178.64ms | 1.52s | 122.27ms | 183.03ms | 137.61ms (fail) |
| diamond | 356.11ms | 280.30ms | 2.46s | 236.77ms | 289.22ms | 180.54ms (fail) |
| mux | 449.51ms | 403.77ms | 1.85s | 371.01ms | 406.84ms | 190.65ms (fail) |
| repeatedObservers | 83.62ms | 38.68ms | 230.09ms | 44.82ms | 46.82ms | 52.52ms (fail) |
| triangle | 117.71ms | 99.40ms | 794.36ms | 85.37ms | 104.80ms | 76.29ms (fail) |
| unstable | 94.98ms | 70.20ms | 351.63ms | 60.96ms | 72.99ms | 339.78ms (fail) |
| molBench | 493.91ms | 491.24ms | 581.61ms | 492.13ms | 489.47ms | 952μs |
| create_signals | 72.11ms | 4.85ms | 84.29ms | 29.52ms | 29.69ms | 63.58ms |
| comp_0to1 | 28.15ms | 20.01ms | 28.65ms | 7.88ms | 12.04ms | 55.29ms |
| comp_1to1 | 49.01ms | 11.09ms | 48.69ms | 4.70ms | 28.86ms | 59.77ms |
| comp_2to1 | 12.02ms | 23.24ms | 36.52ms | 3.21ms | 15.10ms | 39.13ms |
| comp_4to1 | 14.74ms | 23.10ms | 25.25ms | 8.46ms | 5.14ms | 18.74ms |
| comp_1000to1 | 21μs | 4μs | 20μs | 6μs | 5μs | 43μs |
| comp_1to2 | 33.54ms | 17.51ms | 36.28ms | 9.72ms | 10.93ms | 48.33ms |
| comp_1to4 | 19.56ms | 32.35ms | 20.26ms | 12.64ms | 15.04ms | 46.30ms |
| comp_1to8 | 27.64ms | 8.82ms | 23.08ms | 4.40ms | 11.33ms | 46.34ms |
| comp_1to1000 | 14.53ms | 6.02ms | 15.41ms | 4.03ms | 4.54ms | 40.19ms |
| update_1to1 | 16.16ms | 8.18ms | 24.14ms | 8.37ms | 9.26ms | 5.74ms |
| update_2to1 | 7.92ms | 4.09ms | 11.82ms | 3.09ms | 4.61ms | 2.90ms |
| update_4to1 | 4.04ms | 2.04ms | 6.34ms | 1.56ms | 2.31ms | 1.47ms |
| update_1000to1 | 40μs | 20μs | 67μs | 15μs | 23μs | 15μs |
| update_1to2 | 8.17ms | 4.10ms | 13.10ms | 2.98ms | 4.94ms | 2.96ms |
| update_1to4 | 4.17ms | 2.02ms | 5.99ms | 1.35ms | 2.31ms | 1.48ms |
| update_1to1000 | 158μs | 187μs | 181μs | 42μs | 48μs | 394μs |
| cellx1000 | 11.48ms | 10.41ms | 70.15ms | 7.35ms | 9.69ms | 5.70ms |
| cellx2500 | 37.02ms | 38.10ms | 241.87ms | 20.72ms | 29.88ms | 25.35ms |
| cellx5000 | 81.25ms | 111.86ms | 566.31ms | 54.95ms | 80.26ms | 81.49ms |
| 10x5 - 2 sources - read 20.0% (simple) | 353.36ms | 478.80ms | 2.04s | 236.15ms | 512.69ms | 242.36ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 242.66ms | 281.02ms | 1.56s | 184.55ms | 278.41ms | 209.29ms |
| 1000x12 - 4 sources - dynamic (large) | 475.57ms | 3.58s | 1.90s | 285.93ms | 3.91s | 364.83ms |
| 1000x5 - 25 sources (wide dense) | 589.01ms | 2.59s | 3.58s | 423.78ms | 3.56s | 508.45ms |
| 5x500 - 3 sources (deep) | 260.13ms | 235.71ms | 1.18s | 191.80ms | 226.88ms | 205.63ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 393.02ms | 447.78ms | 1.72s | 261.72ms | 488.40ms | 261.43ms |

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
