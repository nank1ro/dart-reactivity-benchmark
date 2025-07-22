# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.38s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.32s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.44s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.04s |
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
| Test Case | state_beacon | mobx | solidart(2.0-dev) | preact_signals | signals | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 154.32ms (fail) | 2.40s | 275.37ms | 199.76ms | 212.84ms | 184.96ms |
| broadPropagation | 6.54ms (fail) | 4.49s | 506.59ms | 501.36ms | 527.67ms | 344.33ms |
| deepPropagation | 140.24ms (fail) | 1.58s | 171.72ms | 179.14ms | 172.24ms | 120.62ms |
| diamond | 199.09ms (fail) | 2.50s | 349.41ms | 294.71ms | 292.42ms | 231.40ms |
| mux | 196.77ms (fail) | 1.84s | 440.90ms | 401.07ms | 410.11ms | 369.04ms |
| repeatedObservers | 52.64ms (fail) | 246.51ms | 81.52ms | 41.24ms | 46.59ms | 46.01ms |
| triangle | 81.31ms (fail) | 777.74ms | 120.12ms | 102.96ms | 102.78ms | 84.70ms |
| unstable | 338.21ms (fail) | 359.21ms | 98.17ms | 73.58ms | 82.73ms | 67.52ms |
| molBench | 1.07ms | 575.68ms | 493.92ms | 489.91ms | 485.81ms | 483.88ms |
| create_signals | 65.43ms | 74.28ms | 97.29ms | 5.15ms | 26.36ms | 28.20ms |
| comp_0to1 | 55.54ms | 35.27ms | 38.63ms | 17.82ms | 11.94ms | 6.98ms |
| comp_1to1 | 56.78ms | 44.53ms | 43.97ms | 11.36ms | 24.66ms | 4.20ms |
| comp_2to1 | 41.88ms | 36.15ms | 44.22ms | 25.10ms | 12.64ms | 2.30ms |
| comp_4to1 | 17.14ms | 15.87ms | 18.06ms | 15.32ms | 6.75ms | 10.42ms |
| comp_1000to1 | 42μs | 17μs | 18μs | 8μs | 8μs | 3μs |
| comp_1to2 | 45.45ms | 33.91ms | 34.84ms | 21.92ms | 23.51ms | 11.18ms |
| comp_1to4 | 43.82ms | 22.31ms | 22.89ms | 31.52ms | 11.33ms | 11.35ms |
| comp_1to8 | 42.91ms | 24.30ms | 25.62ms | 6.84ms | 6.73ms | 5.18ms |
| comp_1to1000 | 38.20ms | 16.35ms | 17.30ms | 6.06ms | 5.29ms | 3.47ms |
| update_1to1 | 5.66ms | 25.90ms | 16.44ms | 8.71ms | 8.92ms | 10.40ms |
| update_2to1 | 3.14ms | 12.67ms | 8.07ms | 4.31ms | 4.47ms | 2.25ms |
| update_4to1 | 1.45ms | 7.05ms | 4.13ms | 2.17ms | 2.21ms | 2.55ms |
| update_1000to1 | 14μs | 71μs | 40μs | 21μs | 22μs | 25μs |
| update_1to2 | 2.87ms | 12.78ms | 8.17ms | 4.68ms | 4.47ms | 5.32ms |
| update_1to4 | 1.46ms | 6.46ms | 4.12ms | 2.13ms | 2.22ms | 2.52ms |
| update_1to1000 | 376μs | 172μs | 175μs | 786μs | 47μs | 28μs |
| cellx1000 | 5.43ms | 80.50ms | 12.56ms | 10.26ms | 10.47ms | 9.90ms |
| cellx2500 | 24.05ms | 271.38ms | 47.07ms | 29.40ms | 32.73ms | 21.22ms |
| cellx5000 | 80.72ms | 606.17ms | 93.68ms | 84.53ms | 76.94ms | 54.30ms |
| 10x5 - 2 sources - read 20.0% (simple) | 238.51ms | 2.03s | 371.46ms | 437.58ms | 516.13ms | 229.47ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 199.23ms | 1.51s | 248.78ms | 269.71ms | 285.29ms | 173.71ms |
| 1000x12 - 4 sources - dynamic (large) | 346.51ms | 1.87s | 466.50ms | 3.75s | 3.76s | 282.30ms |
| 1000x5 - 25 sources (wide dense) | 494.84ms | 3.64s | 582.63ms | 2.73s | 3.44s | 415.70ms |
| 5x500 - 3 sources (deep) | 208.57ms | 1.17s | 256.28ms | 231.15ms | 228.16ms | 191.61ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 260.33ms | 1.72s | 382.43ms | 454.00ms | 479.64ms | 268.61ms |

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
