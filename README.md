# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.27s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 9.98s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.14s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.04s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.41s |

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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 211.48ms | 187.72ms | 146.22ms (fail) | 277.25ms | 207.17ms | 2.40s |
| broadPropagation | 451.33ms | 355.73ms | 6.17ms (fail) | 508.87ms | 455.56ms | 4.45s |
| deepPropagation | 178.37ms | 132.59ms | 140.48ms (fail) | 171.21ms | 180.51ms | 1.50s |
| diamond | 286.29ms | 238.07ms | 182.27ms (fail) | 356.69ms | 286.42ms | 2.41s |
| mux | 389.96ms | 363.32ms | 182.96ms (fail) | 418.64ms | 370.25ms | 1.86s |
| repeatedObservers | 46.02ms | 43.66ms | 52.41ms (fail) | 80.82ms | 40.76ms | 227.11ms |
| triangle | 105.28ms | 84.34ms | 77.75ms (fail) | 114.50ms | 100.77ms | 742.51ms |
| unstable | 77.89ms | 62.99ms | 339.90ms (fail) | 96.98ms | 69.85ms | 349.11ms |
| molBench | 494.70ms | 484.43ms | 985μs | 489.92ms | 479.56ms | 589.96ms |
| create_signals | 26.21ms | 23.78ms | 59.83ms | 76.56ms | 4.69ms | 80.01ms |
| comp_0to1 | 11.82ms | 8.88ms | 57.39ms | 25.35ms | 17.54ms | 22.91ms |
| comp_1to1 | 27.13ms | 10.41ms | 57.22ms | 30.70ms | 12.78ms | 24.74ms |
| comp_2to1 | 9.56ms | 4.40ms | 35.67ms | 36.44ms | 17.27ms | 15.65ms |
| comp_4to1 | 2.13ms | 14.71ms | 15.81ms | 10.02ms | 8.88ms | 14.29ms |
| comp_1000to1 | 5μs | 3μs | 40μs | 15μs | 4μs | 21μs |
| comp_1to2 | 19.82ms | 12.63ms | 44.07ms | 27.82ms | 15.19ms | 38.53ms |
| comp_1to4 | 14.92ms | 7.14ms | 43.95ms | 20.95ms | 23.91ms | 25.96ms |
| comp_1to8 | 6.74ms | 6.32ms | 41.45ms | 20.54ms | 6.90ms | 25.38ms |
| comp_1to1000 | 6.20ms | 3.44ms | 38.04ms | 14.55ms | 5.54ms | 15.81ms |
| update_1to1 | 9.48ms | 4.61ms | 6.10ms | 15.53ms | 8.82ms | 26.77ms |
| update_2to1 | 4.72ms | 2.33ms | 3.06ms | 7.77ms | 4.49ms | 13.11ms |
| update_4to1 | 2.31ms | 1.22ms | 1.54ms | 3.87ms | 2.24ms | 6.95ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 67μs |
| update_1to2 | 4.63ms | 2.25ms | 3.06ms | 7.91ms | 4.45ms | 12.84ms |
| update_1to4 | 2.50ms | 1.19ms | 1.58ms | 3.86ms | 2.21ms | 6.92ms |
| update_1to1000 | 43μs | 50μs | 365μs | 149μs | 1.08ms | 160μs |
| cellx1000 | 9.70ms | 8.60ms | 5.32ms | 15.25ms | 9.78ms | 72.58ms |
| cellx2500 | 32.48ms | 19.77ms | 23.45ms | 41.01ms | 31.11ms | 251.17ms |
| cellx5000 | 68.87ms | 45.55ms | 64.82ms | 99.42ms | 75.40ms | 568.28ms |
| 10x5 - 2 sources - read 20.0% (simple) | 524.79ms | 236.84ms | 240.23ms | 348.36ms | 434.90ms | 1.96s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 288.40ms | 176.28ms | 199.67ms | 245.94ms | 275.32ms | 1.45s |
| 1000x12 - 4 sources - dynamic (large) | 3.63s | 278.49ms | 347.75ms | 466.10ms | 3.64s | 1.86s |
| 1000x5 - 25 sources (wide dense) | 3.50s | 406.04ms | 530.86ms | 595.16ms | 2.51s | 3.30s |
| 5x500 - 3 sources (deep) | 230.39ms | 196.85ms | 202.78ms | 254.34ms | 225.21ms | 1.11s |
| 100x15 - 6 sources - dynamic (very dynamic) | 474.31ms | 260.41ms | 259.32ms | 384.25ms | 455.06ms | 1.62s |

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
