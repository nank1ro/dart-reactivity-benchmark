# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.31s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.24s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.29s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.94s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.43s |

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
| avoidablePropagation | 275.38ms | 206.69ms | 2.34s | 202.02ms | 148.71ms (fail) | 179.85ms |
| broadPropagation | 508.42ms | 465.36ms | 4.62s | 455.83ms | 6.00ms (fail) | 348.65ms |
| deepPropagation | 169.38ms | 171.87ms | 1.59s | 177.41ms | 141.02ms (fail) | 122.49ms |
| diamond | 350.66ms | 281.96ms | 2.51s | 286.87ms | 184.39ms (fail) | 232.80ms |
| mux | 434.30ms | 416.14ms | 1.83s | 403.46ms | 192.49ms (fail) | 370.64ms |
| repeatedObservers | 81.70ms | 44.41ms | 234.36ms | 39.87ms | 54.79ms (fail) | 45.48ms |
| triangle | 118.02ms | 106.58ms | 775.26ms | 98.11ms | 78.30ms (fail) | 86.06ms |
| unstable | 98.10ms | 79.03ms | 351.12ms | 70.33ms | 335.71ms (fail) | 66.85ms |
| molBench | 494.21ms | 485.50ms | 575.84ms | 489.35ms | 1.21ms | 482.13ms |
| create_signals | 76.53ms | 25.52ms | 88.64ms | 5.35ms | 66.30ms | 29.47ms |
| comp_0to1 | 28.04ms | 12.36ms | 35.33ms | 18.25ms | 62.70ms | 6.92ms |
| comp_1to1 | 38.81ms | 27.63ms | 18.63ms | 11.74ms | 57.24ms | 4.28ms |
| comp_2to1 | 38.44ms | 8.30ms | 16.75ms | 11.45ms | 37.91ms | 2.33ms |
| comp_4to1 | 8.94ms | 6.83ms | 28.71ms | 11.56ms | 17.37ms | 10.42ms |
| comp_1000to1 | 17μs | 5μs | 18μs | 5μs | 42μs | 3μs |
| comp_1to2 | 39.08ms | 14.00ms | 35.61ms | 25.45ms | 48.23ms | 12.49ms |
| comp_1to4 | 23.11ms | 9.19ms | 25.28ms | 23.11ms | 47.72ms | 12.00ms |
| comp_1to8 | 26.09ms | 8.89ms | 22.81ms | 8.35ms | 44.38ms | 4.84ms |
| comp_1to1000 | 17.33ms | 7.08ms | 16.50ms | 11.30ms | 39.33ms | 3.56ms |
| update_1to1 | 16.02ms | 9.21ms | 26.19ms | 8.70ms | 6.12ms | 10.36ms |
| update_2to1 | 7.83ms | 4.46ms | 13.14ms | 4.26ms | 4.55ms | 2.26ms |
| update_4to1 | 4.04ms | 2.22ms | 6.84ms | 2.19ms | 1.50ms | 2.53ms |
| update_1000to1 | 40μs | 22μs | 60μs | 21μs | 15μs | 27μs |
| update_1to2 | 8.07ms | 4.48ms | 12.71ms | 4.61ms | 3.00ms | 5.04ms |
| update_1to4 | 4.01ms | 2.21ms | 6.57ms | 2.15ms | 1.50ms | 2.50ms |
| update_1to1000 | 171μs | 44μs | 179μs | 1.97ms | 387μs | 30μs |
| cellx1000 | 12.03ms | 9.86ms | 72.28ms | 10.03ms | 5.98ms | 8.11ms |
| cellx2500 | 40.00ms | 33.75ms | 268.17ms | 28.20ms | 26.60ms | 20.28ms |
| cellx5000 | 93.63ms | 67.08ms | 555.65ms | 77.05ms | 71.30ms | 47.33ms |
| 10x5 - 2 sources - read 20.0% (simple) | 354.95ms | 518.86ms | 2.02s | 434.27ms | 242.10ms | 240.62ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 245.47ms | 280.44ms | 1.55s | 276.17ms | 197.31ms | 178.39ms |
| 1000x12 - 4 sources - dynamic (large) | 467.14ms | 3.78s | 1.90s | 3.71s | 339.88ms | 278.17ms |
| 1000x5 - 25 sources (wide dense) | 592.28ms | 3.44s | 3.54s | 2.70s | 498.90ms | 413.97ms |
| 5x500 - 3 sources (deep) | 255.13ms | 225.13ms | 1.16s | 228.81ms | 206.34ms | 192.65ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 382.92ms | 491.87ms | 1.69s | 452.60ms | 260.41ms | 267.32ms |

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
