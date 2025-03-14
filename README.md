# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.38s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.08s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.37s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.01s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.55s |

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
| avoidablePropagation | 271.66ms | 206.55ms | 2.35s | 189.36ms | 209.10ms | 152.02ms (fail) |
| broadPropagation | 501.48ms | 456.91ms | 4.36s | 355.52ms | 462.06ms | 6.31ms (fail) |
| deepPropagation | 169.37ms | 179.03ms | 1.56s | 124.01ms | 179.43ms | 142.35ms (fail) |
| diamond | 352.47ms | 280.71ms | 2.47s | 238.94ms | 291.01ms | 199.55ms (fail) |
| mux | 441.42ms | 386.60ms | 1.83s | 371.41ms | 413.19ms | 192.26ms (fail) |
| repeatedObservers | 78.15ms | 37.98ms | 238.00ms | 45.90ms | 45.93ms | 53.46ms (fail) |
| triangle | 117.26ms | 99.80ms | 782.86ms | 85.43ms | 102.75ms | 79.55ms (fail) |
| unstable | 93.94ms | 70.54ms | 355.21ms | 60.43ms | 72.12ms | 335.09ms (fail) |
| molBench | 492.81ms | 491.42ms | 580.78ms | 492.40ms | 489.66ms | 1.12ms |
| create_signals | 91.94ms | 4.67ms | 72.97ms | 27.30ms | 26.09ms | 68.04ms |
| comp_0to1 | 43.63ms | 17.76ms | 24.56ms | 7.08ms | 12.76ms | 52.46ms |
| comp_1to1 | 44.80ms | 11.28ms | 17.24ms | 4.21ms | 23.50ms | 59.21ms |
| comp_2to1 | 25.63ms | 20.33ms | 20.32ms | 2.32ms | 11.63ms | 43.37ms |
| comp_4to1 | 13.73ms | 15.08ms | 28.05ms | 8.66ms | 6.22ms | 18.84ms |
| comp_1000to1 | 14μs | 4μs | 15μs | 6μs | 5μs | 42μs |
| comp_1to2 | 27.44ms | 19.43ms | 33.11ms | 16.07ms | 22.61ms | 44.62ms |
| comp_1to4 | 20.98ms | 32.58ms | 25.48ms | 9.73ms | 18.40ms | 43.50ms |
| comp_1to8 | 23.98ms | 6.99ms | 22.03ms | 4.96ms | 7.33ms | 42.64ms |
| comp_1to1000 | 14.43ms | 6.52ms | 15.16ms | 3.46ms | 4.63ms | 37.77ms |
| update_1to1 | 16.24ms | 8.21ms | 23.68ms | 11.34ms | 9.24ms | 5.73ms |
| update_2to1 | 7.97ms | 4.05ms | 12.17ms | 5.02ms | 4.58ms | 2.87ms |
| update_4to1 | 4.08ms | 2.08ms | 5.99ms | 2.77ms | 2.32ms | 1.44ms |
| update_1000to1 | 41μs | 20μs | 60μs | 24μs | 23μs | 15μs |
| update_1to2 | 8.13ms | 4.05ms | 11.65ms | 5.63ms | 4.86ms | 2.94ms |
| update_1to4 | 4.06ms | 2.07ms | 6.15ms | 2.50ms | 2.34ms | 1.44ms |
| update_1to1000 | 150μs | 789μs | 158μs | 46μs | 45μs | 369μs |
| cellx1000 | 12.54ms | 11.69ms | 81.01ms | 7.50ms | 10.09ms | 6.18ms |
| cellx2500 | 46.54ms | 37.45ms | 293.68ms | 21.41ms | 36.63ms | 32.84ms |
| cellx5000 | 135.17ms | 101.17ms | 616.88ms | 57.21ms | 81.80ms | 80.07ms |
| 10x5 - 2 sources - read 20.0% (simple) | 370.17ms | 446.32ms | 2.05s | 233.45ms | 504.69ms | 267.56ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 242.74ms | 276.09ms | 1.53s | 176.96ms | 278.39ms | 226.82ms |
| 1000x12 - 4 sources - dynamic (large) | 472.78ms | 3.52s | 1.98s | 283.07ms | 3.75s | 358.25ms |
| 1000x5 - 25 sources (wide dense) | 595.11ms | 2.62s | 3.72s | 408.98ms | 3.57s | 513.55ms |
| 5x500 - 3 sources (deep) | 253.00ms | 235.40ms | 1.18s | 190.87ms | 225.65ms | 211.84ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 387.99ms | 458.70ms | 1.72s | 267.48ms | 486.78ms | 265.38ms |

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
