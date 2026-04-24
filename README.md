# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.31s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 10.88s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.45s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.87s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.42s |

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
| avoidablePropagation | 2.27s | 204.92ms | 198.32ms | 207.96ms | 273.74ms | 148.66ms (fail) |
| broadPropagation | 4.31s | 468.71ms | 359.85ms | 455.47ms | 498.99ms | 5.84ms (fail) |
| deepPropagation | 1.53s | 172.38ms | 131.10ms | 174.91ms | 167.30ms | 137.94ms (fail) |
| diamond | 2.34s | 286.96ms | 246.70ms | 287.85ms | 348.73ms | 179.36ms (fail) |
| mux | 1.78s | 399.88ms | 361.20ms | 376.93ms | 420.63ms | 180.75ms (fail) |
| repeatedObservers | 227.43ms | 45.84ms | 46.50ms | 42.17ms | 80.53ms | 55.72ms (fail) |
| triangle | 783.84ms | 101.11ms | 88.67ms | 101.53ms | 114.01ms | 75.13ms (fail) |
| unstable | 339.72ms | 76.27ms | 63.27ms | 72.67ms | 95.32ms | 334.25ms (fail) |
| molBench | 584.34ms | 496.25ms | 481.11ms | 496.31ms | 488.10ms | 1.25ms |
| create_signals | 68.50ms | 25.88ms | 27.41ms | 5.64ms | 97.55ms | 64.87ms |
| comp_0to1 | 19.74ms | 12.13ms | 8.10ms | 18.45ms | 35.83ms | 56.41ms |
| comp_1to1 | 41.72ms | 20.67ms | 4.21ms | 10.80ms | 45.43ms | 57.05ms |
| comp_2to1 | 23.91ms | 18.06ms | 2.29ms | 11.98ms | 37.12ms | 38.28ms |
| comp_4to1 | 13.60ms | 1.76ms | 7.46ms | 12.13ms | 13.37ms | 16.95ms |
| comp_1000to1 | 17μs | 7μs | 3μs | 4μs | 15μs | 45μs |
| comp_1to2 | 33.48ms | 22.15ms | 10.40ms | 26.16ms | 27.27ms | 48.13ms |
| comp_1to4 | 24.68ms | 11.22ms | 9.13ms | 22.53ms | 20.19ms | 47.71ms |
| comp_1to8 | 22.62ms | 6.94ms | 5.10ms | 11.08ms | 19.60ms | 46.42ms |
| comp_1to1000 | 14.95ms | 4.27ms | 3.60ms | 6.38ms | 14.24ms | 42.25ms |
| update_1to1 | 21.18ms | 8.90ms | 4.65ms | 9.14ms | 15.83ms | 9.48ms |
| update_2to1 | 10.43ms | 4.45ms | 2.37ms | 4.73ms | 7.95ms | 2.85ms |
| update_4to1 | 5.59ms | 2.27ms | 1.27ms | 2.33ms | 3.97ms | 2.04ms |
| update_1000to1 | 64μs | 22μs | 11μs | 23μs | 39μs | 15μs |
| update_1to2 | 10.38ms | 4.45ms | 2.35ms | 4.56ms | 8.12ms | 4.47ms |
| update_1to4 | 5.30ms | 2.26ms | 1.24ms | 2.45ms | 3.98ms | 1.46ms |
| update_1to1000 | 156μs | 41μs | 45μs | 975μs | 159μs | 406μs |
| cellx1000 | 72.36ms | 10.01ms | 7.51ms | 10.10ms | 13.79ms | 5.42ms |
| cellx2500 | 254.25ms | 35.15ms | 20.36ms | 27.57ms | 37.76ms | 26.87ms |
| cellx5000 | 555.61ms | 70.47ms | 48.01ms | 72.79ms | 98.32ms | 67.13ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.99s | 498.63ms | 236.67ms | 451.53ms | 346.99ms | 235.08ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.49s | 278.67ms | 177.75ms | 272.12ms | 248.22ms | 199.32ms |
| 1000x12 - 4 sources - dynamic (large) | 1.86s | 3.53s | 284.99ms | 3.80s | 472.17ms | 344.91ms |
| 1000x5 - 25 sources (wide dense) | 3.38s | 3.35s | 413.66ms | 2.77s | 605.34ms | 517.59ms |
| 5x500 - 3 sources (deep) | 1.13s | 225.93ms | 191.51ms | 232.51ms | 257.76ms | 206.72ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.65s | 483.99ms | 265.42ms | 448.76ms | 390.62ms | 258.88ms |

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
