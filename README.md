# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.33s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 9.35s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 8.81s |
| 4 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 4.90s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 25.77s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.03s |

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
| Test Case | preact_signals | state_beacon | signals | alien_signals | mobx | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 192.41ms | 132.66ms (fail) | 201.04ms | 166.88ms | 2.25s | 247.52ms |
| broadPropagation | 382.43ms | 5.51ms (fail) | 432.40ms | 303.08ms | 4.06s | 464.03ms |
| deepPropagation | 177.34ms | 154.74ms (fail) | 172.48ms | 106.87ms | 1.42s | 150.37ms |
| diamond | 257.58ms | 177.40ms (fail) | 260.87ms | 239.96ms | 2.26s | 345.79ms |
| mux | 331.83ms | 163.88ms (fail) | 334.99ms | 329.63ms | 1.72s | 386.53ms |
| repeatedObservers | 34.11ms | 45.61ms (fail) | 39.16ms | 40.30ms | 216.42ms | 72.70ms |
| triangle | 95.63ms | 74.62ms (fail) | 91.75ms | 79.39ms | 725.90ms | 114.17ms |
| unstable | 58.78ms | 315.85ms (fail) | 66.02ms | 58.01ms | 321.19ms | 96.92ms |
| molBench | 363.88ms | 866μs | 389.21ms | 361.59ms | 475.71ms | 370.26ms |
| create_signals | 6.57ms | 60.52ms | 23.44ms | 23.12ms | 72.96ms | 73.47ms |
| comp_0to1 | 18.94ms | 52.56ms | 11.56ms | 11.94ms | 34.17ms | 42.24ms |
| comp_1to1 | 16.59ms | 54.29ms | 33.96ms | 5.21ms | 16.86ms | 51.07ms |
| comp_2to1 | 18.76ms | 37.60ms | 10.94ms | 2.95ms | 19.83ms | 31.23ms |
| comp_4to1 | 11.75ms | 15.71ms | 9.02ms | 12.89ms | 29.25ms | 15.45ms |
| comp_1000to1 | 5μs | 40μs | 7μs | 6μs | 20μs | 17μs |
| comp_1to2 | 29.64ms | 44.98ms | 18.72ms | 27.68ms | 36.50ms | 29.40ms |
| comp_1to4 | 31.33ms | 45.59ms | 8.44ms | 12.18ms | 23.87ms | 37.74ms |
| comp_1to8 | 7.77ms | 42.55ms | 7.33ms | 5.11ms | 19.72ms | 26.54ms |
| comp_1to1000 | 7.66ms | 37.57ms | 4.59ms | 4.25ms | 13.81ms | 15.33ms |
| update_1to1 | 8.16ms | 4.42ms | 10.19ms | 3.82ms | 19.49ms | 14.35ms |
| update_2to1 | 4.16ms | 2.38ms | 4.95ms | 1.89ms | 9.79ms | 7.19ms |
| update_4to1 | 2.16ms | 1.24ms | 2.49ms | 961μs | 5.24ms | 3.65ms |
| update_1000to1 | 34μs | 11μs | 27μs | 10μs | 49μs | 48μs |
| update_1to2 | 4.09ms | 2.12ms | 4.98ms | 1.85ms | 9.75ms | 7.13ms |
| update_1to4 | 2.15ms | 1.15ms | 2.54ms | 1.00ms | 4.88ms | 3.52ms |
| update_1to1000 | 366μs | 381μs | 59μs | 41μs | 174μs | 148μs |
| cellx1000 | 9.87ms | 7.11ms | 10.70ms | 8.19ms | 77.03ms | 16.64ms |
| cellx2500 | 25.36ms | 30.22ms | 33.08ms | 24.61ms | 240.19ms | 42.66ms |
| cellx5000 | 66.28ms | 54.78ms | 74.14ms | 57.66ms | 526.71ms | 109.90ms |
| 10x5 - 2 sources - read 20.0% (simple) | 396.02ms | 221.97ms | 421.31ms | 225.77ms | 1.97s | 369.80ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 234.35ms | 173.38ms | 240.04ms | 172.72ms | 1.42s | 252.02ms |
| 1000x12 - 4 sources - dynamic (large) | 3.08s | 271.57ms | 3.19s | 249.90ms | 1.70s | 371.99ms |
| 1000x5 - 25 sources (wide dense) | 2.31s | 381.83ms | 2.62s | 356.55ms | 3.31s | 545.95ms |
| 5x500 - 3 sources (deep) | 226.88ms | 202.81ms | 216.63ms | 209.23ms | 1.13s | 276.12ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 398.11ms | 215.84ms | 407.44ms | 226.34ms | 1.64s | 308.03ms |

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
