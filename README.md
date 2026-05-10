# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.78s |
| 🥈 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.42s |
| 🥉 | preact_signals | 0.24 | 100.0% | 35/35 | 10.37s |
| 4 | signals | 0.22 | 100.0% | 35/35 | 11.36s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.73s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.32s |

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
| avoidablePropagation | 2.28s | 215.53ms | 193.82ms | 223.00ms | 269.28ms | 151.88ms (fail) |
| broadPropagation | 4.19s | 494.25ms | 354.52ms | 529.62ms | 489.98ms | 5.98ms (fail) |
| deepPropagation | 1.49s | 184.52ms | 117.41ms | 199.88ms | 162.80ms | 150.27ms (fail) |
| diamond | 2.27s | 281.75ms | 269.47ms | 286.54ms | 366.98ms | 191.10ms (fail) |
| mux | 1.73s | 387.68ms | 363.42ms | 382.00ms | 420.93ms | 185.94ms (fail) |
| repeatedObservers | 229.71ms | 46.13ms | 43.21ms | 42.64ms | 88.86ms | 54.66ms (fail) |
| triangle | 739.38ms | 105.90ms | 91.13ms | 104.84ms | 122.85ms | 89.33ms (fail) |
| unstable | 341.18ms | 78.06ms | 58.68ms | 72.94ms | 107.15ms | 340.34ms (fail) |
| molBench | 639.90ms | 547.70ms | 560.77ms | 547.41ms | 568.33ms | 990μs |
| create_signals | 76.76ms | 28.32ms | 22.07ms | 5.63ms | 97.62ms | 63.40ms |
| comp_0to1 | 27.04ms | 15.33ms | 8.08ms | 20.59ms | 35.64ms | 54.68ms |
| comp_1to1 | 39.54ms | 35.83ms | 4.01ms | 13.62ms | 46.63ms | 53.44ms |
| comp_2to1 | 24.98ms | 24.85ms | 2.22ms | 18.51ms | 42.99ms | 36.69ms |
| comp_4to1 | 19.83ms | 15.77ms | 9.21ms | 23.18ms | 15.39ms | 17.39ms |
| comp_1000to1 | 15μs | 6μs | 3μs | 26μs | 17μs | 38μs |
| comp_1to2 | 36.08ms | 12.50ms | 15.14ms | 19.57ms | 28.84ms | 46.53ms |
| comp_1to4 | 17.37ms | 13.88ms | 4.96ms | 12.54ms | 21.11ms | 44.20ms |
| comp_1to8 | 19.27ms | 11.01ms | 6.11ms | 7.33ms | 21.79ms | 41.28ms |
| comp_1to1000 | 14.64ms | 4.27ms | 3.41ms | 3.81ms | 14.28ms | 36.03ms |
| update_1to1 | 23.53ms | 9.48ms | 4.76ms | 9.67ms | 18.17ms | 5.97ms |
| update_2to1 | 11.41ms | 4.97ms | 2.46ms | 4.80ms | 8.38ms | 3.01ms |
| update_4to1 | 5.88ms | 2.38ms | 1.23ms | 2.41ms | 4.17ms | 1.54ms |
| update_1000to1 | 56μs | 23μs | 11μs | 23μs | 41μs | 15μs |
| update_1to2 | 11.46ms | 4.75ms | 2.36ms | 4.71ms | 8.54ms | 3.01ms |
| update_1to4 | 5.70ms | 2.38ms | 1.15ms | 2.40ms | 4.17ms | 1.51ms |
| update_1to1000 | 168μs | 49μs | 27μs | 46μs | 143μs | 352μs |
| cellx1000 | 75.29ms | 9.48ms | 7.34ms | 10.19ms | 11.65ms | 4.97ms |
| cellx2500 | 263.49ms | 26.23ms | 19.18ms | 32.08ms | 37.36ms | 23.11ms |
| cellx5000 | 605.39ms | 84.14ms | 47.89ms | 74.28ms | 91.57ms | 67.82ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.00s | 503.08ms | 249.35ms | 435.97ms | 374.72ms | 245.05ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.42s | 273.21ms | 199.39ms | 263.24ms | 270.57ms | 204.49ms |
| 1000x12 - 4 sources - dynamic (large) | 1.84s | 3.79s | 269.82ms | 3.61s | 427.17ms | 297.39ms |
| 1000x5 - 25 sources (wide dense) | 3.46s | 3.44s | 417.83ms | 2.74s | 636.92ms | 462.96ms |
| 5x500 - 3 sources (deep) | 1.14s | 229.91ms | 195.42ms | 233.24ms | 263.95ms | 200.81ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.69s | 468.30ms | 236.35ms | 444.15ms | 341.52ms | 237.10ms |

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
