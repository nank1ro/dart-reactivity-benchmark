# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.65 | 100.0% | 35/35 | 3.67s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 9.71s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.15s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.00s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 27.26s |
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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 269.60ms | 196.81ms | 2.27s | 181.49ms | 200.40ms | 149.14ms (fail) |
| broadPropagation | 497.33ms | 456.02ms | 4.18s | 350.01ms | 443.96ms | 5.91ms (fail) |
| deepPropagation | 167.74ms | 168.82ms | 1.52s | 120.14ms | 173.04ms | 135.41ms (fail) |
| diamond | 334.85ms | 284.21ms | 2.39s | 234.38ms | 276.07ms | 177.72ms (fail) |
| mux | 421.94ms | 372.87ms | 1.79s | 370.70ms | 398.49ms | 195.93ms (fail) |
| repeatedObservers | 77.58ms | 36.61ms | 226.03ms | 44.90ms | 43.49ms | 50.23ms (fail) |
| triangle | 112.95ms | 93.90ms | 767.17ms | 87.00ms | 99.81ms | 76.90ms (fail) |
| unstable | 88.51ms | 66.29ms | 342.83ms | 60.76ms | 70.80ms | 331.28ms (fail) |
| molBench | 476.79ms | 473.98ms | 577.04ms | 490.00ms | 466.29ms | 1.01ms |
| create_signals | 89.57ms | 4.56ms | 79.89ms | 29.08ms | 29.36ms | 69.25ms |
| comp_0to1 | 31.30ms | 16.79ms | 21.25ms | 7.88ms | 12.87ms | 61.88ms |
| comp_1to1 | 45.81ms | 11.46ms | 47.78ms | 4.25ms | 26.66ms | 59.27ms |
| comp_2to1 | 41.00ms | 8.70ms | 41.58ms | 2.23ms | 9.10ms | 35.78ms |
| comp_4to1 | 16.98ms | 13.72ms | 31.03ms | 10.58ms | 1.86ms | 16.20ms |
| comp_1000to1 | 13μs | 4μs | 27μs | 5μs | 8μs | 41μs |
| comp_1to2 | 35.38ms | 26.01ms | 35.95ms | 10.55ms | 18.64ms | 46.87ms |
| comp_1to4 | 19.75ms | 32.23ms | 21.02ms | 6.80ms | 6.96ms | 46.70ms |
| comp_1to8 | 21.84ms | 7.97ms | 22.44ms | 5.92ms | 6.22ms | 45.99ms |
| comp_1to1000 | 14.36ms | 5.94ms | 14.94ms | 3.48ms | 4.29ms | 40.81ms |
| update_1to1 | 16.48ms | 8.16ms | 21.70ms | 11.28ms | 9.22ms | 5.73ms |
| update_2to1 | 7.94ms | 4.04ms | 10.74ms | 5.00ms | 4.60ms | 2.88ms |
| update_4to1 | 4.06ms | 2.07ms | 6.28ms | 2.98ms | 2.32ms | 1.47ms |
| update_1000to1 | 40μs | 20μs | 76μs | 17μs | 25μs | 15μs |
| update_1to2 | 8.14ms | 4.06ms | 11.56ms | 5.60ms | 4.93ms | 2.93ms |
| update_1to4 | 4.05ms | 2.06ms | 5.33ms | 2.51ms | 2.33ms | 1.47ms |
| update_1to1000 | 149μs | 146μs | 170μs | 48μs | 60μs | 401μs |
| cellx1000 | 11.12ms | 9.46ms | 75.43ms | 7.17ms | 9.44ms | 5.09ms |
| cellx2500 | 29.32ms | 25.09ms | 255.98ms | 18.78ms | 30.16ms | 26.55ms |
| cellx5000 | 65.74ms | 62.64ms | 615.60ms | 39.99ms | 56.26ms | 75.90ms |
| 10x5 - 2 sources - read 20.0% (simple) | 346.98ms | 440.13ms | 1.99s | 235.28ms | 500.36ms | 231.51ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 234.44ms | 264.19ms | 1.50s | 176.94ms | 278.11ms | 202.48ms |
| 1000x12 - 4 sources - dynamic (large) | 446.30ms | 3.39s | 1.94s | 285.44ms | 3.69s | 341.14ms |
| 1000x5 - 25 sources (wide dense) | 579.54ms | 2.55s | 3.53s | 405.55ms | 3.41s | 494.45ms |
| 5x500 - 3 sources (deep) | 253.64ms | 233.70ms | 1.17s | 191.04ms | 229.14ms | 198.93ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 375.92ms | 439.18ms | 1.74s | 258.51ms | 476.55ms | 254.98ms |

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
