# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.72s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 9.93s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.31s |
| 4 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.35s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.56s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.45s |

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
| avoidablePropagation | 276.39ms | 206.93ms | 2.31s | 186.21ms | 210.15ms | 158.21ms (fail) |
| broadPropagation | 507.90ms | 455.30ms | 4.27s | 359.80ms | 454.19ms | 6.55ms (fail) |
| deepPropagation | 176.32ms | 179.10ms | 1.52s | 128.02ms | 180.67ms | 144.13ms (fail) |
| diamond | 352.05ms | 279.02ms | 2.38s | 238.42ms | 292.50ms | 181.31ms (fail) |
| mux | 453.19ms | 383.50ms | 1.86s | 380.39ms | 410.04ms | 189.88ms (fail) |
| repeatedObservers | 78.72ms | 38.34ms | 226.99ms | 44.98ms | 46.30ms | 52.71ms (fail) |
| triangle | 118.30ms | 98.31ms | 758.62ms | 85.74ms | 103.25ms | 83.73ms (fail) |
| unstable | 93.79ms | 70.31ms | 348.72ms | 61.67ms | 73.33ms | 336.82ms (fail) |
| molBench | 492.03ms | 490.52ms | 578.13ms | 490.59ms | 486.52ms | 1.33ms |
| create_signals | 96.29ms | 4.73ms | 71.14ms | 26.61ms | 25.66ms | 74.46ms |
| comp_0to1 | 36.56ms | 17.40ms | 26.51ms | 7.83ms | 12.04ms | 62.60ms |
| comp_1to1 | 47.08ms | 11.22ms | 45.71ms | 4.21ms | 20.12ms | 64.37ms |
| comp_2to1 | 23.87ms | 11.45ms | 20.73ms | 2.22ms | 11.05ms | 41.54ms |
| comp_4to1 | 14.71ms | 9.68ms | 17.10ms | 10.68ms | 2.22ms | 19.53ms |
| comp_1000to1 | 17μs | 7μs | 20μs | 5μs | 5μs | 48μs |
| comp_1to2 | 26.91ms | 16.49ms | 33.68ms | 19.20ms | 14.23ms | 50.86ms |
| comp_1to4 | 25.09ms | 25.38ms | 18.58ms | 4.95ms | 10.77ms | 50.15ms |
| comp_1to8 | 23.93ms | 7.06ms | 22.11ms | 4.92ms | 7.02ms | 49.77ms |
| comp_1to1000 | 14.40ms | 5.36ms | 15.17ms | 3.27ms | 4.52ms | 44.28ms |
| update_1to1 | 16.18ms | 8.19ms | 24.70ms | 11.24ms | 9.21ms | 5.73ms |
| update_2to1 | 7.95ms | 4.05ms | 10.80ms | 4.96ms | 5.29ms | 2.89ms |
| update_4to1 | 4.12ms | 2.07ms | 6.77ms | 2.78ms | 2.33ms | 1.48ms |
| update_1000to1 | 66μs | 20μs | 69μs | 10μs | 23μs | 15μs |
| update_1to2 | 11.64ms | 4.12ms | 11.05ms | 5.61ms | 4.91ms | 2.95ms |
| update_1to4 | 4.08ms | 2.06ms | 5.47ms | 2.44ms | 2.32ms | 1.48ms |
| update_1to1000 | 156μs | 157μs | 171μs | 46μs | 43μs | 440μs |
| cellx1000 | 11.39ms | 9.61ms | 71.22ms | 8.36ms | 9.52ms | 5.02ms |
| cellx2500 | 35.47ms | 25.54ms | 235.24ms | 19.59ms | 30.61ms | 21.06ms |
| cellx5000 | 91.30ms | 74.72ms | 581.76ms | 42.83ms | 62.18ms | 61.17ms |
| 10x5 - 2 sources - read 20.0% (simple) | 377.96ms | 444.45ms | 2.04s | 235.41ms | 512.32ms | 241.49ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 242.76ms | 275.82ms | 1.55s | 176.60ms | 279.55ms | 199.29ms |
| 1000x12 - 4 sources - dynamic (large) | 471.30ms | 3.49s | 1.91s | 284.51ms | 3.75s | 340.45ms |
| 1000x5 - 25 sources (wide dense) | 587.05ms | 2.60s | 3.73s | 407.14ms | 3.57s | 492.55ms |
| 5x500 - 3 sources (deep) | 253.43ms | 231.22ms | 1.16s | 191.45ms | 227.87ms | 207.21ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 380.35ms | 452.90ms | 1.70s | 268.20ms | 479.26ms | 258.64ms |

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
