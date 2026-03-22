# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.28s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 10.77s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.40s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.71s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.44s |

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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 198.93ms | 2.29s | 174.73ms (fail) | 193.01ms | 200.94ms | 274.59ms |
| broadPropagation | 461.77ms | 4.28s | 6.60ms (fail) | 355.60ms | 448.92ms | 510.50ms |
| deepPropagation | 169.28ms | 1.51s | 138.87ms (fail) | 127.67ms | 174.11ms | 168.79ms |
| diamond | 285.41ms | 2.39s | 190.05ms (fail) | 245.68ms | 282.79ms | 339.54ms |
| mux | 393.92ms | 1.76s | 177.54ms (fail) | 363.55ms | 370.25ms | 420.95ms |
| repeatedObservers | 46.78ms | 225.31ms | 55.72ms (fail) | 45.59ms | 41.67ms | 80.44ms |
| triangle | 101.39ms | 758.81ms | 75.55ms (fail) | 88.63ms | 99.58ms | 113.04ms |
| unstable | 76.25ms | 341.60ms | 335.81ms (fail) | 61.43ms | 70.84ms | 97.89ms |
| molBench | 489.74ms | 583.74ms | 1.07ms | 487.42ms | 494.93ms | 493.67ms |
| create_signals | 30.42ms | 79.47ms | 66.36ms | 28.27ms | 5.50ms | 99.78ms |
| comp_0to1 | 10.88ms | 30.19ms | 62.12ms | 8.68ms | 18.75ms | 35.15ms |
| comp_1to1 | 24.26ms | 45.12ms | 58.53ms | 4.31ms | 13.55ms | 52.48ms |
| comp_2to1 | 8.08ms | 23.89ms | 38.06ms | 2.31ms | 21.08ms | 36.40ms |
| comp_4to1 | 9.04ms | 33.24ms | 17.29ms | 7.89ms | 16.46ms | 11.20ms |
| comp_1000to1 | 5μs | 25μs | 46μs | 3μs | 5μs | 15μs |
| comp_1to2 | 16.90ms | 40.61ms | 49.61ms | 18.91ms | 18.41ms | 48.14ms |
| comp_1to4 | 10.42ms | 17.66ms | 53.72ms | 9.28ms | 28.89ms | 19.94ms |
| comp_1to8 | 6.58ms | 20.41ms | 48.08ms | 3.71ms | 7.37ms | 19.51ms |
| comp_1to1000 | 4.14ms | 14.74ms | 43.56ms | 3.48ms | 4.63ms | 14.10ms |
| update_1to1 | 8.92ms | 21.01ms | 7.95ms | 4.66ms | 8.94ms | 15.67ms |
| update_2to1 | 4.43ms | 10.32ms | 2.85ms | 2.35ms | 4.56ms | 7.91ms |
| update_4to1 | 2.29ms | 5.98ms | 1.94ms | 1.16ms | 2.26ms | 3.96ms |
| update_1000to1 | 22μs | 60μs | 14μs | 11μs | 31μs | 39μs |
| update_1to2 | 4.46ms | 10.49ms | 4.64ms | 2.34ms | 4.51ms | 8.04ms |
| update_1to4 | 2.25ms | 5.18ms | 1.49ms | 1.15ms | 2.36ms | 3.94ms |
| update_1to1000 | 41μs | 171μs | 427μs | 28μs | 156μs | 147μs |
| cellx1000 | 9.83ms | 70.99ms | 5.41ms | 7.79ms | 10.89ms | 11.40ms |
| cellx2500 | 32.39ms | 241.59ms | 23.56ms | 19.56ms | 26.27ms | 31.02ms |
| cellx5000 | 59.92ms | 571.70ms | 66.92ms | 41.44ms | 65.22ms | 66.95ms |
| 10x5 - 2 sources - read 20.0% (simple) | 514.43ms | 1.98s | 235.89ms | 239.49ms | 464.30ms | 350.64ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 282.46ms | 1.47s | 199.25ms | 179.12ms | 274.48ms | 250.43ms |
| 1000x12 - 4 sources - dynamic (large) | 3.57s | 1.77s | 335.09ms | 278.55ms | 3.76s | 451.45ms |
| 1000x5 - 25 sources (wide dense) | 3.23s | 3.33s | 499.23ms | 409.07ms | 2.78s | 598.03ms |
| 5x500 - 3 sources (deep) | 232.32ms | 1.11s | 204.29ms | 191.86ms | 233.64ms | 261.48ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 472.57ms | 1.67s | 257.81ms | 263.66ms | 449.40ms | 379.87ms |

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
