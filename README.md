# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.68s |
| 🥈 | preact_signals | 0.25 | 100.0% | 35/35 | 10.10s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.17s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.61s |
| 5 | solidart(2.0-dev) | 0.04 | 100.0% | 35/35 | 40.43s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.42s |

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
| Test Case | alien_signals | mobx | solidart(2.0-dev) | state_beacon | preact_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 185.61ms | 2.35s | 864.90ms | 152.89ms (fail) | 204.99ms | 209.96ms |
| broadPropagation | 352.35ms | 4.23s | 7.27s | 5.82ms (fail) | 459.98ms | 479.58ms |
| deepPropagation | 122.47ms | 1.54s | 895.35ms | 138.10ms (fail) | 178.42ms | 182.97ms |
| diamond | 234.69ms | 2.44s | 2.25s | 183.16ms (fail) | 281.66ms | 286.22ms |
| mux | 370.02ms | 1.85s | 1.14s | 190.15ms (fail) | 385.02ms | 411.67ms |
| repeatedObservers | 45.07ms | 231.83ms | 261.57ms | 52.54ms (fail) | 39.88ms | 45.74ms |
| triangle | 87.17ms | 776.95ms | 600.23ms | 75.76ms (fail) | 99.05ms | 102.07ms |
| unstable | 59.63ms | 359.06ms | 703.97ms | 337.43ms (fail) | 71.29ms | 72.27ms |
| molBench | 493.05ms | 580.65ms | 569.73ms | 1.13ms | 491.20ms | 488.33ms |
| create_signals | 27.10ms | 77.32ms | 53.70ms | 65.80ms | 4.64ms | 24.62ms |
| comp_0to1 | 7.96ms | 31.15ms | 30.90ms | 57.35ms | 18.83ms | 11.94ms |
| comp_1to1 | 4.20ms | 17.45ms | 48.35ms | 59.14ms | 14.54ms | 28.04ms |
| comp_2to1 | 2.37ms | 12.70ms | 15.24ms | 39.43ms | 21.02ms | 9.61ms |
| comp_4to1 | 8.27ms | 15.11ms | 11.74ms | 17.34ms | 15.54ms | 1.96ms |
| comp_1000to1 | 3μs | 15μs | 17μs | 47μs | 4μs | 5μs |
| comp_1to2 | 11.06ms | 36.53ms | 41.57ms | 50.76ms | 21.14ms | 18.36ms |
| comp_1to4 | 9.87ms | 24.60ms | 27.00ms | 49.24ms | 33.04ms | 21.20ms |
| comp_1to8 | 5.05ms | 20.94ms | 24.82ms | 48.47ms | 7.33ms | 6.59ms |
| comp_1to1000 | 3.52ms | 15.21ms | 16.24ms | 44.08ms | 5.67ms | 4.51ms |
| update_1to1 | 11.31ms | 22.32ms | 14.53ms | 5.73ms | 8.15ms | 9.19ms |
| update_2to1 | 3.65ms | 11.47ms | 7.52ms | 2.87ms | 4.09ms | 4.58ms |
| update_4to1 | 1.72ms | 6.49ms | 3.64ms | 1.45ms | 2.08ms | 2.33ms |
| update_1000to1 | 10μs | 63μs | 36μs | 15μs | 20μs | 23μs |
| update_1to2 | 5.59ms | 11.16ms | 7.24ms | 2.94ms | 4.08ms | 4.89ms |
| update_1to4 | 2.43ms | 5.72ms | 3.62ms | 1.46ms | 2.08ms | 2.31ms |
| update_1to1000 | 47μs | 180μs | 163μs | 437μs | 163μs | 45μs |
| cellx1000 | 7.17ms | 90.23ms | 73.78ms | 5.17ms | 10.53ms | 10.71ms |
| cellx2500 | 19.69ms | 273.54ms | 166.72ms | 22.48ms | 39.09ms | 36.76ms |
| cellx5000 | 46.52ms | 577.90ms | 421.99ms | 55.58ms | 108.47ms | 83.78ms |
| 10x5 - 2 sources - read 20.0% (simple) | 230.44ms | 2.04s | 2.52s | 245.99ms | 439.72ms | 509.64ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 176.75ms | 1.56s | 2.15s | 199.17ms | 282.66ms | 278.06ms |
| 1000x12 - 4 sources - dynamic (large) | 280.32ms | 1.85s | 5.14s | 343.05ms | 3.54s | 3.53s |
| 1000x5 - 25 sources (wide dense) | 408.41ms | 3.64s | 10.80s | 497.07ms | 2.62s | 3.58s |
| 5x500 - 3 sources (deep) | 189.12ms | 1.19s | 1.22s | 204.05ms | 233.23ms | 226.85ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 262.67ms | 1.72s | 3.08s | 260.76ms | 454.43ms | 493.63ms |

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
