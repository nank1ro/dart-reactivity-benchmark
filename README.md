# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.30s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.03s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.26s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.69s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.37s |

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
| Test Case | solidart(2.0-dev) | preact_signals | alien_signals | state_beacon | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 282.64ms | 204.60ms | 187.78ms | 149.32ms (fail) | 2.34s | 216.29ms |
| broadPropagation | 510.20ms | 460.10ms | 354.24ms | 5.81ms (fail) | 4.26s | 458.35ms |
| deepPropagation | 179.89ms | 180.44ms | 123.86ms | 138.45ms (fail) | 1.52s | 175.47ms |
| diamond | 353.45ms | 282.23ms | 239.87ms | 179.74ms (fail) | 2.41s | 287.83ms |
| mux | 436.20ms | 385.44ms | 372.58ms | 191.56ms (fail) | 1.84s | 400.68ms |
| repeatedObservers | 78.14ms | 38.65ms | 45.33ms | 52.06ms (fail) | 231.46ms | 46.57ms |
| triangle | 120.18ms | 104.47ms | 88.72ms | 75.39ms (fail) | 766.76ms | 99.12ms |
| unstable | 93.97ms | 71.47ms | 61.63ms | 336.65ms (fail) | 348.71ms | 73.25ms |
| molBench | 493.30ms | 493.01ms | 491.10ms | 1.05ms | 577.73ms | 488.76ms |
| create_signals | 74.23ms | 5.28ms | 28.59ms | 59.90ms | 89.70ms | 27.94ms |
| comp_0to1 | 28.44ms | 17.66ms | 8.02ms | 53.29ms | 33.43ms | 13.81ms |
| comp_1to1 | 38.24ms | 11.21ms | 4.14ms | 55.83ms | 17.20ms | 30.11ms |
| comp_2to1 | 49.22ms | 13.62ms | 2.27ms | 36.32ms | 19.31ms | 9.64ms |
| comp_4to1 | 19.01ms | 15.29ms | 7.94ms | 16.67ms | 15.67ms | 3.81ms |
| comp_1000to1 | 15μs | 5μs | 4μs | 42μs | 15μs | 4μs |
| comp_1to2 | 33.94ms | 16.36ms | 9.27ms | 45.52ms | 40.38ms | 20.57ms |
| comp_1to4 | 20.41ms | 24.33ms | 12.38ms | 44.20ms | 25.18ms | 12.04ms |
| comp_1to8 | 22.46ms | 8.45ms | 5.49ms | 43.34ms | 20.77ms | 8.11ms |
| comp_1to1000 | 14.84ms | 6.44ms | 3.55ms | 38.84ms | 15.33ms | 4.61ms |
| update_1to1 | 16.26ms | 8.22ms | 11.33ms | 5.73ms | 24.27ms | 9.24ms |
| update_2to1 | 8.00ms | 4.07ms | 5.02ms | 2.88ms | 12.83ms | 5.33ms |
| update_4to1 | 4.05ms | 2.12ms | 2.70ms | 1.47ms | 6.12ms | 2.32ms |
| update_1000to1 | 40μs | 20μs | 10μs | 15μs | 65μs | 23μs |
| update_1to2 | 8.10ms | 4.08ms | 5.63ms | 2.94ms | 12.11ms | 4.96ms |
| update_1to4 | 4.05ms | 2.06ms | 2.40ms | 1.48ms | 6.29ms | 2.35ms |
| update_1to1000 | 150μs | 1.12ms | 50μs | 380μs | 161μs | 43μs |
| cellx1000 | 12.16ms | 10.38ms | 7.42ms | 5.25ms | 91.20ms | 9.67ms |
| cellx2500 | 34.32ms | 30.11ms | 21.47ms | 27.52ms | 291.93ms | 34.02ms |
| cellx5000 | 78.38ms | 84.02ms | 56.18ms | 59.12ms | 639.27ms | 69.63ms |
| 10x5 - 2 sources - read 20.0% (simple) | 355.73ms | 447.46ms | 225.62ms | 241.17ms | 2.01s | 521.65ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 242.60ms | 274.94ms | 175.71ms | 199.76ms | 1.55s | 288.59ms |
| 1000x12 - 4 sources - dynamic (large) | 461.03ms | 3.57s | 287.18ms | 338.96ms | 1.95s | 3.78s |
| 1000x5 - 25 sources (wide dense) | 593.44ms | 2.58s | 414.91ms | 495.23ms | 3.59s | 3.44s |
| 5x500 - 3 sources (deep) | 257.33ms | 228.19ms | 192.70ms | 204.63ms | 1.18s | 229.11ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 380.32ms | 448.28ms | 264.34ms | 256.84ms | 1.74s | 484.09ms |

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
