# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.35s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 4.82s |
| 🥉 | signals | 0.28 | 100.0% | 35/35 | 9.39s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 8.67s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.04s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.13s |

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
| avoidablePropagation | 201.73ms | 168.78ms | 140.49ms (fail) | 244.53ms | 196.82ms | 2.29s |
| broadPropagation | 388.75ms | 306.19ms | 5.37ms (fail) | 461.38ms | 420.09ms | 4.19s |
| deepPropagation | 172.44ms | 108.17ms | 157.49ms (fail) | 150.59ms | 179.04ms | 1.48s |
| diamond | 254.55ms | 234.40ms | 181.28ms (fail) | 345.24ms | 250.12ms | 2.36s |
| mux | 353.70ms | 347.71ms | 175.68ms (fail) | 401.01ms | 343.00ms | 1.78s |
| repeatedObservers | 38.25ms | 39.56ms | 46.47ms (fail) | 70.47ms | 33.28ms | 220.21ms |
| triangle | 91.44ms | 81.05ms | 77.04ms (fail) | 111.80ms | 92.43ms | 763.91ms |
| unstable | 64.14ms | 61.67ms | 324.00ms (fail) | 95.91ms | 58.47ms | 323.10ms |
| molBench | 365.09ms | 363.50ms | 1.05ms | 371.06ms | 364.62ms | 457.66ms |
| create_signals | 23.78ms | 34.44ms | 69.60ms | 56.73ms | 6.71ms | 70.50ms |
| comp_0to1 | 11.53ms | 9.25ms | 55.13ms | 27.84ms | 19.15ms | 24.52ms |
| comp_1to1 | 26.59ms | 5.73ms | 56.21ms | 48.93ms | 18.40ms | 24.21ms |
| comp_2to1 | 13.36ms | 3.25ms | 40.77ms | 31.98ms | 19.48ms | 18.77ms |
| comp_4to1 | 2.68ms | 10.01ms | 18.12ms | 11.04ms | 8.12ms | 23.67ms |
| comp_1000to1 | 7μs | 10μs | 40μs | 15μs | 9μs | 28μs |
| comp_1to2 | 18.77ms | 20.95ms | 45.60ms | 31.01ms | 17.59ms | 38.52ms |
| comp_1to4 | 11.20ms | 8.08ms | 45.20ms | 20.51ms | 24.70ms | 32.94ms |
| comp_1to8 | 8.33ms | 7.72ms | 44.32ms | 23.93ms | 9.31ms | 24.75ms |
| comp_1to1000 | 5.06ms | 4.39ms | 38.91ms | 15.08ms | 8.08ms | 15.44ms |
| update_1to1 | 9.76ms | 3.97ms | 5.16ms | 15.72ms | 9.23ms | 22.15ms |
| update_2to1 | 4.91ms | 2.03ms | 3.07ms | 7.85ms | 4.22ms | 10.70ms |
| update_4to1 | 2.43ms | 993μs | 1.29ms | 3.94ms | 2.61ms | 5.64ms |
| update_1000to1 | 25μs | 10μs | 12μs | 39μs | 24μs | 52μs |
| update_1to2 | 4.88ms | 1.92ms | 2.49ms | 7.99ms | 7.13ms | 10.93ms |
| update_1to4 | 2.40ms | 956μs | 1.30ms | 3.85ms | 2.38ms | 5.39ms |
| update_1to1000 | 59μs | 42μs | 389μs | 152μs | 2.05ms | 169μs |
| cellx1000 | 10.08ms | 8.95ms | 8.20ms | 16.10ms | 10.20ms | 84.66ms |
| cellx2500 | 32.80ms | 25.20ms | 33.12ms | 42.21ms | 24.57ms | 249.81ms |
| cellx5000 | 67.54ms | 57.94ms | 64.88ms | 98.97ms | 70.38ms | 550.05ms |
| 10x5 - 2 sources - read 20.0% (simple) | 424.77ms | 226.78ms | 228.09ms | 360.65ms | 393.21ms | 2.13s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 237.59ms | 171.99ms | 175.15ms | 253.99ms | 233.04ms | 1.54s |
| 1000x12 - 4 sources - dynamic (large) | 3.25s | 252.70ms | 275.89ms | 370.82ms | 3.00s | 1.75s |
| 1000x5 - 25 sources (wide dense) | 2.68s | 353.45ms | 391.82ms | 540.66ms | 2.26s | 3.59s |
| 5x500 - 3 sources (deep) | 211.28ms | 204.37ms | 201.93ms | 269.87ms | 218.29ms | 1.19s |
| 100x15 - 6 sources - dynamic (very dynamic) | 390.92ms | 222.88ms | 218.54ms | 306.13ms | 374.29ms | 1.75s |

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
