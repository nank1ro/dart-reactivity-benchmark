# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.28s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 9.87s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.23s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.34s |
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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 272.97ms | 204.63ms | 2.35s | 187.09ms | 209.84ms | 155.09ms (fail) |
| broadPropagation | 501.90ms | 454.77ms | 4.24s | 354.33ms | 460.65ms | 5.95ms (fail) |
| deepPropagation | 175.38ms | 175.53ms | 1.53s | 121.67ms | 174.50ms | 143.31ms (fail) |
| diamond | 349.38ms | 282.60ms | 2.38s | 240.67ms | 284.02ms | 191.75ms (fail) |
| mux | 439.91ms | 382.68ms | 1.82s | 374.44ms | 409.70ms | 191.91ms (fail) |
| repeatedObservers | 78.11ms | 38.44ms | 224.60ms | 44.98ms | 47.73ms | 52.23ms (fail) |
| triangle | 120.68ms | 101.75ms | 786.15ms | 87.01ms | 104.43ms | 81.26ms (fail) |
| unstable | 93.97ms | 71.17ms | 351.20ms | 60.71ms | 72.62ms | 335.39ms (fail) |
| molBench | 492.73ms | 490.64ms | 580.39ms | 484.64ms | 486.05ms | 1.24ms |
| create_signals | 74.55ms | 4.86ms | 67.72ms | 26.52ms | 24.91ms | 68.12ms |
| comp_0to1 | 25.71ms | 17.32ms | 26.45ms | 6.93ms | 11.83ms | 62.64ms |
| comp_1to1 | 27.91ms | 11.10ms | 34.98ms | 4.21ms | 28.88ms | 59.77ms |
| comp_2to1 | 31.54ms | 18.11ms | 37.74ms | 2.27ms | 21.36ms | 40.75ms |
| comp_4to1 | 8.63ms | 8.40ms | 13.22ms | 8.78ms | 5.92ms | 17.99ms |
| comp_1000to1 | 15μs | 6μs | 15μs | 6μs | 5μs | 48μs |
| comp_1to2 | 32.82ms | 25.54ms | 33.54ms | 14.99ms | 14.17ms | 50.34ms |
| comp_1to4 | 14.69ms | 26.16ms | 17.51ms | 11.57ms | 24.73ms | 49.48ms |
| comp_1to8 | 21.29ms | 6.28ms | 19.14ms | 5.61ms | 6.47ms | 48.62ms |
| comp_1to1000 | 14.31ms | 6.53ms | 14.69ms | 3.64ms | 5.67ms | 44.09ms |
| update_1to1 | 16.11ms | 8.18ms | 26.25ms | 11.22ms | 9.20ms | 5.73ms |
| update_2to1 | 7.91ms | 4.90ms | 12.19ms | 5.10ms | 4.57ms | 2.87ms |
| update_4to1 | 4.03ms | 3.68ms | 7.83ms | 2.77ms | 2.29ms | 1.46ms |
| update_1000to1 | 41μs | 37μs | 58μs | 22μs | 23μs | 15μs |
| update_1to2 | 8.11ms | 4.83ms | 13.17ms | 5.51ms | 4.85ms | 2.94ms |
| update_1to4 | 4.02ms | 2.08ms | 6.36ms | 2.47ms | 2.35ms | 1.46ms |
| update_1to1000 | 149μs | 878μs | 165μs | 53μs | 81μs | 435μs |
| cellx1000 | 11.91ms | 9.63ms | 72.08ms | 7.52ms | 9.81ms | 5.39ms |
| cellx2500 | 39.77ms | 28.07ms | 257.14ms | 21.56ms | 26.91ms | 22.96ms |
| cellx5000 | 98.58ms | 84.85ms | 572.52ms | 52.60ms | 67.28ms | 65.86ms |
| 10x5 - 2 sources - read 20.0% (simple) | 355.75ms | 442.41ms | 2.06s | 237.18ms | 503.76ms | 255.90ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 267.25ms | 276.38ms | 1.53s | 175.33ms | 283.82ms | 201.38ms |
| 1000x12 - 4 sources - dynamic (large) | 468.52ms | 3.40s | 1.85s | 286.53ms | 3.97s | 351.18ms |
| 1000x5 - 25 sources (wide dense) | 582.95ms | 2.59s | 3.52s | 410.10ms | 3.25s | 507.59ms |
| 5x500 - 3 sources (deep) | 256.96ms | 235.37ms | 1.16s | 188.75ms | 227.28ms | 204.80ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 382.54ms | 448.42ms | 1.72s | 271.83ms | 477.47ms | 268.79ms |

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
