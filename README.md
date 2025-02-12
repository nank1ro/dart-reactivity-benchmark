# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.72s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.05s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 9.83s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.37s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.75s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.50s |

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
| Test Case | solidart | mobx | state_beacon | signals | alien_signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.22s | 2.31s | 157.31ms (fail) | 210.96ms | 187.97ms | 218.76ms |
| broadPropagation | 5.49s | 4.36s | 6.51ms (fail) | 457.05ms | 346.76ms | 454.89ms |
| deepPropagation | 2.02s | 1.55s | 143.60ms (fail) | 175.80ms | 125.66ms | 178.10ms |
| diamond | 3.51s | 2.41s | 188.75ms (fail) | 291.84ms | 235.15ms | 276.10ms |
| mux | 2.06s | 1.83s | 191.28ms (fail) | 411.17ms | 382.17ms | 387.52ms |
| repeatedObservers | 210.13ms | 235.32ms | 53.35ms (fail) | 45.12ms | 43.78ms | 41.16ms |
| triangle | 1.14s | 773.53ms | 83.23ms (fail) | 102.01ms | 89.35ms | 99.27ms |
| unstable | 336.99ms | 351.14ms | 337.41ms (fail) | 77.80ms | 61.09ms | 70.63ms |
| molBench | 1.75s | 586.07ms | 863μs | 487.85ms | 484.09ms | 485.60ms |
| create_signals | 75.93ms | 85.76ms | 70.90ms | 33.13ms | 20.35ms | 5.02ms |
| comp_0to1 | 29.53ms | 21.63ms | 49.71ms | 16.23ms | 5.06ms | 18.65ms |
| comp_1to1 | 46.71ms | 30.72ms | 53.68ms | 32.55ms | 11.12ms | 15.83ms |
| comp_2to1 | 21.36ms | 17.53ms | 33.99ms | 12.74ms | 15.04ms | 21.86ms |
| comp_4to1 | 20.18ms | 18.49ms | 17.59ms | 3.07ms | 2.50ms | 11.17ms |
| comp_1000to1 | 2.87ms | 32μs | 44μs | 5μs | 3μs | 8μs |
| comp_1to2 | 26.44ms | 30.74ms | 46.63ms | 19.18ms | 17.58ms | 29.32ms |
| comp_1to4 | 27.40ms | 32.50ms | 43.88ms | 15.81ms | 9.68ms | 30.45ms |
| comp_1to8 | 24.11ms | 23.47ms | 44.14ms | 7.52ms | 4.05ms | 6.51ms |
| comp_1to1000 | 19.34ms | 15.45ms | 41.10ms | 4.79ms | 3.52ms | 6.10ms |
| update_1to1 | 43.21ms | 27.96ms | 6.44ms | 9.41ms | 4.36ms | 8.79ms |
| update_2to1 | 21.96ms | 13.91ms | 2.91ms | 4.70ms | 2.22ms | 4.37ms |
| update_4to1 | 10.85ms | 7.08ms | 2.52ms | 2.36ms | 1.13ms | 2.22ms |
| update_1000to1 | 115μs | 67μs | 14μs | 23μs | 18μs | 21μs |
| update_1to2 | 21.92ms | 13.77ms | 4.00ms | 4.72ms | 2.25ms | 4.36ms |
| update_1to4 | 10.94ms | 6.92ms | 1.51ms | 2.33ms | 1.17ms | 2.20ms |
| update_1to1000 | 237μs | 163μs | 405μs | 44μs | 50μs | 853μs |
| cellx1000 | 158.39ms | 72.82ms | 6.47ms | 9.61ms | 7.57ms | 9.75ms |
| cellx2500 | 509.17ms | 254.09ms | 21.84ms | 33.88ms | 20.83ms | 28.39ms |
| cellx5000 | 1.15s | 591.86ms | 65.77ms | 77.69ms | 51.75ms | 81.46ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.61s (partial) | 2.02s | 244.96ms | 508.93ms | 237.55ms | 430.02ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.35s (partial) | 1.53s | 206.04ms | 277.05ms | 182.70ms | 278.67ms |
| 1000x12 - 4 sources - dynamic (large) | 4.13s (partial) | 1.83s | 342.63ms | 3.66s | 289.41ms | 3.42s |
| 1000x5 - 25 sources (wide dense) | 4.94s (partial) | 3.51s | 524.02ms | 3.35s | 410.79ms | 2.52s |
| 5x500 - 3 sources (deep) | 2.00s (partial) | 1.14s | 233.45ms | 231.04ms | 197.00ms | 228.60ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.76s (partial) | 1.69s | 276.46ms | 472.24ms | 267.73ms | 452.09ms |

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
