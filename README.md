# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.35s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 9.89s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.06s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.13s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.47s |

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
| avoidablePropagation | 198.60ms | 145.16ms (fail) | 202.35ms | 186.13ms | 2.36s | 272.93ms |
| broadPropagation | 446.67ms | 6.78ms (fail) | 518.93ms | 343.37ms | 4.46s | 507.87ms |
| deepPropagation | 173.80ms | 139.02ms (fail) | 172.56ms | 129.34ms | 1.54s | 172.52ms |
| diamond | 281.08ms | 182.47ms (fail) | 283.73ms | 231.28ms | 2.34s | 360.08ms |
| mux | 385.62ms | 191.57ms (fail) | 406.83ms | 358.87ms | 1.76s | 433.20ms |
| repeatedObservers | 41.36ms | 53.03ms (fail) | 45.65ms | 43.28ms | 228.96ms | 79.75ms |
| triangle | 99.56ms | 79.62ms (fail) | 100.73ms | 99.23ms | 735.03ms | 114.92ms |
| unstable | 73.70ms | 336.85ms (fail) | 73.22ms | 60.77ms | 340.73ms | 95.23ms |
| molBench | 483.95ms | 999μs | 495.46ms | 487.37ms | 596.63ms | 488.77ms |
| create_signals | 4.76ms | 62.11ms | 25.44ms | 29.70ms | 90.88ms | 83.05ms |
| comp_0to1 | 22.50ms | 55.77ms | 11.77ms | 7.55ms | 24.20ms | 51.81ms |
| comp_1to1 | 13.83ms | 60.69ms | 25.95ms | 4.26ms | 43.69ms | 40.82ms |
| comp_2to1 | 19.21ms | 40.36ms | 13.04ms | 2.29ms | 41.95ms | 39.38ms |
| comp_4to1 | 19.77ms | 16.36ms | 7.20ms | 12.43ms | 23.94ms | 4.28ms |
| comp_1000to1 | 5μs | 67μs | 5μs | 4μs | 16μs | 14μs |
| comp_1to2 | 21.89ms | 48.71ms | 27.25ms | 21.20ms | 37.11ms | 35.33ms |
| comp_1to4 | 33.13ms | 47.45ms | 21.76ms | 6.07ms | 17.76ms | 14.66ms |
| comp_1to8 | 7.30ms | 44.80ms | 6.47ms | 4.14ms | 20.50ms | 21.33ms |
| comp_1to1000 | 6.09ms | 39.88ms | 4.19ms | 3.66ms | 15.51ms | 13.91ms |
| update_1to1 | 9.26ms | 5.77ms | 10.16ms | 9.98ms | 24.08ms | 15.90ms |
| update_2to1 | 4.65ms | 3.77ms | 5.06ms | 2.29ms | 11.43ms | 7.82ms |
| update_4to1 | 2.46ms | 2.72ms | 2.58ms | 2.47ms | 6.86ms | 4.05ms |
| update_1000to1 | 35μs | 15μs | 29μs | 28μs | 55μs | 38μs |
| update_1to2 | 4.74ms | 2.90ms | 5.07ms | 4.97ms | 10.55ms | 8.21ms |
| update_1to4 | 2.34ms | 1.53ms | 2.70ms | 1.57ms | 6.35ms | 4.00ms |
| update_1to1000 | 82μs | 389μs | 43μs | 52μs | 162μs | 158μs |
| cellx1000 | 10.16ms | 6.02ms | 9.80ms | 7.50ms | 83.28ms | 12.18ms |
| cellx2500 | 30.65ms | 23.83ms | 33.85ms | 20.68ms | 278.33ms | 37.80ms |
| cellx5000 | 96.97ms | 70.03ms | 74.67ms | 47.93ms | 615.05ms | 91.80ms |
| 10x5 - 2 sources - read 20.0% (simple) | 434.21ms | 264.08ms | 498.52ms | 233.73ms | 1.92s | 348.42ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 268.06ms | 206.43ms | 285.20ms | 175.32ms | 1.54s | 259.38ms |
| 1000x12 - 4 sources - dynamic (large) | 3.49s | 354.84ms | 3.63s | 284.91ms | 1.85s | 468.99ms |
| 1000x5 - 25 sources (wide dense) | 2.53s | 514.07ms | 3.36s | 404.91ms | 3.34s | 627.59ms |
| 5x500 - 3 sources (deep) | 227.81ms | 205.01ms | 223.18ms | 192.00ms | 1.11s | 249.34ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 449.31ms | 261.71ms | 476.72ms | 266.56ms | 1.66s | 386.02ms |

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
