# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.29s |
| 🥉 | signals | 0.24 | 100.0% | 35/35 | 11.43s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 9.94s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 27.18s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.36s |

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
| avoidablePropagation | 229.96ms | 186.52ms | 148.34ms (fail) | 277.62ms | 208.47ms | 2.35s |
| broadPropagation | 460.77ms | 351.11ms | 6.24ms (fail) | 507.15ms | 459.19ms | 4.47s |
| deepPropagation | 175.49ms | 138.07ms | 138.59ms (fail) | 171.26ms | 178.12ms | 1.49s |
| diamond | 292.40ms | 230.92ms | 182.29ms (fail) | 356.48ms | 285.23ms | 2.41s |
| mux | 392.52ms | 367.36ms | 183.30ms (fail) | 419.42ms | 372.33ms | 1.86s |
| repeatedObservers | 48.55ms | 44.32ms | 54.49ms (fail) | 80.67ms | 43.38ms | 229.66ms |
| triangle | 104.35ms | 85.01ms | 76.66ms (fail) | 118.86ms | 101.87ms | 734.03ms |
| unstable | 79.95ms | 62.84ms | 337.26ms (fail) | 96.08ms | 71.11ms | 344.90ms |
| molBench | 497.40ms | 484.81ms | 967μs | 489.36ms | 482.64ms | 590.45ms |
| create_signals | 25.29ms | 21.75ms | 56.33ms | 100.87ms | 5.47ms | 89.07ms |
| comp_0to1 | 11.67ms | 8.32ms | 51.56ms | 35.79ms | 18.25ms | 16.08ms |
| comp_1to1 | 29.54ms | 4.19ms | 52.66ms | 54.88ms | 10.98ms | 44.14ms |
| comp_2to1 | 14.50ms | 2.31ms | 34.91ms | 46.73ms | 11.84ms | 22.28ms |
| comp_4to1 | 1.96ms | 10.19ms | 15.79ms | 15.04ms | 9.30ms | 15.69ms |
| comp_1000to1 | 7μs | 3μs | 40μs | 16μs | 4μs | 15μs |
| comp_1to2 | 15.62ms | 18.80ms | 43.87ms | 39.49ms | 24.06ms | 38.63ms |
| comp_1to4 | 13.87ms | 4.92ms | 44.01ms | 20.92ms | 20.40ms | 21.77ms |
| comp_1to8 | 6.22ms | 4.83ms | 41.86ms | 19.87ms | 7.85ms | 23.40ms |
| comp_1to1000 | 4.15ms | 3.28ms | 38.19ms | 14.60ms | 8.21ms | 15.49ms |
| update_1to1 | 9.30ms | 5.19ms | 6.10ms | 15.42ms | 8.84ms | 27.67ms |
| update_2to1 | 4.72ms | 2.32ms | 3.05ms | 7.74ms | 4.32ms | 11.79ms |
| update_4to1 | 2.37ms | 1.15ms | 1.56ms | 3.89ms | 2.19ms | 7.16ms |
| update_1000to1 | 23μs | 11μs | 16μs | 38μs | 22μs | 80μs |
| update_1to2 | 4.63ms | 3.27ms | 3.12ms | 7.88ms | 4.41ms | 13.83ms |
| update_1to4 | 2.54ms | 1.17ms | 1.59ms | 3.85ms | 2.22ms | 7.74ms |
| update_1to1000 | 44μs | 45μs | 390μs | 146μs | 2.21ms | 170μs |
| cellx1000 | 9.65ms | 9.01ms | 5.51ms | 13.50ms | 9.43ms | 69.88ms |
| cellx2500 | 31.92ms | 21.27ms | 27.13ms | 32.01ms | 25.97ms | 251.81ms |
| cellx5000 | 66.74ms | 42.26ms | 62.81ms | 71.66ms | 67.80ms | 564.27ms |
| 10x5 - 2 sources - read 20.0% (simple) | 519.93ms | 235.81ms | 245.81ms | 344.38ms | 431.35ms | 1.94s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.43ms | 174.68ms | 196.39ms | 248.89ms | 265.09ms | 1.44s |
| 1000x12 - 4 sources - dynamic (large) | 3.93s | 274.52ms | 331.82ms | 453.84ms | 3.63s | 1.87s |
| 1000x5 - 25 sources (wide dense) | 3.47s | 410.14ms | 514.70ms | 594.67ms | 2.50s | 3.45s |
| 5x500 - 3 sources (deep) | 223.38ms | 195.24ms | 200.63ms | 251.57ms | 224.87ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 475.01ms | 268.53ms | 255.32ms | 378.16ms | 449.96ms | 1.66s |

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
