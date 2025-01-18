# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.67s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.50s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 9.76s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.07s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 40.59s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.52s |

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
| avoidablePropagation | 190.74ms | 208.94ms | 209.44ms | 2.28s | 164.73ms (fail) | 2.27s |
| broadPropagation | 345.72ms | 464.67ms | 454.41ms | 5.72s | 7.80ms (fail) | 4.34s |
| deepPropagation | 126.00ms | 185.13ms | 175.59ms | 2.10s | 141.16ms (fail) | 1.56s |
| diamond | 234.25ms | 288.91ms | 273.88ms | 3.63s | 197.10ms (fail) | 2.41s |
| mux | 375.45ms | 414.22ms | 384.83ms | 2.10s | 193.68ms (fail) | 1.81s |
| repeatedObservers | 44.48ms | 46.73ms | 40.95ms | 223.03ms | 53.60ms (fail) | 237.66ms |
| triangle | 83.94ms | 102.52ms | 98.47ms | 1.19s | 77.28ms (fail) | 766.34ms |
| unstable | 60.02ms | 76.15ms | 68.34ms | 370.24ms | 342.71ms (fail) | 361.24ms |
| molBench | 486.91ms | 486.65ms | 482.89ms | 1.76s | 917μs | 588.63ms |
| create_signals | 20.45ms | 29.34ms | 4.63ms | 73.68ms | 69.00ms | 65.04ms |
| comp_0to1 | 4.94ms | 14.90ms | 17.26ms | 30.48ms | 50.75ms | 21.98ms |
| comp_1to1 | 11.23ms | 18.63ms | 16.83ms | 48.26ms | 54.21ms | 23.86ms |
| comp_2to1 | 14.76ms | 8.58ms | 15.32ms | 22.06ms | 33.64ms | 9.94ms |
| comp_4to1 | 1.67ms | 2.28ms | 11.11ms | 12.40ms | 17.05ms | 24.44ms |
| comp_1000to1 | 5μs | 5μs | 6μs | 1.91ms | 45μs | 15μs |
| comp_1to2 | 8.96ms | 19.14ms | 27.02ms | 26.12ms | 46.95ms | 35.77ms |
| comp_1to4 | 8.10ms | 9.80ms | 32.05ms | 31.77ms | 47.73ms | 19.52ms |
| comp_1to8 | 7.33ms | 7.13ms | 7.34ms | 21.85ms | 45.57ms | 21.38ms |
| comp_1to1000 | 3.56ms | 4.74ms | 5.98ms | 18.83ms | 40.59ms | 16.00ms |
| update_1to1 | 4.43ms | 9.37ms | 8.83ms | 43.44ms | 7.25ms | 25.54ms |
| update_2to1 | 2.31ms | 4.75ms | 4.37ms | 21.43ms | 2.89ms | 14.07ms |
| update_4to1 | 2.03ms | 2.34ms | 2.19ms | 10.76ms | 1.65ms | 7.32ms |
| update_1000to1 | 11μs | 23μs | 21μs | 114μs | 14μs | 69μs |
| update_1to2 | 2.18ms | 4.74ms | 4.35ms | 21.77ms | 5.53ms | 11.58ms |
| update_1to4 | 1.13ms | 2.35ms | 2.19ms | 10.96ms | 1.47ms | 5.27ms |
| update_1to1000 | 36μs | 46μs | 909μs | 213μs | 410μs | 164μs |
| cellx1000 | 7.52ms | 9.66ms | 9.99ms | 159.55ms | 5.26ms | 67.94ms |
| cellx2500 | 19.89ms | 33.30ms | 36.52ms | 479.94ms | 19.68ms | 254.29ms |
| cellx5000 | 45.71ms | 73.31ms | 93.26ms | 1.15s | 55.45ms | 554.88ms |
| 10x5 - 2 sources - read 20.0% (simple) | 232.28ms | 505.04ms | 426.82ms | 2.72s (partial) | 261.94ms | 1.98s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 179.05ms | 293.64ms | 270.79ms | 2.44s (partial) | 206.97ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 287.32ms | 3.93s | 3.37s | 4.07s (partial) | 345.52ms | 1.78s |
| 1000x5 - 25 sources (wide dense) | 395.02ms | 3.53s | 2.52s | 4.98s (partial) | 521.75ms | 3.46s |
| 5x500 - 3 sources (deep) | 195.48ms | 229.59ms | 235.16ms | 2.03s (partial) | 232.87ms | 1.12s |
| 100x15 - 6 sources - dynamic (very dynamic) | 268.37ms | 481.41ms | 450.03ms | 2.80s (partial) | 265.46ms | 1.69s |

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
