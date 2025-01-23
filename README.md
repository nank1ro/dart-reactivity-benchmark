# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.72s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 9.74s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.20s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.20s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.79s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.57s |

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
| Test Case | alien_signals | signals | preact_signals | solidart | state_beacon | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 205.76ms | 213.23ms | 212.35ms | 2.19s | 167.53ms (fail) | 2.29s |
| broadPropagation | 349.00ms | 475.13ms | 457.47ms | 5.55s | 7.01ms (fail) | 4.35s |
| deepPropagation | 123.25ms | 171.51ms | 177.82ms | 2.05s | 138.84ms (fail) | 1.54s |
| diamond | 235.13ms | 285.84ms | 278.34ms | 3.47s | 206.89ms (fail) | 2.43s |
| mux | 383.73ms | 416.45ms | 385.92ms | 2.03s | 198.15ms (fail) | 1.79s |
| repeatedObservers | 46.64ms | 45.33ms | 40.94ms | 219.17ms | 57.80ms (fail) | 236.21ms |
| triangle | 83.88ms | 105.29ms | 97.55ms | 1.14s | 80.33ms (fail) | 777.93ms |
| unstable | 60.57ms | 78.73ms | 70.06ms | 344.03ms | 342.48ms (fail) | 346.69ms |
| molBench | 486.58ms | 486.17ms | 484.52ms | 1.74s | 951μs | 586.91ms |
| create_signals | 20.10ms | 30.58ms | 4.61ms | 83.55ms | 70.82ms | 69.40ms |
| comp_0to1 | 4.91ms | 12.96ms | 16.82ms | 32.95ms | 50.21ms | 24.17ms |
| comp_1to1 | 11.33ms | 27.34ms | 17.24ms | 42.40ms | 59.82ms | 31.94ms |
| comp_2to1 | 14.74ms | 11.52ms | 19.74ms | 37.37ms | 34.16ms | 22.71ms |
| comp_4to1 | 2.46ms | 5.11ms | 10.75ms | 13.10ms | 17.82ms | 19.29ms |
| comp_1000to1 | 3μs | 5μs | 4μs | 2.09ms | 44μs | 17μs |
| comp_1to2 | 17.46ms | 17.23ms | 24.79ms | 27.89ms | 48.22ms | 33.67ms |
| comp_1to4 | 11.55ms | 7.41ms | 25.11ms | 27.85ms | 43.85ms | 17.57ms |
| comp_1to8 | 4.48ms | 6.50ms | 7.44ms | 24.30ms | 44.25ms | 19.56ms |
| comp_1to1000 | 3.56ms | 4.51ms | 5.89ms | 18.64ms | 40.83ms | 15.23ms |
| update_1to1 | 4.75ms | 9.39ms | 8.76ms | 43.33ms | 8.39ms | 27.50ms |
| update_2to1 | 3.08ms | 4.71ms | 4.38ms | 21.29ms | 2.89ms | 13.74ms |
| update_4to1 | 1.11ms | 2.40ms | 2.25ms | 10.77ms | 2.74ms | 7.56ms |
| update_1000to1 | 11μs | 23μs | 22μs | 126μs | 15μs | 81μs |
| update_1to2 | 2.19ms | 4.73ms | 4.40ms | 21.44ms | 2.98ms | 14.11ms |
| update_1to4 | 1.34ms | 2.39ms | 2.22ms | 10.99ms | 1.50ms | 6.95ms |
| update_1to1000 | 41μs | 45μs | 728μs | 211μs | 412μs | 163μs |
| cellx1000 | 7.53ms | 9.65ms | 9.64ms | 154.43ms | 5.27ms | 70.26ms |
| cellx2500 | 20.41ms | 33.35ms | 26.69ms | 514.70ms | 19.93ms | 251.50ms |
| cellx5000 | 43.40ms | 65.33ms | 72.63ms | 1.10s | 64.30ms | 550.36ms |
| 10x5 - 2 sources - read 20.0% (simple) | 236.63ms | 512.09ms | 424.44ms | 2.69s (partial) | 280.74ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 182.66ms | 279.83ms | 270.31ms | 2.36s (partial) | 208.38ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 288.79ms | 3.80s | 3.39s | 4.10s (partial) | 338.08ms | 1.79s |
| 1000x5 - 25 sources (wide dense) | 403.19ms | 3.37s | 2.51s | 4.89s (partial) | 523.07ms | 3.49s |
| 5x500 - 3 sources (deep) | 196.84ms | 229.94ms | 226.42ms | 2.00s (partial) | 234.32ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 265.10ms | 481.21ms | 450.17ms | 2.82s (partial) | 264.97ms | 1.68s |

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
