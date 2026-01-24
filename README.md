# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.22s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.41s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.02s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.38s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.50s |

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
| avoidablePropagation | 208.76ms | 193.22ms | 144.54ms (fail) | 279.10ms | 198.63ms | 2.36s |
| broadPropagation | 451.31ms | 364.52ms | 6.05ms (fail) | 500.14ms | 452.56ms | 4.47s |
| deepPropagation | 168.02ms | 125.05ms | 139.37ms (fail) | 168.36ms | 169.76ms | 1.50s |
| diamond | 289.50ms | 229.69ms | 174.88ms (fail) | 351.95ms | 286.44ms | 2.40s |
| mux | 392.49ms | 362.59ms | 182.00ms (fail) | 423.77ms | 379.03ms | 1.80s |
| repeatedObservers | 46.38ms | 44.65ms | 54.06ms (fail) | 81.15ms | 40.51ms | 232.10ms |
| triangle | 101.72ms | 82.08ms | 77.60ms (fail) | 116.57ms | 100.96ms | 761.81ms |
| unstable | 78.31ms | 62.66ms | 339.71ms (fail) | 96.38ms | 68.54ms | 345.98ms |
| molBench | 496.93ms | 485.58ms | 942μs | 405.65ms | 483.11ms | 591.63ms |
| create_signals | 28.30ms | 27.45ms | 61.43ms | 56.03ms | 14.59ms | 78.11ms |
| comp_0to1 | 12.29ms | 10.02ms | 57.90ms | 26.16ms | 20.28ms | 25.17ms |
| comp_1to1 | 28.44ms | 4.33ms | 65.37ms | 36.83ms | 6.96ms | 17.26ms |
| comp_2to1 | 13.63ms | 2.34ms | 44.11ms | 25.99ms | 11.98ms | 19.95ms |
| comp_4to1 | 1.96ms | 8.56ms | 18.21ms | 17.18ms | 9.74ms | 22.38ms |
| comp_1000to1 | 5μs | 4μs | 41μs | 19μs | 10μs | 18μs |
| comp_1to2 | 21.73ms | 14.93ms | 51.54ms | 38.49ms | 18.19ms | 38.13ms |
| comp_1to4 | 12.73ms | 16.65ms | 51.32ms | 21.45ms | 31.57ms | 26.39ms |
| comp_1to8 | 6.93ms | 4.90ms | 47.61ms | 21.22ms | 5.47ms | 25.84ms |
| comp_1to1000 | 4.39ms | 3.75ms | 40.84ms | 14.54ms | 5.76ms | 15.89ms |
| update_1to1 | 9.38ms | 4.69ms | 6.09ms | 15.55ms | 9.08ms | 25.38ms |
| update_2to1 | 4.74ms | 2.35ms | 3.05ms | 7.82ms | 4.53ms | 12.59ms |
| update_4to1 | 2.35ms | 1.24ms | 1.55ms | 3.95ms | 2.95ms | 7.43ms |
| update_1000to1 | 23μs | 21μs | 16μs | 38μs | 22μs | 69μs |
| update_1to2 | 4.62ms | 2.29ms | 3.08ms | 7.98ms | 4.61ms | 13.79ms |
| update_1to4 | 2.54ms | 1.17ms | 1.60ms | 3.90ms | 2.30ms | 6.79ms |
| update_1to1000 | 43μs | 33μs | 365μs | 147μs | 1.07ms | 162μs |
| cellx1000 | 10.48ms | 10.01ms | 5.75ms | 14.43ms | 10.55ms | 87.59ms |
| cellx2500 | 43.32ms | 24.21ms | 29.54ms | 49.66ms | 26.96ms | 307.99ms |
| cellx5000 | 89.14ms | 62.71ms | 104.40ms | 144.05ms | 81.79ms | 632.84ms |
| 10x5 - 2 sources - read 20.0% (simple) | 519.45ms | 233.57ms | 232.88ms | 345.65ms | 428.64ms | 1.98s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 277.77ms | 171.94ms | 197.83ms | 243.67ms | 267.54ms | 1.50s |
| 1000x12 - 4 sources - dynamic (large) | 3.77s | 279.59ms | 362.66ms | 467.11ms | 3.67s | 1.84s |
| 1000x5 - 25 sources (wide dense) | 3.61s | 412.59ms | 518.49ms | 594.44ms | 2.53s | 3.41s |
| 5x500 - 3 sources (deep) | 227.12ms | 191.53ms | 207.26ms | 255.21ms | 233.56ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 479.26ms | 262.16ms | 264.90ms | 385.74ms | 448.99ms | 1.69s |

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
