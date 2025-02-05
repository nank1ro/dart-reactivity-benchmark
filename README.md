# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.67s |
| 🥈 | preact_signals | 0.30 | 100.0% | 35/35 | 9.67s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.18s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.41s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.51s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.60s |

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
| avoidablePropagation | 2.21s | 2.36s | 167.00ms (fail) | 213.19ms | 185.96ms | 210.36ms |
| broadPropagation | 5.50s | 4.32s | 7.18ms (fail) | 460.52ms | 349.17ms | 456.42ms |
| deepPropagation | 2.01s | 1.55s | 143.30ms (fail) | 175.50ms | 125.58ms | 175.50ms |
| diamond | 3.48s | 2.46s | 221.21ms (fail) | 292.84ms | 235.10ms | 273.83ms |
| mux | 2.07s | 1.83s | 194.90ms (fail) | 410.11ms | 383.16ms | 385.36ms |
| repeatedObservers | 215.38ms | 235.94ms | 55.63ms (fail) | 45.25ms | 46.41ms | 40.88ms |
| triangle | 1.12s | 780.75ms | 80.80ms (fail) | 101.50ms | 85.14ms | 98.51ms |
| unstable | 342.56ms | 354.42ms | 339.32ms (fail) | 80.00ms | 60.65ms | 69.16ms |
| molBench | 1.74s | 584.56ms | 886μs | 486.90ms | 486.24ms | 483.06ms |
| create_signals | 76.74ms | 72.39ms | 72.91ms | 29.14ms | 20.35ms | 4.69ms |
| comp_0to1 | 37.87ms | 20.09ms | 53.30ms | 14.84ms | 4.96ms | 17.22ms |
| comp_1to1 | 48.08ms | 37.45ms | 52.50ms | 20.56ms | 8.81ms | 15.37ms |
| comp_2to1 | 29.46ms | 9.59ms | 33.23ms | 15.84ms | 4.26ms | 11.16ms |
| comp_4to1 | 13.65ms | 19.04ms | 17.39ms | 2.25ms | 6.93ms | 13.43ms |
| comp_1000to1 | 2.15ms | 15μs | 44μs | 5μs | 3μs | 4μs |
| comp_1to2 | 33.39ms | 35.33ms | 45.38ms | 16.06ms | 13.95ms | 11.98ms |
| comp_1to4 | 28.82ms | 19.68ms | 42.93ms | 10.43ms | 8.47ms | 22.69ms |
| comp_1to8 | 22.92ms | 22.31ms | 43.22ms | 6.55ms | 4.07ms | 6.80ms |
| comp_1to1000 | 18.69ms | 15.82ms | 40.12ms | 4.69ms | 3.53ms | 3.90ms |
| update_1to1 | 43.19ms | 27.52ms | 5.92ms | 9.41ms | 4.72ms | 8.78ms |
| update_2to1 | 21.70ms | 12.37ms | 2.91ms | 4.67ms | 2.19ms | 4.36ms |
| update_4to1 | 10.72ms | 6.84ms | 2.08ms | 2.38ms | 1.12ms | 2.19ms |
| update_1000to1 | 115μs | 62μs | 15μs | 23μs | 11μs | 21μs |
| update_1to2 | 21.79ms | 13.98ms | 4.42ms | 4.72ms | 2.19ms | 4.35ms |
| update_1to4 | 10.92ms | 6.97ms | 1.50ms | 2.37ms | 1.13ms | 2.19ms |
| update_1to1000 | 229μs | 162μs | 395μs | 45μs | 39μs | 40μs |
| cellx1000 | 156.62ms | 77.06ms | 5.14ms | 9.69ms | 7.43ms | 9.57ms |
| cellx2500 | 491.46ms | 265.04ms | 19.81ms | 31.51ms | 19.64ms | 26.05ms |
| cellx5000 | 1.09s | 596.10ms | 61.52ms | 63.43ms | 41.79ms | 68.15ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.63s (partial) | 2.01s | 273.44ms | 499.65ms | 230.24ms | 423.63ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.33s (partial) | 1.50s | 223.12ms | 277.95ms | 174.17ms | 273.95ms |
| 1000x12 - 4 sources - dynamic (large) | 4.07s (partial) | 1.82s | 346.76ms | 3.67s | 281.44ms | 3.36s |
| 1000x5 - 25 sources (wide dense) | 4.88s (partial) | 3.51s | 533.34ms | 3.51s | 405.51ms | 2.51s |
| 5x500 - 3 sources (deep) | 2.03s (partial) | 1.13s | 237.00ms | 229.79ms | 201.79ms | 226.06ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.72s (partial) | 1.70s | 272.49ms | 478.28ms | 263.08ms | 452.52ms |

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
