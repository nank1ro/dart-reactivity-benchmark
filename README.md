# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.29s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.28s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.18s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 28.45s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| avoidablePropagation | 281.04ms | 175.58ms (fail) | 199.14ms | 213.06ms | 2.41s | 185.90ms |
| broadPropagation | 509.80ms | 6.08ms (fail) | 447.82ms | 524.73ms | 4.52s | 349.82ms |
| deepPropagation | 169.91ms | 137.98ms (fail) | 174.04ms | 176.04ms | 1.58s | 122.54ms |
| diamond | 367.48ms | 183.05ms (fail) | 276.48ms | 290.27ms | 2.54s | 230.53ms |
| mux | 440.35ms | 192.52ms (fail) | 400.97ms | 407.52ms | 1.84s | 372.92ms |
| repeatedObservers | 81.97ms | 53.32ms (fail) | 39.87ms | 46.74ms | 242.57ms | 45.26ms |
| triangle | 117.30ms | 76.14ms (fail) | 100.84ms | 103.26ms | 780.47ms | 84.14ms |
| unstable | 98.82ms | 342.24ms (fail) | 69.75ms | 81.70ms | 359.44ms | 66.85ms |
| molBench | 495.15ms | 927μs | 488.43ms | 485.80ms | 575.26ms | 485.72ms |
| create_signals | 76.88ms | 63.96ms | 4.71ms | 25.19ms | 73.00ms | 26.19ms |
| comp_0to1 | 27.91ms | 55.80ms | 22.27ms | 11.21ms | 38.49ms | 8.25ms |
| comp_1to1 | 40.52ms | 56.77ms | 14.49ms | 17.90ms | 39.51ms | 4.44ms |
| comp_2to1 | 38.29ms | 39.92ms | 19.41ms | 23.09ms | 49.05ms | 2.37ms |
| comp_4to1 | 5.04ms | 17.68ms | 14.42ms | 1.92ms | 17.26ms | 10.12ms |
| comp_1000to1 | 22μs | 44μs | 4μs | 5μs | 16μs | 3μs |
| comp_1to2 | 33.52ms | 47.17ms | 18.54ms | 13.52ms | 35.84ms | 11.87ms |
| comp_1to4 | 22.49ms | 49.04ms | 31.11ms | 14.49ms | 18.25ms | 12.84ms |
| comp_1to8 | 24.15ms | 43.47ms | 6.80ms | 7.69ms | 20.89ms | 4.80ms |
| comp_1to1000 | 17.08ms | 38.22ms | 6.15ms | 4.26ms | 16.47ms | 3.20ms |
| update_1to1 | 15.96ms | 5.65ms | 8.94ms | 8.88ms | 22.89ms | 10.20ms |
| update_2to1 | 7.82ms | 3.14ms | 4.32ms | 4.46ms | 11.70ms | 2.26ms |
| update_4to1 | 3.98ms | 1.41ms | 2.22ms | 2.26ms | 6.58ms | 2.56ms |
| update_1000to1 | 39μs | 14μs | 21μs | 22μs | 70μs | 24μs |
| update_1to2 | 7.97ms | 2.82ms | 4.65ms | 4.47ms | 10.93ms | 5.08ms |
| update_1to4 | 3.98ms | 1.65ms | 2.16ms | 2.20ms | 6.18ms | 2.44ms |
| update_1to1000 | 171μs | 375μs | 818μs | 42μs | 174μs | 37μs |
| cellx1000 | 11.75ms | 6.85ms | 9.76ms | 9.78ms | 78.61ms | 7.33ms |
| cellx2500 | 32.67ms | 23.26ms | 26.19ms | 31.64ms | 282.89ms | 19.63ms |
| cellx5000 | 68.83ms | 83.59ms | 74.93ms | 64.28ms | 570.11ms | 41.72ms |
| 10x5 - 2 sources - read 20.0% (simple) | 356.18ms | 243.51ms | 435.23ms | 519.12ms | 2.07s | 233.20ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 250.80ms | 197.88ms | 273.67ms | 282.76ms | 1.57s | 194.97ms |
| 1000x12 - 4 sources - dynamic (large) | 459.06ms | 339.53ms | 3.64s | 3.76s | 2.00s | 279.20ms |
| 1000x5 - 25 sources (wide dense) | 579.17ms | 501.93ms | 2.69s | 3.43s | 3.70s | 412.79ms |
| 5x500 - 3 sources (deep) | 254.38ms | 209.08ms | 230.07ms | 225.35ms | 1.19s | 190.18ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 384.56ms | 259.29ms | 447.13ms | 483.88ms | 1.76s | 261.47ms |

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
