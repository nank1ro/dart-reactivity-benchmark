# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.74s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 10.09s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.46s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 11.05s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.60s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.47s |

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
| avoidablePropagation | 217.04ms | 188.84ms | 144.32ms (fail) | 275.92ms | 209.08ms | 2.35s |
| broadPropagation | 464.73ms | 352.60ms | 7.06ms (fail) | 494.05ms | 448.97ms | 4.43s |
| deepPropagation | 179.56ms | 136.79ms | 139.63ms (fail) | 171.17ms | 180.91ms | 1.50s |
| diamond | 285.03ms | 244.11ms | 195.20ms (fail) | 358.65ms | 285.29ms | 2.39s |
| mux | 399.74ms | 365.26ms | 183.58ms (fail) | 419.55ms | 373.63ms | 1.85s |
| repeatedObservers | 46.13ms | 46.16ms | 52.83ms (fail) | 80.57ms | 40.50ms | 224.72ms |
| triangle | 103.01ms | 86.47ms | 77.20ms (fail) | 122.15ms | 102.15ms | 740.99ms |
| unstable | 78.14ms | 62.40ms | 335.52ms (fail) | 95.56ms | 72.14ms | 341.45ms |
| molBench | 496.15ms | 487.51ms | 1.03ms | 491.94ms | 481.49ms | 591.26ms |
| create_signals | 27.34ms | 22.32ms | 58.03ms | 95.29ms | 4.72ms | 84.45ms |
| comp_0to1 | 12.12ms | 8.81ms | 52.16ms | 35.19ms | 17.79ms | 20.36ms |
| comp_1to1 | 27.91ms | 4.28ms | 53.61ms | 27.52ms | 14.58ms | 24.80ms |
| comp_2to1 | 11.18ms | 2.30ms | 36.66ms | 42.20ms | 16.56ms | 30.49ms |
| comp_4to1 | 2.14ms | 8.05ms | 16.44ms | 13.23ms | 23.49ms | 27.91ms |
| comp_1000to1 | 8μs | 4μs | 41μs | 15μs | 4μs | 15μs |
| comp_1to2 | 20.33ms | 10.78ms | 44.16ms | 32.51ms | 15.86ms | 38.74ms |
| comp_1to4 | 7.34ms | 11.89ms | 43.99ms | 21.21ms | 22.95ms | 19.89ms |
| comp_1to8 | 6.58ms | 4.88ms | 42.12ms | 23.92ms | 13.68ms | 22.71ms |
| comp_1to1000 | 4.30ms | 3.67ms | 37.88ms | 14.68ms | 6.79ms | 15.49ms |
| update_1to1 | 9.31ms | 10.87ms | 6.10ms | 15.49ms | 8.84ms | 25.82ms |
| update_2to1 | 4.72ms | 5.32ms | 3.08ms | 7.79ms | 4.44ms | 13.66ms |
| update_4to1 | 2.34ms | 2.69ms | 1.55ms | 3.94ms | 2.21ms | 7.43ms |
| update_1000to1 | 24μs | 26μs | 16μs | 38μs | 22μs | 62μs |
| update_1to2 | 4.65ms | 5.36ms | 3.07ms | 7.91ms | 4.43ms | 12.44ms |
| update_1to4 | 2.52ms | 2.68ms | 1.58ms | 3.90ms | 2.25ms | 6.97ms |
| update_1to1000 | 46μs | 37μs | 368μs | 152μs | 51μs | 161μs |
| cellx1000 | 11.99ms | 9.18ms | 7.41ms | 14.99ms | 10.75ms | 104.87ms |
| cellx2500 | 51.94ms | 24.85ms | 38.01ms | 58.30ms | 39.24ms | 308.43ms |
| cellx5000 | 119.48ms | 65.78ms | 88.47ms | 167.59ms | 124.39ms | 675.14ms |
| 10x5 - 2 sources - read 20.0% (simple) | 508.29ms | 233.45ms | 245.83ms | 349.95ms | 430.85ms | 1.98s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.09ms | 173.16ms | 201.88ms | 243.54ms | 270.96ms | 1.50s |
| 1000x12 - 4 sources - dynamic (large) | 3.68s | 277.98ms | 364.14ms | 471.24ms | 3.66s | 1.82s |
| 1000x5 - 25 sources (wide dense) | 3.27s | 416.11ms | 523.77ms | 601.29ms | 2.51s | 3.52s |
| 5x500 - 3 sources (deep) | 227.99ms | 192.70ms | 203.71ms | 296.41ms | 224.77ms | 1.23s |
| 100x15 - 6 sources - dynamic (very dynamic) | 482.12ms | 268.27ms | 264.25ms | 406.96ms | 457.78ms | 1.69s |

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
