# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.68s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 9.76s |
| 🥉 | signals | 0.24 | 100.0% | 35/35 | 11.40s |
| 4 | mobx | 0.04 | 100.0% | 35/35 | 27.30s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.66s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.56s |

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
| avoidablePropagation | 2.23s | 2.30s | 163.86ms (fail) | 213.60ms | 190.12ms | 211.08ms |
| broadPropagation | 5.55s | 4.37s | 10.10ms (fail) | 464.68ms | 356.69ms | 454.25ms |
| deepPropagation | 2.03s | 1.53s | 140.98ms (fail) | 180.05ms | 131.28ms | 176.54ms |
| diamond | 3.50s | 2.45s | 196.49ms (fail) | 283.73ms | 239.67ms | 275.37ms |
| mux | 2.03s | 1.82s | 197.53ms (fail) | 407.21ms | 378.52ms | 386.41ms |
| repeatedObservers | 213.88ms | 239.94ms | 53.88ms (fail) | 44.50ms | 43.69ms | 41.66ms |
| triangle | 1.14s | 783.80ms | 80.69ms (fail) | 101.69ms | 86.33ms | 98.57ms |
| unstable | 347.91ms | 356.27ms | 349.36ms (fail) | 77.29ms | 60.54ms | 69.44ms |
| molBench | 1.74s | 587.46ms | 873μs | 486.29ms | 472.73ms | 483.08ms |
| create_signals | 67.83ms | 70.40ms | 73.07ms | 29.04ms | 20.11ms | 4.55ms |
| comp_0to1 | 36.17ms | 27.81ms | 58.10ms | 13.97ms | 4.96ms | 19.32ms |
| comp_1to1 | 43.30ms | 53.57ms | 55.50ms | 17.41ms | 11.21ms | 15.70ms |
| comp_2to1 | 32.74ms | 32.65ms | 35.26ms | 10.37ms | 18.10ms | 14.24ms |
| comp_4to1 | 13.21ms | 16.94ms | 18.67ms | 7.35ms | 1.73ms | 11.00ms |
| comp_1000to1 | 2.09ms | 22μs | 53μs | 5μs | 3μs | 4μs |
| comp_1to2 | 33.03ms | 38.38ms | 48.85ms | 14.13ms | 15.46ms | 16.85ms |
| comp_1to4 | 27.51ms | 30.03ms | 46.40ms | 14.21ms | 9.57ms | 21.22ms |
| comp_1to8 | 24.13ms | 20.20ms | 46.78ms | 12.66ms | 3.81ms | 8.69ms |
| comp_1to1000 | 18.84ms | 15.25ms | 42.89ms | 10.84ms | 3.21ms | 5.65ms |
| update_1to1 | 43.21ms | 28.31ms | 7.74ms | 9.40ms | 4.38ms | 8.85ms |
| update_2to1 | 21.22ms | 13.71ms | 2.90ms | 4.71ms | 2.19ms | 5.56ms |
| update_4to1 | 10.70ms | 6.78ms | 1.76ms | 2.36ms | 1.09ms | 2.25ms |
| update_1000to1 | 126μs | 82μs | 15μs | 23μs | 11μs | 21μs |
| update_1to2 | 21.24ms | 14.77ms | 4.30ms | 4.73ms | 2.19ms | 4.36ms |
| update_1to4 | 10.90ms | 6.80ms | 1.48ms | 2.37ms | 1.09ms | 2.19ms |
| update_1to1000 | 219μs | 163μs | 425μs | 47μs | 28μs | 347μs |
| cellx1000 | 153.91ms | 76.68ms | 5.53ms | 9.66ms | 8.07ms | 9.55ms |
| cellx2500 | 475.88ms | 226.65ms | 21.49ms | 31.47ms | 20.44ms | 25.51ms |
| cellx5000 | 1.05s | 551.27ms | 63.01ms | 59.96ms | 43.70ms | 62.91ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.65s (partial) | 2.00s | 259.92ms | 510.94ms | 230.91ms | 426.60ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.34s (partial) | 1.55s | 209.93ms | 276.74ms | 176.11ms | 305.98ms |
| 1000x12 - 4 sources - dynamic (large) | 4.06s (partial) | 1.72s | 337.98ms | 3.83s | 281.89ms | 3.39s |
| 1000x5 - 25 sources (wide dense) | 4.90s (partial) | 3.54s | 527.88ms | 3.51s | 402.85ms | 2.52s |
| 5x500 - 3 sources (deep) | 2.02s (partial) | 1.12s | 233.46ms | 227.63ms | 195.96ms | 229.16ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.81s (partial) | 1.70s | 266.26ms | 534.39ms | 265.39ms | 449.96ms |

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
