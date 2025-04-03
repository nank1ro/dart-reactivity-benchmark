# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.70s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.35s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.32s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.01s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.34s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.44s |

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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 272.47ms | 199.03ms | 2.31s | 187.52ms | 214.25ms | 172.24ms (fail) |
| broadPropagation | 502.23ms | 459.10ms | 4.24s | 354.49ms | 467.82ms | 6.18ms (fail) |
| deepPropagation | 169.86ms | 175.40ms | 1.51s | 124.85ms | 172.55ms | 138.42ms (fail) |
| diamond | 351.13ms | 278.81ms | 2.40s | 234.92ms | 290.04ms | 177.39ms (fail) |
| mux | 445.19ms | 387.37ms | 1.90s | 375.31ms | 421.98ms | 192.83ms (fail) |
| repeatedObservers | 78.20ms | 39.07ms | 223.65ms | 45.42ms | 46.30ms | 52.27ms (fail) |
| triangle | 114.43ms | 99.91ms | 765.59ms | 85.77ms | 104.00ms | 75.48ms (fail) |
| unstable | 93.41ms | 70.70ms | 346.93ms | 60.80ms | 74.66ms | 348.43ms (fail) |
| molBench | 493.23ms | 494.48ms | 580.28ms | 492.82ms | 488.29ms | 1.19ms |
| create_signals | 69.70ms | 4.62ms | 81.87ms | 26.65ms | 28.93ms | 62.08ms |
| comp_0to1 | 31.44ms | 17.79ms | 24.44ms | 6.90ms | 12.04ms | 58.17ms |
| comp_1to1 | 53.62ms | 11.32ms | 34.03ms | 4.17ms | 22.22ms | 55.33ms |
| comp_2to1 | 27.13ms | 18.79ms | 33.84ms | 2.29ms | 8.70ms | 43.07ms |
| comp_4to1 | 19.97ms | 8.78ms | 17.99ms | 8.45ms | 1.86ms | 18.50ms |
| comp_1000to1 | 20μs | 7μs | 21μs | 4μs | 5μs | 41μs |
| comp_1to2 | 43.56ms | 15.04ms | 35.92ms | 10.80ms | 21.74ms | 47.20ms |
| comp_1to4 | 22.60ms | 30.55ms | 20.04ms | 9.06ms | 9.28ms | 46.13ms |
| comp_1to8 | 26.52ms | 8.10ms | 23.46ms | 5.50ms | 8.16ms | 43.36ms |
| comp_1to1000 | 15.29ms | 9.51ms | 15.43ms | 3.55ms | 4.49ms | 38.84ms |
| update_1to1 | 16.22ms | 8.37ms | 24.76ms | 11.39ms | 9.28ms | 5.72ms |
| update_2to1 | 7.92ms | 4.10ms | 11.74ms | 5.05ms | 4.59ms | 2.91ms |
| update_4to1 | 4.03ms | 2.29ms | 6.17ms | 2.78ms | 2.29ms | 1.47ms |
| update_1000to1 | 40μs | 20μs | 66μs | 12μs | 23μs | 15μs |
| update_1to2 | 7.91ms | 4.06ms | 11.60ms | 5.58ms | 4.89ms | 2.95ms |
| update_1to4 | 4.26ms | 2.06ms | 6.17ms | 2.46ms | 2.29ms | 1.49ms |
| update_1to1000 | 149μs | 1.51ms | 168μs | 47μs | 43μs | 382μs |
| cellx1000 | 12.67ms | 9.89ms | 72.14ms | 7.42ms | 9.73ms | 5.25ms |
| cellx2500 | 41.98ms | 26.31ms | 244.24ms | 19.98ms | 31.86ms | 26.50ms |
| cellx5000 | 124.99ms | 66.74ms | 564.10ms | 43.92ms | 67.26ms | 63.07ms |
| 10x5 - 2 sources - read 20.0% (simple) | 349.27ms | 465.05ms | 2.01s | 236.13ms | 516.22ms | 240.13ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 243.08ms | 280.08ms | 1.53s | 176.83ms | 278.49ms | 199.97ms |
| 1000x12 - 4 sources - dynamic (large) | 461.84ms | 3.54s | 1.89s | 278.25ms | 3.99s | 338.78ms |
| 1000x5 - 25 sources (wide dense) | 586.50ms | 2.58s | 3.53s | 414.33ms | 3.32s | 507.61ms |
| 5x500 - 3 sources (deep) | 254.95ms | 232.89ms | 1.15s | 189.34ms | 225.97ms | 205.76ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 378.75ms | 449.81ms | 1.72s | 266.77ms | 493.01ms | 264.34ms |

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
