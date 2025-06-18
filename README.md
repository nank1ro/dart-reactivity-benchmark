# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.65 | 100.0% | 35/35 | 3.88s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.44s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.42s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 11.17s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.37s |
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
| Test Case | solidart(2.0-dev) | signals | mobx | preact_signals | state_beacon | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 276.25ms | 209.43ms | 2.40s | 204.84ms | 171.72ms (fail) | 184.25ms |
| broadPropagation | 498.16ms | 449.37ms | 4.56s | 451.25ms | 6.01ms (fail) | 345.32ms |
| deepPropagation | 165.90ms | 169.10ms | 1.57s | 176.84ms | 152.28ms (fail) | 122.93ms |
| diamond | 350.30ms | 279.84ms | 2.46s | 279.99ms | 183.55ms (fail) | 233.99ms |
| mux | 449.50ms | 449.52ms | 1.87s | 405.56ms | 198.75ms (fail) | 379.04ms |
| repeatedObservers | 82.65ms | 44.45ms | 242.87ms | 40.79ms | 53.20ms (fail) | 45.58ms |
| triangle | 119.18ms | 101.61ms | 800.93ms | 99.24ms | 75.72ms (fail) | 86.17ms |
| unstable | 98.14ms | 79.27ms | 362.91ms | 70.73ms | 337.54ms (fail) | 68.47ms |
| molBench | 494.85ms | 487.70ms | 583.94ms | 489.74ms | 872μs | 489.95ms |
| create_signals | 57.86ms | 44.02ms | 82.84ms | 5.37ms | 60.76ms | 29.82ms |
| comp_0to1 | 28.78ms | 17.85ms | 21.85ms | 17.64ms | 54.78ms | 8.17ms |
| comp_1to1 | 35.03ms | 30.59ms | 29.72ms | 11.43ms | 63.66ms | 4.29ms |
| comp_2to1 | 39.53ms | 9.71ms | 9.15ms | 11.90ms | 39.96ms | 2.41ms |
| comp_4to1 | 16.00ms | 2.25ms | 29.87ms | 9.38ms | 18.67ms | 8.76ms |
| comp_1000to1 | 21μs | 5μs | 19μs | 4μs | 41μs | 5μs |
| comp_1to2 | 30.61ms | 26.46ms | 37.96ms | 26.24ms | 47.12ms | 15.18ms |
| comp_1to4 | 27.87ms | 12.94ms | 25.26ms | 25.27ms | 44.45ms | 11.35ms |
| comp_1to8 | 27.46ms | 7.27ms | 23.61ms | 16.39ms | 43.37ms | 5.40ms |
| comp_1to1000 | 16.99ms | 4.30ms | 16.23ms | 6.02ms | 38.43ms | 3.67ms |
| update_1to1 | 16.18ms | 8.90ms | 26.34ms | 8.64ms | 5.64ms | 10.49ms |
| update_2to1 | 7.98ms | 4.50ms | 11.70ms | 4.42ms | 3.14ms | 2.35ms |
| update_4to1 | 4.02ms | 2.23ms | 6.80ms | 2.19ms | 1.46ms | 2.54ms |
| update_1000to1 | 40μs | 22μs | 81μs | 21μs | 15μs | 24μs |
| update_1to2 | 8.09ms | 4.48ms | 11.08ms | 4.60ms | 2.83ms | 5.10ms |
| update_1to4 | 4.04ms | 2.24ms | 6.47ms | 2.19ms | 1.45ms | 2.47ms |
| update_1to1000 | 170μs | 44μs | 189μs | 57μs | 377μs | 54μs |
| cellx1000 | 14.91ms | 12.82ms | 94.64ms | 10.92ms | 7.16ms | 8.56ms |
| cellx2500 | 61.65ms | 45.01ms | 300.11ms | 43.59ms | 35.62ms | 29.62ms |
| cellx5000 | 178.92ms | 110.62ms | 618.97ms | 127.17ms | 85.53ms | 75.61ms |
| 10x5 - 2 sources - read 20.0% (simple) | 352.33ms | 510.49ms | 2.03s | 431.80ms | 245.68ms | 284.19ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 242.94ms | 299.43ms | 1.51s | 275.70ms | 197.77ms | 204.42ms |
| 1000x12 - 4 sources - dynamic (large) | 474.64ms | 3.49s | 1.97s | 3.76s | 365.26ms | 297.91ms |
| 1000x5 - 25 sources (wide dense) | 591.76ms | 3.53s | 3.68s | 2.74s | 506.48ms | 435.16ms |
| 5x500 - 3 sources (deep) | 256.92ms | 228.19ms | 1.24s | 226.79ms | 206.36ms | 201.26ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 390.77ms | 496.59ms | 1.73s | 455.58ms | 264.75ms | 276.38ms |

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
