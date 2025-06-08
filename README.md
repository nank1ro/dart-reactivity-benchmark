# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.65s |
| 🥈 | signals | 0.25 | 100.0% | 35/35 | 11.40s |
| 🥉 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.31s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.29s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 28.05s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.40s |

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
| Test Case | state_beacon | alien_signals | mobx | solidart(2.0-dev) | signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 148.63ms (fail) | 184.00ms | 2.32s | 268.96ms | 219.22ms | 199.50ms |
| broadPropagation | 5.88ms (fail) | 344.55ms | 4.54s | 501.14ms | 522.76ms | 496.06ms |
| deepPropagation | 141.76ms (fail) | 122.51ms | 1.57s | 169.68ms | 175.58ms | 178.96ms |
| diamond | 186.23ms (fail) | 229.13ms | 2.43s | 349.40ms | 294.58ms | 295.52ms |
| mux | 192.61ms (fail) | 366.55ms | 1.82s | 445.07ms | 408.60ms | 404.99ms |
| repeatedObservers | 54.78ms (fail) | 45.36ms | 228.86ms | 80.98ms | 46.79ms | 41.35ms |
| triangle | 77.46ms (fail) | 84.88ms | 776.47ms | 118.84ms | 104.90ms | 103.06ms |
| unstable | 336.11ms (fail) | 66.95ms | 346.81ms | 96.95ms | 81.81ms | 72.67ms |
| molBench | 882μs | 482.01ms | 574.15ms | 493.71ms | 485.98ms | 489.46ms |
| create_signals | 66.24ms | 27.68ms | 72.92ms | 79.46ms | 25.17ms | 4.71ms |
| comp_0to1 | 63.88ms | 6.90ms | 25.62ms | 49.58ms | 10.94ms | 17.45ms |
| comp_1to1 | 61.08ms | 4.49ms | 29.59ms | 52.50ms | 27.22ms | 14.67ms |
| comp_2to1 | 38.30ms | 2.34ms | 15.33ms | 43.19ms | 9.05ms | 21.85ms |
| comp_4to1 | 17.13ms | 8.49ms | 14.75ms | 15.61ms | 1.98ms | 14.62ms |
| comp_1000to1 | 41μs | 3μs | 23μs | 18μs | 4μs | 5μs |
| comp_1to2 | 46.24ms | 15.18ms | 38.14ms | 34.53ms | 22.65ms | 18.47ms |
| comp_1to4 | 44.62ms | 5.31ms | 24.64ms | 21.78ms | 9.50ms | 30.49ms |
| comp_1to8 | 43.31ms | 4.60ms | 22.22ms | 23.88ms | 9.03ms | 6.78ms |
| comp_1to1000 | 39.96ms | 3.62ms | 16.09ms | 17.35ms | 7.05ms | 6.02ms |
| update_1to1 | 5.64ms | 10.51ms | 25.88ms | 16.02ms | 9.09ms | 8.72ms |
| update_2to1 | 3.13ms | 2.28ms | 14.04ms | 7.92ms | 4.46ms | 4.41ms |
| update_4to1 | 1.45ms | 2.58ms | 6.91ms | 4.04ms | 2.21ms | 2.14ms |
| update_1000to1 | 14μs | 24μs | 69μs | 40μs | 22μs | 21μs |
| update_1to2 | 2.84ms | 5.14ms | 12.54ms | 7.98ms | 4.46ms | 4.64ms |
| update_1to4 | 1.45ms | 2.57ms | 6.23ms | 4.02ms | 2.25ms | 2.17ms |
| update_1to1000 | 389μs | 43μs | 172μs | 174μs | 42μs | 819μs |
| cellx1000 | 6.79ms | 9.18ms | 73.86ms | 11.96ms | 9.66ms | 9.63ms |
| cellx2500 | 24.02ms | 19.69ms | 267.86ms | 32.73ms | 31.34ms | 25.26ms |
| cellx5000 | 58.87ms | 43.67ms | 555.97ms | 71.22ms | 59.34ms | 70.48ms |
| 10x5 - 2 sources - read 20.0% (simple) | 244.39ms | 231.35ms | 2.05s | 360.61ms | 514.83ms | 435.67ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 201.65ms | 176.68ms | 1.57s | 244.46ms | 283.46ms | 267.53ms |
| 1000x12 - 4 sources - dynamic (large) | 346.00ms | 279.39ms | 2.07s | 459.62ms | 3.74s | 3.68s |
| 1000x5 - 25 sources (wide dense) | 479.88ms | 408.74ms | 3.65s | 587.85ms | 3.58s | 2.68s |
| 5x500 - 3 sources (deep) | 203.86ms | 191.57ms | 1.18s | 251.15ms | 226.74ms | 225.51ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 259.26ms | 266.60ms | 1.69s | 384.15ms | 471.71ms | 447.65ms |

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
