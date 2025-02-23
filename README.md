# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.69s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.17s |
| 🥉 | preact_signals | 0.25 | 100.0% | 35/35 | 10.00s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.45s |
| 5 | solidart(2.0-dev) | 0.04 | 100.0% | 35/35 | 39.00s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.39s |

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
| Test Case | alien_signals | mobx | solidart(2.0-dev) | state_beacon | preact_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 187.24ms | 2.33s | 847.65ms | 156.41ms (fail) | 206.11ms | 207.79ms |
| broadPropagation | 351.54ms | 4.28s | 7.38s | 6.37ms (fail) | 456.83ms | 459.80ms |
| deepPropagation | 125.14ms | 1.53s | 790.53ms | 137.32ms (fail) | 178.09ms | 178.16ms |
| diamond | 234.20ms | 2.39s | 2.25s | 180.84ms (fail) | 279.19ms | 287.47ms |
| mux | 373.40ms | 1.82s | 1.14s | 191.49ms (fail) | 389.20ms | 418.82ms |
| repeatedObservers | 44.82ms | 226.28ms | 254.06ms | 52.12ms (fail) | 38.78ms | 46.43ms |
| triangle | 85.83ms | 768.17ms | 595.11ms | 75.96ms (fail) | 99.02ms | 101.56ms |
| unstable | 60.95ms | 344.75ms | 723.03ms | 338.66ms (fail) | 70.53ms | 74.91ms |
| molBench | 491.96ms | 580.21ms | 565.42ms | 1.19ms | 490.97ms | 490.30ms |
| create_signals | 24.82ms | 88.36ms | 58.98ms | 64.38ms | 15.39ms | 24.92ms |
| comp_0to1 | 8.07ms | 26.95ms | 23.13ms | 57.79ms | 34.02ms | 11.68ms |
| comp_1to1 | 4.30ms | 38.33ms | 42.12ms | 53.23ms | 7.04ms | 27.50ms |
| comp_2to1 | 2.25ms | 22.66ms | 18.38ms | 35.57ms | 13.82ms | 16.16ms |
| comp_4to1 | 10.61ms | 17.41ms | 28.00ms | 16.09ms | 10.32ms | 2.09ms |
| comp_1000to1 | 3μs | 24μs | 20μs | 42μs | 4μs | 5μs |
| comp_1to2 | 10.65ms | 35.03ms | 23.33ms | 48.23ms | 20.92ms | 14.89ms |
| comp_1to4 | 9.17ms | 18.70ms | 40.37ms | 43.64ms | 27.59ms | 12.30ms |
| comp_1to8 | 5.36ms | 22.17ms | 26.76ms | 42.54ms | 9.46ms | 9.23ms |
| comp_1to1000 | 3.53ms | 15.00ms | 16.39ms | 38.00ms | 9.31ms | 7.65ms |
| update_1to1 | 11.23ms | 24.70ms | 14.52ms | 7.52ms | 8.25ms | 9.46ms |
| update_2to1 | 5.08ms | 12.04ms | 7.32ms | 2.89ms | 4.05ms | 5.36ms |
| update_4to1 | 2.76ms | 6.67ms | 3.66ms | 1.49ms | 2.06ms | 2.34ms |
| update_1000to1 | 19μs | 67μs | 39μs | 15μs | 20μs | 23μs |
| update_1to2 | 5.59ms | 13.01ms | 7.42ms | 2.94ms | 5.73ms | 4.94ms |
| update_1to4 | 2.47ms | 5.71ms | 3.64ms | 1.47ms | 2.08ms | 2.35ms |
| update_1to1000 | 47μs | 156μs | 164μs | 379μs | 3.08ms | 52μs |
| cellx1000 | 7.34ms | 70.82ms | 89.42ms | 5.11ms | 10.41ms | 11.95ms |
| cellx2500 | 19.82ms | 239.84ms | 81.85ms | 25.07ms | 25.91ms | 31.27ms |
| cellx5000 | 42.67ms | 542.25ms | 321.77ms | 66.59ms | 71.36ms | 61.35ms |
| 10x5 - 2 sources - read 20.0% (simple) | 231.28ms | 2.01s | 2.50s | 237.31ms | 446.66ms | 512.26ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 184.80ms | 1.57s | 1.51s | 198.55ms | 274.56ms | 278.83ms |
| 1000x12 - 4 sources - dynamic (large) | 278.27ms | 1.95s | 5.39s | 338.99ms | 3.51s | 3.74s |
| 1000x5 - 25 sources (wide dense) | 407.58ms | 3.60s | 10.26s | 496.73ms | 2.60s | 3.42s |
| 5x500 - 3 sources (deep) | 188.59ms | 1.14s | 1.03s | 206.33ms | 234.47ms | 225.43ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 264.07ms | 1.72s | 2.96s | 259.69ms | 453.06ms | 485.57ms |

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
