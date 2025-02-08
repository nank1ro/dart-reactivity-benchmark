# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.77 | 100.0% | 35/35 | 3.69s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 9.72s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.07s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.07s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.47s |
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
| avoidablePropagation | 2.17s | 2.30s | 167.61ms (fail) | 211.63ms | 187.52ms | 209.76ms |
| broadPropagation | 5.44s | 4.34s | 6.78ms (fail) | 455.71ms | 347.04ms | 456.88ms |
| deepPropagation | 2.02s | 1.54s | 143.91ms (fail) | 173.54ms | 125.72ms | 173.98ms |
| diamond | 3.41s | 2.39s | 207.75ms (fail) | 292.23ms | 236.23ms | 278.26ms |
| mux | 2.06s | 1.80s | 197.46ms (fail) | 412.77ms | 377.85ms | 385.79ms |
| repeatedObservers | 211.41ms | 230.87ms | 55.42ms (fail) | 44.96ms | 43.89ms | 41.68ms |
| triangle | 1.13s | 759.40ms | 79.76ms (fail) | 101.91ms | 86.30ms | 98.88ms |
| unstable | 342.06ms | 353.49ms | 337.45ms (fail) | 77.34ms | 60.25ms | 69.87ms |
| molBench | 1.74s | 587.90ms | 1.15ms | 486.21ms | 486.75ms | 483.58ms |
| create_signals | 73.07ms | 68.58ms | 63.22ms | 30.22ms | 20.40ms | 4.65ms |
| comp_0to1 | 30.65ms | 23.41ms | 54.52ms | 13.19ms | 5.01ms | 17.29ms |
| comp_1to1 | 40.96ms | 23.04ms | 53.60ms | 22.56ms | 11.02ms | 16.21ms |
| comp_2to1 | 21.52ms | 9.20ms | 33.99ms | 9.37ms | 14.18ms | 9.21ms |
| comp_4to1 | 13.11ms | 29.70ms | 17.83ms | 1.93ms | 2.43ms | 16.17ms |
| comp_1000to1 | 1.80ms | 38μs | 43μs | 6μs | 3μs | 5μs |
| comp_1to2 | 21.16ms | 29.89ms | 47.32ms | 13.19ms | 8.70ms | 27.94ms |
| comp_1to4 | 39.19ms | 19.43ms | 44.79ms | 14.79ms | 7.72ms | 21.18ms |
| comp_1to8 | 28.90ms | 26.83ms | 43.66ms | 7.17ms | 4.48ms | 11.49ms |
| comp_1to1000 | 19.27ms | 21.32ms | 40.84ms | 8.45ms | 3.69ms | 6.82ms |
| update_1to1 | 43.69ms | 26.04ms | 8.87ms | 11.90ms | 4.38ms | 10.58ms |
| update_2to1 | 21.95ms | 13.06ms | 2.90ms | 4.69ms | 3.32ms | 4.58ms |
| update_4to1 | 10.96ms | 6.66ms | 2.96ms | 2.36ms | 1.09ms | 2.26ms |
| update_1000to1 | 116μs | 69μs | 15μs | 23μs | 10μs | 21μs |
| update_1to2 | 21.98ms | 10.56ms | 4.35ms | 4.77ms | 2.18ms | 4.38ms |
| update_1to4 | 10.99ms | 7.02ms | 1.48ms | 2.36ms | 1.09ms | 2.21ms |
| update_1to1000 | 223μs | 164μs | 393μs | 45μs | 30μs | 40μs |
| cellx1000 | 166.63ms | 71.84ms | 5.37ms | 9.85ms | 7.53ms | 9.59ms |
| cellx2500 | 477.03ms | 244.70ms | 20.55ms | 34.03ms | 20.41ms | 25.48ms |
| cellx5000 | 1.06s | 548.20ms | 58.21ms | 68.87ms | 46.07ms | 65.22ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.66s (partial) | 2.00s | 264.11ms | 508.36ms | 234.52ms | 424.72ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.38s (partial) | 1.50s | 209.82ms | 277.36ms | 181.56ms | 272.86ms |
| 1000x12 - 4 sources - dynamic (large) | 4.05s (partial) | 1.80s | 350.51ms | 3.67s | 287.21ms | 3.36s |
| 1000x5 - 25 sources (wide dense) | 4.92s (partial) | 3.49s | 529.98ms | 3.38s | 413.77ms | 2.53s |
| 5x500 - 3 sources (deep) | 2.06s (partial) | 1.11s | 235.67ms | 230.19ms | 194.82ms | 225.17ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.78s (partial) | 1.68s | 268.11ms | 488.14ms | 264.87ms | 448.78ms |

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
