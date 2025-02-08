# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.71s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 9.92s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.25s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.50s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 40.03s |
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
| Test Case | solidart | mobx | state_beacon | signals | alien_signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.25s | 2.31s | 167.69ms (fail) | 211.22ms | 185.44ms | 211.71ms |
| broadPropagation | 5.55s | 4.40s | 7.08ms (fail) | 459.41ms | 348.66ms | 455.65ms |
| deepPropagation | 2.06s | 1.56s | 138.11ms (fail) | 172.56ms | 125.80ms | 174.57ms |
| diamond | 3.52s | 2.42s | 193.81ms (fail) | 286.25ms | 231.21ms | 277.58ms |
| mux | 2.07s | 1.84s | 198.43ms (fail) | 414.24ms | 380.55ms | 389.73ms |
| repeatedObservers | 214.34ms | 238.40ms | 53.43ms (fail) | 45.49ms | 44.37ms | 41.44ms |
| triangle | 1.15s | 787.40ms | 82.97ms (fail) | 102.41ms | 86.69ms | 100.54ms |
| unstable | 351.95ms | 351.82ms | 337.18ms (fail) | 77.94ms | 60.48ms | 69.72ms |
| molBench | 1.76s | 583.98ms | 936μs | 486.98ms | 481.81ms | 483.48ms |
| create_signals | 82.45ms | 66.84ms | 62.66ms | 30.73ms | 20.01ms | 4.62ms |
| comp_0to1 | 52.92ms | 23.07ms | 54.26ms | 16.32ms | 4.99ms | 16.94ms |
| comp_1to1 | 47.60ms | 23.85ms | 52.45ms | 18.89ms | 11.34ms | 14.72ms |
| comp_2to1 | 29.50ms | 9.07ms | 33.79ms | 10.36ms | 15.71ms | 10.85ms |
| comp_4to1 | 13.07ms | 20.49ms | 16.86ms | 1.97ms | 1.77ms | 13.36ms |
| comp_1000to1 | 2.16ms | 33μs | 42μs | 9μs | 5μs | 4μs |
| comp_1to2 | 29.57ms | 29.87ms | 45.63ms | 15.29ms | 8.91ms | 19.56ms |
| comp_1to4 | 29.65ms | 25.04ms | 43.05ms | 7.41ms | 11.76ms | 20.39ms |
| comp_1to8 | 24.67ms | 22.44ms | 43.63ms | 6.81ms | 4.86ms | 7.45ms |
| comp_1to1000 | 19.08ms | 15.22ms | 40.10ms | 4.63ms | 3.64ms | 6.54ms |
| update_1to1 | 44.61ms | 27.46ms | 7.75ms | 9.40ms | 4.40ms | 8.79ms |
| update_2to1 | 21.40ms | 13.49ms | 2.90ms | 4.66ms | 2.91ms | 4.36ms |
| update_4to1 | 10.81ms | 7.09ms | 2.58ms | 2.41ms | 1.09ms | 2.20ms |
| update_1000to1 | 117μs | 69μs | 15μs | 23μs | 10μs | 21μs |
| update_1to2 | 21.40ms | 13.91ms | 3.51ms | 4.73ms | 2.19ms | 5.20ms |
| update_1to4 | 11.09ms | 6.60ms | 1.49ms | 2.37ms | 2.45ms | 2.42ms |
| update_1to1000 | 227μs | 165μs | 397μs | 46μs | 40μs | 449μs |
| cellx1000 | 155.98ms | 71.94ms | 6.23ms | 10.38ms | 7.58ms | 9.68ms |
| cellx2500 | 468.99ms | 265.52ms | 25.47ms | 36.39ms | 20.50ms | 25.79ms |
| cellx5000 | 1.06s | 550.61ms | 68.12ms | 83.70ms | 49.07ms | 70.53ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.66s (partial) | 2.04s | 263.40ms | 509.59ms | 235.22ms | 435.00ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.44s (partial) | 1.52s | 206.03ms | 280.54ms | 181.77ms | 278.19ms |
| 1000x12 - 4 sources - dynamic (large) | 4.10s (partial) | 1.84s | 361.93ms | 3.82s | 299.65ms | 3.54s |
| 1000x5 - 25 sources (wide dense) | 4.96s (partial) | 3.54s | 522.58ms | 3.42s | 406.43ms | 2.54s |
| 5x500 - 3 sources (deep) | 2.01s (partial) | 1.12s | 241.18ms | 232.15ms | 206.00ms | 230.82ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.81s (partial) | 1.74s | 268.81ms | 474.67ms | 267.67ms | 447.44ms |

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
