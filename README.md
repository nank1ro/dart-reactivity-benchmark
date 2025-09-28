# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.26s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.49s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.49s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.50s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.51s |

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
| avoidablePropagation | 212.32ms | 191.35ms | 154.03ms (fail) | 264.97ms | 200.75ms | 2.35s |
| broadPropagation | 456.62ms | 351.15ms | 6.48ms (fail) | 486.42ms | 464.75ms | 4.41s |
| deepPropagation | 175.67ms | 129.52ms | 141.24ms (fail) | 162.16ms | 178.02ms | 1.57s |
| diamond | 282.86ms | 234.01ms | 205.38ms (fail) | 354.51ms | 279.71ms | 2.40s |
| mux | 410.56ms | 383.47ms | 192.59ms (fail) | 431.29ms | 387.73ms | 1.82s |
| repeatedObservers | 46.31ms | 43.78ms | 52.69ms (fail) | 80.98ms | 40.13ms | 230.37ms |
| triangle | 113.49ms | 84.38ms | 79.18ms (fail) | 114.41ms | 99.05ms | 773.95ms |
| unstable | 72.64ms | 59.37ms | 372.84ms (fail) | 95.66ms | 74.22ms | 345.86ms |
| molBench | 485.73ms | 488.37ms | 958μs | 494.76ms | 488.55ms | 585.23ms |
| create_signals | 27.00ms | 27.41ms | 68.98ms | 61.55ms | 5.27ms | 82.84ms |
| comp_0to1 | 12.18ms | 8.12ms | 56.72ms | 24.86ms | 17.29ms | 21.07ms |
| comp_1to1 | 25.09ms | 4.22ms | 58.34ms | 42.17ms | 12.40ms | 37.00ms |
| comp_2to1 | 15.66ms | 2.33ms | 37.91ms | 24.14ms | 17.39ms | 8.66ms |
| comp_4to1 | 3.21ms | 8.64ms | 17.26ms | 8.76ms | 11.22ms | 33.77ms |
| comp_1000to1 | 5μs | 4μs | 45μs | 19μs | 5μs | 15μs |
| comp_1to2 | 22.49ms | 10.97ms | 48.59ms | 36.86ms | 14.34ms | 33.33ms |
| comp_1to4 | 10.93ms | 7.59ms | 46.69ms | 16.94ms | 25.43ms | 22.97ms |
| comp_1to8 | 6.93ms | 4.42ms | 46.17ms | 21.77ms | 7.01ms | 24.86ms |
| comp_1to1000 | 4.49ms | 3.59ms | 42.13ms | 14.04ms | 5.71ms | 15.17ms |
| update_1to1 | 10.16ms | 10.01ms | 6.04ms | 16.34ms | 8.29ms | 23.06ms |
| update_2to1 | 4.51ms | 2.21ms | 3.10ms | 8.01ms | 4.38ms | 11.72ms |
| update_4to1 | 2.55ms | 2.45ms | 1.52ms | 4.07ms | 2.13ms | 5.77ms |
| update_1000to1 | 26μs | 16μs | 15μs | 40μs | 20μs | 67μs |
| update_1to2 | 4.51ms | 4.95ms | 3.04ms | 8.21ms | 4.08ms | 11.12ms |
| update_1to4 | 2.54ms | 2.30ms | 1.52ms | 4.08ms | 2.08ms | 5.65ms |
| update_1to1000 | 44μs | 49μs | 432μs | 261μs | 156μs | 170μs |
| cellx1000 | 10.36ms | 7.93ms | 5.12ms | 14.09ms | 10.12ms | 70.93ms |
| cellx2500 | 39.63ms | 23.05ms | 27.82ms | 40.91ms | 26.72ms | 246.43ms |
| cellx5000 | 96.05ms | 59.62ms | 60.74ms | 125.28ms | 84.33ms | 539.63ms |
| 10x5 - 2 sources - read 20.0% (simple) | 511.36ms | 239.76ms | 251.95ms | 349.88ms | 511.23ms | 2.07s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.51ms | 181.45ms | 198.31ms | 250.57ms | 300.87ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 3.85s | 286.61ms | 342.98ms | 460.12ms | 3.72s | 1.92s |
| 1000x5 - 25 sources (wide dense) | 3.59s | 405.78ms | 514.91ms | 615.21ms | 2.76s | 3.47s |
| 5x500 - 3 sources (deep) | 220.29ms | 194.63ms | 203.14ms | 247.84ms | 244.59ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 483.21ms | 267.01ms | 259.74ms | 382.38ms | 475.50ms | 1.71s |

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
