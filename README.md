# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.68s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 9.99s |
| 🥉 | signals | 0.28 | 100.0% | 35/35 | 11.08s |
| 4 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.42s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.31s |
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
| Test Case | preact_signals | state_beacon | signals | alien_signals | mobx | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 202.84ms | 145.46ms (fail) | 200.17ms | 185.67ms | 2.42s | 274.70ms |
| broadPropagation | 444.61ms | 6.09ms (fail) | 512.41ms | 343.61ms | 4.43s | 513.42ms |
| deepPropagation | 175.35ms | 136.25ms (fail) | 173.28ms | 127.70ms | 1.54s | 173.68ms |
| diamond | 278.20ms | 179.31ms (fail) | 284.99ms | 231.32ms | 2.39s | 356.88ms |
| mux | 383.18ms | 194.34ms (fail) | 393.01ms | 357.96ms | 1.78s | 434.64ms |
| repeatedObservers | 40.97ms | 53.05ms (fail) | 45.86ms | 43.22ms | 231.43ms | 80.04ms |
| triangle | 98.87ms | 79.32ms (fail) | 100.58ms | 84.49ms | 747.24ms | 114.20ms |
| unstable | 73.11ms | 337.53ms (fail) | 74.43ms | 59.70ms | 350.09ms | 96.88ms |
| molBench | 486.56ms | 1.41ms | 497.17ms | 487.31ms | 591.55ms | 492.46ms |
| create_signals | 5.44ms | 70.17ms | 25.28ms | 28.92ms | 94.65ms | 97.33ms |
| comp_0to1 | 17.53ms | 57.46ms | 10.78ms | 11.19ms | 27.99ms | 36.00ms |
| comp_1to1 | 18.62ms | 62.41ms | 18.35ms | 11.06ms | 44.35ms | 46.46ms |
| comp_2to1 | 22.71ms | 38.83ms | 17.82ms | 2.40ms | 43.54ms | 38.54ms |
| comp_4to1 | 11.25ms | 16.75ms | 3.33ms | 10.54ms | 28.62ms | 20.82ms |
| comp_1000to1 | 6μs | 44μs | 5μs | 3μs | 30μs | 14μs |
| comp_1to2 | 32.01ms | 46.76ms | 22.13ms | 16.21ms | 44.09ms | 34.23ms |
| comp_1to4 | 25.96ms | 47.06ms | 15.83ms | 9.06ms | 18.43ms | 14.78ms |
| comp_1to8 | 10.16ms | 44.39ms | 6.37ms | 5.63ms | 20.76ms | 20.46ms |
| comp_1to1000 | 4.66ms | 40.23ms | 3.93ms | 3.84ms | 15.57ms | 14.35ms |
| update_1to1 | 9.81ms | 5.77ms | 9.76ms | 10.01ms | 24.93ms | 15.98ms |
| update_2to1 | 4.60ms | 2.96ms | 4.97ms | 2.29ms | 12.93ms | 7.77ms |
| update_4to1 | 2.39ms | 1.48ms | 2.42ms | 2.49ms | 7.24ms | 3.98ms |
| update_1000to1 | 39μs | 15μs | 24μs | 10μs | 68μs | 38μs |
| update_1to2 | 4.81ms | 2.91ms | 4.87ms | 4.96ms | 13.69ms | 8.30ms |
| update_1to4 | 2.32ms | 1.53ms | 2.47ms | 1.82ms | 6.97ms | 4.01ms |
| update_1to1000 | 38μs | 382μs | 41μs | 50μs | 204μs | 144μs |
| cellx1000 | 12.34ms | 7.15ms | 9.78ms | 7.47ms | 81.26ms | 14.43ms |
| cellx2500 | 28.02ms | 31.55ms | 32.65ms | 20.42ms | 283.87ms | 50.82ms |
| cellx5000 | 69.61ms | 85.11ms | 64.56ms | 42.61ms | 601.12ms | 129.94ms |
| 10x5 - 2 sources - read 20.0% (simple) | 439.87ms | 247.85ms | 518.89ms | 234.85ms | 1.91s | 352.16ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.11ms | 202.96ms | 285.93ms | 174.31ms | 1.47s | 250.53ms |
| 1000x12 - 4 sources - dynamic (large) | 3.56s | 350.50ms | 3.65s | 284.68ms | 1.86s | 475.09ms |
| 1000x5 - 25 sources (wide dense) | 2.57s | 516.51ms | 3.37s | 418.26ms | 3.41s | 611.68ms |
| 5x500 - 3 sources (deep) | 228.21ms | 206.99ms | 223.35ms | 188.85ms | 1.13s | 249.75ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 447.59ms | 260.68ms | 485.81ms | 264.24ms | 1.68s | 386.56ms |

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
