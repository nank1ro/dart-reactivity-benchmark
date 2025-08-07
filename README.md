# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.67s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.05s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.18s |
| 4 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.41s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.33s |
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
| Test Case | state_beacon | mobx | solidart(2.0-dev) | preact_signals | signals | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 164.66ms (fail) | 2.34s | 276.47ms | 198.21ms | 213.00ms | 183.51ms |
| broadPropagation | 6.82ms (fail) | 4.52s | 511.66ms | 447.98ms | 454.45ms | 346.46ms |
| deepPropagation | 140.08ms (fail) | 1.58s | 173.05ms | 178.86ms | 169.74ms | 124.65ms |
| diamond | 181.48ms (fail) | 2.49s | 362.85ms | 278.27ms | 281.27ms | 230.38ms |
| mux | 194.88ms (fail) | 1.89s | 440.80ms | 402.17ms | 450.37ms | 369.04ms |
| repeatedObservers | 52.63ms (fail) | 239.90ms | 81.74ms | 39.48ms | 44.61ms | 45.22ms |
| triangle | 98.65ms (fail) | 794.03ms | 117.83ms | 98.21ms | 99.67ms | 84.89ms |
| unstable | 337.52ms (fail) | 346.31ms | 97.72ms | 70.04ms | 79.50ms | 67.06ms |
| molBench | 953μs | 574.82ms | 494.63ms | 484.85ms | 486.69ms | 485.80ms |
| create_signals | 61.33ms | 85.45ms | 94.09ms | 5.27ms | 27.59ms | 18.65ms |
| comp_0to1 | 55.47ms | 39.69ms | 32.98ms | 21.94ms | 11.98ms | 8.88ms |
| comp_1to1 | 56.63ms | 18.68ms | 50.86ms | 13.78ms | 30.08ms | 4.28ms |
| comp_2to1 | 39.47ms | 22.81ms | 29.36ms | 17.72ms | 11.57ms | 2.36ms |
| comp_4to1 | 16.83ms | 28.93ms | 17.07ms | 7.87ms | 2.18ms | 8.04ms |
| comp_1000to1 | 42μs | 19μs | 22μs | 4μs | 4μs | 4μs |
| comp_1to2 | 46.02ms | 40.52ms | 45.73ms | 20.52ms | 18.77ms | 16.38ms |
| comp_1to4 | 46.20ms | 26.99ms | 22.47ms | 32.50ms | 11.11ms | 11.81ms |
| comp_1to8 | 43.60ms | 25.69ms | 27.39ms | 8.95ms | 6.39ms | 5.04ms |
| comp_1to1000 | 39.24ms | 16.54ms | 17.24ms | 5.76ms | 4.25ms | 3.58ms |
| update_1to1 | 5.70ms | 23.91ms | 16.12ms | 8.64ms | 8.96ms | 10.32ms |
| update_2to1 | 3.14ms | 11.06ms | 8.54ms | 4.37ms | 4.48ms | 2.28ms |
| update_4to1 | 1.43ms | 6.16ms | 4.06ms | 2.19ms | 2.22ms | 2.50ms |
| update_1000to1 | 14μs | 69μs | 40μs | 21μs | 22μs | 25μs |
| update_1to2 | 2.90ms | 11.53ms | 7.84ms | 4.70ms | 4.47ms | 5.02ms |
| update_1to4 | 1.47ms | 5.50ms | 4.02ms | 2.15ms | 2.29ms | 2.51ms |
| update_1to1000 | 385μs | 185μs | 171μs | 969μs | 53μs | 47μs |
| cellx1000 | 5.46ms | 82.58ms | 13.65ms | 9.78ms | 9.91ms | 7.11ms |
| cellx2500 | 25.91ms | 279.72ms | 47.67ms | 26.96ms | 35.99ms | 19.63ms |
| cellx5000 | 66.49ms | 645.31ms | 137.45ms | 72.47ms | 78.15ms | 44.86ms |
| 10x5 - 2 sources - read 20.0% (simple) | 242.70ms | 2.05s | 355.60ms | 438.67ms | 507.07ms | 232.47ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 198.50ms | 1.56s | 241.31ms | 270.58ms | 282.02ms | 178.31ms |
| 1000x12 - 4 sources - dynamic (large) | 348.75ms | 2.03s | 462.66ms | 3.62s | 3.77s | 280.22ms |
| 1000x5 - 25 sources (wide dense) | 500.50ms | 3.64s | 590.19ms | 2.71s | 3.25s | 412.16ms |
| 5x500 - 3 sources (deep) | 220.27ms | 1.15s | 248.47ms | 231.41ms | 221.46ms | 191.43ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 257.48ms | 1.75s | 377.61ms | 449.03ms | 475.99ms | 263.45ms |

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
