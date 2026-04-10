# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.80s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.41s |
| 🥉 | signals | 0.23 | 100.0% | 35/35 | 11.51s |
| 4 | preact_signals | 0.22 | 100.0% | 35/35 | 10.41s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.76s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.33s |

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
| avoidablePropagation | 2.27s | 215.02ms | 188.37ms | 211.06ms | 272.96ms | 158.24ms (fail) |
| broadPropagation | 4.17s | 476.90ms | 361.59ms | 531.92ms | 496.75ms | 6.16ms (fail) |
| deepPropagation | 1.50s | 186.11ms | 121.04ms | 207.86ms | 162.71ms | 149.15ms (fail) |
| diamond | 2.23s | 284.37ms | 269.56ms | 287.80ms | 368.26ms | 192.03ms (fail) |
| mux | 1.71s | 385.32ms | 368.21ms | 388.43ms | 426.50ms | 185.84ms (fail) |
| repeatedObservers | 226.39ms | 46.44ms | 44.48ms | 41.97ms | 87.96ms | 54.74ms (fail) |
| triangle | 730.65ms | 104.74ms | 91.82ms | 104.81ms | 123.26ms | 81.08ms (fail) |
| unstable | 343.91ms | 78.64ms | 61.40ms | 72.93ms | 107.32ms | 342.79ms (fail) |
| molBench | 638.25ms | 548.36ms | 560.77ms | 547.36ms | 568.26ms | 1.02ms |
| create_signals | 81.68ms | 48.26ms | 26.72ms | 5.80ms | 81.46ms | 60.62ms |
| comp_0to1 | 24.96ms | 18.49ms | 7.60ms | 20.41ms | 26.11ms | 54.11ms |
| comp_1to1 | 31.89ms | 34.56ms | 4.05ms | 13.56ms | 41.32ms | 55.94ms |
| comp_2to1 | 8.83ms | 16.24ms | 2.28ms | 12.68ms | 44.24ms | 36.95ms |
| comp_4to1 | 25.04ms | 2.67ms | 11.56ms | 10.94ms | 14.98ms | 16.89ms |
| comp_1000to1 | 16μs | 5μs | 3μs | 4μs | 17μs | 42μs |
| comp_1to2 | 42.48ms | 28.20ms | 11.98ms | 19.38ms | 34.12ms | 44.64ms |
| comp_1to4 | 23.24ms | 14.63ms | 13.85ms | 32.92ms | 20.91ms | 44.30ms |
| comp_1to8 | 21.05ms | 6.48ms | 4.55ms | 11.89ms | 22.67ms | 42.02ms |
| comp_1to1000 | 14.70ms | 3.97ms | 4.70ms | 10.49ms | 14.39ms | 38.03ms |
| update_1to1 | 22.89ms | 9.49ms | 7.92ms | 9.62ms | 16.77ms | 5.97ms |
| update_2to1 | 11.54ms | 4.67ms | 3.44ms | 4.87ms | 8.32ms | 3.02ms |
| update_4to1 | 6.15ms | 2.44ms | 1.23ms | 2.36ms | 4.19ms | 1.53ms |
| update_1000to1 | 56μs | 23μs | 11μs | 24μs | 42μs | 15μs |
| update_1to2 | 11.45ms | 4.72ms | 2.39ms | 4.77ms | 8.67ms | 3.02ms |
| update_1to4 | 5.74ms | 2.36ms | 1.22ms | 2.41ms | 4.21ms | 1.51ms |
| update_1to1000 | 155μs | 40μs | 42μs | 2.53ms | 145μs | 367μs |
| cellx1000 | 75.55ms | 10.63ms | 6.95ms | 10.58ms | 11.96ms | 5.32ms |
| cellx2500 | 270.73ms | 45.98ms | 19.64ms | 30.89ms | 36.87ms | 27.29ms |
| cellx5000 | 618.93ms | 97.75ms | 48.43ms | 93.25ms | 88.70ms | 68.00ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.00s | 498.69ms | 244.30ms | 472.84ms | 365.80ms | 248.40ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.43s | 271.16ms | 195.91ms | 269.72ms | 270.56ms | 203.10ms |
| 1000x12 - 4 sources - dynamic (large) | 1.90s | 3.91s | 273.55ms | 3.53s | 431.46ms | 295.86ms |
| 1000x5 - 25 sources (wide dense) | 3.47s | 3.46s | 415.50ms | 2.77s | 639.46ms | 464.71ms |
| 5x500 - 3 sources (deep) | 1.14s | 228.34ms | 192.91ms | 238.29ms | 266.12ms | 201.00ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.70s | 463.82ms | 236.63ms | 431.26ms | 345.86ms | 236.78ms |

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
