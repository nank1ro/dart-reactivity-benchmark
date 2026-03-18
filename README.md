# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.27s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.29s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.44s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.00s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 200.27ms | 2.31s | 172.19ms (fail) | 192.80ms | 208.20ms | 278.30ms |
| broadPropagation | 455.56ms | 4.22s | 6.78ms (fail) | 355.63ms | 461.38ms | 521.91ms |
| deepPropagation | 171.40ms | 1.52s | 136.66ms (fail) | 127.52ms | 174.94ms | 166.12ms |
| diamond | 286.28ms | 2.39s | 175.51ms (fail) | 245.53ms | 284.90ms | 359.78ms |
| mux | 403.31ms | 1.75s | 178.74ms (fail) | 362.80ms | 376.79ms | 424.90ms |
| repeatedObservers | 45.79ms | 234.15ms | 55.39ms (fail) | 45.58ms | 41.78ms | 80.56ms |
| triangle | 102.70ms | 771.95ms | 98.20ms (fail) | 87.53ms | 98.77ms | 115.83ms |
| unstable | 76.08ms | 348.01ms | 334.83ms (fail) | 63.02ms | 72.16ms | 95.03ms |
| molBench | 493.68ms | 588.87ms | 1.37ms | 481.59ms | 495.04ms | 490.53ms |
| create_signals | 30.68ms | 70.14ms | 59.52ms | 27.18ms | 5.53ms | 59.37ms |
| comp_0to1 | 12.01ms | 26.65ms | 54.38ms | 9.36ms | 18.59ms | 25.81ms |
| comp_1to1 | 27.20ms | 44.73ms | 55.57ms | 4.26ms | 14.00ms | 43.20ms |
| comp_2to1 | 8.99ms | 21.61ms | 36.27ms | 2.31ms | 16.99ms | 24.95ms |
| comp_4to1 | 1.95ms | 16.92ms | 16.34ms | 7.39ms | 14.76ms | 14.83ms |
| comp_1000to1 | 5μs | 15μs | 44μs | 3μs | 4μs | 15μs |
| comp_1to2 | 22.32ms | 33.74ms | 46.59ms | 11.29ms | 18.63ms | 30.22ms |
| comp_1to4 | 15.17ms | 18.32ms | 45.92ms | 12.09ms | 35.36ms | 20.74ms |
| comp_1to8 | 6.86ms | 20.83ms | 44.77ms | 5.15ms | 9.25ms | 21.40ms |
| comp_1to1000 | 4.06ms | 15.09ms | 41.07ms | 3.32ms | 4.84ms | 14.59ms |
| update_1to1 | 9.03ms | 21.52ms | 7.71ms | 4.66ms | 8.90ms | 15.85ms |
| update_2to1 | 4.47ms | 10.51ms | 2.87ms | 2.35ms | 4.55ms | 7.81ms |
| update_4to1 | 2.20ms | 5.40ms | 2.35ms | 1.22ms | 2.26ms | 3.90ms |
| update_1000to1 | 22μs | 52μs | 15μs | 12μs | 31μs | 39μs |
| update_1to2 | 4.42ms | 10.51ms | 4.75ms | 2.37ms | 4.50ms | 8.04ms |
| update_1to4 | 2.23ms | 5.34ms | 1.50ms | 1.22ms | 2.35ms | 4.00ms |
| update_1to1000 | 42μs | 154μs | 407μs | 46μs | 151μs | 145μs |
| cellx1000 | 9.88ms | 72.33ms | 5.29ms | 10.12ms | 10.01ms | 11.82ms |
| cellx2500 | 34.25ms | 251.19ms | 24.11ms | 19.59ms | 28.74ms | 39.58ms |
| cellx5000 | 73.91ms | 578.75ms | 70.72ms | 41.42ms | 74.78ms | 103.00ms |
| 10x5 - 2 sources - read 20.0% (simple) | 502.37ms | 2.00s | 253.66ms | 239.38ms | 466.63ms | 344.74ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 281.86ms | 1.49s | 199.77ms | 185.02ms | 280.66ms | 248.37ms |
| 1000x12 - 4 sources - dynamic (large) | 3.86s | 1.89s | 344.70ms | 280.15ms | 3.75s | 464.46ms |
| 1000x5 - 25 sources (wide dense) | 3.44s | 3.45s | 513.21ms | 409.74ms | 2.76s | 591.47ms |
| 5x500 - 3 sources (deep) | 222.75ms | 1.13s | 208.50ms | 190.98ms | 233.41ms | 252.52ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 470.77ms | 1.68s | 256.93ms | 262.21ms | 459.93ms | 382.31ms |

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
