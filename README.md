# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.23s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.11s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.46s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.57s |
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
| avoidablePropagation | 199.53ms | 2.31s | 146.99ms (fail) | 198.77ms | 205.93ms | 273.81ms |
| broadPropagation | 457.21ms | 4.21s | 6.59ms (fail) | 357.11ms | 451.25ms | 494.40ms |
| deepPropagation | 172.16ms | 1.52s | 142.85ms (fail) | 132.36ms | 174.17ms | 168.61ms |
| diamond | 285.71ms | 2.36s | 180.63ms (fail) | 247.99ms | 283.35ms | 350.12ms |
| mux | 399.11ms | 1.75s | 185.04ms (fail) | 364.10ms | 373.89ms | 422.11ms |
| repeatedObservers | 46.16ms | 225.47ms | 58.71ms (fail) | 45.52ms | 41.65ms | 81.99ms |
| triangle | 102.74ms | 743.36ms | 76.96ms (fail) | 88.73ms | 101.52ms | 114.39ms |
| unstable | 78.07ms | 339.49ms | 336.27ms (fail) | 61.36ms | 71.29ms | 95.26ms |
| molBench | 493.95ms | 587.86ms | 2.14ms | 487.07ms | 496.47ms | 492.88ms |
| create_signals | 26.30ms | 83.98ms | 59.98ms | 27.61ms | 4.76ms | 72.33ms |
| comp_0to1 | 11.36ms | 21.51ms | 53.99ms | 8.86ms | 18.93ms | 26.98ms |
| comp_1to1 | 34.16ms | 46.26ms | 54.81ms | 4.23ms | 11.84ms | 44.08ms |
| comp_2to1 | 8.19ms | 34.22ms | 36.46ms | 2.31ms | 18.24ms | 16.75ms |
| comp_4to1 | 2.70ms | 14.20ms | 18.79ms | 7.69ms | 11.97ms | 17.39ms |
| comp_1000to1 | 5μs | 15μs | 42μs | 3μs | 4μs | 19μs |
| comp_1to2 | 19.92ms | 34.87ms | 45.46ms | 11.06ms | 29.41ms | 31.40ms |
| comp_1to4 | 6.92ms | 17.82ms | 45.06ms | 12.03ms | 30.09ms | 18.54ms |
| comp_1to8 | 6.66ms | 19.80ms | 43.56ms | 5.16ms | 9.35ms | 23.91ms |
| comp_1to1000 | 4.03ms | 14.83ms | 50.08ms | 3.58ms | 5.79ms | 13.95ms |
| update_1to1 | 8.96ms | 21.11ms | 9.79ms | 4.62ms | 9.54ms | 15.46ms |
| update_2to1 | 4.52ms | 10.41ms | 3.15ms | 2.39ms | 5.12ms | 7.77ms |
| update_4to1 | 2.29ms | 5.63ms | 2.46ms | 1.20ms | 2.41ms | 3.86ms |
| update_1000to1 | 22μs | 52μs | 14μs | 11μs | 33μs | 39μs |
| update_1to2 | 4.45ms | 10.40ms | 4.08ms | 2.32ms | 4.51ms | 7.78ms |
| update_1to4 | 2.27ms | 5.21ms | 1.47ms | 1.20ms | 2.55ms | 3.85ms |
| update_1to1000 | 42μs | 155μs | 418μs | 46μs | 166μs | 146μs |
| cellx1000 | 10.24ms | 70.17ms | 5.60ms | 7.21ms | 9.86ms | 11.66ms |
| cellx2500 | 31.82ms | 250.05ms | 22.25ms | 19.39ms | 25.95ms | 36.02ms |
| cellx5000 | 60.87ms | 553.57ms | 56.85ms | 42.30ms | 69.69ms | 86.70ms |
| 10x5 - 2 sources - read 20.0% (simple) | 508.55ms | 1.93s | 243.37ms | 232.24ms | 458.04ms | 348.73ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.98ms | 1.47s | 201.44ms | 178.16ms | 276.02ms | 251.36ms |
| 1000x12 - 4 sources - dynamic (large) | 3.67s | 1.86s | 334.98ms | 276.84ms | 3.77s | 462.97ms |
| 1000x5 - 25 sources (wide dense) | 3.48s | 3.35s | 504.86ms | 414.73ms | 2.80s | 600.00ms |
| 5x500 - 3 sources (deep) | 219.71ms | 1.08s | 208.25ms | 189.26ms | 231.06ms | 252.19ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 473.80ms | 1.62s | 259.66ms | 265.94ms | 451.21ms | 380.40ms |

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
