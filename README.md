# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.80s |
| 🥈 | preact_signals | 0.26 | 100.0% | 35/35 | 10.23s |
| 🥉 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.49s |
| 4 | signals | 0.24 | 100.0% | 35/35 | 11.57s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.72s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.38s |

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
| avoidablePropagation | 213.00ms | 185.79ms | 160.88ms (fail) | 264.84ms | 220.53ms | 2.26s |
| broadPropagation | 476.18ms | 350.87ms | 5.94ms (fail) | 494.76ms | 523.40ms | 4.20s |
| deepPropagation | 179.27ms | 121.04ms | 150.57ms (fail) | 164.90ms | 203.71ms | 1.49s |
| diamond | 284.20ms | 264.31ms | 184.42ms (fail) | 362.41ms | 288.31ms | 2.22s |
| mux | 383.19ms | 366.54ms | 186.39ms (fail) | 430.75ms | 394.49ms | 1.72s |
| repeatedObservers | 46.48ms | 45.42ms | 51.34ms (fail) | 88.46ms | 42.37ms | 227.52ms |
| triangle | 106.40ms | 87.94ms | 79.71ms (fail) | 120.52ms | 104.88ms | 729.30ms |
| unstable | 78.78ms | 61.67ms | 345.01ms (fail) | 108.71ms | 72.65ms | 337.05ms |
| molBench | 547.34ms | 561.01ms | 1.04ms | 568.76ms | 547.89ms | 640.27ms |
| create_signals | 29.07ms | 27.09ms | 67.42ms | 97.47ms | 4.93ms | 76.91ms |
| comp_0to1 | 13.15ms | 7.34ms | 60.07ms | 44.27ms | 19.82ms | 27.54ms |
| comp_1to1 | 23.21ms | 4.07ms | 55.35ms | 43.64ms | 12.91ms | 40.33ms |
| comp_2to1 | 19.20ms | 2.23ms | 37.96ms | 46.62ms | 12.59ms | 25.38ms |
| comp_4to1 | 3.13ms | 9.39ms | 19.14ms | 4.46ms | 15.74ms | 16.83ms |
| comp_1000to1 | 6μs | 4μs | 40μs | 22μs | 5μs | 21μs |
| comp_1to2 | 17.41ms | 10.78ms | 60.78ms | 34.37ms | 22.18ms | 37.33ms |
| comp_1to4 | 13.48ms | 13.40ms | 50.69ms | 14.61ms | 20.84ms | 26.23ms |
| comp_1to8 | 6.09ms | 3.94ms | 44.19ms | 20.92ms | 7.89ms | 21.29ms |
| comp_1to1000 | 4.05ms | 3.09ms | 37.09ms | 14.48ms | 3.37ms | 14.89ms |
| update_1to1 | 9.46ms | 4.75ms | 6.00ms | 16.75ms | 9.56ms | 23.65ms |
| update_2to1 | 4.69ms | 2.43ms | 3.00ms | 8.34ms | 4.90ms | 11.55ms |
| update_4to1 | 2.39ms | 1.26ms | 1.50ms | 4.22ms | 2.45ms | 5.93ms |
| update_1000to1 | 22μs | 11μs | 15μs | 53μs | 24μs | 57μs |
| update_1to2 | 4.73ms | 2.37ms | 2.99ms | 9.39ms | 4.79ms | 11.42ms |
| update_1to4 | 2.37ms | 1.22ms | 1.50ms | 4.22ms | 2.48ms | 5.69ms |
| update_1to1000 | 41μs | 57μs | 375μs | 147μs | 34μs | 162μs |
| cellx1000 | 9.95ms | 7.09ms | 5.42ms | 13.70ms | 11.81ms | 89.59ms |
| cellx2500 | 39.26ms | 22.19ms | 28.02ms | 51.62ms | 35.65ms | 318.70ms |
| cellx5000 | 104.94ms | 62.05ms | 78.87ms | 144.21ms | 104.88ms | 645.64ms |
| 10x5 - 2 sources - read 20.0% (simple) | 501.08ms | 249.07ms | 243.08ms | 372.40ms | 446.44ms | 2.00s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 272.92ms | 194.82ms | 202.27ms | 271.19ms | 268.21ms | 1.42s |
| 1000x12 - 4 sources - dynamic (large) | 3.96s | 274.13ms | 306.34ms | 424.95ms | 3.43s | 1.83s |
| 1000x5 - 25 sources (wide dense) | 3.52s | 420.54ms | 466.54ms | 635.96ms | 2.72s | 3.43s |
| 5x500 - 3 sources (deep) | 228.85ms | 192.67ms | 200.39ms | 264.68ms | 235.20ms | 1.17s |
| 100x15 - 6 sources - dynamic (very dynamic) | 465.86ms | 236.87ms | 238.49ms | 340.52ms | 438.14ms | 1.64s |

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
