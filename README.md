# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.68s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.26s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.17s |
| 4 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.44s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.04s |
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
| Test Case | state_beacon | alien_signals | mobx | solidart(2.0-dev) | signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 164.44ms (fail) | 183.99ms | 2.32s | 283.71ms | 204.56ms | 201.80ms |
| broadPropagation | 5.88ms (fail) | 344.38ms | 4.50s | 506.55ms | 453.20ms | 464.50ms |
| deepPropagation | 139.93ms (fail) | 124.42ms | 1.55s | 181.32ms | 175.29ms | 177.13ms |
| diamond | 181.95ms (fail) | 228.99ms | 2.45s | 362.06ms | 277.19ms | 279.40ms |
| mux | 197.18ms (fail) | 375.39ms | 1.83s | 446.12ms | 405.32ms | 401.22ms |
| repeatedObservers | 53.07ms (fail) | 45.31ms | 231.04ms | 82.67ms | 44.36ms | 39.46ms |
| triangle | 77.06ms (fail) | 85.22ms | 768.13ms | 123.88ms | 105.43ms | 98.48ms |
| unstable | 335.41ms (fail) | 66.78ms | 352.90ms | 98.57ms | 78.97ms | 70.74ms |
| molBench | 923μs | 486.81ms | 571.50ms | 495.38ms | 486.30ms | 488.08ms |
| create_signals | 68.31ms | 26.62ms | 89.18ms | 100.45ms | 25.56ms | 5.38ms |
| comp_0to1 | 62.88ms | 8.11ms | 40.06ms | 37.70ms | 11.15ms | 17.27ms |
| comp_1to1 | 58.63ms | 4.23ms | 32.20ms | 46.92ms | 27.50ms | 11.11ms |
| comp_2to1 | 36.25ms | 2.42ms | 24.76ms | 38.52ms | 9.22ms | 18.05ms |
| comp_4to1 | 16.00ms | 8.64ms | 18.98ms | 11.94ms | 1.96ms | 8.11ms |
| comp_1000to1 | 68μs | 5μs | 18μs | 18μs | 6μs | 6μs |
| comp_1to2 | 44.59ms | 19.20ms | 41.28ms | 44.31ms | 19.12ms | 13.86ms |
| comp_1to4 | 43.70ms | 11.22ms | 24.00ms | 23.26ms | 12.68ms | 21.19ms |
| comp_1to8 | 42.72ms | 5.24ms | 25.24ms | 26.24ms | 6.44ms | 12.88ms |
| comp_1to1000 | 38.20ms | 3.58ms | 16.13ms | 16.84ms | 4.23ms | 5.53ms |
| update_1to1 | 5.63ms | 10.28ms | 23.25ms | 17.12ms | 8.97ms | 8.62ms |
| update_2to1 | 3.12ms | 2.36ms | 11.22ms | 8.45ms | 4.49ms | 4.24ms |
| update_4to1 | 1.45ms | 2.50ms | 6.58ms | 4.25ms | 2.25ms | 2.23ms |
| update_1000to1 | 14μs | 25μs | 70μs | 42μs | 22μs | 21μs |
| update_1to2 | 2.83ms | 5.20ms | 11.55ms | 8.59ms | 4.49ms | 4.63ms |
| update_1to4 | 1.45ms | 2.49ms | 5.48ms | 4.22ms | 2.23ms | 2.21ms |
| update_1to1000 | 383μs | 47μs | 184μs | 172μs | 41μs | 54μs |
| cellx1000 | 5.58ms | 7.13ms | 71.92ms | 11.75ms | 9.61ms | 9.77ms |
| cellx2500 | 26.14ms | 19.19ms | 262.11ms | 32.35ms | 31.21ms | 27.24ms |
| cellx5000 | 60.27ms | 42.51ms | 593.14ms | 82.53ms | 64.33ms | 82.49ms |
| 10x5 - 2 sources - read 20.0% (simple) | 235.74ms | 225.29ms | 2.04s | 369.45ms | 527.30ms | 438.76ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 198.03ms | 175.55ms | 1.52s | 258.41ms | 280.67ms | 269.63ms |
| 1000x12 - 4 sources - dynamic (large) | 332.26ms | 283.66ms | 1.95s | 474.21ms | 3.76s | 3.72s |
| 1000x5 - 25 sources (wide dense) | 496.42ms | 410.86ms | 3.78s | 597.08ms | 3.43s | 2.68s |
| 5x500 - 3 sources (deep) | 203.15ms | 193.05ms | 1.15s | 256.55ms | 227.31ms | 228.42ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 257.52ms | 265.59ms | 1.74s | 386.06ms | 477.66ms | 454.85ms |

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
