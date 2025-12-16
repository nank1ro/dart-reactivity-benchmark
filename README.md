# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.68s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.28s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 9.98s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.53s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.09s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.48s |

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
| avoidablePropagation | 211.51ms | 191.04ms | 147.17ms (fail) | 290.77ms | 207.92ms | 2.33s |
| broadPropagation | 453.95ms | 355.49ms | 6.41ms (fail) | 506.02ms | 457.45ms | 4.48s |
| deepPropagation | 172.34ms | 128.06ms | 139.23ms (fail) | 173.50ms | 178.29ms | 1.50s |
| diamond | 286.30ms | 234.87ms | 182.67ms (fail) | 358.49ms | 282.23ms | 2.36s |
| mux | 391.10ms | 358.92ms | 186.22ms (fail) | 419.86ms | 371.81ms | 1.85s |
| repeatedObservers | 46.20ms | 43.32ms | 52.19ms (fail) | 81.67ms | 40.40ms | 229.16ms |
| triangle | 103.07ms | 86.85ms | 76.36ms (fail) | 113.28ms | 101.35ms | 741.38ms |
| unstable | 77.31ms | 62.92ms | 334.97ms (fail) | 95.67ms | 69.99ms | 337.92ms |
| molBench | 496.24ms | 485.60ms | 1.01ms | 491.29ms | 486.75ms | 590.00ms |
| create_signals | 25.98ms | 28.82ms | 67.65ms | 101.14ms | 4.68ms | 81.37ms |
| comp_0to1 | 11.60ms | 7.84ms | 59.09ms | 34.01ms | 17.55ms | 15.82ms |
| comp_1to1 | 17.71ms | 5.12ms | 66.29ms | 51.89ms | 13.06ms | 53.74ms |
| comp_2to1 | 16.86ms | 2.22ms | 43.61ms | 36.11ms | 17.63ms | 22.72ms |
| comp_4to1 | 3.85ms | 8.15ms | 19.19ms | 4.46ms | 19.44ms | 31.48ms |
| comp_1000to1 | 8μs | 6μs | 45μs | 15μs | 4μs | 15μs |
| comp_1to2 | 13.41ms | 14.19ms | 50.54ms | 32.62ms | 23.91ms | 36.39ms |
| comp_1to4 | 11.77ms | 9.26ms | 50.42ms | 14.71ms | 21.74ms | 21.82ms |
| comp_1to8 | 6.62ms | 5.07ms | 48.07ms | 19.93ms | 8.59ms | 23.93ms |
| comp_1to1000 | 4.23ms | 3.61ms | 42.56ms | 14.63ms | 5.92ms | 15.47ms |
| update_1to1 | 9.42ms | 4.72ms | 6.10ms | 15.61ms | 8.90ms | 25.51ms |
| update_2to1 | 5.21ms | 2.33ms | 3.10ms | 7.80ms | 4.48ms | 12.96ms |
| update_4to1 | 2.38ms | 1.20ms | 1.58ms | 3.88ms | 2.20ms | 6.73ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 69μs |
| update_1to2 | 4.65ms | 2.36ms | 3.08ms | 7.93ms | 5.29ms | 13.62ms |
| update_1to4 | 2.58ms | 1.27ms | 1.60ms | 3.89ms | 2.19ms | 6.78ms |
| update_1to1000 | 45μs | 49μs | 421μs | 149μs | 323μs | 160μs |
| cellx1000 | 10.12ms | 8.55ms | 5.11ms | 11.62ms | 9.46ms | 70.82ms |
| cellx2500 | 32.80ms | 19.64ms | 25.58ms | 31.87ms | 26.04ms | 259.74ms |
| cellx5000 | 91.36ms | 42.55ms | 86.17ms | 68.59ms | 69.28ms | 610.36ms |
| 10x5 - 2 sources - read 20.0% (simple) | 501.29ms | 239.81ms | 242.19ms | 344.57ms | 429.47ms | 1.95s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.25ms | 175.95ms | 201.37ms | 245.12ms | 270.78ms | 1.44s |
| 1000x12 - 4 sources - dynamic (large) | 3.93s | 277.31ms | 347.90ms | 469.48ms | 3.63s | 1.85s |
| 1000x5 - 25 sources (wide dense) | 3.58s | 408.34ms | 519.58ms | 593.24ms | 2.52s | 3.37s |
| 5x500 - 3 sources (deep) | 240.63ms | 191.82ms | 203.95ms | 258.77ms | 230.41ms | 1.11s |
| 100x15 - 6 sources - dynamic (very dynamic) | 486.78ms | 272.25ms | 261.15ms | 381.94ms | 439.35ms | 1.66s |

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
