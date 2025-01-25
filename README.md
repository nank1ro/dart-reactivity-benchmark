# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.72s |
| 🥈 | preact_signals | 0.31 | 100.0% | 35/35 | 9.81s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.19s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.39s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.43s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.53s |

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
| avoidablePropagation | 2.18s | 2.34s | 160.02ms (fail) | 211.85ms | 187.61ms | 212.28ms |
| broadPropagation | 5.51s | 4.41s | 6.70ms (fail) | 466.51ms | 346.14ms | 458.77ms |
| deepPropagation | 2.00s | 1.56s | 140.43ms (fail) | 170.10ms | 122.92ms | 173.56ms |
| diamond | 3.47s | 2.40s | 198.70ms (fail) | 283.43ms | 237.30ms | 274.66ms |
| mux | 2.06s | 1.85s | 196.00ms (fail) | 413.24ms | 377.06ms | 382.83ms |
| repeatedObservers | 214.69ms | 236.85ms | 53.89ms (fail) | 44.85ms | 43.96ms | 41.14ms |
| triangle | 1.13s | 763.13ms | 81.11ms (fail) | 99.55ms | 85.37ms | 98.90ms |
| unstable | 339.47ms | 357.44ms | 333.56ms (fail) | 77.82ms | 59.52ms | 68.87ms |
| molBench | 1.75s | 537.18ms | 916μs | 486.14ms | 485.99ms | 483.56ms |
| create_signals | 58.61ms | 77.23ms | 72.31ms | 39.99ms | 21.35ms | 5.00ms |
| comp_0to1 | 45.43ms | 19.70ms | 49.70ms | 17.68ms | 5.24ms | 17.40ms |
| comp_1to1 | 46.35ms | 27.92ms | 52.93ms | 26.65ms | 8.89ms | 17.44ms |
| comp_2to1 | 33.00ms | 16.96ms | 34.03ms | 15.49ms | 14.45ms | 13.19ms |
| comp_4to1 | 13.62ms | 18.84ms | 17.42ms | 4.53ms | 14.43ms | 9.35ms |
| comp_1000to1 | 2.17ms | 23μs | 46μs | 5μs | 4μs | 7μs |
| comp_1to2 | 39.72ms | 37.15ms | 45.44ms | 22.82ms | 23.50ms | 8.60ms |
| comp_1to4 | 27.50ms | 22.72ms | 43.47ms | 7.54ms | 15.04ms | 16.34ms |
| comp_1to8 | 23.87ms | 20.99ms | 43.35ms | 6.67ms | 9.27ms | 8.57ms |
| comp_1to1000 | 19.12ms | 15.12ms | 40.09ms | 4.59ms | 3.83ms | 3.72ms |
| update_1to1 | 43.21ms | 28.21ms | 8.90ms | 9.39ms | 4.38ms | 8.76ms |
| update_2to1 | 21.44ms | 12.00ms | 2.89ms | 4.67ms | 2.58ms | 4.39ms |
| update_4to1 | 10.80ms | 5.99ms | 2.99ms | 2.33ms | 1.15ms | 2.38ms |
| update_1000to1 | 115μs | 69μs | 14μs | 23μs | 11μs | 21μs |
| update_1to2 | 21.58ms | 14.07ms | 3.24ms | 4.72ms | 2.22ms | 4.36ms |
| update_1to4 | 10.96ms | 7.04ms | 1.45ms | 2.35ms | 1.13ms | 2.19ms |
| update_1to1000 | 213μs | 180μs | 408μs | 46μs | 45μs | 42μs |
| cellx1000 | 151.73ms | 70.80ms | 5.35ms | 9.76ms | 7.47ms | 11.13ms |
| cellx2500 | 484.75ms | 248.67ms | 20.20ms | 35.33ms | 19.89ms | 26.32ms |
| cellx5000 | 1.09s | 569.79ms | 57.64ms | 80.86ms | 46.82ms | 66.34ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.65s (partial) | 2.03s | 266.82ms | 509.32ms | 232.30ms | 446.75ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.33s (partial) | 1.52s | 208.46ms | 284.45ms | 181.50ms | 274.76ms |
| 1000x12 - 4 sources - dynamic (large) | 4.04s (partial) | 1.81s | 341.62ms | 3.62s | 284.08ms | 3.44s |
| 1000x5 - 25 sources (wide dense) | 4.87s (partial) | 3.54s | 532.00ms | 3.52s | 404.25ms | 2.54s |
| 5x500 - 3 sources (deep) | 1.98s (partial) | 1.14s | 235.50ms | 230.42ms | 202.46ms | 230.30ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.76s (partial) | 1.68s | 267.73ms | 478.47ms | 266.44ms | 457.81ms |

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
