# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.35s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 4.84s |
| 🥉 | signals | 0.28 | 100.0% | 35/35 | 9.29s |
| 4 | preact_signals | 0.27 | 100.0% | 35/35 | 8.72s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 25.88s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.07s |

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
| Test Case | solidart(2.0-dev) | signals | mobx | preact_signals | state_beacon | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 246.65ms | 200.41ms | 2.28s | 192.28ms | 132.53ms (fail) | 167.13ms |
| broadPropagation | 462.83ms | 428.03ms | 4.02s | 384.54ms | 5.43ms (fail) | 304.05ms |
| deepPropagation | 150.45ms | 172.64ms | 1.41s | 178.60ms | 153.72ms (fail) | 107.40ms |
| diamond | 347.08ms | 261.71ms | 2.21s | 256.12ms | 176.40ms (fail) | 231.00ms |
| mux | 385.19ms | 336.78ms | 1.73s | 334.01ms | 161.71ms (fail) | 330.58ms |
| repeatedObservers | 72.64ms | 39.88ms | 221.03ms | 33.98ms | 45.53ms (fail) | 40.20ms |
| triangle | 114.16ms | 91.91ms | 729.67ms | 93.62ms | 76.17ms (fail) | 79.34ms |
| unstable | 96.25ms | 65.79ms | 327.22ms | 58.70ms | 315.35ms (fail) | 57.49ms |
| molBench | 370.36ms | 389.49ms | 478.75ms | 364.11ms | 914μs | 361.81ms |
| create_signals | 72.14ms | 23.30ms | 73.79ms | 6.72ms | 71.29ms | 33.23ms |
| comp_0to1 | 40.48ms | 11.22ms | 38.69ms | 19.23ms | 56.60ms | 10.43ms |
| comp_1to1 | 52.34ms | 31.93ms | 29.92ms | 26.52ms | 62.02ms | 5.20ms |
| comp_2to1 | 29.19ms | 9.88ms | 27.66ms | 14.52ms | 44.42ms | 3.18ms |
| comp_4to1 | 8.60ms | 8.21ms | 24.34ms | 17.25ms | 16.89ms | 15.93ms |
| comp_1000to1 | 102μs | 6μs | 16μs | 11μs | 40μs | 6μs |
| comp_1to2 | 36.77ms | 18.91ms | 37.95ms | 24.12ms | 45.71ms | 24.34ms |
| comp_1to4 | 16.94ms | 21.36ms | 25.86ms | 32.22ms | 44.44ms | 9.55ms |
| comp_1to8 | 20.52ms | 8.18ms | 24.45ms | 7.94ms | 43.04ms | 9.59ms |
| comp_1to1000 | 13.79ms | 4.95ms | 15.91ms | 7.70ms | 37.49ms | 4.99ms |
| update_1to1 | 14.32ms | 9.67ms | 19.97ms | 7.84ms | 4.43ms | 3.83ms |
| update_2to1 | 7.24ms | 4.74ms | 10.05ms | 4.22ms | 2.53ms | 1.89ms |
| update_4to1 | 3.65ms | 2.52ms | 5.10ms | 2.19ms | 1.09ms | 916μs |
| update_1000to1 | 34μs | 27μs | 49μs | 20μs | 20μs | 11μs |
| update_1to2 | 7.14ms | 4.71ms | 10.18ms | 4.08ms | 2.19ms | 1.99ms |
| update_1to4 | 3.61ms | 2.62ms | 4.91ms | 2.13ms | 1.14ms | 1.06ms |
| update_1to1000 | 147μs | 60μs | 164μs | 458μs | 432μs | 45μs |
| cellx1000 | 16.85ms | 11.28ms | 86.46ms | 10.24ms | 9.46ms | 9.74ms |
| cellx2500 | 44.59ms | 33.69ms | 257.15ms | 30.94ms | 29.97ms | 26.95ms |
| cellx5000 | 92.96ms | 74.84ms | 573.11ms | 68.63ms | 60.39ms | 62.31ms |
| 10x5 - 2 sources - read 20.0% (simple) | 362.74ms | 419.03ms | 1.96s | 397.49ms | 222.88ms | 229.48ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 251.80ms | 238.43ms | 1.42s | 233.33ms | 173.29ms | 172.49ms |
| 1000x12 - 4 sources - dynamic (large) | 369.74ms | 3.15s | 1.70s | 3.02s | 270.77ms | 251.64ms |
| 1000x5 - 25 sources (wide dense) | 545.83ms | 2.59s | 3.35s | 2.28s | 380.54ms | 356.77ms |
| 5x500 - 3 sources (deep) | 275.56ms | 214.47ms | 1.14s | 224.79ms | 203.73ms | 210.38ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 308.79ms | 408.18ms | 1.63s | 385.83ms | 217.94ms | 223.53ms |

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
