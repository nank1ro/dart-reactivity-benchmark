# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.68s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.20s |
| 🥉 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.42s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.36s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.61s |
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
| Test Case | state_beacon | alien_signals | mobx | solidart(2.0-dev) | signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 148.14ms (fail) | 186.67ms | 2.29s | 281.68ms | 211.18ms | 201.67ms |
| broadPropagation | 7.36ms (fail) | 357.22ms | 4.37s | 506.42ms | 449.82ms | 495.83ms |
| deepPropagation | 141.68ms (fail) | 122.71ms | 1.55s | 169.95ms | 176.36ms | 178.40ms |
| diamond | 184.42ms (fail) | 227.28ms | 2.42s | 361.22ms | 279.27ms | 302.87ms |
| mux | 194.86ms (fail) | 372.90ms | 1.86s | 437.63ms | 403.76ms | 417.57ms |
| repeatedObservers | 54.78ms (fail) | 47.52ms | 232.41ms | 81.65ms | 44.50ms | 41.37ms |
| triangle | 75.79ms (fail) | 84.91ms | 769.40ms | 118.99ms | 102.44ms | 104.07ms |
| unstable | 338.52ms (fail) | 67.38ms | 350.65ms | 97.51ms | 78.87ms | 72.91ms |
| molBench | 1.09ms | 487.58ms | 570.52ms | 494.57ms | 484.97ms | 490.46ms |
| create_signals | 68.30ms | 27.25ms | 55.64ms | 97.93ms | 25.66ms | 5.16ms |
| comp_0to1 | 55.74ms | 7.83ms | 16.54ms | 37.91ms | 11.70ms | 17.27ms |
| comp_1to1 | 59.09ms | 4.18ms | 49.38ms | 52.53ms | 32.93ms | 12.61ms |
| comp_2to1 | 36.01ms | 2.32ms | 22.41ms | 47.79ms | 8.69ms | 17.31ms |
| comp_4to1 | 16.25ms | 7.63ms | 17.68ms | 18.20ms | 2.86ms | 8.51ms |
| comp_1000to1 | 40μs | 3μs | 21μs | 17μs | 5μs | 9μs |
| comp_1to2 | 44.67ms | 10.42ms | 36.83ms | 33.63ms | 17.18ms | 20.36ms |
| comp_1to4 | 43.65ms | 11.80ms | 21.76ms | 22.35ms | 9.14ms | 28.76ms |
| comp_1to8 | 42.55ms | 4.89ms | 24.36ms | 22.48ms | 6.08ms | 7.83ms |
| comp_1to1000 | 38.30ms | 3.54ms | 16.11ms | 17.19ms | 4.17ms | 5.97ms |
| update_1to1 | 5.92ms | 10.54ms | 25.68ms | 16.00ms | 8.97ms | 8.64ms |
| update_2to1 | 3.26ms | 2.26ms | 14.05ms | 7.81ms | 4.49ms | 4.27ms |
| update_4to1 | 1.50ms | 2.62ms | 6.47ms | 4.01ms | 2.28ms | 2.16ms |
| update_1000to1 | 15μs | 26μs | 70μs | 40μs | 22μs | 21μs |
| update_1to2 | 3.00ms | 5.29ms | 10.98ms | 8.00ms | 4.58ms | 4.57ms |
| update_1to4 | 1.54ms | 2.57ms | 5.62ms | 4.01ms | 2.24ms | 2.15ms |
| update_1to1000 | 395μs | 40μs | 175μs | 170μs | 42μs | 924μs |
| cellx1000 | 5.14ms | 7.32ms | 78.10ms | 13.78ms | 9.80ms | 9.87ms |
| cellx2500 | 23.79ms | 20.13ms | 266.38ms | 41.09ms | 33.11ms | 27.62ms |
| cellx5000 | 68.23ms | 48.55ms | 614.73ms | 103.37ms | 69.17ms | 75.38ms |
| 10x5 - 2 sources - read 20.0% (simple) | 255.99ms | 231.65ms | 2.04s | 373.08ms | 520.00ms | 437.09ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 197.40ms | 177.27ms | 1.51s | 248.17ms | 287.01ms | 273.93ms |
| 1000x12 - 4 sources - dynamic (large) | 337.63ms | 279.61ms | 1.89s | 472.00ms | 3.77s | 3.70s |
| 1000x5 - 25 sources (wide dense) | 501.31ms | 410.81ms | 3.57s | 592.86ms | 3.42s | 2.70s |
| 5x500 - 3 sources (deep) | 204.51ms | 187.12ms | 1.17s | 256.53ms | 225.80ms | 233.01ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 257.27ms | 265.10ms | 1.73s | 379.12ms | 490.11ms | 450.91ms |

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
