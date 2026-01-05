# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.66s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.26s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.06s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.19s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.32s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.47s |

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
| avoidablePropagation | 209.56ms | 186.22ms | 158.88ms (fail) | 297.69ms | 207.09ms | 2.35s |
| broadPropagation | 453.79ms | 353.76ms | 6.51ms (fail) | 493.83ms | 465.38ms | 4.41s |
| deepPropagation | 170.81ms | 121.89ms | 139.75ms (fail) | 168.70ms | 176.92ms | 1.52s |
| diamond | 283.48ms | 231.07ms | 192.87ms (fail) | 352.92ms | 281.60ms | 2.42s |
| mux | 402.40ms | 360.21ms | 183.85ms (fail) | 415.08ms | 393.18ms | 1.82s |
| repeatedObservers | 46.09ms | 43.42ms | 52.78ms (fail) | 81.25ms | 40.71ms | 234.37ms |
| triangle | 101.22ms | 83.40ms | 79.23ms (fail) | 133.10ms | 100.89ms | 751.12ms |
| unstable | 77.85ms | 62.91ms | 335.75ms (fail) | 96.05ms | 69.87ms | 343.65ms |
| molBench | 496.17ms | 484.51ms | 1.20ms | 489.57ms | 479.53ms | 589.27ms |
| create_signals | 26.13ms | 22.60ms | 57.69ms | 77.23ms | 5.40ms | 65.04ms |
| comp_0to1 | 11.65ms | 11.71ms | 52.56ms | 33.33ms | 17.84ms | 15.89ms |
| comp_1to1 | 26.73ms | 4.18ms | 53.78ms | 42.80ms | 14.51ms | 44.41ms |
| comp_2to1 | 17.99ms | 2.28ms | 36.87ms | 14.12ms | 17.35ms | 23.69ms |
| comp_4to1 | 3.27ms | 8.57ms | 16.33ms | 15.60ms | 14.16ms | 17.41ms |
| comp_1000to1 | 5μs | 3μs | 40μs | 19μs | 4μs | 20μs |
| comp_1to2 | 16.19ms | 15.18ms | 44.49ms | 34.29ms | 18.20ms | 35.59ms |
| comp_1to4 | 13.30ms | 5.47ms | 44.13ms | 22.72ms | 33.64ms | 17.83ms |
| comp_1to8 | 6.28ms | 4.47ms | 42.17ms | 23.51ms | 8.47ms | 20.43ms |
| comp_1to1000 | 4.19ms | 3.47ms | 38.16ms | 14.67ms | 5.21ms | 15.48ms |
| update_1to1 | 9.30ms | 4.63ms | 6.12ms | 16.02ms | 8.75ms | 21.06ms |
| update_2to1 | 4.71ms | 2.30ms | 3.08ms | 7.75ms | 4.30ms | 10.83ms |
| update_4to1 | 2.40ms | 1.19ms | 1.57ms | 3.86ms | 2.24ms | 5.69ms |
| update_1000to1 | 23μs | 21μs | 16μs | 38μs | 22μs | 53μs |
| update_1to2 | 4.74ms | 3.02ms | 3.24ms | 7.88ms | 4.37ms | 10.69ms |
| update_1to4 | 2.56ms | 1.76ms | 1.59ms | 3.86ms | 2.23ms | 5.25ms |
| update_1to1000 | 44μs | 50μs | 366μs | 144μs | 183μs | 169μs |
| cellx1000 | 9.81ms | 7.25ms | 6.96ms | 11.70ms | 9.74ms | 72.44ms |
| cellx2500 | 31.11ms | 20.23ms | 39.48ms | 33.06ms | 26.05ms | 266.37ms |
| cellx5000 | 67.94ms | 44.15ms | 97.11ms | 80.10ms | 71.56ms | 548.79ms |
| 10x5 - 2 sources - read 20.0% (simple) | 507.95ms | 242.71ms | 235.83ms | 344.54ms | 434.47ms | 2.05s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 281.97ms | 188.57ms | 197.40ms | 242.95ms | 280.78ms | 1.49s |
| 1000x12 - 4 sources - dynamic (large) | 3.89s | 280.14ms | 356.10ms | 465.02ms | 3.64s | 1.89s |
| 1000x5 - 25 sources (wide dense) | 3.31s | 407.94ms | 521.93ms | 596.90ms | 2.54s | 3.42s |
| 5x500 - 3 sources (deep) | 223.04ms | 190.57ms | 204.65ms | 253.11ms | 229.18ms | 1.15s |
| 100x15 - 6 sources - dynamic (very dynamic) | 474.77ms | 262.12ms | 257.01ms | 385.44ms | 458.37ms | 1.68s |

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
