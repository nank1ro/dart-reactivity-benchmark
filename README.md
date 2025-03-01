# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.26s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.40s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 9.98s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.90s |
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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 274.44ms | 205.91ms | 2.34s | 187.03ms | 206.42ms | 157.09ms (fail) |
| broadPropagation | 500.75ms | 455.85ms | 4.31s | 362.67ms | 460.69ms | 6.24ms (fail) |
| deepPropagation | 166.53ms | 178.97ms | 1.55s | 124.80ms | 178.59ms | 136.63ms (fail) |
| diamond | 352.40ms | 281.56ms | 2.42s | 234.76ms | 296.38ms | 194.01ms (fail) |
| mux | 444.38ms | 388.72ms | 1.81s | 370.82ms | 410.71ms | 189.87ms (fail) |
| repeatedObservers | 79.57ms | 38.42ms | 237.19ms | 46.75ms | 46.56ms | 56.19ms (fail) |
| triangle | 115.88ms | 99.09ms | 791.50ms | 85.90ms | 103.40ms | 78.21ms (fail) |
| unstable | 94.56ms | 70.97ms | 360.43ms | 60.83ms | 72.33ms | 340.12ms (fail) |
| molBench | 492.60ms | 491.37ms | 580.05ms | 490.96ms | 485.85ms | 1.26ms |
| create_signals | 71.28ms | 4.64ms | 52.36ms | 26.43ms | 24.68ms | 59.42ms |
| comp_0to1 | 28.35ms | 17.39ms | 14.98ms | 7.97ms | 12.10ms | 53.86ms |
| comp_1to1 | 39.01ms | 11.69ms | 44.27ms | 4.16ms | 27.67ms | 54.69ms |
| comp_2to1 | 23.98ms | 16.91ms | 34.38ms | 2.33ms | 12.23ms | 37.06ms |
| comp_4to1 | 15.13ms | 9.60ms | 17.73ms | 7.62ms | 3.33ms | 16.42ms |
| comp_1000to1 | 15μs | 5μs | 15μs | 3μs | 5μs | 45μs |
| comp_1to2 | 31.93ms | 16.45ms | 33.84ms | 11.30ms | 14.12ms | 51.26ms |
| comp_1to4 | 20.37ms | 29.88ms | 19.26ms | 12.62ms | 11.43ms | 45.15ms |
| comp_1to8 | 23.46ms | 8.14ms | 23.14ms | 4.06ms | 6.83ms | 44.94ms |
| comp_1to1000 | 14.86ms | 8.40ms | 15.27ms | 3.23ms | 4.51ms | 40.26ms |
| update_1to1 | 16.23ms | 8.34ms | 23.88ms | 9.50ms | 9.18ms | 5.73ms |
| update_2to1 | 7.92ms | 4.08ms | 12.43ms | 5.04ms | 4.59ms | 2.88ms |
| update_4to1 | 4.04ms | 2.08ms | 6.36ms | 2.81ms | 2.33ms | 1.46ms |
| update_1000to1 | 40μs | 20μs | 81μs | 27μs | 23μs | 15μs |
| update_1to2 | 8.14ms | 6.78ms | 11.64ms | 5.63ms | 4.90ms | 2.97ms |
| update_1to4 | 4.04ms | 2.12ms | 5.84ms | 2.48ms | 2.31ms | 1.51ms |
| update_1to1000 | 152μs | 2.50ms | 171μs | 35μs | 45μs | 393μs |
| cellx1000 | 12.29ms | 9.68ms | 76.89ms | 7.51ms | 9.68ms | 5.62ms |
| cellx2500 | 34.26ms | 30.15ms | 266.47ms | 20.26ms | 33.28ms | 27.47ms |
| cellx5000 | 78.28ms | 80.77ms | 596.13ms | 46.15ms | 60.16ms | 60.10ms |
| 10x5 - 2 sources - read 20.0% (simple) | 349.07ms | 439.46ms | 2.06s | 234.87ms | 504.23ms | 246.70ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 247.45ms | 275.38ms | 1.62s | 177.37ms | 279.30ms | 201.54ms |
| 1000x12 - 4 sources - dynamic (large) | 469.33ms | 3.52s | 1.94s | 278.28ms | 3.80s | 338.14ms |
| 1000x5 - 25 sources (wide dense) | 599.01ms | 2.59s | 3.69s | 404.19ms | 3.60s | 501.50ms |
| 5x500 - 3 sources (deep) | 257.08ms | 229.49ms | 1.16s | 190.28ms | 228.14ms | 207.23ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 378.84ms | 452.15ms | 1.77s | 263.05ms | 479.24ms | 258.43ms |

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
