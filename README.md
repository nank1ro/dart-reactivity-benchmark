# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.33s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 4.89s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 8.71s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 9.27s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 25.87s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.09s |

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
| avoidablePropagation | 246.78ms | 200.41ms | 2.24s | 195.29ms | 132.16ms (fail) | 168.42ms |
| broadPropagation | 462.52ms | 424.60ms | 4.02s | 381.65ms | 5.59ms (fail) | 305.72ms |
| deepPropagation | 150.20ms | 173.69ms | 1.42s | 177.62ms | 152.76ms (fail) | 108.24ms |
| diamond | 346.06ms | 263.00ms | 2.21s | 257.19ms | 176.00ms (fail) | 241.16ms |
| mux | 387.30ms | 335.09ms | 1.72s | 330.82ms | 160.06ms (fail) | 329.61ms |
| repeatedObservers | 72.93ms | 39.12ms | 217.94ms | 34.05ms | 45.87ms (fail) | 40.81ms |
| triangle | 114.36ms | 91.22ms | 723.42ms | 94.08ms | 75.47ms (fail) | 80.07ms |
| unstable | 96.75ms | 66.38ms | 321.17ms | 58.45ms | 315.41ms (fail) | 57.95ms |
| molBench | 370.48ms | 389.82ms | 479.43ms | 365.32ms | 820μs | 362.45ms |
| create_signals | 99.12ms | 24.10ms | 65.19ms | 8.86ms | 67.45ms | 31.98ms |
| comp_0to1 | 39.12ms | 11.88ms | 16.04ms | 20.46ms | 60.06ms | 10.94ms |
| comp_1to1 | 44.56ms | 30.18ms | 61.29ms | 22.63ms | 62.33ms | 6.18ms |
| comp_2to1 | 22.64ms | 13.39ms | 42.05ms | 18.48ms | 38.28ms | 3.61ms |
| comp_4to1 | 14.19ms | 8.48ms | 21.80ms | 12.07ms | 16.05ms | 15.77ms |
| comp_1000to1 | 22μs | 6μs | 18μs | 5μs | 40μs | 7μs |
| comp_1to2 | 30.53ms | 29.70ms | 40.78ms | 32.04ms | 45.22ms | 12.03ms |
| comp_1to4 | 22.26ms | 22.54ms | 26.48ms | 30.84ms | 46.20ms | 10.28ms |
| comp_1to8 | 17.42ms | 8.85ms | 26.98ms | 8.39ms | 43.07ms | 5.99ms |
| comp_1to1000 | 14.77ms | 5.82ms | 16.39ms | 8.22ms | 37.93ms | 5.00ms |
| update_1to1 | 14.38ms | 9.75ms | 20.11ms | 8.32ms | 4.37ms | 4.02ms |
| update_2to1 | 7.29ms | 4.77ms | 10.36ms | 4.09ms | 2.40ms | 2.15ms |
| update_4to1 | 3.66ms | 2.42ms | 5.15ms | 2.15ms | 1.15ms | 1.13ms |
| update_1000to1 | 37μs | 28μs | 50μs | 28μs | 11μs | 10μs |
| update_1to2 | 7.11ms | 4.77ms | 10.29ms | 3.71ms | 2.41ms | 2.05ms |
| update_1to4 | 3.66ms | 2.65ms | 4.91ms | 2.11ms | 1.13ms | 1.03ms |
| update_1to1000 | 160μs | 64μs | 166μs | 506μs | 364μs | 48μs |
| cellx1000 | 17.02ms | 12.02ms | 92.75ms | 10.70ms | 8.80ms | 8.51ms |
| cellx2500 | 52.01ms | 39.11ms | 272.42ms | 28.25ms | 33.83ms | 25.93ms |
| cellx5000 | 113.41ms | 82.23ms | 560.27ms | 78.63ms | 80.88ms | 59.13ms |
| 10x5 - 2 sources - read 20.0% (simple) | 362.69ms | 425.01ms | 2.00s | 397.89ms | 225.58ms | 226.66ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 252.78ms | 238.83ms | 1.45s | 234.95ms | 173.20ms | 173.12ms |
| 1000x12 - 4 sources - dynamic (large) | 369.89ms | 3.13s | 1.71s | 3.00s | 271.75ms | 250.28ms |
| 1000x5 - 25 sources (wide dense) | 546.40ms | 2.58s | 3.34s | 2.27s | 383.23ms | 357.05ms |
| 5x500 - 3 sources (deep) | 274.07ms | 209.77ms | 1.12s | 222.41ms | 201.10ms | 198.45ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 309.84ms | 395.75ms | 1.61s | 383.03ms | 217.70ms | 226.47ms |

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
