# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.80s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.35s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 10.25s |
| 4 | signals | 0.24 | 100.0% | 35/35 | 11.41s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.68s |
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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.24s | 218.01ms | 183.36ms | 219.11ms | 270.66ms | 151.76ms (fail) |
| broadPropagation | 4.24s | 478.42ms | 354.23ms | 527.00ms | 500.84ms | 5.96ms (fail) |
| deepPropagation | 1.50s | 181.09ms | 116.62ms | 204.94ms | 162.75ms | 152.54ms (fail) |
| diamond | 2.19s | 283.77ms | 264.15ms | 288.04ms | 367.51ms | 189.49ms (fail) |
| mux | 1.73s | 388.89ms | 366.64ms | 383.11ms | 423.83ms | 187.40ms (fail) |
| repeatedObservers | 225.51ms | 46.34ms | 44.44ms | 42.06ms | 89.00ms | 54.97ms (fail) |
| triangle | 724.61ms | 105.14ms | 92.78ms | 104.72ms | 123.14ms | 78.35ms (fail) |
| unstable | 343.26ms | 77.73ms | 61.25ms | 73.01ms | 107.81ms | 343.38ms (fail) |
| molBench | 641.28ms | 549.10ms | 560.93ms | 548.72ms | 568.88ms | 1.01ms |
| create_signals | 69.64ms | 48.45ms | 27.06ms | 6.02ms | 80.55ms | 69.05ms |
| comp_0to1 | 14.98ms | 21.93ms | 7.24ms | 23.94ms | 26.04ms | 62.18ms |
| comp_1to1 | 54.00ms | 30.49ms | 4.20ms | 13.78ms | 29.85ms | 61.29ms |
| comp_2to1 | 24.79ms | 14.42ms | 2.31ms | 17.53ms | 45.75ms | 42.66ms |
| comp_4to1 | 30.70ms | 7.50ms | 9.52ms | 12.60ms | 10.77ms | 16.50ms |
| comp_1000to1 | 25μs | 5μs | 4μs | 7μs | 17μs | 43μs |
| comp_1to2 | 38.05ms | 28.45ms | 19.50ms | 21.57ms | 29.61ms | 45.20ms |
| comp_1to4 | 22.89ms | 15.03ms | 11.67ms | 15.15ms | 20.69ms | 44.37ms |
| comp_1to8 | 22.83ms | 6.50ms | 6.69ms | 5.75ms | 19.89ms | 43.73ms |
| comp_1to1000 | 14.22ms | 3.98ms | 3.34ms | 3.33ms | 14.07ms | 38.67ms |
| update_1to1 | 22.92ms | 9.28ms | 4.74ms | 9.77ms | 16.69ms | 6.01ms |
| update_2to1 | 11.55ms | 4.66ms | 2.40ms | 4.83ms | 8.33ms | 3.04ms |
| update_4to1 | 6.09ms | 2.37ms | 1.41ms | 2.41ms | 4.19ms | 1.56ms |
| update_1000to1 | 56μs | 23μs | 12μs | 24μs | 41μs | 15μs |
| update_1to2 | 11.32ms | 4.96ms | 2.46ms | 4.73ms | 8.49ms | 3.03ms |
| update_1to4 | 5.75ms | 2.39ms | 1.20ms | 2.44ms | 4.18ms | 1.55ms |
| update_1to1000 | 157μs | 39μs | 40μs | 52μs | 144μs | 372μs |
| cellx1000 | 73.45ms | 10.52ms | 7.08ms | 10.13ms | 11.17ms | 4.86ms |
| cellx2500 | 279.72ms | 43.69ms | 20.33ms | 27.79ms | 32.28ms | 24.53ms |
| cellx5000 | 624.88ms | 114.11ms | 48.59ms | 70.08ms | 73.58ms | 93.67ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.99s | 514.71ms | 277.12ms | 433.34ms | 372.65ms | 246.35ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.42s | 273.71ms | 187.68ms | 264.25ms | 269.78ms | 201.65ms |
| 1000x12 - 4 sources - dynamic (large) | 1.85s | 3.64s | 269.75ms | 3.50s | 417.75ms | 305.11ms |
| 1000x5 - 25 sources (wide dense) | 3.41s | 3.59s | 414.42ms | 2.73s | 635.88ms | 466.58ms |
| 5x500 - 3 sources (deep) | 1.13s | 228.19ms | 194.12ms | 234.30ms | 263.84ms | 201.34ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.70s | 467.45ms | 235.68ms | 441.86ms | 337.32ms | 235.11ms |

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
