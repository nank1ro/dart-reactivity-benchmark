# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.68s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 10.02s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.19s |
| 4 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.32s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.39s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.43s |

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
| avoidablePropagation | 273.53ms | 211.16ms | 2.32s | 185.67ms | 208.62ms | 153.21ms (fail) |
| broadPropagation | 505.96ms | 453.86ms | 4.23s | 351.77ms | 459.76ms | 6.55ms (fail) |
| deepPropagation | 168.64ms | 180.08ms | 1.53s | 126.09ms | 182.62ms | 141.45ms (fail) |
| diamond | 357.85ms | 281.53ms | 2.40s | 241.15ms | 295.66ms | 179.51ms (fail) |
| mux | 437.13ms | 383.62ms | 1.83s | 371.25ms | 404.67ms | 190.78ms (fail) |
| repeatedObservers | 78.27ms | 38.76ms | 229.51ms | 45.80ms | 46.12ms | 53.24ms (fail) |
| triangle | 115.47ms | 100.10ms | 770.73ms | 84.19ms | 105.08ms | 80.40ms (fail) |
| unstable | 94.15ms | 70.81ms | 349.37ms | 61.64ms | 74.28ms | 337.03ms (fail) |
| molBench | 492.06ms | 493.03ms | 578.55ms | 490.48ms | 488.00ms | 1.15ms |
| create_signals | 71.16ms | 4.60ms | 80.10ms | 26.62ms | 25.89ms | 85.21ms |
| comp_0to1 | 26.40ms | 17.21ms | 27.30ms | 7.89ms | 12.28ms | 60.38ms |
| comp_1to1 | 46.61ms | 14.16ms | 47.25ms | 4.18ms | 23.95ms | 58.75ms |
| comp_2to1 | 49.11ms | 16.18ms | 38.09ms | 2.28ms | 9.47ms | 36.10ms |
| comp_4to1 | 7.93ms | 11.50ms | 16.28ms | 8.52ms | 2.18ms | 16.28ms |
| comp_1000to1 | 14μs | 4μs | 15μs | 3μs | 5μs | 42μs |
| comp_1to2 | 32.14ms | 18.07ms | 37.36ms | 16.08ms | 19.39ms | 45.72ms |
| comp_1to4 | 21.54ms | 33.53ms | 22.17ms | 5.54ms | 9.98ms | 44.32ms |
| comp_1to8 | 23.62ms | 7.06ms | 23.86ms | 4.42ms | 7.16ms | 44.23ms |
| comp_1to1000 | 15.45ms | 5.53ms | 15.30ms | 3.43ms | 4.57ms | 39.55ms |
| update_1to1 | 16.14ms | 8.16ms | 21.91ms | 11.42ms | 9.19ms | 5.80ms |
| update_2to1 | 8.60ms | 4.05ms | 10.95ms | 5.07ms | 4.59ms | 2.88ms |
| update_4to1 | 4.04ms | 2.04ms | 5.96ms | 2.81ms | 2.29ms | 1.46ms |
| update_1000to1 | 40μs | 20μs | 77μs | 10μs | 23μs | 14μs |
| update_1to2 | 8.17ms | 4.08ms | 10.48ms | 5.63ms | 4.96ms | 2.94ms |
| update_1to4 | 4.04ms | 2.02ms | 5.25ms | 2.49ms | 2.31ms | 1.46ms |
| update_1to1000 | 271μs | 146μs | 167μs | 35μs | 43μs | 374μs |
| cellx1000 | 11.45ms | 9.60ms | 73.33ms | 7.26ms | 9.59ms | 5.25ms |
| cellx2500 | 34.38ms | 27.58ms | 263.60ms | 19.79ms | 32.47ms | 25.44ms |
| cellx5000 | 108.48ms | 64.67ms | 615.74ms | 42.08ms | 67.34ms | 65.16ms |
| 10x5 - 2 sources - read 20.0% (simple) | 361.09ms | 436.19ms | 2.00s | 228.95ms | 507.07ms | 239.86ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 255.72ms | 271.53ms | 1.53s | 175.74ms | 285.16ms | 199.60ms |
| 1000x12 - 4 sources - dynamic (large) | 464.19ms | 3.55s | 1.88s | 280.62ms | 3.75s | 337.24ms |
| 1000x5 - 25 sources (wide dense) | 593.99ms | 2.62s | 3.53s | 407.39ms | 3.43s | 501.41ms |
| 5x500 - 3 sources (deep) | 252.09ms | 228.04ms | 1.15s | 189.64ms | 229.74ms | 205.71ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 381.68ms | 446.72ms | 1.75s | 262.31ms | 478.66ms | 258.03ms |

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
