# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.28s |
| 🥉 | preact_signals | 0.25 | 100.0% | 35/35 | 10.01s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.19s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 27.42s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.42s |

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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 272.40ms | 207.94ms | 2.31s | 187.94ms | 215.87ms | 151.54ms (fail) |
| broadPropagation | 512.03ms | 460.73ms | 4.23s | 358.38ms | 474.41ms | 6.21ms (fail) |
| deepPropagation | 167.89ms | 178.79ms | 1.53s | 124.52ms | 177.98ms | 137.96ms (fail) |
| diamond | 349.31ms | 293.14ms | 2.41s | 237.16ms | 289.46ms | 194.33ms (fail) |
| mux | 439.64ms | 380.93ms | 1.84s | 372.41ms | 407.09ms | 190.61ms (fail) |
| repeatedObservers | 78.14ms | 38.70ms | 227.55ms | 45.92ms | 46.18ms | 52.06ms (fail) |
| triangle | 116.45ms | 101.10ms | 765.51ms | 86.47ms | 102.19ms | 78.56ms (fail) |
| unstable | 93.64ms | 70.61ms | 347.44ms | 61.15ms | 72.47ms | 338.19ms (fail) |
| molBench | 493.53ms | 492.63ms | 579.65ms | 491.76ms | 489.24ms | 1.29ms |
| create_signals | 51.67ms | 4.76ms | 81.41ms | 20.14ms | 31.42ms | 69.20ms |
| comp_0to1 | 28.67ms | 17.59ms | 37.85ms | 7.42ms | 13.62ms | 56.28ms |
| comp_1to1 | 30.38ms | 12.88ms | 17.34ms | 4.21ms | 27.00ms | 52.22ms |
| comp_2to1 | 44.80ms | 17.71ms | 19.96ms | 2.27ms | 9.64ms | 35.59ms |
| comp_4to1 | 13.28ms | 12.76ms | 33.17ms | 8.57ms | 1.81ms | 16.06ms |
| comp_1000to1 | 15μs | 4μs | 32μs | 5μs | 9μs | 42μs |
| comp_1to2 | 31.77ms | 15.19ms | 42.12ms | 20.19ms | 23.09ms | 47.34ms |
| comp_1to4 | 16.42ms | 28.65ms | 22.44ms | 5.50ms | 17.47ms | 43.31ms |
| comp_1to8 | 22.74ms | 5.82ms | 24.88ms | 4.45ms | 6.72ms | 42.98ms |
| comp_1to1000 | 16.40ms | 6.54ms | 15.21ms | 3.54ms | 4.44ms | 37.44ms |
| update_1to1 | 16.07ms | 8.18ms | 22.11ms | 11.33ms | 9.25ms | 5.73ms |
| update_2to1 | 7.91ms | 4.05ms | 12.79ms | 5.15ms | 4.61ms | 2.87ms |
| update_4to1 | 4.06ms | 2.08ms | 6.65ms | 2.83ms | 2.36ms | 1.44ms |
| update_1000to1 | 40μs | 20μs | 68μs | 10μs | 23μs | 15μs |
| update_1to2 | 8.12ms | 4.12ms | 10.91ms | 5.64ms | 4.90ms | 2.96ms |
| update_1to4 | 4.02ms | 2.08ms | 5.71ms | 2.49ms | 2.34ms | 1.45ms |
| update_1to1000 | 153μs | 895μs | 170μs | 36μs | 43μs | 370μs |
| cellx1000 | 11.75ms | 9.74ms | 74.69ms | 7.51ms | 9.63ms | 5.19ms |
| cellx2500 | 35.99ms | 27.41ms | 253.98ms | 20.25ms | 33.47ms | 26.28ms |
| cellx5000 | 76.99ms | 76.79ms | 593.70ms | 45.66ms | 67.51ms | 67.38ms |
| 10x5 - 2 sources - read 20.0% (simple) | 390.20ms | 440.09ms | 2.01s | 231.99ms | 507.55ms | 243.54ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 247.88ms | 267.94ms | 1.58s | 177.78ms | 282.72ms | 205.12ms |
| 1000x12 - 4 sources - dynamic (large) | 462.27ms | 3.55s | 1.91s | 282.21ms | 3.73s | 336.59ms |
| 1000x5 - 25 sources (wide dense) | 594.63ms | 2.59s | 3.53s | 408.86ms | 3.42s | 503.48ms |
| 5x500 - 3 sources (deep) | 257.07ms | 233.05ms | 1.15s | 188.61ms | 227.66ms | 207.71ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 384.85ms | 452.59ms | 1.74s | 258.19ms | 484.27ms | 260.14ms |

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
