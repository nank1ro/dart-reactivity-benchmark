# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.31s |
| 🥈 | signals | 0.28 | 100.0% | 35/35 | 9.11s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 8.53s |
| 4 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 4.86s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.00s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.04s |

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
| avoidablePropagation | 194.53ms | 167.32ms | 135.68ms (fail) | 246.10ms | 183.48ms | 2.24s |
| broadPropagation | 388.45ms | 303.65ms | 5.59ms (fail) | 454.32ms | 381.88ms | 4.07s |
| deepPropagation | 172.14ms | 107.78ms | 150.30ms (fail) | 149.87ms | 173.57ms | 1.46s |
| diamond | 257.80ms | 234.16ms | 176.85ms (fail) | 343.33ms | 251.15ms | 2.27s |
| mux | 333.11ms | 328.81ms | 156.74ms (fail) | 381.02ms | 322.32ms | 1.71s |
| repeatedObservers | 38.96ms | 40.41ms | 47.53ms (fail) | 73.00ms | 33.07ms | 216.97ms |
| triangle | 92.02ms | 79.87ms | 77.04ms (fail) | 112.22ms | 92.55ms | 720.98ms |
| unstable | 64.49ms | 58.89ms | 325.22ms (fail) | 97.06ms | 56.99ms | 314.48ms |
| molBench | 388.71ms | 363.94ms | 807μs | 396.82ms | 362.90ms | 477.49ms |
| create_signals | 22.61ms | 30.86ms | 57.96ms | 65.27ms | 6.45ms | 67.53ms |
| comp_0to1 | 10.99ms | 9.36ms | 57.27ms | 33.60ms | 18.62ms | 23.81ms |
| comp_1to1 | 26.42ms | 5.26ms | 52.78ms | 51.65ms | 17.60ms | 30.99ms |
| comp_2to1 | 8.17ms | 2.94ms | 34.52ms | 32.75ms | 19.47ms | 12.09ms |
| comp_4to1 | 2.53ms | 11.94ms | 16.13ms | 10.44ms | 10.89ms | 16.91ms |
| comp_1000to1 | 7μs | 9μs | 45μs | 31μs | 9μs | 19μs |
| comp_1to2 | 21.61ms | 14.34ms | 45.32ms | 40.40ms | 15.29ms | 38.05ms |
| comp_1to4 | 12.45ms | 13.51ms | 44.98ms | 25.01ms | 21.13ms | 31.91ms |
| comp_1to8 | 8.90ms | 6.08ms | 43.14ms | 25.43ms | 7.38ms | 25.17ms |
| comp_1to1000 | 7.41ms | 5.10ms | 38.43ms | 15.29ms | 6.95ms | 15.85ms |
| update_1to1 | 8.74ms | 3.79ms | 4.61ms | 14.29ms | 8.79ms | 20.09ms |
| update_2to1 | 4.37ms | 1.97ms | 2.68ms | 7.13ms | 4.00ms | 9.84ms |
| update_4to1 | 2.38ms | 956μs | 1.18ms | 3.60ms | 2.40ms | 5.60ms |
| update_1000to1 | 23μs | 10μs | 12μs | 35μs | 19μs | 49μs |
| update_1to2 | 4.36ms | 2.06ms | 2.31ms | 7.17ms | 4.37ms | 10.03ms |
| update_1to4 | 2.23ms | 931μs | 1.21ms | 3.63ms | 2.17ms | 5.05ms |
| update_1to1000 | 60μs | 47μs | 375μs | 149μs | 391μs | 190μs |
| cellx1000 | 10.98ms | 8.85ms | 8.17ms | 19.10ms | 10.48ms | 82.51ms |
| cellx2500 | 35.33ms | 25.96ms | 30.84ms | 52.84ms | 27.50ms | 251.90ms |
| cellx5000 | 69.66ms | 58.41ms | 61.88ms | 104.33ms | 69.27ms | 576.90ms |
| 10x5 - 2 sources - read 20.0% (simple) | 416.94ms | 226.78ms | 225.73ms | 362.19ms | 383.09ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 239.86ms | 173.72ms | 173.54ms | 251.19ms | 237.49ms | 1.48s |
| 1000x12 - 4 sources - dynamic (large) | 3.11s | 249.35ms | 266.23ms | 369.94ms | 2.94s | 1.68s |
| 1000x5 - 25 sources (wide dense) | 2.56s | 354.21ms | 378.53ms | 543.70ms | 2.26s | 3.33s |
| 5x500 - 3 sources (deep) | 212.93ms | 196.19ms | 197.30ms | 267.60ms | 220.90ms | 1.15s |
| 100x15 - 6 sources - dynamic (very dynamic) | 392.15ms | 224.09ms | 217.66ms | 304.15ms | 377.49ms | 1.65s |

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
