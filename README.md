# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.27s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.30s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.45s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.47s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.52s |

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
| Test Case | preact_signals | state_beacon | solidart(2.0-dev) | signals | alien_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 202.69ms | 165.13ms (fail) | 260.69ms | 213.27ms | 193.16ms | 2.34s |
| broadPropagation | 470.46ms | 6.31ms (fail) | 493.76ms | 470.01ms | 354.36ms | 4.35s |
| deepPropagation | 181.33ms | 138.97ms (fail) | 162.80ms | 174.45ms | 126.44ms | 1.54s |
| diamond | 283.92ms | 182.79ms (fail) | 360.13ms | 302.93ms | 238.63ms | 2.41s |
| mux | 388.34ms | 198.37ms (fail) | 427.91ms | 408.90ms | 374.76ms | 1.85s |
| repeatedObservers | 40.55ms | 52.26ms (fail) | 80.61ms | 46.51ms | 43.77ms | 233.94ms |
| triangle | 120.80ms | 90.26ms (fail) | 115.01ms | 101.88ms | 85.41ms | 755.81ms |
| unstable | 74.44ms | 341.55ms (fail) | 95.00ms | 76.03ms | 59.77ms | 342.25ms |
| molBench | 486.97ms | 938μs | 494.42ms | 488.86ms | 490.23ms | 581.41ms |
| create_signals | 4.71ms | 63.40ms | 57.04ms | 26.43ms | 25.03ms | 61.96ms |
| comp_0to1 | 20.20ms | 57.35ms | 33.31ms | 12.35ms | 8.97ms | 19.89ms |
| comp_1to1 | 15.32ms | 58.34ms | 34.37ms | 22.02ms | 4.46ms | 31.90ms |
| comp_2to1 | 17.14ms | 38.77ms | 25.80ms | 9.46ms | 2.39ms | 19.36ms |
| comp_4to1 | 13.59ms | 17.49ms | 6.03ms | 2.96ms | 8.04ms | 29.57ms |
| comp_1000to1 | 4μs | 44μs | 15μs | 6μs | 6μs | 34μs |
| comp_1to2 | 15.69ms | 48.43ms | 32.37ms | 10.17ms | 11.62ms | 39.41ms |
| comp_1to4 | 25.52ms | 46.88ms | 14.85ms | 14.15ms | 12.43ms | 31.82ms |
| comp_1to8 | 8.64ms | 45.97ms | 20.96ms | 10.40ms | 5.04ms | 20.64ms |
| comp_1to1000 | 7.75ms | 41.78ms | 14.22ms | 4.09ms | 3.56ms | 15.71ms |
| update_1to1 | 8.41ms | 6.01ms | 16.40ms | 10.17ms | 10.13ms | 27.89ms |
| update_2to1 | 4.43ms | 3.10ms | 8.05ms | 4.58ms | 2.11ms | 12.65ms |
| update_4to1 | 2.09ms | 1.57ms | 4.08ms | 2.56ms | 2.47ms | 6.58ms |
| update_1000to1 | 20μs | 15μs | 40μs | 26μs | 26μs | 69μs |
| update_1to2 | 4.07ms | 3.02ms | 8.38ms | 4.51ms | 5.00ms | 14.10ms |
| update_1to4 | 2.09ms | 1.52ms | 4.10ms | 2.55ms | 2.43ms | 6.99ms |
| update_1to1000 | 989μs | 411μs | 150μs | 43μs | 53μs | 173μs |
| cellx1000 | 10.70ms | 6.55ms | 16.82ms | 10.14ms | 7.29ms | 89.22ms |
| cellx2500 | 33.52ms | 33.13ms | 46.50ms | 30.41ms | 20.73ms | 255.19ms |
| cellx5000 | 83.14ms | 80.69ms | 105.40ms | 76.64ms | 48.88ms | 619.09ms |
| 10x5 - 2 sources - read 20.0% (simple) | 451.79ms | 243.73ms | 349.88ms | 520.95ms | 236.66ms | 2.04s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.86ms | 199.91ms | 248.69ms | 289.60ms | 184.56ms | 1.54s |
| 1000x12 - 4 sources - dynamic (large) | 3.74s | 354.60ms | 468.18ms | 3.77s | 289.63ms | 1.79s |
| 1000x5 - 25 sources (wide dense) | 2.74s | 513.90ms | 615.00ms | 3.47s | 411.49ms | 3.53s |
| 5x500 - 3 sources (deep) | 235.12ms | 208.42ms | 257.43ms | 227.01ms | 192.81ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 473.55ms | 263.97ms | 392.78ms | 483.11ms | 265.62ms | 1.71s |

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
