# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.68s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.33s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.55s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.07s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.42s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.42s |

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
| Test Case | solidart(2.0-dev) | preact_signals | alien_signals | state_beacon | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 271.67ms | 205.70ms | 186.98ms | 158.89ms (fail) | 2.37s | 210.94ms |
| broadPropagation | 501.51ms | 462.01ms | 354.63ms | 6.66ms (fail) | 4.22s | 453.87ms |
| deepPropagation | 168.50ms | 179.19ms | 124.37ms | 138.51ms (fail) | 1.53s | 168.07ms |
| diamond | 355.28ms | 285.48ms | 231.81ms | 187.75ms (fail) | 2.41s | 287.10ms |
| mux | 437.39ms | 384.36ms | 376.21ms | 191.97ms (fail) | 1.85s | 405.16ms |
| repeatedObservers | 80.95ms | 38.74ms | 45.24ms | 52.90ms (fail) | 228.29ms | 46.04ms |
| triangle | 119.31ms | 99.98ms | 85.10ms | 77.08ms (fail) | 768.15ms | 102.94ms |
| unstable | 93.74ms | 70.86ms | 60.95ms | 339.94ms (fail) | 346.08ms | 73.93ms |
| molBench | 492.56ms | 491.15ms | 491.89ms | 1.31ms | 578.87ms | 488.32ms |
| create_signals | 54.94ms | 5.24ms | 26.61ms | 59.27ms | 85.95ms | 24.93ms |
| comp_0to1 | 25.46ms | 18.26ms | 8.06ms | 51.40ms | 26.91ms | 11.36ms |
| comp_1to1 | 40.62ms | 14.26ms | 4.16ms | 52.76ms | 39.65ms | 17.74ms |
| comp_2to1 | 26.25ms | 17.08ms | 2.25ms | 35.28ms | 32.45ms | 10.14ms |
| comp_4to1 | 4.91ms | 7.80ms | 8.61ms | 15.86ms | 30.81ms | 2.18ms |
| comp_1000to1 | 16μs | 6μs | 5μs | 41μs | 28μs | 5μs |
| comp_1to2 | 39.62ms | 26.94ms | 13.85ms | 44.52ms | 33.79ms | 13.30ms |
| comp_1to4 | 22.22ms | 26.69ms | 7.40ms | 42.84ms | 21.48ms | 10.61ms |
| comp_1to8 | 21.22ms | 6.08ms | 7.15ms | 42.30ms | 23.64ms | 6.75ms |
| comp_1to1000 | 14.67ms | 6.32ms | 3.50ms | 37.78ms | 15.29ms | 4.45ms |
| update_1to1 | 16.14ms | 8.25ms | 11.32ms | 5.73ms | 25.17ms | 9.24ms |
| update_2to1 | 7.94ms | 4.06ms | 5.11ms | 2.86ms | 12.21ms | 4.62ms |
| update_4to1 | 4.05ms | 2.09ms | 2.94ms | 1.46ms | 6.23ms | 2.33ms |
| update_1000to1 | 40μs | 20μs | 21μs | 15μs | 62μs | 23μs |
| update_1to2 | 8.11ms | 4.05ms | 5.65ms | 2.95ms | 12.67ms | 4.90ms |
| update_1to4 | 4.05ms | 2.08ms | 2.46ms | 1.46ms | 6.34ms | 2.37ms |
| update_1to1000 | 157μs | 914μs | 49μs | 379μs | 170μs | 43μs |
| cellx1000 | 14.63ms | 10.18ms | 6.98ms | 5.53ms | 72.28ms | 9.35ms |
| cellx2500 | 63.96ms | 31.02ms | 18.32ms | 27.60ms | 246.90ms | 30.36ms |
| cellx5000 | 116.32ms | 104.20ms | 39.47ms | 57.61ms | 538.14ms | 61.46ms |
| 10x5 - 2 sources - read 20.0% (simple) | 355.92ms | 440.69ms | 227.87ms | 251.21ms | 2.00s | 506.66ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 250.38ms | 271.73ms | 175.89ms | 200.06ms | 1.53s | 278.84ms |
| 1000x12 - 4 sources - dynamic (large) | 479.07ms | 3.58s | 286.45ms | 342.78ms | 1.84s | 4.02s |
| 1000x5 - 25 sources (wide dense) | 593.18ms | 2.59s | 408.10ms | 511.53ms | 3.65s | 3.57s |
| 5x500 - 3 sources (deep) | 264.78ms | 228.66ms | 192.80ms | 207.11ms | 1.15s | 225.57ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 380.80ms | 450.07ms | 260.89ms | 262.48ms | 1.73s | 481.45ms |

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
