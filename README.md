# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.33s |
| 🥈 | preact_signals | 0.31 | 100.0% | 35/35 | 8.59s |
| 🥉 | signals | 0.30 | 100.0% | 35/35 | 9.14s |
| 4 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 4.88s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.24s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.08s |

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
| avoidablePropagation | 194.82ms | 167.29ms | 135.80ms (fail) | 246.84ms | 183.92ms | 2.23s |
| broadPropagation | 393.43ms | 302.70ms | 5.70ms (fail) | 456.06ms | 381.23ms | 4.04s |
| deepPropagation | 171.96ms | 108.15ms | 150.52ms (fail) | 150.41ms | 175.85ms | 1.44s |
| diamond | 256.29ms | 235.78ms | 176.60ms (fail) | 344.77ms | 253.21ms | 2.28s |
| mux | 332.56ms | 328.99ms | 160.05ms (fail) | 394.69ms | 333.82ms | 1.72s |
| repeatedObservers | 38.90ms | 40.48ms | 47.67ms (fail) | 72.70ms | 33.27ms | 216.59ms |
| triangle | 92.21ms | 80.02ms | 74.77ms (fail) | 112.38ms | 93.34ms | 737.01ms |
| unstable | 64.57ms | 58.83ms | 323.58ms (fail) | 97.33ms | 59.31ms | 315.67ms |
| molBench | 388.44ms | 364.62ms | 916μs | 397.08ms | 363.24ms | 478.85ms |
| create_signals | 23.87ms | 30.50ms | 66.06ms | 78.42ms | 6.96ms | 77.04ms |
| comp_0to1 | 11.10ms | 9.41ms | 60.91ms | 25.41ms | 20.08ms | 22.28ms |
| comp_1to1 | 30.92ms | 5.92ms | 62.05ms | 43.77ms | 12.86ms | 45.75ms |
| comp_2to1 | 11.39ms | 2.99ms | 39.58ms | 13.74ms | 14.15ms | 9.46ms |
| comp_4to1 | 7.64ms | 11.91ms | 16.07ms | 11.38ms | 13.74ms | 35.18ms |
| comp_1000to1 | 7μs | 5μs | 45μs | 35μs | 6μs | 35μs |
| comp_1to2 | 21.64ms | 13.64ms | 45.76ms | 30.53ms | 27.64ms | 39.21ms |
| comp_1to4 | 13.04ms | 16.32ms | 45.13ms | 24.78ms | 31.43ms | 30.23ms |
| comp_1to8 | 7.98ms | 5.97ms | 43.41ms | 37.72ms | 17.10ms | 27.37ms |
| comp_1to1000 | 5.04ms | 5.17ms | 38.72ms | 15.36ms | 6.22ms | 16.31ms |
| update_1to1 | 8.87ms | 4.04ms | 4.65ms | 14.36ms | 8.25ms | 19.81ms |
| update_2to1 | 4.64ms | 2.04ms | 2.56ms | 7.28ms | 3.91ms | 10.15ms |
| update_4to1 | 2.37ms | 1.74ms | 1.23ms | 3.64ms | 2.13ms | 5.49ms |
| update_1000to1 | 22μs | 18μs | 12μs | 37μs | 17μs | 47μs |
| update_1to2 | 4.16ms | 3.54ms | 2.37ms | 7.14ms | 4.33ms | 10.11ms |
| update_1to4 | 2.17ms | 1.83ms | 1.26ms | 3.62ms | 2.03ms | 4.96ms |
| update_1to1000 | 58μs | 60μs | 372μs | 152μs | 63μs | 173μs |
| cellx1000 | 10.52ms | 10.08ms | 8.56ms | 19.00ms | 10.97ms | 103.57ms |
| cellx2500 | 34.44ms | 27.78ms | 28.64ms | 51.98ms | 29.73ms | 280.55ms |
| cellx5000 | 70.51ms | 61.41ms | 70.96ms | 119.14ms | 80.49ms | 599.93ms |
| 10x5 - 2 sources - read 20.0% (simple) | 417.84ms | 228.03ms | 221.58ms | 358.21ms | 384.01ms | 2.03s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 239.06ms | 173.65ms | 172.33ms | 251.96ms | 232.70ms | 1.49s |
| 1000x12 - 4 sources - dynamic (large) | 3.10s | 248.31ms | 271.29ms | 368.14ms | 2.94s | 1.73s |
| 1000x5 - 25 sources (wide dense) | 2.57s | 355.06ms | 380.55ms | 542.06ms | 2.26s | 3.37s |
| 5x500 - 3 sources (deep) | 216.42ms | 199.26ms | 201.85ms | 274.78ms | 221.55ms | 1.16s |
| 100x15 - 6 sources - dynamic (very dynamic) | 396.81ms | 224.82ms | 220.92ms | 303.64ms | 378.85ms | 1.66s |

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
