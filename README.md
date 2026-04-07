# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.27s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 10.95s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.45s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.76s |
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
| Test Case | solidart(2.0-dev) | alien_signals | state_beacon | preact_signals | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 273.89ms | 198.84ms | 148.32ms (fail) | 205.94ms | 2.24s | 201.89ms |
| broadPropagation | 497.36ms | 361.63ms | 6.94ms (fail) | 454.88ms | 4.30s | 467.73ms |
| deepPropagation | 167.70ms | 128.47ms | 136.78ms (fail) | 180.43ms | 1.56s | 167.42ms |
| diamond | 343.90ms | 245.82ms | 186.29ms (fail) | 286.80ms | 2.36s | 287.73ms |
| mux | 419.49ms | 365.11ms | 185.28ms (fail) | 375.19ms | 1.77s | 403.41ms |
| repeatedObservers | 80.71ms | 45.59ms | 59.92ms (fail) | 42.47ms | 223.68ms | 45.64ms |
| triangle | 114.36ms | 87.50ms | 76.19ms (fail) | 101.15ms | 754.82ms | 99.84ms |
| unstable | 94.98ms | 62.36ms | 336.34ms (fail) | 72.55ms | 336.78ms | 75.38ms |
| molBench | 488.90ms | 480.93ms | 1.17ms | 496.98ms | 583.40ms | 494.68ms |
| create_signals | 75.42ms | 20.28ms | 61.38ms | 5.29ms | 67.87ms | 26.35ms |
| comp_0to1 | 26.50ms | 7.59ms | 53.76ms | 23.38ms | 26.31ms | 12.02ms |
| comp_1to1 | 42.61ms | 4.26ms | 54.88ms | 12.71ms | 37.00ms | 35.75ms |
| comp_2to1 | 40.49ms | 2.35ms | 36.98ms | 19.86ms | 29.02ms | 9.96ms |
| comp_4to1 | 18.04ms | 8.45ms | 18.75ms | 11.14ms | 22.86ms | 2.15ms |
| comp_1000to1 | 15μs | 7μs | 45μs | 4μs | 21μs | 7μs |
| comp_1to2 | 57.53ms | 14.16ms | 46.12ms | 29.10ms | 28.78ms | 14.03ms |
| comp_1to4 | 20.39ms | 9.04ms | 45.66ms | 22.26ms | 23.62ms | 20.64ms |
| comp_1to8 | 19.93ms | 5.44ms | 43.84ms | 10.63ms | 26.15ms | 5.84ms |
| comp_1to1000 | 14.00ms | 3.60ms | 40.06ms | 6.53ms | 14.75ms | 5.43ms |
| update_1to1 | 15.69ms | 4.65ms | 8.99ms | 9.15ms | 21.18ms | 8.96ms |
| update_2to1 | 7.87ms | 2.33ms | 2.94ms | 4.67ms | 10.40ms | 4.46ms |
| update_4to1 | 3.94ms | 1.20ms | 2.73ms | 2.32ms | 5.39ms | 2.25ms |
| update_1000to1 | 39μs | 11μs | 14μs | 23μs | 52μs | 22μs |
| update_1to2 | 8.03ms | 2.33ms | 4.48ms | 4.55ms | 10.37ms | 4.42ms |
| update_1to4 | 3.96ms | 1.20ms | 1.44ms | 2.57ms | 5.18ms | 2.28ms |
| update_1to1000 | 146μs | 41μs | 392μs | 56μs | 153μs | 58μs |
| cellx1000 | 15.27ms | 7.37ms | 5.37ms | 10.26ms | 68.00ms | 10.58ms |
| cellx2500 | 36.10ms | 19.89ms | 25.17ms | 27.00ms | 239.20ms | 32.77ms |
| cellx5000 | 84.20ms | 42.51ms | 65.06ms | 68.91ms | 533.17ms | 89.59ms |
| 10x5 - 2 sources - read 20.0% (simple) | 341.84ms | 237.19ms | 240.49ms | 453.70ms | 2.00s | 501.53ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 247.71ms | 176.84ms | 199.90ms | 273.10ms | 1.49s | 279.62ms |
| 1000x12 - 4 sources - dynamic (large) | 467.21ms | 277.66ms | 334.17ms | 3.74s | 1.84s | 3.64s |
| 1000x5 - 25 sources (wide dense) | 598.86ms | 403.30ms | 517.46ms | 2.81s | 3.36s | 3.30s |
| 5x500 - 3 sources (deep) | 254.58ms | 199.62ms | 206.41ms | 235.61ms | 1.11s | 222.58ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 383.38ms | 266.64ms | 256.59ms | 453.65ms | 1.65s | 469.53ms |

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
