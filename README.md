# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.74s |
| 🥈 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.36s |
| 🥉 | signals | 0.24 | 100.0% | 35/35 | 11.08s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 9.87s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.59s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.34s |

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
| Test Case | preact_signals | state_beacon | signals | alien_signals | mobx | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 215.57ms | 159.33ms (fail) | 210.16ms | 184.57ms | 2.28s | 264.75ms |
| broadPropagation | 523.58ms | 7.88ms (fail) | 475.16ms | 355.55ms | 4.18s | 487.35ms |
| deepPropagation | 194.79ms | 157.79ms (fail) | 180.43ms | 118.64ms | 1.48s | 163.17ms |
| diamond | 283.73ms | 186.55ms (fail) | 286.91ms | 263.39ms | 2.24s | 377.95ms |
| mux | 382.76ms | 186.73ms (fail) | 391.96ms | 362.21ms | 1.71s | 425.39ms |
| repeatedObservers | 41.37ms | 54.20ms (fail) | 46.53ms | 42.89ms | 230.79ms | 87.55ms |
| triangle | 105.72ms | 80.77ms (fail) | 106.51ms | 91.92ms | 718.89ms | 121.12ms |
| unstable | 72.89ms | 342.13ms (fail) | 84.08ms | 59.86ms | 342.07ms | 107.57ms |
| molBench | 546.81ms | 1.04ms | 547.63ms | 551.78ms | 639.48ms | 560.30ms |
| create_signals | 5.64ms | 59.73ms | 27.80ms | 28.78ms | 96.17ms | 58.58ms |
| comp_0to1 | 20.41ms | 52.96ms | 12.14ms | 8.89ms | 15.58ms | 26.84ms |
| comp_1to1 | 21.51ms | 54.23ms | 32.71ms | 4.15ms | 48.15ms | 30.21ms |
| comp_2to1 | 17.30ms | 37.63ms | 12.45ms | 2.16ms | 35.97ms | 35.94ms |
| comp_4to1 | 12.78ms | 15.75ms | 3.13ms | 14.39ms | 18.70ms | 14.59ms |
| comp_1000to1 | 4μs | 39μs | 6μs | 4μs | 15μs | 15μs |
| comp_1to2 | 20.13ms | 44.03ms | 25.48ms | 17.28ms | 38.34ms | 28.83ms |
| comp_1to4 | 33.22ms | 44.12ms | 7.50ms | 5.82ms | 16.81ms | 27.39ms |
| comp_1to8 | 7.57ms | 41.10ms | 6.07ms | 3.98ms | 18.99ms | 23.33ms |
| comp_1to1000 | 6.47ms | 36.34ms | 3.96ms | 3.43ms | 15.73ms | 14.78ms |
| update_1to1 | 8.46ms | 6.15ms | 10.58ms | 4.39ms | 23.25ms | 16.35ms |
| update_2to1 | 4.23ms | 3.17ms | 5.31ms | 2.27ms | 11.40ms | 8.16ms |
| update_4to1 | 2.22ms | 1.59ms | 2.64ms | 1.09ms | 6.66ms | 4.11ms |
| update_1000to1 | 32μs | 16μs | 28μs | 11μs | 56μs | 40μs |
| update_1to2 | 4.18ms | 3.06ms | 5.41ms | 2.26ms | 11.60ms | 8.33ms |
| update_1to4 | 2.14ms | 1.57ms | 2.63ms | 1.09ms | 5.71ms | 4.08ms |
| update_1to1000 | 652μs | 355μs | 40μs | 27μs | 166μs | 143μs |
| cellx1000 | 10.02ms | 4.72ms | 9.53ms | 6.99ms | 72.33ms | 11.56ms |
| cellx2500 | 27.25ms | 20.91ms | 32.75ms | 20.06ms | 267.90ms | 32.67ms |
| cellx5000 | 71.72ms | 69.64ms | 65.95ms | 43.69ms | 598.46ms | 82.27ms |
| 10x5 - 2 sources - read 20.0% (simple) | 429.13ms | 256.50ms | 486.37ms | 241.86ms | 1.98s | 383.86ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 260.21ms | 200.71ms | 271.31ms | 184.41ms | 1.40s | 271.24ms |
| 1000x12 - 4 sources - dynamic (large) | 3.35s | 312.84ms | 3.69s | 264.77ms | 1.83s | 428.60ms |
| 1000x5 - 25 sources (wide dense) | 2.52s | 462.98ms | 3.34s | 414.26ms | 3.45s | 638.66ms |
| 5x500 - 3 sources (deep) | 233.81ms | 202.99ms | 227.75ms | 191.26ms | 1.13s | 266.63ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 437.98ms | 234.57ms | 469.89ms | 239.31ms | 1.67s | 346.04ms |

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
