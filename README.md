# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.71s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 9.65s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.55s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.69s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.81s |
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
| avoidablePropagation | 2.20s | 2.34s | 163.74ms (fail) | 206.60ms | 183.78ms | 210.47ms |
| broadPropagation | 5.54s | 4.39s | 7.07ms (fail) | 475.78ms | 345.98ms | 456.17ms |
| deepPropagation | 2.01s | 1.55s | 139.70ms (fail) | 171.35ms | 123.31ms | 174.46ms |
| diamond | 3.50s | 2.45s | 191.92ms (fail) | 289.40ms | 239.04ms | 274.01ms |
| mux | 2.04s | 1.84s | 193.97ms (fail) | 415.07ms | 385.68ms | 383.10ms |
| repeatedObservers | 214.34ms | 238.57ms | 53.34ms (fail) | 45.22ms | 43.77ms | 40.96ms |
| triangle | 1.15s | 787.11ms | 81.17ms (fail) | 101.88ms | 85.00ms | 98.32ms |
| unstable | 344.65ms | 352.45ms | 343.36ms (fail) | 77.96ms | 59.43ms | 69.25ms |
| molBench | 1.74s | 586.50ms | 927μs | 486.07ms | 484.44ms | 483.55ms |
| create_signals | 70.94ms | 56.29ms | 76.38ms | 33.21ms | 20.99ms | 4.54ms |
| comp_0to1 | 35.28ms | 25.98ms | 59.35ms | 14.99ms | 4.96ms | 17.05ms |
| comp_1to1 | 43.29ms | 52.67ms | 57.55ms | 18.46ms | 8.90ms | 16.90ms |
| comp_2to1 | 28.85ms | 23.39ms | 36.97ms | 9.64ms | 4.21ms | 12.32ms |
| comp_4to1 | 13.53ms | 24.83ms | 18.93ms | 2.13ms | 8.70ms | 12.99ms |
| comp_1000to1 | 2.33ms | 15μs | 51μs | 5μs | 3μs | 4μs |
| comp_1to2 | 37.15ms | 39.22ms | 53.06ms | 16.26ms | 14.39ms | 14.40ms |
| comp_1to4 | 25.33ms | 18.16ms | 47.47ms | 20.95ms | 8.58ms | 22.26ms |
| comp_1to8 | 23.79ms | 21.34ms | 47.85ms | 11.57ms | 3.68ms | 8.55ms |
| comp_1to1000 | 19.08ms | 15.49ms | 44.13ms | 5.10ms | 3.59ms | 4.64ms |
| update_1to1 | 43.32ms | 26.01ms | 7.82ms | 9.38ms | 4.37ms | 8.78ms |
| update_2to1 | 21.52ms | 14.01ms | 2.90ms | 4.90ms | 2.41ms | 4.37ms |
| update_4to1 | 10.70ms | 7.12ms | 1.54ms | 2.40ms | 1.15ms | 2.21ms |
| update_1000to1 | 114μs | 73μs | 15μs | 23μs | 16μs | 21μs |
| update_1to2 | 21.60ms | 13.64ms | 3.01ms | 4.79ms | 2.20ms | 4.36ms |
| update_1to4 | 10.86ms | 5.89ms | 1.46ms | 2.38ms | 1.13ms | 2.21ms |
| update_1to1000 | 234μs | 166μs | 433μs | 61μs | 29μs | 146μs |
| cellx1000 | 177.69ms | 86.20ms | 7.81ms | 10.71ms | 7.49ms | 9.56ms |
| cellx2500 | 525.14ms | 290.09ms | 31.39ms | 37.27ms | 21.20ms | 27.19ms |
| cellx5000 | 1.18s | 600.44ms | 93.05ms | 98.61ms | 51.82ms | 67.29ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.63s (partial) | 2.02s | 241.59ms | 522.61ms | 234.51ms | 417.76ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.39s (partial) | 1.53s | 206.97ms | 282.55ms | 182.18ms | 271.81ms |
| 1000x12 - 4 sources - dynamic (large) | 4.11s (partial) | 1.82s | 358.26ms | 3.87s | 291.44ms | 3.35s |
| 1000x5 - 25 sources (wide dense) | 4.92s (partial) | 3.52s | 521.33ms | 3.61s | 409.64ms | 2.52s |
| 5x500 - 3 sources (deep) | 1.99s (partial) | 1.19s | 233.56ms | 231.38ms | 202.35ms | 219.92ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.75s (partial) | 1.75s | 267.34ms | 472.08ms | 265.80ms | 444.53ms |

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
