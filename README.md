# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.26s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 10.99s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.44s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.04s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.41s |

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
| avoidablePropagation | 199.07ms | 2.35s | 149.36ms (fail) | 195.09ms | 206.46ms | 280.00ms |
| broadPropagation | 451.40ms | 4.34s | 5.91ms (fail) | 361.24ms | 450.84ms | 498.92ms |
| deepPropagation | 172.01ms | 1.55s | 134.97ms (fail) | 124.96ms | 175.07ms | 165.45ms |
| diamond | 285.00ms | 2.44s | 177.17ms (fail) | 247.11ms | 284.72ms | 337.66ms |
| mux | 400.20ms | 1.80s | 187.38ms (fail) | 364.47ms | 367.13ms | 432.17ms |
| repeatedObservers | 45.62ms | 228.78ms | 55.13ms (fail) | 44.89ms | 41.66ms | 81.27ms |
| triangle | 101.42ms | 764.36ms | 78.27ms (fail) | 90.45ms | 99.87ms | 115.59ms |
| unstable | 86.75ms | 340.97ms | 335.37ms (fail) | 62.34ms | 72.44ms | 95.73ms |
| molBench | 492.96ms | 582.87ms | 1.07ms | 487.29ms | 495.91ms | 487.74ms |
| create_signals | 27.35ms | 62.74ms | 65.09ms | 28.65ms | 5.76ms | 58.32ms |
| comp_0to1 | 12.04ms | 14.95ms | 55.48ms | 7.10ms | 18.58ms | 26.15ms |
| comp_1to1 | 26.29ms | 46.03ms | 55.85ms | 4.25ms | 13.71ms | 42.75ms |
| comp_2to1 | 8.34ms | 36.18ms | 37.20ms | 2.44ms | 18.51ms | 25.15ms |
| comp_4to1 | 7.93ms | 13.76ms | 16.57ms | 8.63ms | 8.96ms | 8.07ms |
| comp_1000to1 | 5μs | 21μs | 44μs | 4μs | 5μs | 15μs |
| comp_1to2 | 21.20ms | 34.00ms | 47.24ms | 22.65ms | 23.91ms | 31.39ms |
| comp_1to4 | 13.54ms | 17.19ms | 46.46ms | 9.43ms | 29.31ms | 20.76ms |
| comp_1to8 | 7.23ms | 19.33ms | 45.46ms | 4.13ms | 8.48ms | 22.99ms |
| comp_1to1000 | 4.13ms | 14.58ms | 41.35ms | 3.46ms | 5.78ms | 14.09ms |
| update_1to1 | 8.87ms | 21.09ms | 8.24ms | 4.63ms | 9.03ms | 15.60ms |
| update_2to1 | 4.45ms | 10.37ms | 2.85ms | 2.31ms | 4.58ms | 7.85ms |
| update_4to1 | 2.29ms | 5.59ms | 2.49ms | 1.15ms | 2.32ms | 3.90ms |
| update_1000to1 | 22μs | 52μs | 14μs | 11μs | 40μs | 39μs |
| update_1to2 | 4.47ms | 10.42ms | 4.44ms | 2.30ms | 4.44ms | 7.98ms |
| update_1to4 | 2.37ms | 5.21ms | 1.46ms | 1.16ms | 2.38ms | 3.92ms |
| update_1to1000 | 42μs | 152μs | 394μs | 31μs | 1.12ms | 146μs |
| cellx1000 | 12.42ms | 75.67ms | 5.22ms | 7.40ms | 10.08ms | 11.81ms |
| cellx2500 | 33.89ms | 255.08ms | 26.50ms | 19.74ms | 29.97ms | 33.82ms |
| cellx5000 | 72.75ms | 585.70ms | 66.60ms | 47.39ms | 87.89ms | 91.92ms |
| 10x5 - 2 sources - read 20.0% (simple) | 513.18ms | 1.98s | 239.53ms | 231.42ms | 449.94ms | 348.17ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.89ms | 1.46s | 198.88ms | 177.77ms | 272.67ms | 255.39ms |
| 1000x12 - 4 sources - dynamic (large) | 3.65s | 1.86s | 337.99ms | 281.96ms | 3.77s | 480.34ms |
| 1000x5 - 25 sources (wide dense) | 3.32s | 3.36s | 513.92ms | 407.75ms | 2.78s | 612.58ms |
| 5x500 - 3 sources (deep) | 223.93ms | 1.10s | 212.62ms | 192.31ms | 233.74ms | 251.85ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 500.61ms | 1.67s | 257.20ms | 264.63ms | 456.04ms | 386.11ms |

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
