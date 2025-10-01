# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.77 | 100.0% | 35/35 | 3.33s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 8.74s |
| 🥉 | signals | 0.29 | 100.0% | 35/35 | 9.36s |
| 4 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 4.82s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.11s |
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
| avoidablePropagation | 201.92ms | 168.22ms | 141.10ms (fail) | 244.69ms | 197.12ms | 2.28s |
| broadPropagation | 386.39ms | 306.13ms | 5.61ms (fail) | 458.13ms | 440.37ms | 4.19s |
| deepPropagation | 171.70ms | 108.27ms | 158.69ms (fail) | 150.32ms | 180.03ms | 1.48s |
| diamond | 254.03ms | 231.64ms | 182.28ms (fail) | 345.30ms | 250.98ms | 2.36s |
| mux | 349.03ms | 346.50ms | 171.49ms (fail) | 404.85ms | 352.37ms | 1.81s |
| repeatedObservers | 38.36ms | 39.32ms | 46.27ms (fail) | 70.13ms | 35.31ms | 225.51ms |
| triangle | 92.05ms | 79.21ms | 76.64ms (fail) | 111.55ms | 93.26ms | 771.91ms |
| unstable | 64.00ms | 61.62ms | 321.38ms (fail) | 95.71ms | 58.20ms | 326.29ms |
| molBench | 365.54ms | 363.17ms | 905μs | 370.81ms | 363.63ms | 458.67ms |
| create_signals | 22.44ms | 32.59ms | 65.68ms | 59.36ms | 6.43ms | 73.92ms |
| comp_0to1 | 11.23ms | 9.49ms | 55.60ms | 44.19ms | 18.56ms | 24.72ms |
| comp_1to1 | 19.16ms | 5.26ms | 61.68ms | 32.59ms | 14.69ms | 40.95ms |
| comp_2to1 | 7.97ms | 2.78ms | 37.22ms | 24.38ms | 21.82ms | 36.04ms |
| comp_4to1 | 10.42ms | 8.36ms | 16.75ms | 16.84ms | 12.94ms | 15.56ms |
| comp_1000to1 | 6μs | 5μs | 40μs | 16μs | 5μs | 17μs |
| comp_1to2 | 26.96ms | 18.12ms | 49.47ms | 33.99ms | 23.35ms | 36.85ms |
| comp_1to4 | 13.93ms | 11.25ms | 45.73ms | 26.77ms | 28.71ms | 25.06ms |
| comp_1to8 | 8.01ms | 5.88ms | 45.45ms | 25.46ms | 9.47ms | 24.04ms |
| comp_1to1000 | 4.57ms | 3.95ms | 39.11ms | 14.89ms | 11.86ms | 15.32ms |
| update_1to1 | 9.67ms | 4.08ms | 4.89ms | 15.74ms | 8.84ms | 22.18ms |
| update_2to1 | 4.98ms | 2.15ms | 2.70ms | 7.84ms | 4.64ms | 10.74ms |
| update_4to1 | 2.45ms | 1.03ms | 1.23ms | 3.92ms | 2.25ms | 6.07ms |
| update_1000to1 | 25μs | 11μs | 12μs | 39μs | 23μs | 50μs |
| update_1to2 | 4.90ms | 2.14ms | 2.48ms | 7.83ms | 4.69ms | 10.96ms |
| update_1to4 | 2.34ms | 1.05ms | 1.41ms | 4.02ms | 2.28ms | 5.42ms |
| update_1to1000 | 59μs | 58μs | 378μs | 152μs | 54μs | 185μs |
| cellx1000 | 8.80ms | 8.62ms | 8.46ms | 13.42ms | 10.09ms | 87.05ms |
| cellx2500 | 28.27ms | 24.96ms | 33.08ms | 40.00ms | 23.04ms | 256.30ms |
| cellx5000 | 59.93ms | 59.19ms | 61.57ms | 84.95ms | 62.28ms | 565.43ms |
| 10x5 - 2 sources - read 20.0% (simple) | 425.68ms | 227.21ms | 229.69ms | 362.43ms | 390.18ms | 2.13s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 240.16ms | 173.62ms | 175.30ms | 254.34ms | 233.81ms | 1.56s |
| 1000x12 - 4 sources - dynamic (large) | 3.25s | 247.23ms | 275.63ms | 364.33ms | 2.99s | 1.77s |
| 1000x5 - 25 sources (wide dense) | 2.68s | 352.95ms | 391.92ms | 538.26ms | 2.30s | 3.56s |
| 5x500 - 3 sources (deep) | 212.65ms | 202.46ms | 202.38ms | 282.01ms | 219.99ms | 1.20s |
| 100x15 - 6 sources - dynamic (very dynamic) | 391.45ms | 225.46ms | 220.67ms | 308.55ms | 374.41ms | 1.73s |

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
