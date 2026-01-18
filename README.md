# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.78 | 100.0% | 35/35 | 3.61s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 9.97s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.30s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.05s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.86s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.43s |

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
| avoidablePropagation | 214.69ms | 186.39ms | 178.46ms (fail) | 290.39ms | 207.44ms | 2.37s |
| broadPropagation | 458.62ms | 352.08ms | 6.96ms (fail) | 500.73ms | 447.98ms | 4.40s |
| deepPropagation | 186.91ms | 122.89ms | 140.07ms (fail) | 173.41ms | 175.84ms | 1.51s |
| diamond | 291.23ms | 229.41ms | 193.91ms (fail) | 359.13ms | 281.20ms | 2.39s |
| mux | 391.50ms | 352.96ms | 185.75ms (fail) | 422.32ms | 389.67ms | 1.84s |
| repeatedObservers | 46.59ms | 44.17ms | 52.54ms (fail) | 80.46ms | 40.75ms | 230.27ms |
| triangle | 100.60ms | 84.66ms | 84.59ms (fail) | 118.47ms | 111.11ms | 748.20ms |
| unstable | 77.33ms | 62.45ms | 336.05ms (fail) | 96.47ms | 69.48ms | 344.04ms |
| molBench | 495.26ms | 484.13ms | 1.29ms | 491.61ms | 480.75ms | 624.88ms |
| create_signals | 25.20ms | 27.19ms | 57.44ms | 98.50ms | 4.57ms | 74.52ms |
| comp_0to1 | 10.98ms | 6.74ms | 51.05ms | 35.42ms | 21.92ms | 26.79ms |
| comp_1to1 | 22.16ms | 4.25ms | 52.12ms | 47.53ms | 12.76ms | 27.72ms |
| comp_2to1 | 12.05ms | 2.28ms | 34.59ms | 43.63ms | 17.54ms | 11.70ms |
| comp_4to1 | 8.54ms | 7.68ms | 15.57ms | 17.55ms | 8.10ms | 18.82ms |
| comp_1000to1 | 5μs | 4μs | 41μs | 16μs | 4μs | 16μs |
| comp_1to2 | 19.69ms | 11.41ms | 43.76ms | 33.64ms | 15.30ms | 35.57ms |
| comp_1to4 | 10.16ms | 8.99ms | 43.70ms | 15.40ms | 24.37ms | 25.61ms |
| comp_1to8 | 6.13ms | 5.22ms | 41.68ms | 19.83ms | 6.86ms | 24.82ms |
| comp_1to1000 | 4.22ms | 3.53ms | 38.06ms | 14.57ms | 4.65ms | 15.78ms |
| update_1to1 | 9.33ms | 5.23ms | 6.10ms | 15.44ms | 8.85ms | 22.31ms |
| update_2to1 | 4.95ms | 2.90ms | 3.04ms | 7.75ms | 4.29ms | 10.79ms |
| update_4to1 | 2.34ms | 1.17ms | 1.56ms | 3.86ms | 2.27ms | 5.66ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 53μs |
| update_1to2 | 4.66ms | 2.28ms | 3.07ms | 7.89ms | 4.32ms | 10.59ms |
| update_1to4 | 2.55ms | 1.16ms | 1.62ms | 3.90ms | 2.23ms | 5.51ms |
| update_1to1000 | 42μs | 30μs | 370μs | 152μs | 178μs | 162μs |
| cellx1000 | 9.65ms | 7.29ms | 7.05ms | 14.09ms | 9.48ms | 69.39ms |
| cellx2500 | 31.29ms | 19.41ms | 26.56ms | 30.97ms | 25.31ms | 260.74ms |
| cellx5000 | 57.30ms | 41.69ms | 56.56ms | 68.84ms | 65.61ms | 528.15ms |
| 10x5 - 2 sources - read 20.0% (simple) | 505.02ms | 234.63ms | 246.17ms | 346.20ms | 467.50ms | 1.95s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.18ms | 172.43ms | 201.23ms | 246.24ms | 269.73ms | 1.45s |
| 1000x12 - 4 sources - dynamic (large) | 3.80s | 269.68ms | 342.04ms | 458.73ms | 3.63s | 1.73s |
| 1000x5 - 25 sources (wide dense) | 3.26s | 401.42ms | 518.36ms | 598.91ms | 2.48s | 3.34s |
| 5x500 - 3 sources (deep) | 225.66ms | 189.01ms | 203.29ms | 250.87ms | 228.28ms | 1.09s |
| 100x15 - 6 sources - dynamic (very dynamic) | 482.31ms | 261.99ms | 259.50ms | 385.18ms | 447.55ms | 1.65s |

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
