# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.33s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.07s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 9.91s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.94s |
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
| Test Case | preact_signals | state_beacon | signals | alien_signals | mobx | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 198.88ms | 145.39ms (fail) | 200.03ms | 188.88ms | 2.35s | 274.12ms |
| broadPropagation | 443.59ms | 6.40ms (fail) | 506.53ms | 343.62ms | 4.33s | 507.26ms |
| deepPropagation | 173.54ms | 139.02ms (fail) | 168.45ms | 131.11ms | 1.51s | 174.10ms |
| diamond | 283.42ms | 180.86ms (fail) | 283.50ms | 233.32ms | 2.41s | 359.42ms |
| mux | 377.39ms | 189.26ms (fail) | 396.43ms | 362.66ms | 1.77s | 419.04ms |
| repeatedObservers | 40.64ms | 53.17ms (fail) | 45.74ms | 43.40ms | 230.75ms | 80.37ms |
| triangle | 98.55ms | 79.82ms (fail) | 99.34ms | 83.91ms | 751.39ms | 114.75ms |
| unstable | 73.64ms | 334.42ms (fail) | 72.65ms | 59.79ms | 344.39ms | 95.60ms |
| molBench | 484.70ms | 1.47ms | 496.20ms | 487.37ms | 593.70ms | 492.91ms |
| create_signals | 5.49ms | 63.81ms | 26.09ms | 30.12ms | 85.77ms | 95.60ms |
| comp_0to1 | 17.70ms | 61.38ms | 12.03ms | 9.69ms | 38.56ms | 35.97ms |
| comp_1to1 | 21.13ms | 58.24ms | 38.10ms | 4.21ms | 31.62ms | 28.15ms |
| comp_2to1 | 18.91ms | 39.91ms | 12.63ms | 2.28ms | 10.03ms | 38.20ms |
| comp_4to1 | 17.24ms | 16.99ms | 1.85ms | 13.12ms | 29.38ms | 4.31ms |
| comp_1000to1 | 6μs | 45μs | 4μs | 3μs | 35μs | 14μs |
| comp_1to2 | 22.25ms | 48.37ms | 18.41ms | 12.07ms | 36.83ms | 27.07ms |
| comp_1to4 | 31.78ms | 48.39ms | 7.10ms | 16.46ms | 24.05ms | 28.34ms |
| comp_1to8 | 7.25ms | 46.33ms | 6.76ms | 4.80ms | 24.92ms | 23.19ms |
| comp_1to1000 | 6.75ms | 42.09ms | 3.96ms | 3.37ms | 15.49ms | 14.43ms |
| update_1to1 | 9.47ms | 5.75ms | 9.82ms | 9.99ms | 25.38ms | 16.00ms |
| update_2to1 | 4.63ms | 3.14ms | 4.98ms | 2.24ms | 10.90ms | 7.82ms |
| update_4to1 | 2.47ms | 1.51ms | 2.43ms | 2.50ms | 7.34ms | 4.04ms |
| update_1000to1 | 28μs | 15μs | 24μs | 10μs | 52μs | 39μs |
| update_1to2 | 4.69ms | 2.94ms | 4.85ms | 4.97ms | 11.03ms | 8.11ms |
| update_1to4 | 2.29ms | 1.55ms | 2.48ms | 1.26ms | 5.81ms | 4.05ms |
| update_1to1000 | 56μs | 410μs | 44μs | 36μs | 179μs | 146μs |
| cellx1000 | 10.11ms | 6.15ms | 12.15ms | 7.52ms | 77.12ms | 12.51ms |
| cellx2500 | 36.07ms | 31.61ms | 34.81ms | 20.68ms | 266.45ms | 40.37ms |
| cellx5000 | 95.02ms | 66.33ms | 73.81ms | 51.49ms | 643.86ms | 103.33ms |
| 10x5 - 2 sources - read 20.0% (simple) | 437.73ms | 250.29ms | 502.56ms | 235.65ms | 1.91s | 346.64ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 271.45ms | 204.06ms | 290.83ms | 175.98ms | 1.45s | 251.01ms |
| 1000x12 - 4 sources - dynamic (large) | 3.52s | 353.90ms | 3.66s | 288.59ms | 1.85s | 478.46ms |
| 1000x5 - 25 sources (wide dense) | 2.52s | 508.92ms | 3.37s | 401.86ms | 3.33s | 610.96ms |
| 5x500 - 3 sources (deep) | 227.25ms | 207.02ms | 223.64ms | 202.94ms | 1.09s | 245.19ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 446.25ms | 262.65ms | 484.32ms | 262.56ms | 1.66s | 386.09ms |

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
