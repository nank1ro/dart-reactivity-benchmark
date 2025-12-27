# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.68s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.29s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.25s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.01s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.22s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.48s |

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
| avoidablePropagation | 211.67ms | 188.04ms | 174.26ms (fail) | 276.97ms | 206.41ms | 2.36s |
| broadPropagation | 468.56ms | 352.44ms | 6.84ms (fail) | 506.64ms | 451.87ms | 4.35s |
| deepPropagation | 171.12ms | 123.73ms | 139.93ms (fail) | 170.68ms | 179.58ms | 1.50s |
| diamond | 303.58ms | 230.74ms | 250.90ms (fail) | 365.65ms | 286.06ms | 2.37s |
| mux | 391.00ms | 367.14ms | 181.76ms (fail) | 421.46ms | 377.86ms | 1.87s |
| repeatedObservers | 46.81ms | 43.49ms | 53.91ms (fail) | 81.34ms | 40.79ms | 229.93ms |
| triangle | 120.45ms | 82.97ms | 77.31ms (fail) | 113.20ms | 100.39ms | 768.23ms |
| unstable | 80.26ms | 62.95ms | 340.88ms (fail) | 96.79ms | 69.37ms | 345.38ms |
| molBench | 495.80ms | 485.01ms | 995μs | 490.63ms | 479.62ms | 590.59ms |
| create_signals | 26.03ms | 20.87ms | 58.96ms | 75.76ms | 18.96ms | 51.92ms |
| comp_0to1 | 11.79ms | 8.10ms | 52.49ms | 25.72ms | 15.76ms | 15.50ms |
| comp_1to1 | 24.62ms | 4.15ms | 52.81ms | 32.24ms | 7.03ms | 41.32ms |
| comp_2to1 | 9.68ms | 2.32ms | 36.02ms | 35.13ms | 10.35ms | 28.57ms |
| comp_4to1 | 4.42ms | 8.54ms | 15.71ms | 4.36ms | 13.68ms | 13.99ms |
| comp_1000to1 | 4μs | 6μs | 40μs | 15μs | 6μs | 15μs |
| comp_1to2 | 15.71ms | 26.58ms | 44.21ms | 40.74ms | 32.13ms | 36.17ms |
| comp_1to4 | 15.04ms | 5.80ms | 44.16ms | 20.61ms | 21.54ms | 22.66ms |
| comp_1to8 | 6.50ms | 5.93ms | 42.05ms | 23.02ms | 8.62ms | 23.42ms |
| comp_1to1000 | 4.26ms | 3.34ms | 38.05ms | 14.69ms | 6.26ms | 15.68ms |
| update_1to1 | 9.28ms | 4.64ms | 6.10ms | 15.55ms | 9.21ms | 26.93ms |
| update_2to1 | 4.78ms | 2.36ms | 3.05ms | 7.75ms | 4.47ms | 12.67ms |
| update_4to1 | 2.36ms | 1.21ms | 1.58ms | 3.91ms | 2.30ms | 6.69ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 75μs |
| update_1to2 | 4.66ms | 2.29ms | 3.09ms | 7.91ms | 4.58ms | 13.27ms |
| update_1to4 | 2.47ms | 1.20ms | 1.59ms | 3.85ms | 2.27ms | 6.65ms |
| update_1to1000 | 44μs | 48μs | 366μs | 152μs | 2.44ms | 160μs |
| cellx1000 | 9.85ms | 7.90ms | 5.58ms | 11.87ms | 11.13ms | 73.61ms |
| cellx2500 | 32.22ms | 19.36ms | 28.00ms | 34.04ms | 25.78ms | 266.03ms |
| cellx5000 | 81.53ms | 46.15ms | 78.78ms | 84.04ms | 73.74ms | 603.29ms |
| 10x5 - 2 sources - read 20.0% (simple) | 503.75ms | 237.59ms | 235.02ms | 367.06ms | 439.02ms | 1.95s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 276.65ms | 174.38ms | 190.39ms | 254.16ms | 264.73ms | 1.49s |
| 1000x12 - 4 sources - dynamic (large) | 3.85s | 284.31ms | 343.07ms | 469.09ms | 3.67s | 1.83s |
| 1000x5 - 25 sources (wide dense) | 3.36s | 420.45ms | 518.42ms | 598.26ms | 2.50s | 3.48s |
| 5x500 - 3 sources (deep) | 227.92ms | 195.20ms | 199.17ms | 256.10ms | 228.41ms | 1.15s |
| 100x15 - 6 sources - dynamic (very dynamic) | 477.49ms | 260.73ms | 251.20ms | 377.64ms | 449.47ms | 1.67s |

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
