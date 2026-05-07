# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.48s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.21s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.61s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.45s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.51s |

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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.37s | 200.89ms | 192.88ms | 210.88ms | 276.82ms | 148.49ms (fail) |
| broadPropagation | 4.41s | 477.59ms | 359.24ms | 478.33ms | 504.48ms | 6.05ms (fail) |
| deepPropagation | 1.56s | 170.66ms | 123.94ms | 175.30ms | 165.80ms | 142.21ms (fail) |
| diamond | 2.41s | 289.22ms | 242.24ms | 287.15ms | 353.99ms | 182.06ms (fail) |
| mux | 1.83s | 405.94ms | 363.22ms | 377.31ms | 414.58ms | 180.46ms (fail) |
| repeatedObservers | 233.80ms | 45.87ms | 44.87ms | 42.64ms | 81.03ms | 56.47ms (fail) |
| triangle | 767.28ms | 101.87ms | 87.81ms | 101.96ms | 114.18ms | 75.56ms (fail) |
| unstable | 354.16ms | 75.77ms | 60.98ms | 72.57ms | 95.69ms | 337.19ms (fail) |
| molBench | 588.79ms | 494.40ms | 481.78ms | 496.67ms | 490.63ms | 1.07ms |
| create_signals | 71.49ms | 27.91ms | 30.36ms | 5.41ms | 81.46ms | 66.41ms |
| comp_0to1 | 28.18ms | 15.14ms | 7.03ms | 18.23ms | 27.73ms | 64.60ms |
| comp_1to1 | 51.32ms | 31.59ms | 4.25ms | 12.90ms | 53.11ms | 61.85ms |
| comp_2to1 | 24.70ms | 14.57ms | 2.28ms | 14.15ms | 27.04ms | 45.04ms |
| comp_4to1 | 13.80ms | 1.92ms | 8.81ms | 15.42ms | 9.69ms | 20.06ms |
| comp_1000to1 | 21μs | 8μs | 3μs | 4μs | 15μs | 46μs |
| comp_1to2 | 42.75ms | 22.96ms | 15.85ms | 19.30ms | 33.23ms | 48.09ms |
| comp_1to4 | 29.91ms | 9.52ms | 5.16ms | 34.31ms | 14.77ms | 51.63ms |
| comp_1to8 | 21.93ms | 6.61ms | 5.24ms | 6.41ms | 22.18ms | 45.35ms |
| comp_1to1000 | 14.74ms | 4.14ms | 3.55ms | 5.92ms | 14.10ms | 40.17ms |
| update_1to1 | 21.23ms | 8.87ms | 4.67ms | 9.25ms | 16.16ms | 7.82ms |
| update_2to1 | 10.53ms | 4.46ms | 2.35ms | 4.62ms | 7.87ms | 2.85ms |
| update_4to1 | 5.30ms | 2.29ms | 1.25ms | 2.42ms | 3.93ms | 1.82ms |
| update_1000to1 | 53μs | 22μs | 11μs | 23μs | 39μs | 17μs |
| update_1to2 | 11.09ms | 4.44ms | 2.36ms | 4.49ms | 8.07ms | 4.31ms |
| update_1to4 | 5.32ms | 2.28ms | 1.25ms | 2.47ms | 4.07ms | 1.42ms |
| update_1to1000 | 160μs | 43μs | 49μs | 744μs | 147μs | 419μs |
| cellx1000 | 104.36ms | 10.19ms | 8.58ms | 11.59ms | 23.69ms | 6.94ms |
| cellx2500 | 292.87ms | 39.42ms | 22.36ms | 38.20ms | 91.32ms | 32.02ms |
| cellx5000 | 661.43ms | 109.44ms | 58.08ms | 111.55ms | 213.16ms | 89.03ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.98s | 507.64ms | 236.54ms | 448.30ms | 347.62ms | 237.28ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.49s | 282.35ms | 176.63ms | 271.34ms | 248.32ms | 200.55ms |
| 1000x12 - 4 sources - dynamic (large) | 1.77s | 3.70s | 290.29ms | 3.84s | 474.41ms | 357.12ms |
| 1000x5 - 25 sources (wide dense) | 3.43s | 3.44s | 415.70ms | 2.81s | 605.30ms | 519.62ms |
| 5x500 - 3 sources (deep) | 1.17s | 229.72ms | 198.18ms | 233.65ms | 260.32ms | 212.23ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.68s | 477.74ms | 264.94ms | 454.23ms | 396.28ms | 264.91ms |

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
