# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.79s |
| 🥈 | solidart(2.0-dev) | 0.31 | 100.0% | 35/35 | 5.27s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.35s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.57s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.24s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.59s |

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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 202.86ms | 2.29s | 145.70ms (fail) | 196.30ms | 205.15ms | 272.78ms |
| broadPropagation | 455.14ms | 4.29s | 6.36ms (fail) | 369.76ms | 458.18ms | 497.13ms |
| deepPropagation | 172.01ms | 1.52s | 139.64ms (fail) | 133.89ms | 173.77ms | 165.47ms |
| diamond | 297.14ms | 2.35s | 187.12ms (fail) | 251.07ms | 285.31ms | 341.66ms |
| mux | 393.81ms | 1.76s | 190.65ms (fail) | 371.83ms | 376.23ms | 413.60ms |
| repeatedObservers | 45.80ms | 227.95ms | 56.04ms (fail) | 48.13ms | 41.56ms | 80.50ms |
| triangle | 101.76ms | 765.39ms | 91.23ms (fail) | 88.41ms | 99.89ms | 114.62ms |
| unstable | 76.00ms | 345.83ms | 342.04ms (fail) | 64.24ms | 71.69ms | 94.92ms |
| molBench | 495.46ms | 591.13ms | 1.38ms | 492.65ms | 495.23ms | 490.23ms |
| create_signals | 44.71ms | 71.11ms | 73.75ms | 27.10ms | 6.22ms | 81.58ms |
| comp_0to1 | 19.80ms | 15.43ms | 66.44ms | 9.27ms | 20.54ms | 27.50ms |
| comp_1to1 | 30.67ms | 53.65ms | 62.10ms | 4.94ms | 11.65ms | 54.26ms |
| comp_2to1 | 11.09ms | 39.10ms | 48.12ms | 2.82ms | 15.60ms | 28.26ms |
| comp_4to1 | 8.97ms | 27.41ms | 19.30ms | 9.48ms | 17.43ms | 12.06ms |
| comp_1000to1 | 6μs | 22μs | 45μs | 6μs | 4μs | 15μs |
| comp_1to2 | 22.22ms | 37.12ms | 48.03ms | 21.32ms | 18.82ms | 26.60ms |
| comp_1to4 | 15.22ms | 23.50ms | 48.10ms | 8.43ms | 39.33ms | 15.09ms |
| comp_1to8 | 7.51ms | 24.91ms | 46.04ms | 8.13ms | 10.13ms | 20.66ms |
| comp_1to1000 | 4.78ms | 15.16ms | 41.46ms | 4.37ms | 6.68ms | 14.50ms |
| update_1to1 | 8.90ms | 22.76ms | 7.37ms | 4.67ms | 8.96ms | 15.66ms |
| update_2to1 | 4.44ms | 12.08ms | 5.79ms | 2.34ms | 4.57ms | 7.83ms |
| update_4to1 | 2.28ms | 5.76ms | 1.75ms | 1.69ms | 2.29ms | 3.92ms |
| update_1000to1 | 22μs | 62μs | 16μs | 11μs | 39μs | 39μs |
| update_1to2 | 4.40ms | 10.91ms | 4.25ms | 2.39ms | 4.45ms | 8.02ms |
| update_1to4 | 2.53ms | 6.19ms | 1.59ms | 1.22ms | 2.29ms | 3.94ms |
| update_1to1000 | 43μs | 172μs | 398μs | 35μs | 953μs | 147μs |
| cellx1000 | 14.19ms | 90.74ms | 6.39ms | 8.15ms | 10.79ms | 14.37ms |
| cellx2500 | 47.96ms | 322.84ms | 37.85ms | 23.30ms | 30.83ms | 38.10ms |
| cellx5000 | 95.33ms | 733.06ms | 89.35ms | 52.46ms | 89.54ms | 107.95ms |
| 10x5 - 2 sources - read 20.0% (simple) | 493.67ms | 1.95s | 244.01ms | 231.73ms | 456.45ms | 344.46ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.05ms | 1.44s | 205.21ms | 174.20ms | 269.43ms | 246.86ms |
| 1000x12 - 4 sources - dynamic (large) | 3.80s | 1.95s | 355.32ms | 286.37ms | 3.84s | 476.80ms |
| 1000x5 - 25 sources (wide dense) | 3.49s | 3.41s | 534.72ms | 418.11ms | 2.79s | 608.56ms |
| 5x500 - 3 sources (deep) | 228.35ms | 1.15s | 213.68ms | 198.97ms | 237.59ms | 250.75ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 480.86ms | 1.70s | 266.00ms | 271.91ms | 457.75ms | 392.30ms |

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
