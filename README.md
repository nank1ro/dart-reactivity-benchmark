# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.65s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.25s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.37s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.52s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.74s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.50s |

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
| Test Case | solidart(2.0-dev) | state_beacon | preact_signals | signals | mobx | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 269.30ms | 163.65ms (fail) | 202.39ms | 215.44ms | 2.42s | 181.99ms |
| broadPropagation | 507.68ms | 5.88ms (fail) | 493.89ms | 454.40ms | 4.52s | 346.24ms |
| deepPropagation | 168.67ms | 140.90ms (fail) | 175.12ms | 172.21ms | 1.57s | 125.51ms |
| diamond | 349.17ms | 184.56ms (fail) | 296.47ms | 282.91ms | 2.51s | 231.25ms |
| mux | 431.26ms | 198.71ms (fail) | 403.89ms | 411.53ms | 1.91s | 366.17ms |
| repeatedObservers | 80.94ms | 54.81ms (fail) | 41.94ms | 45.32ms | 245.32ms | 47.38ms |
| triangle | 116.74ms | 75.64ms (fail) | 101.68ms | 102.78ms | 781.86ms | 84.08ms |
| unstable | 97.33ms | 337.70ms (fail) | 73.91ms | 80.46ms | 356.16ms | 67.33ms |
| molBench | 493.10ms | 971μs | 484.45ms | 486.65ms | 576.74ms | 487.49ms |
| create_signals | 56.13ms | 68.84ms | 4.65ms | 27.83ms | 72.34ms | 24.34ms |
| comp_0to1 | 28.19ms | 57.83ms | 17.26ms | 12.39ms | 30.28ms | 8.90ms |
| comp_1to1 | 38.30ms | 59.16ms | 12.71ms | 27.46ms | 39.22ms | 4.38ms |
| comp_2to1 | 26.46ms | 43.01ms | 21.73ms | 10.54ms | 36.48ms | 2.36ms |
| comp_4to1 | 5.27ms | 19.29ms | 14.48ms | 2.73ms | 14.24ms | 7.88ms |
| comp_1000to1 | 17μs | 46μs | 4μs | 5μs | 20μs | 3μs |
| comp_1to2 | 34.91ms | 49.10ms | 18.89ms | 22.73ms | 37.40ms | 10.75ms |
| comp_1to4 | 23.19ms | 48.86ms | 33.33ms | 9.40ms | 19.44ms | 11.76ms |
| comp_1to8 | 25.39ms | 44.13ms | 7.50ms | 6.45ms | 23.77ms | 4.98ms |
| comp_1to1000 | 17.14ms | 39.13ms | 5.98ms | 4.29ms | 16.11ms | 3.38ms |
| update_1to1 | 16.21ms | 5.67ms | 8.68ms | 9.00ms | 26.71ms | 10.33ms |
| update_2to1 | 7.83ms | 4.71ms | 4.30ms | 4.62ms | 12.91ms | 2.25ms |
| update_4to1 | 4.03ms | 2.65ms | 2.15ms | 2.21ms | 6.59ms | 1.95ms |
| update_1000to1 | 40μs | 15μs | 21μs | 22μs | 70μs | 26μs |
| update_1to2 | 8.03ms | 2.88ms | 4.65ms | 4.68ms | 12.78ms | 5.03ms |
| update_1to4 | 4.03ms | 1.48ms | 2.13ms | 2.20ms | 6.16ms | 2.47ms |
| update_1to1000 | 171μs | 380μs | 1.05ms | 44μs | 171μs | 45μs |
| cellx1000 | 12.73ms | 7.52ms | 10.17ms | 11.97ms | 79.48ms | 7.27ms |
| cellx2500 | 37.61ms | 43.82ms | 29.55ms | 49.86ms | 286.66ms | 20.43ms |
| cellx5000 | 96.91ms | 98.23ms | 88.58ms | 109.45ms | 586.23ms | 50.50ms |
| 10x5 - 2 sources - read 20.0% (simple) | 355.55ms | 236.98ms | 436.89ms | 520.38ms | 2.05s | 225.41ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 242.62ms | 196.51ms | 274.35ms | 288.26ms | 1.57s | 171.67ms |
| 1000x12 - 4 sources - dynamic (large) | 468.56ms | 351.04ms | 3.74s | 3.78s | 2.16s | 274.93ms |
| 1000x5 - 25 sources (wide dense) | 586.84ms | 486.60ms | 2.81s | 3.49s | 3.82s | 408.83ms |
| 5x500 - 3 sources (deep) | 255.17ms | 205.40ms | 235.36ms | 226.36ms | 1.19s | 193.50ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 384.97ms | 264.84ms | 462.15ms | 491.92ms | 1.73s | 263.78ms |

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
