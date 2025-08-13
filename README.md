# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.66s |
| 🥈 | signals | 0.28 | 100.0% | 35/35 | 10.97s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.25s |
| 4 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.29s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.32s |
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
| Test Case | mobx | state_beacon | preact_signals | alien_signals | solidart(2.0-dev) | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.40s | 152.23ms (fail) | 196.98ms | 187.29ms | 271.77ms | 216.11ms |
| broadPropagation | 4.58s | 6.00ms (fail) | 456.73ms | 343.80ms | 514.55ms | 457.67ms |
| deepPropagation | 1.60s | 142.93ms (fail) | 178.95ms | 125.62ms | 166.72ms | 168.07ms |
| diamond | 2.57s | 189.31ms (fail) | 278.40ms | 230.76ms | 350.52ms | 280.82ms |
| mux | 1.89s | 191.82ms (fail) | 399.70ms | 363.99ms | 444.69ms | 408.96ms |
| repeatedObservers | 239.36ms | 52.71ms (fail) | 39.83ms | 45.34ms | 80.97ms | 44.52ms |
| triangle | 795.15ms | 77.05ms (fail) | 100.16ms | 84.90ms | 118.68ms | 105.17ms |
| unstable | 365.07ms | 336.82ms (fail) | 69.46ms | 67.53ms | 99.01ms | 79.21ms |
| molBench | 575.67ms | 996μs | 485.05ms | 483.25ms | 491.97ms | 485.73ms |
| create_signals | 82.06ms | 61.34ms | 5.25ms | 21.19ms | 76.25ms | 24.44ms |
| comp_0to1 | 45.79ms | 54.36ms | 17.63ms | 8.49ms | 28.47ms | 11.36ms |
| comp_1to1 | 18.52ms | 56.21ms | 11.03ms | 4.29ms | 48.54ms | 29.33ms |
| comp_2to1 | 22.79ms | 37.45ms | 13.52ms | 2.33ms | 42.33ms | 8.91ms |
| comp_4to1 | 17.17ms | 17.14ms | 13.13ms | 8.85ms | 18.12ms | 1.98ms |
| comp_1000to1 | 28μs | 42μs | 4μs | 3μs | 17μs | 4μs |
| comp_1to2 | 34.69ms | 45.64ms | 18.12ms | 15.20ms | 32.23ms | 19.16ms |
| comp_1to4 | 23.96ms | 44.35ms | 36.31ms | 6.20ms | 30.19ms | 10.44ms |
| comp_1to8 | 19.47ms | 43.51ms | 7.74ms | 7.04ms | 24.46ms | 8.13ms |
| comp_1to1000 | 16.06ms | 38.84ms | 4.69ms | 3.53ms | 16.93ms | 4.11ms |
| update_1to1 | 22.96ms | 5.66ms | 8.62ms | 10.41ms | 15.91ms | 8.95ms |
| update_2to1 | 11.08ms | 3.13ms | 4.27ms | 2.33ms | 7.87ms | 4.53ms |
| update_4to1 | 5.61ms | 1.48ms | 2.17ms | 2.62ms | 4.06ms | 2.22ms |
| update_1000to1 | 60μs | 14μs | 21μs | 24μs | 39μs | 22μs |
| update_1to2 | 11.59ms | 2.91ms | 4.60ms | 3.94ms | 7.99ms | 4.46ms |
| update_1to4 | 5.79ms | 1.46ms | 2.16ms | 2.00ms | 4.00ms | 2.24ms |
| update_1to1000 | 167μs | 386μs | 230μs | 47μs | 171μs | 42μs |
| cellx1000 | 74.32ms | 7.01ms | 9.64ms | 7.76ms | 11.64ms | 9.56ms |
| cellx2500 | 261.96ms | 38.98ms | 27.76ms | 19.73ms | 34.83ms | 31.16ms |
| cellx5000 | 569.78ms | 82.84ms | 80.02ms | 42.53ms | 79.64ms | 61.52ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.13s | 242.53ms | 437.98ms | 231.65ms | 358.05ms | 515.05ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.56s | 200.06ms | 272.57ms | 178.69ms | 246.00ms | 279.72ms |
| 1000x12 - 4 sources - dynamic (large) | 1.93s | 349.84ms | 3.70s | 282.89ms | 463.87ms | 3.75s |
| 1000x5 - 25 sources (wide dense) | 3.56s | 507.17ms | 2.69s | 412.27ms | 569.65ms | 3.23s |
| 5x500 - 3 sources (deep) | 1.16s | 206.05ms | 225.20ms | 192.48ms | 250.63ms | 225.15ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.73s | 257.71ms | 448.31ms | 264.55ms | 377.78ms | 479.68ms |

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
