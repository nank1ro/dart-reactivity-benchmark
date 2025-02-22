# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.70s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 9.95s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.21s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.61s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.11s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.40s |

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
| Test Case | alien_signals | mobx | solidart | state_beacon | preact_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 184.49ms | 2.36s | 2.18s | 151.16ms (fail) | 197.32ms | 207.68ms |
| broadPropagation | 350.13ms | 4.25s | 5.37s | 6.42ms (fail) | 455.50ms | 453.32ms |
| deepPropagation | 119.81ms | 1.52s | 1.99s | 136.11ms (fail) | 175.41ms | 174.63ms |
| diamond | 233.50ms | 2.44s | 3.48s | 193.57ms (fail) | 277.29ms | 297.62ms |
| mux | 382.63ms | 1.85s | 2.02s | 190.63ms (fail) | 383.18ms | 409.27ms |
| repeatedObservers | 44.89ms | 234.37ms | 207.26ms | 52.11ms (fail) | 37.84ms | 46.74ms |
| triangle | 85.03ms | 784.57ms | 1.13s | 76.99ms (fail) | 100.72ms | 103.60ms |
| unstable | 59.94ms | 356.63ms | 342.81ms | 338.61ms (fail) | 70.29ms | 76.49ms |
| molBench | 491.81ms | 582.10ms | 1.71s | 979μs | 491.97ms | 482.74ms |
| create_signals | 24.34ms | 83.34ms | 48.85ms | 58.31ms | 5.98ms | 26.32ms |
| comp_0to1 | 8.16ms | 22.46ms | 34.72ms | 51.26ms | 17.86ms | 12.33ms |
| comp_1to1 | 4.17ms | 31.47ms | 30.10ms | 53.62ms | 11.73ms | 36.43ms |
| comp_2to1 | 2.28ms | 9.01ms | 30.17ms | 39.15ms | 16.82ms | 9.02ms |
| comp_4to1 | 8.67ms | 17.30ms | 12.01ms | 16.09ms | 11.79ms | 3.68ms |
| comp_1000to1 | 5μs | 16μs | 2.33ms | 41μs | 7μs | 6μs |
| comp_1to2 | 19.85ms | 36.62ms | 25.44ms | 44.50ms | 16.46ms | 16.17ms |
| comp_1to4 | 11.22ms | 21.00ms | 27.05ms | 43.09ms | 22.35ms | 14.50ms |
| comp_1to8 | 5.48ms | 22.91ms | 25.61ms | 43.45ms | 6.87ms | 11.42ms |
| comp_1to1000 | 3.39ms | 16.45ms | 17.33ms | 37.70ms | 6.62ms | 8.75ms |
| update_1to1 | 6.49ms | 23.80ms | 42.20ms | 5.72ms | 8.30ms | 9.42ms |
| update_2to1 | 3.91ms | 11.17ms | 20.41ms | 2.90ms | 4.06ms | 4.59ms |
| update_4to1 | 2.26ms | 5.94ms | 10.35ms | 1.48ms | 2.06ms | 2.30ms |
| update_1000to1 | 24μs | 71μs | 147μs | 15μs | 20μs | 22μs |
| update_1to2 | 4.13ms | 10.79ms | 21.84ms | 3.63ms | 4.05ms | 4.92ms |
| update_1to4 | 1.21ms | 6.69ms | 10.26ms | 1.49ms | 2.06ms | 2.28ms |
| update_1to1000 | 61μs | 191μs | 215μs | 368μs | 1.05ms | 46μs |
| cellx1000 | 8.98ms | 92.45ms | 161.03ms | 5.25ms | 9.93ms | 10.60ms |
| cellx2500 | 20.90ms | 295.76ms | 483.24ms | 27.44ms | 26.67ms | 34.33ms |
| cellx5000 | 46.78ms | 583.44ms | 1.11s | 69.58ms | 67.75ms | 72.03ms |
| 10x5 - 2 sources - read 20.0% (simple) | 235.67ms | 2.01s | 2.60s (partial) | 240.44ms | 451.49ms | 512.29ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 178.18ms | 1.58s | 2.33s (partial) | 200.89ms | 274.47ms | 280.17ms |
| 1000x12 - 4 sources - dynamic (large) | 279.51ms | 1.87s | 4.02s (partial) | 335.86ms | 3.51s | 3.75s |
| 1000x5 - 25 sources (wide dense) | 412.97ms | 3.57s | 4.85s (partial) | 506.68ms | 2.60s | 3.42s |
| 5x500 - 3 sources (deep) | 192.77ms | 1.19s | 1.98s (partial) | 204.73ms | 236.00ms | 233.28ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 265.56ms | 1.71s | 2.77s (partial) | 260.55ms | 446.09ms | 485.61ms |

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
