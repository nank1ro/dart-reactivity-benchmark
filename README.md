# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.74s |
| 🥈 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.26s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.65s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.55s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.40s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.55s |

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
| avoidablePropagation | 212.98ms | 198.58ms | 156.26ms (fail) | 271.60ms | 200.58ms | 2.37s |
| broadPropagation | 465.48ms | 359.72ms | 6.54ms (fail) | 493.78ms | 455.59ms | 4.33s |
| deepPropagation | 176.07ms | 130.77ms | 142.10ms (fail) | 164.53ms | 181.50ms | 1.55s |
| diamond | 284.01ms | 237.93ms | 210.53ms (fail) | 354.30ms | 282.44ms | 2.43s |
| mux | 410.59ms | 382.45ms | 193.22ms (fail) | 428.27ms | 390.69ms | 1.84s |
| repeatedObservers | 46.17ms | 43.73ms | 52.67ms (fail) | 82.12ms | 40.60ms | 233.01ms |
| triangle | 102.14ms | 85.43ms | 79.64ms (fail) | 112.83ms | 100.46ms | 770.76ms |
| unstable | 75.72ms | 60.20ms | 339.48ms (fail) | 95.53ms | 74.65ms | 351.26ms |
| molBench | 487.51ms | 491.66ms | 944μs | 497.59ms | 488.39ms | 582.70ms |
| create_signals | 26.94ms | 21.81ms | 65.76ms | 60.51ms | 5.36ms | 68.45ms |
| comp_0to1 | 12.67ms | 8.03ms | 62.66ms | 25.86ms | 18.30ms | 15.92ms |
| comp_1to1 | 29.22ms | 4.34ms | 64.23ms | 44.85ms | 11.26ms | 40.09ms |
| comp_2to1 | 9.45ms | 2.38ms | 44.09ms | 51.01ms | 11.75ms | 31.52ms |
| comp_4to1 | 2.10ms | 8.97ms | 17.97ms | 4.22ms | 9.88ms | 17.55ms |
| comp_1000to1 | 6μs | 6μs | 44μs | 15μs | 10μs | 21μs |
| comp_1to2 | 14.70ms | 14.58ms | 49.66ms | 32.48ms | 22.40ms | 34.46ms |
| comp_1to4 | 9.61ms | 9.31ms | 49.64ms | 20.08ms | 34.29ms | 22.25ms |
| comp_1to8 | 8.98ms | 5.58ms | 45.89ms | 20.09ms | 7.33ms | 23.16ms |
| comp_1to1000 | 4.48ms | 3.81ms | 41.08ms | 14.21ms | 7.71ms | 15.22ms |
| update_1to1 | 10.18ms | 10.21ms | 6.01ms | 16.41ms | 8.39ms | 27.16ms |
| update_2to1 | 5.14ms | 2.19ms | 3.10ms | 8.30ms | 4.44ms | 13.96ms |
| update_4to1 | 2.57ms | 2.52ms | 1.52ms | 4.15ms | 2.11ms | 7.12ms |
| update_1000to1 | 25μs | 19μs | 16μs | 40μs | 20μs | 69μs |
| update_1to2 | 4.51ms | 4.92ms | 3.02ms | 8.83ms | 4.08ms | 13.42ms |
| update_1to4 | 2.55ms | 2.42ms | 1.54ms | 4.13ms | 2.09ms | 7.07ms |
| update_1to1000 | 44μs | 46μs | 407μs | 163μs | 831μs | 172μs |
| cellx1000 | 12.61ms | 7.71ms | 5.00ms | 11.88ms | 9.88ms | 70.62ms |
| cellx2500 | 52.28ms | 22.70ms | 22.04ms | 34.46ms | 27.64ms | 252.16ms |
| cellx5000 | 133.85ms | 64.35ms | 68.81ms | 73.04ms | 84.67ms | 560.82ms |
| 10x5 - 2 sources - read 20.0% (simple) | 498.21ms | 226.84ms | 262.27ms | 347.34ms | 512.78ms | 2.01s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 281.24ms | 172.53ms | 206.07ms | 249.16ms | 310.04ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 3.98s | 283.84ms | 356.28ms | 465.33ms | 3.77s | 1.87s |
| 1000x5 - 25 sources (wide dense) | 3.57s | 415.86ms | 508.74ms | 610.86ms | 2.74s | 3.48s |
| 5x500 - 3 sources (deep) | 222.53ms | 192.53ms | 216.04ms | 257.39ms | 248.64ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 498.96ms | 264.63ms | 263.08ms | 391.36ms | 479.76ms | 1.71s |

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
