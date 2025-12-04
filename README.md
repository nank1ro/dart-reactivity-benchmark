# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.31s |
| 🥈 | signals | 0.30 | 100.0% | 35/35 | 9.04s |
| 🥉 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 4.82s |
| 4 | preact_signals | 0.27 | 100.0% | 35/35 | 8.51s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 25.61s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.02s |

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
| avoidablePropagation | 194.75ms | 167.29ms | 135.84ms (fail) | 246.68ms | 183.60ms | 2.25s |
| broadPropagation | 386.42ms | 301.96ms | 5.94ms (fail) | 456.36ms | 382.91ms | 4.05s |
| deepPropagation | 172.82ms | 108.19ms | 150.49ms (fail) | 150.24ms | 174.77ms | 1.43s |
| diamond | 257.82ms | 234.58ms | 175.81ms (fail) | 343.75ms | 251.64ms | 2.26s |
| mux | 329.17ms | 330.87ms | 158.04ms (fail) | 388.59ms | 327.52ms | 1.71s |
| repeatedObservers | 38.91ms | 40.33ms | 48.20ms (fail) | 72.49ms | 32.75ms | 219.65ms |
| triangle | 92.23ms | 79.54ms | 74.74ms (fail) | 111.88ms | 92.53ms | 733.99ms |
| unstable | 64.56ms | 58.94ms | 326.29ms (fail) | 97.06ms | 56.39ms | 318.16ms |
| molBench | 388.63ms | 364.13ms | 835μs | 395.63ms | 362.81ms | 475.79ms |
| create_signals | 20.97ms | 31.88ms | 57.97ms | 78.13ms | 6.41ms | 66.38ms |
| comp_0to1 | 10.35ms | 8.24ms | 50.85ms | 46.49ms | 18.13ms | 25.85ms |
| comp_1to1 | 19.09ms | 5.51ms | 53.87ms | 38.31ms | 14.98ms | 47.02ms |
| comp_2to1 | 7.61ms | 2.92ms | 34.40ms | 28.65ms | 20.61ms | 31.17ms |
| comp_4to1 | 8.71ms | 11.75ms | 15.59ms | 6.35ms | 11.13ms | 13.14ms |
| comp_1000to1 | 6μs | 5μs | 46μs | 17μs | 8μs | 24μs |
| comp_1to2 | 12.91ms | 13.83ms | 45.01ms | 38.55ms | 18.54ms | 25.62ms |
| comp_1to4 | 7.63ms | 18.27ms | 43.76ms | 21.94ms | 34.41ms | 23.83ms |
| comp_1to8 | 6.71ms | 5.70ms | 43.00ms | 21.85ms | 9.16ms | 33.56ms |
| comp_1to1000 | 4.47ms | 4.62ms | 38.28ms | 14.55ms | 7.04ms | 15.60ms |
| update_1to1 | 9.10ms | 4.15ms | 4.66ms | 14.38ms | 8.12ms | 19.41ms |
| update_2to1 | 4.36ms | 1.97ms | 2.60ms | 7.17ms | 3.73ms | 9.85ms |
| update_4to1 | 2.18ms | 1.10ms | 1.26ms | 3.58ms | 2.19ms | 4.97ms |
| update_1000to1 | 23μs | 10μs | 12μs | 36μs | 17μs | 50μs |
| update_1to2 | 4.54ms | 2.12ms | 2.36ms | 7.27ms | 4.28ms | 9.66ms |
| update_1to4 | 2.10ms | 1.02ms | 1.21ms | 3.58ms | 2.17ms | 4.92ms |
| update_1to1000 | 58μs | 43μs | 382μs | 143μs | 508μs | 157μs |
| cellx1000 | 9.90ms | 7.88ms | 7.04ms | 14.08ms | 9.45ms | 74.99ms |
| cellx2500 | 30.97ms | 24.25ms | 31.03ms | 39.98ms | 24.15ms | 231.12ms |
| cellx5000 | 59.86ms | 53.64ms | 57.57ms | 84.48ms | 65.42ms | 503.77ms |
| 10x5 - 2 sources - read 20.0% (simple) | 416.22ms | 227.52ms | 223.87ms | 358.57ms | 383.01ms | 1.93s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 235.81ms | 172.31ms | 174.13ms | 251.22ms | 236.16ms | 1.44s |
| 1000x12 - 4 sources - dynamic (large) | 3.08s | 247.17ms | 266.01ms | 365.26ms | 2.93s | 1.59s |
| 1000x5 - 25 sources (wide dense) | 2.56s | 354.35ms | 376.95ms | 537.35ms | 2.25s | 3.31s |
| 5x500 - 3 sources (deep) | 210.83ms | 197.86ms | 197.51ms | 267.59ms | 219.10ms | 1.12s |
| 100x15 - 6 sources - dynamic (very dynamic) | 390.92ms | 225.25ms | 217.20ms | 304.76ms | 370.11ms | 1.63s |

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
