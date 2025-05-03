# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.68s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.24s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.11s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 9.96s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.29s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.40s |

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
| Test Case | solidart(2.0-dev) | preact_signals | alien_signals | state_beacon | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 268.19ms | 206.10ms | 183.68ms | 150.16ms (fail) | 2.33s | 211.47ms |
| broadPropagation | 504.47ms | 457.33ms | 353.33ms | 6.35ms (fail) | 4.27s | 457.48ms |
| deepPropagation | 174.82ms | 176.45ms | 123.91ms | 139.64ms (fail) | 1.53s | 183.01ms |
| diamond | 346.10ms | 275.74ms | 235.79ms | 195.21ms (fail) | 2.41s | 292.13ms |
| mux | 444.51ms | 378.67ms | 369.92ms | 189.55ms (fail) | 1.82s | 406.66ms |
| repeatedObservers | 77.99ms | 38.25ms | 44.70ms | 53.69ms (fail) | 221.06ms | 45.26ms |
| triangle | 119.13ms | 99.16ms | 86.12ms | 77.03ms (fail) | 777.51ms | 106.40ms |
| unstable | 93.34ms | 70.80ms | 60.19ms | 336.83ms (fail) | 348.25ms | 70.61ms |
| molBench | 493.43ms | 490.52ms | 491.40ms | 993μs | 574.91ms | 481.37ms |
| create_signals | 77.52ms | 5.21ms | 32.06ms | 59.14ms | 67.03ms | 25.93ms |
| comp_0to1 | 47.27ms | 17.86ms | 6.81ms | 52.29ms | 26.36ms | 12.56ms |
| comp_1to1 | 27.59ms | 14.37ms | 4.09ms | 53.45ms | 36.57ms | 28.27ms |
| comp_2to1 | 33.04ms | 16.26ms | 2.19ms | 35.42ms | 33.46ms | 14.05ms |
| comp_4to1 | 4.62ms | 8.99ms | 11.47ms | 16.04ms | 13.11ms | 1.94ms |
| comp_1000to1 | 18μs | 4μs | 3μs | 42μs | 21μs | 5μs |
| comp_1to2 | 31.26ms | 23.36ms | 16.25ms | 44.61ms | 28.21ms | 18.18ms |
| comp_1to4 | 15.59ms | 20.85ms | 6.92ms | 46.45ms | 23.46ms | 11.71ms |
| comp_1to8 | 20.26ms | 9.65ms | 4.37ms | 43.48ms | 22.16ms | 6.53ms |
| comp_1to1000 | 15.04ms | 11.21ms | 3.49ms | 38.41ms | 14.70ms | 4.47ms |
| update_1to1 | 16.08ms | 8.26ms | 11.36ms | 5.73ms | 26.25ms | 9.29ms |
| update_2to1 | 7.91ms | 4.12ms | 5.08ms | 5.42ms | 12.70ms | 4.55ms |
| update_4to1 | 4.03ms | 2.08ms | 2.79ms | 1.48ms | 6.52ms | 2.34ms |
| update_1000to1 | 40μs | 20μs | 10μs | 14μs | 68μs | 23μs |
| update_1to2 | 8.11ms | 4.16ms | 5.64ms | 2.96ms | 12.95ms | 4.91ms |
| update_1to4 | 4.04ms | 2.05ms | 2.46ms | 1.48ms | 6.23ms | 2.35ms |
| update_1to1000 | 149μs | 1.73ms | 48μs | 379μs | 165μs | 43μs |
| cellx1000 | 14.32ms | 9.66ms | 7.50ms | 5.24ms | 69.12ms | 9.73ms |
| cellx2500 | 29.94ms | 25.71ms | 19.48ms | 24.35ms | 233.99ms | 33.15ms |
| cellx5000 | 65.64ms | 64.31ms | 41.31ms | 61.79ms | 529.61ms | 68.34ms |
| 10x5 - 2 sources - read 20.0% (simple) | 355.44ms | 448.74ms | 226.30ms | 245.14ms | 2.03s | 498.63ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 250.46ms | 268.11ms | 175.19ms | 203.42ms | 1.54s | 306.04ms |
| 1000x12 - 4 sources - dynamic (large) | 453.51ms | 3.53s | 284.25ms | 336.25ms | 1.84s | 3.76s |
| 1000x5 - 25 sources (wide dense) | 592.95ms | 2.59s | 410.19ms | 504.23ms | 3.61s | 3.32s |
| 5x500 - 3 sources (deep) | 255.58ms | 231.11ms | 187.30ms | 203.45ms | 1.14s | 227.34ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 382.73ms | 447.54ms | 259.62ms | 258.07ms | 1.70s | 479.01ms |

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
