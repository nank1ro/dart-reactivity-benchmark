# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.70s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 9.96s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.36s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.63s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.94s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.45s |

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
| avoidablePropagation | 185.66ms | 2.28s | 2.21s | 151.50ms (fail) | 206.81ms | 213.45ms |
| broadPropagation | 355.73ms | 4.29s | 5.51s | 6.19ms (fail) | 454.27ms | 463.03ms |
| deepPropagation | 125.64ms | 1.53s | 2.04s | 143.19ms (fail) | 176.36ms | 179.40ms |
| diamond | 233.51ms | 2.39s | 3.43s | 188.14ms (fail) | 278.74ms | 296.61ms |
| mux | 387.89ms | 1.82s | 2.04s | 191.29ms (fail) | 383.16ms | 408.84ms |
| repeatedObservers | 45.48ms | 228.32ms | 207.43ms | 53.27ms (fail) | 38.69ms | 46.99ms |
| triangle | 85.10ms | 773.73ms | 1.15s | 85.31ms (fail) | 98.95ms | 101.01ms |
| unstable | 59.55ms | 348.82ms | 346.15ms | 339.13ms (fail) | 70.51ms | 75.08ms |
| molBench | 488.76ms | 586.30ms | 1.71s | 1.16ms | 491.27ms | 488.55ms |
| create_signals | 24.04ms | 90.49ms | 48.97ms | 59.72ms | 4.63ms | 25.36ms |
| comp_0to1 | 8.27ms | 27.84ms | 35.31ms | 53.81ms | 17.98ms | 12.32ms |
| comp_1to1 | 4.42ms | 32.45ms | 34.28ms | 54.92ms | 11.57ms | 18.84ms |
| comp_2to1 | 2.34ms | 36.41ms | 33.31ms | 36.35ms | 17.16ms | 13.34ms |
| comp_4to1 | 8.67ms | 31.63ms | 17.45ms | 16.66ms | 8.74ms | 1.96ms |
| comp_1000to1 | 5μs | 29μs | 2.23ms | 43μs | 7μs | 6μs |
| comp_1to2 | 13.98ms | 35.04ms | 26.76ms | 45.63ms | 16.82ms | 20.60ms |
| comp_1to4 | 9.54ms | 22.82ms | 28.08ms | 44.55ms | 28.04ms | 12.25ms |
| comp_1to8 | 5.05ms | 24.16ms | 25.57ms | 44.18ms | 7.37ms | 7.25ms |
| comp_1to1000 | 3.73ms | 15.37ms | 18.03ms | 39.32ms | 6.49ms | 4.56ms |
| update_1to1 | 8.03ms | 26.04ms | 42.36ms | 5.73ms | 8.20ms | 9.28ms |
| update_2to1 | 5.23ms | 11.32ms | 21.81ms | 2.91ms | 4.05ms | 4.59ms |
| update_4to1 | 2.37ms | 6.71ms | 10.54ms | 1.48ms | 2.08ms | 2.33ms |
| update_1000to1 | 24μs | 55μs | 114μs | 15μs | 20μs | 22μs |
| update_1to2 | 5.03ms | 12.53ms | 21.25ms | 2.94ms | 4.12ms | 4.91ms |
| update_1to4 | 2.52ms | 5.93ms | 10.75ms | 1.48ms | 2.15ms | 2.33ms |
| update_1to1000 | 47μs | 170μs | 218μs | 388μs | 843μs | 44μs |
| cellx1000 | 7.41ms | 80.93ms | 183.60ms | 5.71ms | 9.64ms | 9.57ms |
| cellx2500 | 24.09ms | 283.21ms | 508.15ms | 29.44ms | 26.47ms | 31.70ms |
| cellx5000 | 51.35ms | 633.22ms | 1.23s | 90.84ms | 80.66ms | 66.84ms |
| 10x5 - 2 sources - read 20.0% (simple) | 228.83ms | 2.02s | 2.63s (partial) | 244.12ms | 450.49ms | 542.81ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 186.17ms | 1.56s | 2.40s (partial) | 205.24ms | 271.00ms | 279.63ms |
| 1000x12 - 4 sources - dynamic (large) | 280.53ms | 1.96s | 4.19s (partial) | 344.32ms | 3.51s | 3.89s |
| 1000x5 - 25 sources (wide dense) | 399.79ms | 3.54s | 4.92s (partial) | 498.11ms | 2.58s | 3.42s |
| 5x500 - 3 sources (deep) | 191.03ms | 1.18s | 2.08s (partial) | 206.29ms | 234.41ms | 229.26ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 260.51ms | 1.75s | 2.77s (partial) | 257.55ms | 454.81ms | 480.39ms |

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
