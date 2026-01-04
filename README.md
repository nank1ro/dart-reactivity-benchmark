# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.74s |
| 🥈 | solidart(2.0-dev) | 0.24 | 100.0% | 35/35 | 5.53s |
| 🥉 | signals | 0.24 | 100.0% | 35/35 | 11.97s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 9.95s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.79s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.33s |

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
| avoidablePropagation | 220.33ms | 186.40ms | 153.10ms (fail) | 271.32ms | 226.94ms | 2.23s |
| broadPropagation | 523.38ms | 353.10ms | 5.98ms (fail) | 496.75ms | 507.39ms | 4.28s |
| deepPropagation | 182.13ms | 116.00ms | 149.45ms (fail) | 166.96ms | 210.65ms | 1.49s |
| diamond | 295.01ms | 263.92ms | 185.50ms (fail) | 378.34ms | 311.23ms | 2.21s |
| mux | 385.79ms | 370.11ms | 185.39ms (fail) | 430.14ms | 404.51ms | 1.70s |
| repeatedObservers | 46.52ms | 43.46ms | 53.79ms (fail) | 88.95ms | 42.31ms | 224.17ms |
| triangle | 106.76ms | 87.09ms | 80.81ms (fail) | 120.95ms | 110.59ms | 724.59ms |
| unstable | 80.31ms | 60.90ms | 338.18ms (fail) | 109.40ms | 73.23ms | 329.60ms |
| molBench | 547.47ms | 551.63ms | 1.06ms | 554.06ms | 562.72ms | 637.96ms |
| create_signals | 28.71ms | 27.29ms | 65.24ms | 105.41ms | 5.72ms | 77.63ms |
| comp_0to1 | 12.79ms | 7.79ms | 51.74ms | 36.18ms | 19.77ms | 28.76ms |
| comp_1to1 | 22.22ms | 4.11ms | 61.20ms | 45.95ms | 14.98ms | 51.73ms |
| comp_2to1 | 12.86ms | 2.30ms | 38.23ms | 70.92ms | 19.70ms | 39.88ms |
| comp_4to1 | 2.35ms | 9.49ms | 16.85ms | 16.10ms | 12.40ms | 34.38ms |
| comp_1000to1 | 5μs | 4μs | 39μs | 17μs | 7μs | 25μs |
| comp_1to2 | 25.34ms | 13.73ms | 45.77ms | 37.44ms | 31.64ms | 41.95ms |
| comp_1to4 | 16.38ms | 16.00ms | 47.93ms | 21.76ms | 27.43ms | 23.50ms |
| comp_1to8 | 7.44ms | 4.56ms | 41.66ms | 20.17ms | 6.58ms | 24.09ms |
| comp_1to1000 | 4.37ms | 3.42ms | 36.05ms | 14.27ms | 5.80ms | 16.04ms |
| update_1to1 | 9.62ms | 4.76ms | 6.50ms | 16.30ms | 19.08ms | 23.29ms |
| update_2to1 | 4.79ms | 2.45ms | 3.53ms | 8.19ms | 4.24ms | 11.37ms |
| update_4to1 | 2.41ms | 1.22ms | 1.64ms | 4.08ms | 2.14ms | 5.88ms |
| update_1000to1 | 23μs | 18μs | 17μs | 52μs | 22μs | 57μs |
| update_1to2 | 4.79ms | 2.27ms | 3.31ms | 8.46ms | 4.24ms | 11.45ms |
| update_1to4 | 2.75ms | 1.21ms | 1.69ms | 4.09ms | 2.14ms | 5.68ms |
| update_1to1000 | 63μs | 44μs | 352μs | 141μs | 805μs | 164μs |
| cellx1000 | 9.79ms | 7.01ms | 5.02ms | 11.86ms | 10.52ms | 80.48ms |
| cellx2500 | 35.82ms | 21.17ms | 23.68ms | 41.34ms | 31.57ms | 306.86ms |
| cellx5000 | 81.86ms | 50.45ms | 69.30ms | 108.38ms | 83.65ms | 693.76ms |
| 10x5 - 2 sources - read 20.0% (simple) | 504.51ms | 237.29ms | 247.45ms | 382.68ms | 417.27ms | 2.00s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 272.40ms | 185.60ms | 201.24ms | 268.72ms | 261.63ms | 1.41s |
| 1000x12 - 4 sources - dynamic (large) | 4.21s | 267.60ms | 305.54ms | 430.69ms | 3.31s | 1.85s |
| 1000x5 - 25 sources (wide dense) | 3.60s | 414.52ms | 465.43ms | 651.17ms | 2.53s | 3.41s |
| 5x500 - 3 sources (deep) | 230.21ms | 188.91ms | 200.72ms | 265.16ms | 238.69ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 475.47ms | 237.08ms | 236.78ms | 344.19ms | 436.86ms | 1.68s |

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
