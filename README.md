# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.72s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 9.97s |
| 🥉 | signals | 0.28 | 100.0% | 35/35 | 11.24s |
| 4 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.41s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.85s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.48s |

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
| avoidablePropagation | 270.11ms | 204.73ms | 2.35s | 184.22ms | 210.54ms | 149.25ms (fail) |
| broadPropagation | 497.06ms | 467.58ms | 4.39s | 353.89ms | 454.25ms | 5.95ms (fail) |
| deepPropagation | 167.68ms | 178.51ms | 1.57s | 122.49ms | 167.43ms | 137.44ms (fail) |
| diamond | 347.03ms | 277.96ms | 2.50s | 238.06ms | 289.12ms | 199.34ms (fail) |
| mux | 433.68ms | 388.49ms | 1.86s | 372.90ms | 410.11ms | 189.43ms (fail) |
| repeatedObservers | 77.83ms | 38.29ms | 233.88ms | 45.14ms | 46.47ms | 52.18ms (fail) |
| triangle | 117.03ms | 99.20ms | 791.48ms | 86.96ms | 104.17ms | 82.36ms (fail) |
| unstable | 93.67ms | 70.25ms | 352.69ms | 60.50ms | 75.38ms | 344.50ms (fail) |
| molBench | 493.21ms | 492.23ms | 580.50ms | 491.39ms | 488.05ms | 1.09ms |
| create_signals | 99.54ms | 17.24ms | 67.74ms | 26.04ms | 26.20ms | 67.11ms |
| comp_0to1 | 33.95ms | 15.41ms | 25.91ms | 11.33ms | 12.25ms | 56.79ms |
| comp_1to1 | 45.95ms | 7.09ms | 30.56ms | 9.96ms | 18.91ms | 57.80ms |
| comp_2to1 | 44.28ms | 9.97ms | 33.01ms | 6.72ms | 17.39ms | 39.60ms |
| comp_4to1 | 17.30ms | 8.85ms | 17.26ms | 6.98ms | 6.12ms | 18.35ms |
| comp_1000to1 | 15μs | 5μs | 21μs | 3μs | 5μs | 41μs |
| comp_1to2 | 36.58ms | 16.63ms | 34.68ms | 13.72ms | 18.51ms | 47.79ms |
| comp_1to4 | 20.66ms | 26.27ms | 19.92ms | 8.64ms | 7.26ms | 44.10ms |
| comp_1to8 | 25.05ms | 7.84ms | 24.40ms | 3.56ms | 6.58ms | 44.09ms |
| comp_1to1000 | 15.13ms | 7.41ms | 14.96ms | 3.48ms | 4.48ms | 37.83ms |
| update_1to1 | 16.07ms | 8.29ms | 23.79ms | 11.30ms | 9.20ms | 5.73ms |
| update_2to1 | 8.90ms | 4.05ms | 10.78ms | 5.12ms | 4.56ms | 2.88ms |
| update_4to1 | 4.51ms | 2.04ms | 6.32ms | 2.81ms | 2.33ms | 1.43ms |
| update_1000to1 | 40μs | 20μs | 57μs | 10μs | 23μs | 15μs |
| update_1to2 | 8.13ms | 4.05ms | 12.59ms | 5.59ms | 6.20ms | 2.94ms |
| update_1to4 | 3.97ms | 2.15ms | 5.77ms | 2.46ms | 2.33ms | 1.44ms |
| update_1to1000 | 152μs | 828μs | 164μs | 44μs | 46μs | 395μs |
| cellx1000 | 13.64ms | 10.26ms | 71.20ms | 9.24ms | 9.87ms | 5.60ms |
| cellx2500 | 53.23ms | 32.14ms | 240.28ms | 20.40ms | 34.18ms | 30.89ms |
| cellx5000 | 143.72ms | 95.25ms | 552.36ms | 51.55ms | 73.68ms | 86.99ms |
| 10x5 - 2 sources - read 20.0% (simple) | 353.04ms | 442.86ms | 2.10s | 230.27ms | 514.71ms | 243.07ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 248.95ms | 273.30ms | 1.58s | 177.69ms | 278.95ms | 201.91ms |
| 1000x12 - 4 sources - dynamic (large) | 473.63ms | 3.50s | 1.86s | 283.18ms | 3.82s | 345.61ms |
| 1000x5 - 25 sources (wide dense) | 601.94ms | 2.59s | 3.59s | 417.16ms | 3.41s | 505.38ms |
| 5x500 - 3 sources (deep) | 266.17ms | 229.55ms | 1.20s | 189.60ms | 226.36ms | 207.61ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 380.86ms | 444.59ms | 1.71s | 270.53ms | 475.71ms | 261.52ms |

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
