# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.25s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.08s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.15s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.11s |
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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 228.27ms | 187.34ms | 144.71ms (fail) | 277.19ms | 204.08ms | 2.37s |
| broadPropagation | 481.40ms | 353.17ms | 5.88ms (fail) | 508.82ms | 448.71ms | 4.38s |
| deepPropagation | 187.11ms | 135.32ms | 137.28ms (fail) | 168.49ms | 176.28ms | 1.50s |
| diamond | 288.90ms | 229.75ms | 180.49ms (fail) | 355.09ms | 287.63ms | 2.44s |
| mux | 388.81ms | 361.27ms | 183.58ms (fail) | 420.06ms | 374.16ms | 1.82s |
| repeatedObservers | 47.40ms | 44.20ms | 53.27ms (fail) | 81.58ms | 40.57ms | 245.30ms |
| triangle | 106.55ms | 84.00ms | 77.10ms (fail) | 114.36ms | 100.84ms | 744.10ms |
| unstable | 79.45ms | 63.76ms | 339.64ms (fail) | 95.46ms | 68.08ms | 344.81ms |
| molBench | 497.91ms | 485.10ms | 968μs | 490.08ms | 479.97ms | 589.45ms |
| create_signals | 25.71ms | 29.70ms | 66.16ms | 55.20ms | 5.35ms | 84.36ms |
| comp_0to1 | 11.67ms | 8.00ms | 61.26ms | 25.93ms | 17.92ms | 25.38ms |
| comp_1to1 | 27.93ms | 4.25ms | 62.50ms | 38.41ms | 14.23ms | 16.95ms |
| comp_2to1 | 19.22ms | 2.27ms | 37.53ms | 24.57ms | 20.95ms | 20.13ms |
| comp_4to1 | 7.67ms | 10.55ms | 19.34ms | 14.18ms | 14.56ms | 13.98ms |
| comp_1000to1 | 6μs | 5μs | 41μs | 15μs | 5μs | 22μs |
| comp_1to2 | 21.76ms | 18.29ms | 45.98ms | 32.20ms | 19.06ms | 37.58ms |
| comp_1to4 | 12.46ms | 9.06ms | 46.31ms | 20.86ms | 30.90ms | 26.01ms |
| comp_1to8 | 6.93ms | 5.36ms | 42.91ms | 22.11ms | 6.30ms | 21.10ms |
| comp_1to1000 | 4.58ms | 3.63ms | 38.30ms | 14.67ms | 6.36ms | 15.46ms |
| update_1to1 | 9.28ms | 6.48ms | 6.10ms | 15.71ms | 8.75ms | 24.49ms |
| update_2to1 | 4.71ms | 2.32ms | 3.05ms | 7.74ms | 4.37ms | 12.84ms |
| update_4to1 | 2.34ms | 2.22ms | 1.53ms | 3.89ms | 2.19ms | 6.66ms |
| update_1000to1 | 23μs | 23μs | 16μs | 38μs | 22μs | 68μs |
| update_1to2 | 4.62ms | 5.16ms | 3.06ms | 7.88ms | 4.42ms | 12.98ms |
| update_1to4 | 2.50ms | 2.57ms | 1.55ms | 3.86ms | 2.21ms | 6.38ms |
| update_1to1000 | 43μs | 47μs | 364μs | 145μs | 970μs | 161μs |
| cellx1000 | 9.93ms | 8.05ms | 5.56ms | 12.23ms | 9.75ms | 72.77ms |
| cellx2500 | 34.36ms | 19.92ms | 32.59ms | 42.74ms | 29.23ms | 250.25ms |
| cellx5000 | 76.76ms | 49.51ms | 99.31ms | 100.07ms | 99.75ms | 549.50ms |
| 10x5 - 2 sources - read 20.0% (simple) | 513.96ms | 238.30ms | 247.98ms | 345.01ms | 434.64ms | 1.93s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 276.49ms | 172.64ms | 196.40ms | 242.03ms | 271.52ms | 1.48s |
| 1000x12 - 4 sources - dynamic (large) | 3.73s | 277.24ms | 350.48ms | 465.56ms | 3.67s | 1.86s |
| 1000x5 - 25 sources (wide dense) | 3.35s | 412.02ms | 520.52ms | 602.73ms | 2.55s | 3.47s |
| 5x500 - 3 sources (deep) | 227.49ms | 191.69ms | 205.85ms | 255.34ms | 230.99ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 470.18ms | 265.28ms | 257.02ms | 386.24ms | 449.71ms | 1.64s |

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
