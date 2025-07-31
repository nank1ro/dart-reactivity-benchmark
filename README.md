# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.23s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.24s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.26s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 29.20s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.38s |

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
| Test Case | state_beacon | mobx | solidart(2.0-dev) | preact_signals | signals | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 161.04ms (fail) | 2.39s | 270.05ms | 204.68ms | 207.20ms | 186.59ms |
| broadPropagation | 6.05ms (fail) | 4.65s | 501.56ms | 444.68ms | 452.90ms | 357.76ms |
| deepPropagation | 140.11ms (fail) | 1.63s | 168.18ms | 175.23ms | 171.70ms | 122.57ms |
| diamond | 183.54ms (fail) | 2.58s | 347.54ms | 278.69ms | 280.50ms | 232.81ms |
| mux | 189.82ms (fail) | 1.95s | 437.29ms | 404.01ms | 447.81ms | 371.56ms |
| repeatedObservers | 52.45ms (fail) | 234.88ms | 81.01ms | 40.27ms | 47.09ms | 45.49ms |
| triangle | 81.42ms (fail) | 821.71ms | 117.42ms | 99.23ms | 101.24ms | 84.88ms |
| unstable | 339.31ms (fail) | 352.86ms | 97.31ms | 68.45ms | 79.54ms | 67.71ms |
| molBench | 915μs | 581.09ms | 492.23ms | 485.27ms | 486.61ms | 481.59ms |
| create_signals | 59.48ms | 71.94ms | 78.26ms | 5.28ms | 25.37ms | 21.67ms |
| comp_0to1 | 55.87ms | 26.03ms | 28.31ms | 17.44ms | 11.31ms | 7.83ms |
| comp_1to1 | 55.66ms | 18.91ms | 33.11ms | 12.54ms | 27.96ms | 4.36ms |
| comp_2to1 | 36.12ms | 15.16ms | 35.90ms | 12.78ms | 18.22ms | 2.30ms |
| comp_4to1 | 16.24ms | 27.88ms | 5.12ms | 8.78ms | 11.48ms | 8.58ms |
| comp_1000to1 | 42μs | 36μs | 18μs | 4μs | 5μs | 5μs |
| comp_1to2 | 45.18ms | 39.02ms | 38.24ms | 23.89ms | 21.62ms | 19.36ms |
| comp_1to4 | 43.88ms | 24.37ms | 22.59ms | 20.83ms | 14.19ms | 7.66ms |
| comp_1to8 | 42.78ms | 25.65ms | 24.86ms | 9.61ms | 6.56ms | 7.31ms |
| comp_1to1000 | 39.39ms | 16.42ms | 16.99ms | 15.87ms | 4.24ms | 3.58ms |
| update_1to1 | 5.69ms | 24.95ms | 16.16ms | 8.66ms | 8.85ms | 10.26ms |
| update_2to1 | 3.11ms | 13.16ms | 7.85ms | 4.28ms | 4.48ms | 2.29ms |
| update_4to1 | 1.46ms | 7.00ms | 4.04ms | 2.16ms | 2.28ms | 2.60ms |
| update_1000to1 | 14μs | 71μs | 41μs | 22μs | 33μs | 24μs |
| update_1to2 | 2.86ms | 17.04ms | 8.05ms | 4.79ms | 4.46ms | 5.10ms |
| update_1to4 | 1.61ms | 7.07ms | 4.05ms | 2.17ms | 2.27ms | 2.51ms |
| update_1to1000 | 382μs | 173μs | 184μs | 2.08ms | 42μs | 32μs |
| cellx1000 | 5.34ms | 74.22ms | 12.31ms | 9.70ms | 9.65ms | 7.45ms |
| cellx2500 | 24.16ms | 245.27ms | 32.50ms | 26.34ms | 31.42ms | 22.62ms |
| cellx5000 | 56.24ms | 554.65ms | 77.26ms | 68.21ms | 60.82ms | 49.81ms |
| 10x5 - 2 sources - read 20.0% (simple) | 235.53ms | 2.15s | 349.22ms | 437.07ms | 514.19ms | 238.63ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 197.09ms | 1.71s | 242.67ms | 268.69ms | 281.18ms | 177.03ms |
| 1000x12 - 4 sources - dynamic (large) | 335.40ms | 2.05s | 463.21ms | 3.69s | 3.77s | 281.43ms |
| 1000x5 - 25 sources (wide dense) | 494.47ms | 3.88s | 583.82ms | 2.72s | 3.42s | 413.31ms |
| 5x500 - 3 sources (deep) | 205.45ms | 1.20s | 253.88ms | 227.84ms | 223.77ms | 196.19ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 261.85ms | 1.82s | 382.79ms | 455.74ms | 486.10ms | 265.11ms |

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
