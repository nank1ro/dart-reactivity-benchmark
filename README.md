# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.69s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 9.70s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.19s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.59s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.79s |
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
| avoidablePropagation | 2.22s | 2.34s | 150.73ms (fail) | 211.96ms | 195.09ms | 211.47ms |
| broadPropagation | 5.54s | 4.43s | 7.02ms (fail) | 472.10ms | 346.15ms | 459.56ms |
| deepPropagation | 2.04s | 1.57s | 139.49ms (fail) | 178.98ms | 118.76ms | 173.60ms |
| diamond | 3.46s | 2.45s | 196.03ms (fail) | 284.07ms | 235.90ms | 278.69ms |
| mux | 2.06s | 1.83s | 191.41ms (fail) | 410.08ms | 377.19ms | 385.32ms |
| repeatedObservers | 217.29ms | 234.89ms | 55.05ms (fail) | 44.71ms | 44.00ms | 41.18ms |
| triangle | 1.15s | 794.92ms | 77.73ms (fail) | 103.06ms | 85.01ms | 97.98ms |
| unstable | 348.76ms | 358.67ms | 336.82ms (fail) | 77.94ms | 59.50ms | 70.01ms |
| molBench | 1.75s | 593.52ms | 1.37ms | 487.73ms | 480.30ms | 483.27ms |
| create_signals | 72.66ms | 73.59ms | 72.97ms | 30.62ms | 20.76ms | 4.68ms |
| comp_0to1 | 28.98ms | 19.80ms | 52.95ms | 13.98ms | 5.06ms | 16.98ms |
| comp_1to1 | 41.18ms | 34.62ms | 52.27ms | 29.37ms | 11.46ms | 17.45ms |
| comp_2to1 | 23.99ms | 23.52ms | 33.98ms | 9.59ms | 14.87ms | 10.40ms |
| comp_4to1 | 18.34ms | 14.74ms | 17.17ms | 2.29ms | 1.80ms | 13.31ms |
| comp_1000to1 | 2.08ms | 17μs | 44μs | 11μs | 3μs | 4μs |
| comp_1to2 | 30.03ms | 45.83ms | 46.22ms | 16.65ms | 10.12ms | 12.17ms |
| comp_1to4 | 27.43ms | 29.32ms | 43.72ms | 15.19ms | 7.13ms | 24.84ms |
| comp_1to8 | 23.28ms | 19.66ms | 43.84ms | 6.65ms | 3.77ms | 6.99ms |
| comp_1to1000 | 18.57ms | 15.59ms | 40.00ms | 4.58ms | 3.41ms | 4.79ms |
| update_1to1 | 42.69ms | 26.68ms | 7.99ms | 9.42ms | 4.39ms | 8.86ms |
| update_2to1 | 21.58ms | 12.17ms | 2.91ms | 4.67ms | 2.45ms | 4.47ms |
| update_4to1 | 10.73ms | 7.04ms | 2.79ms | 2.35ms | 1.17ms | 2.25ms |
| update_1000to1 | 115μs | 67μs | 15μs | 34μs | 11μs | 21μs |
| update_1to2 | 21.67ms | 14.23ms | 4.02ms | 4.73ms | 2.20ms | 4.39ms |
| update_1to4 | 10.90ms | 6.48ms | 1.49ms | 2.34ms | 1.24ms | 2.20ms |
| update_1to1000 | 223μs | 163μs | 397μs | 44μs | 50μs | 153μs |
| cellx1000 | 156.78ms | 75.99ms | 5.64ms | 9.71ms | 9.42ms | 9.72ms |
| cellx2500 | 470.59ms | 239.63ms | 20.68ms | 32.27ms | 20.24ms | 26.66ms |
| cellx5000 | 1.07s | 561.75ms | 57.19ms | 64.72ms | 48.38ms | 78.12ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.66s (partial) | 2.02s | 243.24ms | 503.40ms | 234.72ms | 428.76ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.37s (partial) | 1.54s | 208.30ms | 282.23ms | 180.74ms | 277.60ms |
| 1000x12 - 4 sources - dynamic (large) | 4.12s (partial) | 1.86s | 350.92ms | 3.74s | 286.43ms | 3.35s |
| 1000x5 - 25 sources (wide dense) | 4.97s (partial) | 3.52s | 523.82ms | 3.42s | 415.33ms | 2.52s |
| 5x500 - 3 sources (deep) | 2.01s (partial) | 1.13s | 242.44ms | 227.87ms | 196.23ms | 229.63ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.79s (partial) | 1.69s | 270.01ms | 476.23ms | 266.79ms | 450.18ms |

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
