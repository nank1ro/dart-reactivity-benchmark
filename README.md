# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.71s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 10.74s |
| 🥉 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.36s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.45s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.80s |
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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 205.45ms | 2.30s | 144.92ms (fail) | 195.17ms | 204.66ms | 274.55ms |
| broadPropagation | 452.55ms | 4.30s | 5.80ms (fail) | 359.25ms | 448.43ms | 507.04ms |
| deepPropagation | 173.82ms | 1.51s | 135.68ms (fail) | 125.92ms | 174.29ms | 163.98ms |
| diamond | 291.30ms | 2.35s | 176.23ms (fail) | 244.18ms | 287.43ms | 363.23ms |
| mux | 400.07ms | 1.78s | 182.38ms (fail) | 359.99ms | 375.56ms | 430.23ms |
| repeatedObservers | 46.04ms | 235.02ms | 58.34ms (fail) | 47.19ms | 41.84ms | 81.92ms |
| triangle | 101.75ms | 751.24ms | 75.97ms (fail) | 86.92ms | 120.67ms | 116.39ms |
| unstable | 76.76ms | 339.12ms | 339.65ms (fail) | 61.58ms | 71.51ms | 99.49ms |
| molBench | 492.43ms | 584.57ms | 1.03ms | 480.66ms | 495.39ms | 493.00ms |
| create_signals | 42.19ms | 90.87ms | 63.91ms | 27.48ms | 4.76ms | 57.35ms |
| comp_0to1 | 15.15ms | 21.87ms | 54.13ms | 7.02ms | 19.08ms | 26.82ms |
| comp_1to1 | 25.97ms | 31.83ms | 55.53ms | 4.19ms | 13.86ms | 36.28ms |
| comp_2to1 | 9.89ms | 36.39ms | 39.96ms | 2.26ms | 17.28ms | 48.09ms |
| comp_4to1 | 2.25ms | 24.51ms | 17.10ms | 10.31ms | 15.60ms | 13.59ms |
| comp_1000to1 | 5μs | 16μs | 43μs | 3μs | 5μs | 14μs |
| comp_1to2 | 13.77ms | 42.92ms | 47.05ms | 19.78ms | 19.52ms | 35.92ms |
| comp_1to4 | 12.05ms | 22.72ms | 45.35ms | 7.32ms | 31.91ms | 21.15ms |
| comp_1to8 | 6.68ms | 22.60ms | 44.16ms | 4.44ms | 7.20ms | 23.68ms |
| comp_1to1000 | 4.14ms | 15.01ms | 39.99ms | 3.64ms | 6.75ms | 14.37ms |
| update_1to1 | 9.00ms | 21.09ms | 8.83ms | 4.70ms | 8.95ms | 15.69ms |
| update_2to1 | 4.49ms | 10.35ms | 5.02ms | 2.35ms | 4.60ms | 7.86ms |
| update_4to1 | 2.26ms | 5.86ms | 2.43ms | 1.23ms | 2.29ms | 3.91ms |
| update_1000to1 | 22μs | 60μs | 25μs | 11μs | 22μs | 39μs |
| update_1to2 | 4.41ms | 10.49ms | 5.25ms | 2.36ms | 4.53ms | 8.07ms |
| update_1to4 | 2.27ms | 5.24ms | 1.49ms | 1.22ms | 2.40ms | 3.92ms |
| update_1to1000 | 41μs | 153μs | 378μs | 48μs | 866μs | 147μs |
| cellx1000 | 9.84ms | 68.69ms | 5.15ms | 7.40ms | 9.72ms | 12.39ms |
| cellx2500 | 32.47ms | 251.62ms | 25.43ms | 19.55ms | 26.70ms | 39.46ms |
| cellx5000 | 63.35ms | 571.24ms | 69.03ms | 41.88ms | 79.64ms | 97.51ms |
| 10x5 - 2 sources - read 20.0% (simple) | 490.17ms | 1.95s | 249.99ms | 242.86ms | 455.60ms | 350.89ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.21ms | 1.51s | 197.33ms | 184.68ms | 277.21ms | 261.17ms |
| 1000x12 - 4 sources - dynamic (large) | 3.51s | 1.82s | 329.17ms | 285.17ms | 3.75s | 486.52ms |
| 1000x5 - 25 sources (wide dense) | 3.25s | 3.39s | 507.84ms | 414.64ms | 2.80s | 602.49ms |
| 5x500 - 3 sources (deep) | 223.96ms | 1.11s | 205.18ms | 195.05ms | 231.14ms | 259.34ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 480.93ms | 1.62s | 255.34ms | 263.36ms | 451.16ms | 400.14ms |

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
