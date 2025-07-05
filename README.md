# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.66s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.34s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.31s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.43s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.11s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.49s |

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
| Test Case | solidart(2.0-dev) | state_beacon | preact_signals | signals | mobx | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 274.65ms | 147.87ms (fail) | 196.77ms | 209.72ms | 2.39s | 183.55ms |
| broadPropagation | 500.83ms | 5.83ms (fail) | 448.41ms | 458.86ms | 4.43s | 344.89ms |
| deepPropagation | 168.46ms | 142.84ms (fail) | 176.03ms | 168.02ms | 1.56s | 120.06ms |
| diamond | 353.59ms | 181.19ms (fail) | 276.84ms | 282.06ms | 2.53s | 230.40ms |
| mux | 437.45ms | 198.75ms (fail) | 406.47ms | 449.95ms | 1.83s | 370.00ms |
| repeatedObservers | 81.66ms | 52.72ms (fail) | 40.51ms | 45.11ms | 235.51ms | 45.40ms |
| triangle | 119.40ms | 75.87ms (fail) | 103.91ms | 99.60ms | 778.85ms | 84.23ms |
| unstable | 98.55ms | 337.29ms (fail) | 70.44ms | 79.04ms | 357.20ms | 66.77ms |
| molBench | 493.18ms | 877μs | 490.64ms | 486.87ms | 588.46ms | 485.24ms |
| create_signals | 78.18ms | 60.99ms | 4.76ms | 26.56ms | 91.47ms | 18.81ms |
| comp_0to1 | 28.35ms | 54.07ms | 17.39ms | 12.26ms | 16.43ms | 8.80ms |
| comp_1to1 | 39.85ms | 56.55ms | 11.55ms | 28.05ms | 47.22ms | 4.27ms |
| comp_2to1 | 43.43ms | 37.04ms | 11.57ms | 12.38ms | 24.80ms | 2.37ms |
| comp_4to1 | 11.35ms | 17.02ms | 8.49ms | 2.01ms | 31.97ms | 7.67ms |
| comp_1000to1 | 17μs | 42μs | 9μs | 7μs | 17μs | 3μs |
| comp_1to2 | 33.60ms | 45.40ms | 35.47ms | 26.29ms | 36.70ms | 12.07ms |
| comp_1to4 | 22.56ms | 44.20ms | 23.40ms | 19.16ms | 18.77ms | 13.96ms |
| comp_1to8 | 25.31ms | 43.00ms | 8.58ms | 7.90ms | 21.61ms | 4.11ms |
| comp_1to1000 | 17.16ms | 38.66ms | 6.48ms | 4.38ms | 15.96ms | 3.15ms |
| update_1to1 | 16.02ms | 7.79ms | 8.64ms | 8.93ms | 26.76ms | 10.27ms |
| update_2to1 | 8.02ms | 4.25ms | 4.25ms | 4.55ms | 12.55ms | 2.40ms |
| update_4to1 | 3.98ms | 1.95ms | 2.21ms | 2.25ms | 7.34ms | 2.61ms |
| update_1000to1 | 40μs | 15μs | 21μs | 33μs | 70μs | 25μs |
| update_1to2 | 8.06ms | 3.86ms | 4.64ms | 4.47ms | 12.46ms | 5.06ms |
| update_1to4 | 4.01ms | 1.96ms | 2.17ms | 2.28ms | 6.36ms | 2.58ms |
| update_1to1000 | 170μs | 377μs | 929μs | 43μs | 172μs | 54μs |
| cellx1000 | 12.93ms | 5.89ms | 10.30ms | 10.20ms | 90.27ms | 7.76ms |
| cellx2500 | 43.63ms | 32.68ms | 33.01ms | 37.42ms | 279.61ms | 19.81ms |
| cellx5000 | 115.20ms | 81.32ms | 87.64ms | 89.21ms | 659.72ms | 50.28ms |
| 10x5 - 2 sources - read 20.0% (simple) | 361.08ms | 247.72ms | 451.46ms | 516.72ms | 2.04s | 223.51ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 249.93ms | 220.28ms | 300.71ms | 287.91ms | 1.54s | 173.22ms |
| 1000x12 - 4 sources - dynamic (large) | 468.51ms | 350.76ms | 3.79s | 3.77s | 2.00s | 282.99ms |
| 1000x5 - 25 sources (wide dense) | 585.62ms | 504.74ms | 2.71s | 3.44s | 3.51s | 411.98ms |
| 5x500 - 3 sources (deep) | 251.06ms | 207.50ms | 229.60ms | 225.81ms | 1.18s | 191.68ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 384.56ms | 279.98ms | 455.08ms | 497.25ms | 1.73s | 266.08ms |

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
