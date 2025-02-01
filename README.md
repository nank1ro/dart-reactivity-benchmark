# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.72s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 9.74s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 10.97s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.32s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.80s |
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
| avoidablePropagation | 2.21s | 2.33s | 164.13ms (fail) | 207.40ms | 206.58ms | 208.32ms |
| broadPropagation | 5.49s | 4.33s | 5.97ms (fail) | 461.49ms | 352.46ms | 454.57ms |
| deepPropagation | 2.01s | 1.54s | 139.47ms (fail) | 169.40ms | 122.52ms | 170.28ms |
| diamond | 3.45s | 2.43s | 182.29ms (fail) | 285.49ms | 238.07ms | 273.69ms |
| mux | 2.07s | 1.85s | 192.28ms (fail) | 413.77ms | 382.43ms | 383.17ms |
| repeatedObservers | 213.76ms | 235.82ms | 53.75ms (fail) | 44.63ms | 43.86ms | 41.31ms |
| triangle | 1.13s | 769.20ms | 78.90ms (fail) | 101.58ms | 84.61ms | 98.36ms |
| unstable | 340.00ms | 351.12ms | 335.74ms (fail) | 77.13ms | 59.98ms | 67.52ms |
| molBench | 1.75s | 589.10ms | 1.27ms | 486.56ms | 487.26ms | 483.65ms |
| create_signals | 82.27ms | 60.00ms | 72.34ms | 36.71ms | 20.47ms | 4.71ms |
| comp_0to1 | 31.94ms | 21.70ms | 54.07ms | 15.83ms | 5.08ms | 16.99ms |
| comp_1to1 | 43.19ms | 32.08ms | 52.64ms | 17.36ms | 11.78ms | 14.62ms |
| comp_2to1 | 32.87ms | 23.83ms | 34.35ms | 18.45ms | 5.31ms | 16.48ms |
| comp_4to1 | 18.53ms | 25.33ms | 17.43ms | 4.91ms | 10.79ms | 13.78ms |
| comp_1000to1 | 2.88ms | 22μs | 101μs | 9μs | 3μs | 4μs |
| comp_1to2 | 27.22ms | 35.66ms | 47.56ms | 14.81ms | 11.60ms | 17.42ms |
| comp_1to4 | 28.41ms | 21.00ms | 51.81ms | 14.56ms | 15.92ms | 35.87ms |
| comp_1to8 | 24.03ms | 23.28ms | 43.40ms | 13.16ms | 4.28ms | 7.85ms |
| comp_1to1000 | 19.52ms | 15.41ms | 40.19ms | 11.39ms | 3.62ms | 5.11ms |
| update_1to1 | 43.02ms | 27.96ms | 9.71ms | 9.40ms | 4.39ms | 8.80ms |
| update_2to1 | 21.14ms | 13.77ms | 2.89ms | 4.67ms | 2.19ms | 4.36ms |
| update_4to1 | 10.78ms | 7.40ms | 1.62ms | 2.35ms | 1.45ms | 2.23ms |
| update_1000to1 | 128μs | 69μs | 15μs | 23μs | 11μs | 21μs |
| update_1to2 | 21.43ms | 14.02ms | 3.54ms | 4.77ms | 2.49ms | 4.36ms |
| update_1to4 | 11.03ms | 6.84ms | 1.47ms | 2.38ms | 1.60ms | 2.21ms |
| update_1to1000 | 217μs | 178μs | 407μs | 45μs | 35μs | 161μs |
| cellx1000 | 173.64ms | 74.68ms | 5.42ms | 9.57ms | 9.17ms | 9.62ms |
| cellx2500 | 518.01ms | 263.02ms | 21.39ms | 33.18ms | 20.91ms | 27.16ms |
| cellx5000 | 1.16s | 565.81ms | 63.65ms | 75.81ms | 51.81ms | 72.61ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.64s (partial) | 2.00s | 255.65ms | 500.34ms | 234.27ms | 425.58ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.39s (partial) | 1.53s | 206.41ms | 276.62ms | 178.13ms | 268.54ms |
| 1000x12 - 4 sources - dynamic (large) | 4.16s (partial) | 1.86s | 343.30ms | 3.73s | 281.22ms | 3.40s |
| 1000x5 - 25 sources (wide dense) | 4.88s (partial) | 3.47s | 519.91ms | 3.22s | 395.16ms | 2.52s |
| 5x500 - 3 sources (deep) | 2.03s (partial) | 1.12s | 229.75ms | 229.55ms | 203.50ms | 228.69ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.76s (partial) | 1.68s | 263.44ms | 474.93ms | 268.59ms | 445.09ms |

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
