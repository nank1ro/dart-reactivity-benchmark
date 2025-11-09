# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.34s |
| 🥈 | signals | 0.29 | 100.0% | 35/35 | 9.41s |
| 🥉 | preact_signals | 0.29 | 100.0% | 35/35 | 8.72s |
| 4 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 4.83s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.90s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.10s |

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
| avoidablePropagation | 201.74ms | 168.53ms | 140.93ms (fail) | 244.48ms | 196.71ms | 2.28s |
| broadPropagation | 388.06ms | 305.71ms | 5.53ms (fail) | 461.05ms | 420.14ms | 4.15s |
| deepPropagation | 171.75ms | 108.47ms | 156.80ms (fail) | 151.29ms | 177.90ms | 1.47s |
| diamond | 254.00ms | 231.41ms | 182.66ms (fail) | 342.84ms | 251.93ms | 2.33s |
| mux | 348.90ms | 341.69ms | 181.39ms (fail) | 402.22ms | 340.39ms | 1.78s |
| repeatedObservers | 38.18ms | 39.47ms | 46.21ms (fail) | 70.06ms | 33.47ms | 223.73ms |
| triangle | 91.35ms | 78.76ms | 77.08ms (fail) | 111.25ms | 92.78ms | 762.75ms |
| unstable | 63.90ms | 61.43ms | 318.87ms (fail) | 95.48ms | 59.51ms | 322.89ms |
| molBench | 366.28ms | 363.66ms | 1.12ms | 371.25ms | 363.95ms | 457.93ms |
| create_signals | 22.51ms | 26.35ms | 58.41ms | 67.28ms | 16.18ms | 45.25ms |
| comp_0to1 | 11.35ms | 10.87ms | 50.42ms | 24.95ms | 21.48ms | 15.63ms |
| comp_1to1 | 18.78ms | 5.96ms | 52.78ms | 41.34ms | 18.11ms | 40.04ms |
| comp_2to1 | 8.14ms | 3.23ms | 34.71ms | 13.22ms | 21.75ms | 38.84ms |
| comp_4to1 | 2.63ms | 8.65ms | 15.54ms | 17.65ms | 10.05ms | 14.83ms |
| comp_1000to1 | 5μs | 5μs | 44μs | 299μs | 11μs | 17μs |
| comp_1to2 | 22.40ms | 18.50ms | 45.03ms | 34.78ms | 15.51ms | 35.51ms |
| comp_1to4 | 10.25ms | 10.96ms | 44.53ms | 23.90ms | 21.50ms | 25.64ms |
| comp_1to8 | 10.17ms | 8.68ms | 43.40ms | 23.41ms | 13.02ms | 25.13ms |
| comp_1to1000 | 7.15ms | 5.89ms | 38.63ms | 14.52ms | 6.52ms | 15.28ms |
| update_1to1 | 9.90ms | 4.21ms | 5.13ms | 15.59ms | 9.04ms | 21.97ms |
| update_2to1 | 4.91ms | 2.06ms | 2.81ms | 7.85ms | 4.51ms | 10.82ms |
| update_4to1 | 2.41ms | 1.02ms | 1.25ms | 3.94ms | 2.41ms | 5.56ms |
| update_1000to1 | 26μs | 10μs | 12μs | 39μs | 21μs | 53μs |
| update_1to2 | 4.76ms | 2.16ms | 2.52ms | 7.87ms | 4.47ms | 10.76ms |
| update_1to4 | 2.40ms | 1.03ms | 1.29ms | 4.03ms | 2.34ms | 5.38ms |
| update_1to1000 | 90μs | 42μs | 379μs | 149μs | 58μs | 165μs |
| cellx1000 | 10.90ms | 9.42ms | 6.92ms | 17.95ms | 9.36ms | 81.82ms |
| cellx2500 | 32.37ms | 26.25ms | 31.36ms | 48.17ms | 24.97ms | 247.05ms |
| cellx5000 | 67.25ms | 62.40ms | 55.95ms | 108.68ms | 70.16ms | 539.76ms |
| 10x5 - 2 sources - read 20.0% (simple) | 425.53ms | 225.85ms | 232.63ms | 358.82ms | 395.96ms | 2.12s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 240.52ms | 172.82ms | 174.31ms | 256.52ms | 232.38ms | 1.59s |
| 1000x12 - 4 sources - dynamic (large) | 3.27s | 253.32ms | 274.62ms | 368.68ms | 3.01s | 1.72s |
| 1000x5 - 25 sources (wide dense) | 2.69s | 352.15ms | 391.97ms | 542.38ms | 2.27s | 3.59s |
| 5x500 - 3 sources (deep) | 215.38ms | 206.69ms | 201.15ms | 272.88ms | 222.32ms | 1.19s |
| 100x15 - 6 sources - dynamic (very dynamic) | 391.76ms | 222.86ms | 220.60ms | 307.56ms | 376.92ms | 1.74s |

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
