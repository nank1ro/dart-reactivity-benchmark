# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.29s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 9.98s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.16s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.08s |
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
| Test Case | solidart(2.0-dev) | signals | mobx | preact_signals | state_beacon | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 275.21ms | 204.18ms | 2.37s | 197.08ms | 145.70ms (fail) | 185.49ms |
| broadPropagation | 511.00ms | 452.69ms | 4.40s | 454.30ms | 5.96ms (fail) | 346.11ms |
| deepPropagation | 173.38ms | 172.28ms | 1.53s | 172.96ms | 138.47ms (fail) | 130.20ms |
| diamond | 356.24ms | 286.06ms | 2.42s | 285.54ms | 181.73ms (fail) | 230.32ms |
| mux | 425.66ms | 397.58ms | 1.78s | 378.23ms | 193.78ms (fail) | 360.41ms |
| repeatedObservers | 80.06ms | 45.58ms | 237.20ms | 41.47ms | 52.70ms (fail) | 43.21ms |
| triangle | 113.76ms | 100.10ms | 746.71ms | 98.37ms | 79.04ms (fail) | 86.28ms |
| unstable | 95.57ms | 73.79ms | 350.62ms | 74.04ms | 335.92ms (fail) | 59.94ms |
| molBench | 486.17ms | 497.33ms | 595.08ms | 484.79ms | 1.01ms | 487.46ms |
| create_signals | 59.07ms | 26.36ms | 70.30ms | 5.42ms | 62.46ms | 22.69ms |
| comp_0to1 | 26.08ms | 11.76ms | 32.82ms | 23.18ms | 56.17ms | 8.61ms |
| comp_1to1 | 28.69ms | 26.95ms | 32.36ms | 13.64ms | 56.92ms | 4.27ms |
| comp_2to1 | 33.42ms | 11.22ms | 37.46ms | 19.43ms | 38.49ms | 2.38ms |
| comp_4to1 | 19.53ms | 2.72ms | 28.59ms | 17.46ms | 16.50ms | 10.44ms |
| comp_1000to1 | 14μs | 12μs | 15μs | 6μs | 44μs | 4μs |
| comp_1to2 | 34.12ms | 23.62ms | 36.87ms | 22.64ms | 46.89ms | 13.75ms |
| comp_1to4 | 20.89ms | 15.60ms | 18.01ms | 32.41ms | 47.04ms | 9.53ms |
| comp_1to8 | 24.01ms | 6.46ms | 21.02ms | 7.26ms | 45.45ms | 4.02ms |
| comp_1to1000 | 13.99ms | 4.03ms | 15.36ms | 6.46ms | 39.99ms | 3.69ms |
| update_1to1 | 15.92ms | 9.79ms | 26.25ms | 9.42ms | 5.77ms | 9.98ms |
| update_2to1 | 7.86ms | 4.97ms | 12.75ms | 4.59ms | 2.98ms | 2.26ms |
| update_4to1 | 4.00ms | 2.46ms | 7.15ms | 2.49ms | 1.48ms | 2.51ms |
| update_1000to1 | 38μs | 39μs | 53μs | 23μs | 15μs | 10μs |
| update_1to2 | 8.10ms | 5.09ms | 14.10ms | 4.78ms | 2.94ms | 4.99ms |
| update_1to4 | 4.01ms | 2.52ms | 6.91ms | 2.33ms | 1.54ms | 1.08ms |
| update_1to1000 | 146μs | 43μs | 164μs | 60μs | 387μs | 36μs |
| cellx1000 | 15.01ms | 10.52ms | 74.74ms | 10.40ms | 5.79ms | 7.64ms |
| cellx2500 | 44.91ms | 41.20ms | 268.21ms | 36.39ms | 24.62ms | 23.07ms |
| cellx5000 | 97.15ms | 79.56ms | 602.64ms | 93.76ms | 64.22ms | 61.42ms |
| 10x5 - 2 sources - read 20.0% (simple) | 350.88ms | 499.51ms | 1.93s | 438.53ms | 249.47ms | 236.56ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 249.21ms | 283.20ms | 1.45s | 279.25ms | 202.46ms | 179.45ms |
| 1000x12 - 4 sources - dynamic (large) | 465.26ms | 3.64s | 1.88s | 3.54s | 350.49ms | 281.12ms |
| 1000x5 - 25 sources (wide dense) | 615.44ms | 3.52s | 3.34s | 2.54s | 516.53ms | 408.99ms |
| 5x500 - 3 sources (deep) | 251.76ms | 221.79ms | 1.09s | 228.93ms | 207.63ms | 192.67ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 384.72ms | 480.55ms | 1.66s | 453.23ms | 278.51ms | 273.84ms |

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
