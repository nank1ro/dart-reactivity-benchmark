# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.66s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.28s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.05s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 9.97s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 27.27s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.37s |

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
| avoidablePropagation | 212.31ms | 187.46ms | 148.06ms (fail) | 277.73ms | 203.56ms | 2.34s |
| broadPropagation | 455.94ms | 352.96ms | 5.92ms (fail) | 508.27ms | 461.43ms | 4.40s |
| deepPropagation | 172.64ms | 132.39ms | 138.35ms (fail) | 167.94ms | 174.70ms | 1.50s |
| diamond | 281.12ms | 233.26ms | 179.46ms (fail) | 352.26ms | 284.46ms | 2.36s |
| mux | 392.16ms | 355.39ms | 180.40ms (fail) | 414.87ms | 369.75ms | 1.85s |
| repeatedObservers | 46.15ms | 43.59ms | 52.40ms (fail) | 80.61ms | 40.13ms | 232.98ms |
| triangle | 102.17ms | 86.72ms | 76.15ms (fail) | 113.68ms | 100.72ms | 750.33ms |
| unstable | 77.74ms | 62.64ms | 336.19ms (fail) | 99.61ms | 68.69ms | 341.41ms |
| molBench | 494.25ms | 484.71ms | 1.27ms | 490.39ms | 479.65ms | 590.50ms |
| create_signals | 25.70ms | 27.49ms | 67.39ms | 100.28ms | 4.71ms | 67.80ms |
| comp_0to1 | 11.37ms | 8.15ms | 53.61ms | 34.08ms | 17.84ms | 28.42ms |
| comp_1to1 | 25.87ms | 4.12ms | 52.63ms | 45.32ms | 14.58ms | 39.42ms |
| comp_2to1 | 10.99ms | 2.25ms | 35.63ms | 36.50ms | 16.54ms | 41.41ms |
| comp_4to1 | 2.02ms | 9.90ms | 15.93ms | 4.31ms | 9.61ms | 20.83ms |
| comp_1000to1 | 5μs | 4μs | 39μs | 18μs | 9μs | 15μs |
| comp_1to2 | 16.61ms | 18.43ms | 43.78ms | 36.28ms | 18.21ms | 40.75ms |
| comp_1to4 | 10.35ms | 8.87ms | 43.43ms | 20.78ms | 30.47ms | 23.88ms |
| comp_1to8 | 6.46ms | 3.83ms | 41.79ms | 21.04ms | 7.97ms | 23.75ms |
| comp_1to1000 | 4.24ms | 3.48ms | 37.91ms | 14.49ms | 6.16ms | 15.51ms |
| update_1to1 | 9.34ms | 4.66ms | 6.11ms | 15.45ms | 8.77ms | 27.24ms |
| update_2to1 | 4.72ms | 2.31ms | 3.09ms | 7.75ms | 4.37ms | 13.64ms |
| update_4to1 | 2.33ms | 1.15ms | 1.58ms | 3.85ms | 2.25ms | 7.35ms |
| update_1000to1 | 23μs | 11μs | 16μs | 38μs | 22μs | 66μs |
| update_1to2 | 4.64ms | 2.77ms | 3.10ms | 7.91ms | 4.40ms | 13.63ms |
| update_1to4 | 2.55ms | 1.36ms | 1.61ms | 3.89ms | 2.22ms | 6.91ms |
| update_1to1000 | 44μs | 46μs | 457μs | 151μs | 885μs | 161μs |
| cellx1000 | 9.65ms | 7.46ms | 5.45ms | 14.40ms | 9.64ms | 74.50ms |
| cellx2500 | 32.46ms | 19.64ms | 26.63ms | 35.27ms | 27.72ms | 259.26ms |
| cellx5000 | 69.52ms | 47.46ms | 64.00ms | 87.22ms | 78.00ms | 565.14ms |
| 10x5 - 2 sources - read 20.0% (simple) | 500.63ms | 235.17ms | 234.81ms | 349.24ms | 442.77ms | 1.93s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 276.19ms | 173.38ms | 197.90ms | 246.04ms | 265.25ms | 1.47s |
| 1000x12 - 4 sources - dynamic (large) | 3.54s | 278.16ms | 344.36ms | 467.35ms | 3.61s | 1.96s |
| 1000x5 - 25 sources (wide dense) | 3.55s | 410.63ms | 519.41ms | 590.92ms | 2.53s | 3.52s |
| 5x500 - 3 sources (deep) | 224.27ms | 189.73ms | 200.21ms | 251.57ms | 229.69ms | 1.09s |
| 100x15 - 6 sources - dynamic (very dynamic) | 473.98ms | 262.88ms | 254.61ms | 382.40ms | 441.52ms | 1.65s |

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
