# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.26s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.01s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 11.18s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.22s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.49s |

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
| avoidablePropagation | 222.72ms | 189.32ms | 145.05ms (fail) | 281.06ms | 205.06ms | 2.36s |
| broadPropagation | 459.59ms | 354.13ms | 6.80ms (fail) | 508.03ms | 446.13ms | 4.49s |
| deepPropagation | 174.07ms | 129.08ms | 141.20ms (fail) | 171.78ms | 176.17ms | 1.49s |
| diamond | 284.22ms | 230.57ms | 206.23ms (fail) | 358.02ms | 283.98ms | 2.37s |
| mux | 387.96ms | 361.86ms | 181.40ms (fail) | 420.34ms | 377.61ms | 1.86s |
| repeatedObservers | 45.91ms | 43.32ms | 52.30ms (fail) | 80.42ms | 40.50ms | 226.59ms |
| triangle | 101.79ms | 85.39ms | 80.36ms (fail) | 115.83ms | 100.76ms | 742.33ms |
| unstable | 76.42ms | 63.42ms | 339.92ms (fail) | 96.29ms | 69.54ms | 348.75ms |
| molBench | 495.40ms | 485.64ms | 1.21ms | 490.04ms | 482.01ms | 596.75ms |
| create_signals | 24.99ms | 24.18ms | 66.54ms | 56.80ms | 5.46ms | 56.82ms |
| comp_0to1 | 11.50ms | 8.95ms | 53.63ms | 25.85ms | 17.70ms | 15.50ms |
| comp_1to1 | 27.19ms | 4.24ms | 54.35ms | 35.80ms | 13.23ms | 51.41ms |
| comp_2to1 | 17.06ms | 2.28ms | 36.44ms | 38.16ms | 23.94ms | 22.83ms |
| comp_4to1 | 2.14ms | 7.46ms | 16.58ms | 20.07ms | 12.53ms | 16.69ms |
| comp_1000to1 | 4μs | 3μs | 60μs | 15μs | 6μs | 21μs |
| comp_1to2 | 13.51ms | 16.06ms | 44.03ms | 31.80ms | 16.79ms | 35.78ms |
| comp_1to4 | 12.71ms | 11.90ms | 43.70ms | 19.79ms | 24.95ms | 21.39ms |
| comp_1to8 | 6.62ms | 6.03ms | 41.58ms | 22.35ms | 6.71ms | 23.66ms |
| comp_1to1000 | 4.31ms | 3.61ms | 38.23ms | 14.78ms | 4.67ms | 17.85ms |
| update_1to1 | 9.28ms | 4.90ms | 6.14ms | 15.47ms | 8.82ms | 23.79ms |
| update_2to1 | 4.76ms | 2.33ms | 3.26ms | 7.74ms | 4.31ms | 12.79ms |
| update_4to1 | 2.35ms | 1.25ms | 1.58ms | 3.88ms | 2.20ms | 7.41ms |
| update_1000to1 | 23μs | 26μs | 16μs | 38μs | 22μs | 70μs |
| update_1to2 | 4.64ms | 3.23ms | 3.10ms | 7.94ms | 4.36ms | 13.89ms |
| update_1to4 | 2.53ms | 1.23ms | 1.61ms | 3.92ms | 2.25ms | 6.95ms |
| update_1to1000 | 44μs | 50μs | 367μs | 153μs | 162μs | 162μs |
| cellx1000 | 9.77ms | 7.42ms | 5.39ms | 12.19ms | 9.61ms | 82.10ms |
| cellx2500 | 32.65ms | 19.96ms | 27.00ms | 36.17ms | 26.13ms | 275.48ms |
| cellx5000 | 67.51ms | 44.71ms | 65.94ms | 78.85ms | 73.38ms | 611.67ms |
| 10x5 - 2 sources - read 20.0% (simple) | 516.85ms | 236.61ms | 244.61ms | 356.96ms | 434.20ms | 1.93s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.43ms | 175.24ms | 213.61ms | 247.29ms | 269.37ms | 1.45s |
| 1000x12 - 4 sources - dynamic (large) | 3.80s | 275.77ms | 358.00ms | 468.56ms | 3.68s | 1.90s |
| 1000x5 - 25 sources (wide dense) | 3.37s | 411.89ms | 524.30ms | 594.12ms | 2.51s | 3.40s |
| 5x500 - 3 sources (deep) | 228.23ms | 191.92ms | 213.34ms | 257.58ms | 227.68ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 485.40ms | 265.67ms | 267.47ms | 384.05ms | 451.76ms | 1.67s |

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
