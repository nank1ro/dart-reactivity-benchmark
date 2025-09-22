# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.81s |
| 🥈 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.45s |
| 🥉 | signals | 0.29 | 100.0% | 35/35 | 11.87s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.89s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.31s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.59s |

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
| avoidablePropagation | 207.07ms | 158.93ms (fail) | 265.87ms | 210.97ms | 197.06ms | 2.39s |
| broadPropagation | 458.69ms | 6.33ms (fail) | 505.50ms | 478.73ms | 352.36ms | 4.39s |
| deepPropagation | 182.43ms | 139.12ms (fail) | 165.60ms | 179.88ms | 131.00ms | 1.53s |
| diamond | 283.20ms | 208.08ms (fail) | 352.48ms | 283.78ms | 235.78ms | 2.41s |
| mux | 402.58ms | 200.94ms (fail) | 431.75ms | 409.53ms | 382.41ms | 1.88s |
| repeatedObservers | 40.34ms | 53.65ms (fail) | 80.96ms | 46.43ms | 43.84ms | 235.50ms |
| triangle | 100.44ms | 78.80ms (fail) | 114.90ms | 104.21ms | 84.30ms | 781.00ms |
| unstable | 74.74ms | 376.87ms (fail) | 103.30ms | 75.77ms | 61.67ms | 351.90ms |
| molBench | 489.07ms | 973μs | 501.00ms | 487.13ms | 489.39ms | 585.38ms |
| create_signals | 17.84ms | 64.85ms | 80.82ms | 27.72ms | 25.09ms | 78.63ms |
| comp_0to1 | 16.17ms | 58.18ms | 29.39ms | 12.53ms | 8.03ms | 28.03ms |
| comp_1to1 | 7.41ms | 60.93ms | 27.87ms | 31.62ms | 4.25ms | 17.69ms |
| comp_2to1 | 10.59ms | 40.57ms | 41.09ms | 8.70ms | 2.33ms | 21.53ms |
| comp_4to1 | 9.10ms | 18.10ms | 4.27ms | 2.99ms | 9.24ms | 26.43ms |
| comp_1000to1 | 6μs | 47μs | 26μs | 5μs | 5μs | 16μs |
| comp_1to2 | 22.58ms | 50.00ms | 32.51ms | 15.55ms | 15.43ms | 39.42ms |
| comp_1to4 | 29.59ms | 49.70ms | 21.02ms | 7.13ms | 7.18ms | 29.05ms |
| comp_1to8 | 7.97ms | 47.64ms | 25.05ms | 7.84ms | 8.13ms | 27.26ms |
| comp_1to1000 | 6.95ms | 41.98ms | 14.52ms | 4.52ms | 5.54ms | 15.55ms |
| update_1to1 | 9.78ms | 6.01ms | 16.95ms | 10.13ms | 8.90ms | 27.43ms |
| update_2to1 | 5.10ms | 3.13ms | 8.17ms | 4.53ms | 3.82ms | 13.60ms |
| update_4to1 | 2.51ms | 1.56ms | 4.18ms | 2.54ms | 2.19ms | 7.58ms |
| update_1000to1 | 22μs | 15μs | 51μs | 25μs | 21μs | 69μs |
| update_1to2 | 4.78ms | 3.06ms | 8.43ms | 4.50ms | 4.37ms | 14.07ms |
| update_1to4 | 2.45ms | 1.57ms | 4.13ms | 2.70ms | 2.17ms | 5.96ms |
| update_1to1000 | 757μs | 416μs | 152μs | 45μs | 48μs | 196μs |
| cellx1000 | 14.24ms | 8.83ms | 17.19ms | 14.79ms | 9.82ms | 109.34ms |
| cellx2500 | 54.19ms | 40.91ms | 69.93ms | 58.09ms | 34.76ms | 331.49ms |
| cellx5000 | 144.14ms | 95.58ms | 178.78ms | 128.51ms | 90.31ms | 696.92ms |
| 10x5 - 2 sources - read 20.0% (simple) | 534.70ms | 245.51ms | 351.19ms | 510.69ms | 239.69ms | 2.03s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 302.48ms | 195.47ms | 253.09ms | 280.33ms | 180.66ms | 1.54s |
| 1000x12 - 4 sources - dynamic (large) | 3.88s | 350.40ms | 474.09ms | 4.09s | 290.50ms | 1.98s |
| 1000x5 - 25 sources (wide dense) | 2.84s | 510.56ms | 615.34ms | 3.64s | 409.24ms | 3.57s |
| 5x500 - 3 sources (deep) | 252.16ms | 208.74ms | 256.56ms | 224.24ms | 196.20ms | 1.33s |
| 100x15 - 6 sources - dynamic (very dynamic) | 480.52ms | 262.75ms | 393.43ms | 491.61ms | 270.76ms | 1.80s |

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
