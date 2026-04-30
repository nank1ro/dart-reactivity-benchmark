# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.71s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 10.94s |
| 🥉 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.38s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.59s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.04s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| avoidablePropagation | 2.27s | 201.39ms | 200.00ms | 209.71ms | 276.48ms | 148.51ms (fail) |
| broadPropagation | 4.31s | 468.12ms | 357.40ms | 454.69ms | 493.65ms | 5.87ms (fail) |
| deepPropagation | 1.54s | 168.64ms | 128.43ms | 181.77ms | 166.79ms | 137.01ms (fail) |
| diamond | 2.34s | 287.37ms | 240.28ms | 283.31ms | 353.18ms | 179.09ms (fail) |
| mux | 1.79s | 412.22ms | 362.07ms | 376.83ms | 429.74ms | 180.12ms (fail) |
| repeatedObservers | 228.87ms | 45.72ms | 46.29ms | 42.22ms | 80.85ms | 55.98ms (fail) |
| triangle | 756.02ms | 99.72ms | 89.44ms | 100.09ms | 113.11ms | 77.38ms (fail) |
| unstable | 344.81ms | 76.04ms | 61.68ms | 72.41ms | 95.79ms | 334.81ms (fail) |
| molBench | 589.29ms | 494.34ms | 481.57ms | 496.85ms | 490.51ms | 1.07ms |
| create_signals | 71.66ms | 25.55ms | 26.77ms | 5.53ms | 94.82ms | 59.97ms |
| comp_0to1 | 26.90ms | 11.47ms | 6.92ms | 18.13ms | 33.99ms | 54.18ms |
| comp_1to1 | 44.82ms | 24.90ms | 4.16ms | 12.39ms | 51.35ms | 55.57ms |
| comp_2to1 | 21.43ms | 15.80ms | 2.28ms | 9.32ms | 22.95ms | 36.70ms |
| comp_4to1 | 18.33ms | 3.74ms | 8.37ms | 14.19ms | 18.95ms | 16.68ms |
| comp_1000to1 | 20μs | 4μs | 3μs | 4μs | 27μs | 45μs |
| comp_1to2 | 36.76ms | 15.16ms | 12.97ms | 29.89ms | 42.05ms | 45.95ms |
| comp_1to4 | 24.16ms | 22.71ms | 9.04ms | 23.52ms | 19.37ms | 45.62ms |
| comp_1to8 | 25.14ms | 6.51ms | 4.89ms | 9.03ms | 25.68ms | 44.23ms |
| comp_1to1000 | 15.35ms | 6.33ms | 3.54ms | 8.37ms | 14.58ms | 39.63ms |
| update_1to1 | 21.50ms | 8.94ms | 4.69ms | 9.30ms | 15.60ms | 9.14ms |
| update_2to1 | 10.46ms | 4.47ms | 2.37ms | 4.61ms | 7.84ms | 2.83ms |
| update_4to1 | 5.35ms | 2.36ms | 1.25ms | 2.34ms | 3.91ms | 2.39ms |
| update_1000to1 | 52μs | 22μs | 22μs | 23μs | 39μs | 14μs |
| update_1to2 | 10.41ms | 4.44ms | 2.35ms | 4.56ms | 7.83ms | 4.56ms |
| update_1to4 | 5.21ms | 2.25ms | 1.21ms | 2.47ms | 4.16ms | 1.44ms |
| update_1to1000 | 157μs | 61μs | 46μs | 911μs | 147μs | 381μs |
| cellx1000 | 91.40ms | 10.87ms | 7.33ms | 10.90ms | 13.55ms | 5.62ms |
| cellx2500 | 271.55ms | 28.53ms | 19.64ms | 35.94ms | 52.14ms | 28.65ms |
| cellx5000 | 597.84ms | 71.78ms | 44.73ms | 96.73ms | 141.06ms | 72.06ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.99s | 513.33ms | 235.81ms | 483.56ms | 350.15ms | 237.72ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.50s | 281.76ms | 191.83ms | 274.04ms | 248.48ms | 198.84ms |
| 1000x12 - 4 sources - dynamic (large) | 1.87s | 3.74s | 274.89ms | 3.83s | 467.21ms | 385.84ms |
| 1000x5 - 25 sources (wide dense) | 3.39s | 3.19s | 415.17ms | 2.80s | 603.67ms | 519.00ms |
| 5x500 - 3 sources (deep) | 1.14s | 223.04ms | 197.38ms | 235.29ms | 255.28ms | 211.20ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.67s | 478.94ms | 262.82ms | 452.40ms | 389.86ms | 263.02ms |

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
