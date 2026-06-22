# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.81s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.61s |
| 🥉 | signals | 0.24 | 100.0% | 35/35 | 11.44s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.18s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 28.44s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.56s |

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
| avoidablePropagation | 220.37ms | 158.44ms (fail) | 211.32ms | 192.02ms | 2.40s | 270.85ms |
| broadPropagation | 540.62ms | 7.12ms (fail) | 473.72ms | 366.60ms | 4.25s | 498.63ms |
| deepPropagation | 198.86ms | 156.71ms (fail) | 189.34ms | 118.48ms | 1.56s | 172.51ms |
| diamond | 288.93ms | 197.90ms (fail) | 292.72ms | 268.03ms | 2.31s | 384.90ms |
| mux | 390.24ms | 201.94ms (fail) | 401.57ms | 362.52ms | 1.90s | 438.77ms |
| repeatedObservers | 41.66ms | 54.92ms (fail) | 47.52ms | 43.09ms | 238.94ms | 89.55ms |
| triangle | 106.81ms | 83.61ms (fail) | 108.67ms | 89.74ms | 760.47ms | 121.38ms |
| unstable | 72.90ms | 357.38ms (fail) | 81.56ms | 61.14ms | 345.88ms | 108.32ms |
| molBench | 547.84ms | 1.27ms | 561.80ms | 553.26ms | 641.92ms | 560.39ms |
| create_signals | 5.77ms | 68.23ms | 31.31ms | 24.68ms | 83.19ms | 62.86ms |
| comp_0to1 | 21.39ms | 56.84ms | 13.75ms | 9.44ms | 31.11ms | 27.92ms |
| comp_1to1 | 21.94ms | 57.96ms | 30.47ms | 4.35ms | 35.91ms | 31.88ms |
| comp_2to1 | 19.77ms | 41.73ms | 13.57ms | 2.33ms | 43.61ms | 38.59ms |
| comp_4to1 | 13.81ms | 17.29ms | 2.24ms | 15.04ms | 37.64ms | 4.46ms |
| comp_1000to1 | 5μs | 43μs | 5μs | 4μs | 31μs | 14μs |
| comp_1to2 | 33.88ms | 49.54ms | 18.28ms | 19.77ms | 47.64ms | 38.97ms |
| comp_1to4 | 33.59ms | 46.62ms | 7.86ms | 7.70ms | 25.53ms | 15.16ms |
| comp_1to8 | 7.09ms | 42.70ms | 6.73ms | 4.01ms | 26.84ms | 21.99ms |
| comp_1to1000 | 6.40ms | 36.89ms | 4.22ms | 3.54ms | 16.26ms | 14.71ms |
| update_1to1 | 8.51ms | 6.19ms | 10.12ms | 4.36ms | 25.79ms | 16.22ms |
| update_2to1 | 4.28ms | 3.17ms | 5.15ms | 2.27ms | 12.33ms | 8.44ms |
| update_4to1 | 2.10ms | 1.57ms | 2.51ms | 1.09ms | 6.34ms | 4.06ms |
| update_1000to1 | 21μs | 16μs | 37μs | 11μs | 72μs | 40μs |
| update_1to2 | 4.21ms | 3.41ms | 4.92ms | 2.20ms | 12.02ms | 8.30ms |
| update_1to4 | 2.11ms | 1.61ms | 2.50ms | 1.09ms | 5.83ms | 4.04ms |
| update_1to1000 | 793μs | 384μs | 41μs | 29μs | 161μs | 155μs |
| cellx1000 | 10.68ms | 6.82ms | 12.30ms | 8.07ms | 107.14ms | 14.32ms |
| cellx2500 | 45.10ms | 41.19ms | 54.58ms | 26.46ms | 380.40ms | 68.06ms |
| cellx5000 | 138.85ms | 113.92ms | 154.73ms | 79.48ms | 804.51ms | 230.34ms |
| 10x5 - 2 sources - read 20.0% (simple) | 428.69ms | 262.84ms | 518.17ms | 241.46ms | 2.16s | 372.79ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 268.85ms | 200.02ms | 288.38ms | 182.91ms | 1.47s | 270.65ms |
| 1000x12 - 4 sources - dynamic (large) | 3.42s | 346.25ms | 3.60s | 271.52ms | 1.98s | 441.68ms |
| 1000x5 - 25 sources (wide dense) | 2.59s | 482.58ms | 3.56s | 412.99ms | 3.65s | 646.80ms |
| 5x500 - 3 sources (deep) | 241.41ms | 211.40ms | 242.27ms | 192.22ms | 1.25s | 275.47ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 453.98ms | 243.66ms | 493.03ms | 238.21ms | 1.82s | 350.90ms |

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
