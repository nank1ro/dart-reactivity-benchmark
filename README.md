# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.69s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 9.72s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 10.85s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.28s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 40.00s |
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
| Test Case | solidart | mobx | state_beacon | signals | alien_signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.25s | 2.32s | 157.05ms (fail) | 213.17ms | 205.32ms | 210.35ms |
| broadPropagation | 5.60s | 4.33s | 6.47ms (fail) | 460.00ms | 348.35ms | 457.39ms |
| deepPropagation | 2.07s | 1.56s | 139.93ms (fail) | 172.38ms | 123.59ms | 171.40ms |
| diamond | 3.53s | 2.42s | 193.10ms (fail) | 289.77ms | 234.75ms | 273.27ms |
| mux | 2.08s | 1.83s | 199.31ms (fail) | 413.43ms | 379.27ms | 390.78ms |
| repeatedObservers | 219.12ms | 234.48ms | 54.09ms (fail) | 44.93ms | 43.65ms | 41.08ms |
| triangle | 1.19s | 780.63ms | 83.24ms (fail) | 102.12ms | 84.92ms | 97.99ms |
| unstable | 340.99ms | 354.76ms | 336.96ms (fail) | 76.35ms | 60.46ms | 69.59ms |
| molBench | 1.74s | 584.95ms | 944μs | 448.30ms | 487.65ms | 483.77ms |
| create_signals | 58.29ms | 72.62ms | 72.44ms | 30.30ms | 20.15ms | 4.63ms |
| comp_0to1 | 49.39ms | 19.39ms | 53.38ms | 15.98ms | 4.99ms | 16.96ms |
| comp_1to1 | 49.69ms | 28.26ms | 53.08ms | 18.01ms | 11.64ms | 17.58ms |
| comp_2to1 | 31.67ms | 9.08ms | 34.05ms | 10.01ms | 14.59ms | 14.45ms |
| comp_4to1 | 14.32ms | 17.92ms | 17.60ms | 7.14ms | 1.67ms | 10.90ms |
| comp_1000to1 | 2.08ms | 22μs | 43μs | 5μs | 5μs | 4μs |
| comp_1to2 | 32.57ms | 33.42ms | 46.28ms | 18.13ms | 9.21ms | 16.85ms |
| comp_1to4 | 29.76ms | 19.78ms | 44.40ms | 14.84ms | 9.26ms | 20.66ms |
| comp_1to8 | 23.27ms | 20.93ms | 44.03ms | 10.05ms | 5.62ms | 7.34ms |
| comp_1to1000 | 19.09ms | 15.54ms | 40.57ms | 6.17ms | 3.52ms | 5.90ms |
| update_1to1 | 42.64ms | 28.28ms | 8.18ms | 9.38ms | 4.38ms | 9.82ms |
| update_2to1 | 21.83ms | 12.95ms | 2.91ms | 5.09ms | 2.21ms | 4.36ms |
| update_4to1 | 10.73ms | 7.28ms | 2.49ms | 2.42ms | 1.16ms | 2.20ms |
| update_1000to1 | 113μs | 65μs | 15μs | 23μs | 11μs | 21μs |
| update_1to2 | 21.35ms | 12.41ms | 4.16ms | 4.76ms | 2.19ms | 4.36ms |
| update_1to4 | 10.86ms | 5.84ms | 1.50ms | 2.33ms | 1.13ms | 2.24ms |
| update_1to1000 | 244μs | 172μs | 405μs | 93μs | 40μs | 495μs |
| cellx1000 | 155.20ms | 68.95ms | 5.34ms | 9.75ms | 7.58ms | 9.66ms |
| cellx2500 | 494.57ms | 250.88ms | 20.59ms | 26.11ms | 20.39ms | 25.79ms |
| cellx5000 | 1.08s | 557.43ms | 61.04ms | 63.33ms | 43.94ms | 70.13ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.69s (partial) | 2.01s | 257.93ms | 500.07ms | 231.65ms | 423.64ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.36s (partial) | 1.51s | 209.42ms | 286.89ms | 180.18ms | 271.21ms |
| 1000x12 - 4 sources - dynamic (large) | 4.09s (partial) | 1.81s | 340.85ms | 3.37s | 283.63ms | 3.37s |
| 1000x5 - 25 sources (wide dense) | 4.88s (partial) | 3.53s | 523.42ms | 3.50s | 402.96ms | 2.55s |
| 5x500 - 3 sources (deep) | 2.02s (partial) | 1.12s | 234.03ms | 228.15ms | 196.40ms | 222.88ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.79s (partial) | 1.70s | 264.70ms | 486.23ms | 264.71ms | 450.13ms |

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
