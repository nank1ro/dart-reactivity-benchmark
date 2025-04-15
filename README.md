# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.39s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.12s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.04s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.90s |
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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 275.35ms | 206.27ms | 2.35s | 185.69ms | 208.74ms | 148.84ms (fail) |
| broadPropagation | 511.06ms | 453.03ms | 4.31s | 352.85ms | 459.83ms | 5.97ms (fail) |
| deepPropagation | 171.32ms | 179.79ms | 1.53s | 126.97ms | 180.56ms | 137.85ms (fail) |
| diamond | 355.48ms | 277.19ms | 2.43s | 234.83ms | 289.53ms | 185.31ms (fail) |
| mux | 435.06ms | 382.75ms | 1.83s | 382.39ms | 412.31ms | 190.83ms (fail) |
| repeatedObservers | 78.80ms | 39.08ms | 235.92ms | 45.53ms | 46.01ms | 53.29ms (fail) |
| triangle | 118.89ms | 100.33ms | 769.02ms | 90.31ms | 100.17ms | 78.00ms (fail) |
| unstable | 95.51ms | 70.98ms | 350.77ms | 60.81ms | 73.50ms | 340.64ms (fail) |
| molBench | 493.31ms | 490.75ms | 580.96ms | 492.24ms | 489.00ms | 1.15ms |
| create_signals | 96.29ms | 4.64ms | 80.41ms | 26.35ms | 25.39ms | 68.22ms |
| comp_0to1 | 36.04ms | 24.38ms | 22.06ms | 7.06ms | 11.94ms | 56.26ms |
| comp_1to1 | 47.85ms | 11.81ms | 43.98ms | 4.24ms | 25.25ms | 56.53ms |
| comp_2to1 | 47.51ms | 17.61ms | 34.61ms | 2.29ms | 17.41ms | 37.80ms |
| comp_4to1 | 17.88ms | 14.08ms | 17.79ms | 8.57ms | 8.23ms | 19.03ms |
| comp_1000to1 | 15μs | 4μs | 20μs | 3μs | 6μs | 41μs |
| comp_1to2 | 39.15ms | 21.15ms | 36.09ms | 10.72ms | 22.18ms | 46.60ms |
| comp_1to4 | 20.67ms | 26.33ms | 20.01ms | 12.99ms | 9.06ms | 68.04ms |
| comp_1to8 | 20.35ms | 5.84ms | 22.23ms | 4.15ms | 6.55ms | 43.06ms |
| comp_1to1000 | 14.72ms | 6.83ms | 15.41ms | 3.25ms | 4.65ms | 37.30ms |
| update_1to1 | 16.40ms | 8.20ms | 22.96ms | 11.39ms | 9.25ms | 5.72ms |
| update_2to1 | 8.13ms | 4.06ms | 11.24ms | 4.93ms | 4.64ms | 2.87ms |
| update_4to1 | 4.13ms | 2.07ms | 5.74ms | 2.77ms | 2.31ms | 1.43ms |
| update_1000to1 | 41μs | 20μs | 67μs | 16μs | 23μs | 14μs |
| update_1to2 | 8.24ms | 4.06ms | 11.25ms | 5.61ms | 5.00ms | 2.92ms |
| update_1to4 | 4.11ms | 2.06ms | 5.61ms | 2.43ms | 2.28ms | 1.43ms |
| update_1to1000 | 146μs | 948μs | 177μs | 49μs | 42μs | 378μs |
| cellx1000 | 11.19ms | 9.92ms | 82.15ms | 7.85ms | 9.57ms | 5.99ms |
| cellx2500 | 31.52ms | 30.63ms | 276.06ms | 19.40ms | 31.34ms | 37.22ms |
| cellx5000 | 85.40ms | 87.02ms | 599.68ms | 41.97ms | 82.47ms | 91.44ms |
| 10x5 - 2 sources - read 20.0% (simple) | 382.25ms | 442.44ms | 2.05s | 231.28ms | 516.28ms | 239.59ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 250.23ms | 269.94ms | 1.55s | 176.88ms | 279.71ms | 201.00ms |
| 1000x12 - 4 sources - dynamic (large) | 462.72ms | 3.56s | 1.96s | 294.04ms | 3.58s | 358.91ms |
| 1000x5 - 25 sources (wide dense) | 604.86ms | 2.68s | 3.63s | 409.70ms | 3.42s | 512.43ms |
| 5x500 - 3 sources (deep) | 259.39ms | 232.57ms | 1.24s | 191.66ms | 227.89ms | 208.95ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 387.63ms | 455.03ms | 1.78s | 262.37ms | 482.00ms | 268.40ms |

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
