# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.71s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 10.37s |
| 🥉 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.24s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 11.28s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.80s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.53s |

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
| avoidablePropagation | 211.21ms | 192.07ms | 174.54ms (fail) | 266.88ms | 201.44ms | 2.38s |
| broadPropagation | 453.40ms | 355.83ms | 6.37ms (fail) | 504.28ms | 460.24ms | 4.45s |
| deepPropagation | 173.78ms | 130.59ms | 140.74ms (fail) | 162.09ms | 179.10ms | 1.54s |
| diamond | 284.44ms | 235.59ms | 183.42ms (fail) | 362.15ms | 282.01ms | 2.45s |
| mux | 410.44ms | 376.57ms | 192.57ms (fail) | 442.24ms | 394.75ms | 1.85s |
| repeatedObservers | 47.20ms | 43.83ms | 53.80ms (fail) | 82.95ms | 40.56ms | 234.05ms |
| triangle | 105.25ms | 86.50ms | 79.95ms (fail) | 115.17ms | 99.54ms | 785.75ms |
| unstable | 76.46ms | 60.05ms | 374.83ms (fail) | 97.86ms | 75.05ms | 342.95ms |
| molBench | 485.49ms | 488.74ms | 1.25ms | 496.75ms | 488.74ms | 584.74ms |
| create_signals | 24.96ms | 26.55ms | 67.61ms | 57.52ms | 4.64ms | 71.88ms |
| comp_0to1 | 11.23ms | 11.25ms | 65.69ms | 25.27ms | 17.87ms | 28.78ms |
| comp_1to1 | 28.48ms | 10.52ms | 61.37ms | 41.65ms | 13.58ms | 40.03ms |
| comp_2to1 | 10.21ms | 2.25ms | 40.75ms | 23.99ms | 11.75ms | 34.95ms |
| comp_4to1 | 3.30ms | 13.42ms | 19.15ms | 15.34ms | 11.36ms | 17.29ms |
| comp_1000to1 | 8μs | 4μs | 45μs | 17μs | 4μs | 15μs |
| comp_1to2 | 21.66ms | 12.07ms | 51.61ms | 26.53ms | 26.30ms | 48.54ms |
| comp_1to4 | 9.41ms | 5.20ms | 49.58ms | 16.65ms | 24.72ms | 19.92ms |
| comp_1to8 | 6.36ms | 5.29ms | 46.96ms | 21.00ms | 8.06ms | 24.69ms |
| comp_1to1000 | 4.45ms | 3.42ms | 41.79ms | 14.85ms | 5.59ms | 15.25ms |
| update_1to1 | 10.26ms | 10.10ms | 6.01ms | 18.16ms | 8.38ms | 28.13ms |
| update_2to1 | 4.56ms | 2.14ms | 3.10ms | 10.31ms | 4.36ms | 14.22ms |
| update_4to1 | 2.54ms | 2.64ms | 1.51ms | 4.87ms | 2.12ms | 7.12ms |
| update_1000to1 | 26μs | 22μs | 15μs | 47μs | 20μs | 69μs |
| update_1to2 | 4.50ms | 4.97ms | 3.03ms | 10.30ms | 4.07ms | 13.88ms |
| update_1to4 | 2.54ms | 2.47ms | 1.52ms | 4.56ms | 2.11ms | 6.93ms |
| update_1to1000 | 43μs | 48μs | 457μs | 156μs | 62μs | 173μs |
| cellx1000 | 9.58ms | 7.26ms | 5.38ms | 15.92ms | 9.50ms | 77.82ms |
| cellx2500 | 31.18ms | 18.76ms | 25.72ms | 31.76ms | 25.50ms | 277.25ms |
| cellx5000 | 58.93ms | 39.51ms | 81.84ms | 67.65ms | 65.71ms | 615.89ms |
| 10x5 - 2 sources - read 20.0% (simple) | 510.60ms | 235.52ms | 232.53ms | 352.77ms | 448.81ms | 2.01s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 277.70ms | 184.38ms | 194.98ms | 253.50ms | 280.73ms | 1.51s |
| 1000x12 - 4 sources - dynamic (large) | 3.76s | 289.19ms | 341.57ms | 457.45ms | 3.75s | 1.96s |
| 1000x5 - 25 sources (wide dense) | 3.53s | 402.18ms | 512.29ms | 598.42ms | 2.73s | 3.52s |
| 5x500 - 3 sources (deep) | 224.17ms | 194.08ms | 206.38ms | 253.49ms | 230.39ms | 1.12s |
| 100x15 - 6 sources - dynamic (very dynamic) | 488.42ms | 260.53ms | 260.92ms | 383.94ms | 463.09ms | 1.71s |

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
