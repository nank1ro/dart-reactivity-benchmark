# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.70s |
| 🥈 | preact_signals | 0.31 | 100.0% | 35/35 | 9.99s |
| 🥉 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.28s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 11.62s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.77s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.44s |

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
| Test Case | state_beacon | alien_signals | mobx | solidart(2.0-dev) | signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 155.94ms (fail) | 193.42ms | 2.33s | 281.99ms | 206.03ms | 205.38ms |
| broadPropagation | 6.01ms (fail) | 352.45ms | 4.25s | 506.45ms | 449.97ms | 453.81ms |
| deepPropagation | 136.69ms (fail) | 124.74ms | 1.56s | 169.45ms | 174.27ms | 175.54ms |
| diamond | 194.58ms (fail) | 235.46ms | 2.40s | 351.26ms | 288.74ms | 282.34ms |
| mux | 189.10ms (fail) | 371.75ms | 1.81s | 448.50ms | 410.61ms | 382.95ms |
| repeatedObservers | 53.85ms (fail) | 45.38ms | 231.43ms | 81.00ms | 46.26ms | 38.12ms |
| triangle | 78.23ms (fail) | 84.78ms | 777.62ms | 119.21ms | 99.41ms | 99.22ms |
| unstable | 340.17ms (fail) | 60.00ms | 351.29ms | 94.59ms | 91.92ms | 71.27ms |
| molBench | 1.09ms | 488.94ms | 584.17ms | 493.93ms | 487.88ms | 491.85ms |
| create_signals | 63.10ms | 27.74ms | 78.46ms | 73.08ms | 26.15ms | 4.68ms |
| comp_0to1 | 55.83ms | 10.85ms | 21.00ms | 32.65ms | 12.14ms | 17.51ms |
| comp_1to1 | 55.41ms | 7.83ms | 30.92ms | 40.77ms | 28.63ms | 14.15ms |
| comp_2to1 | 36.04ms | 16.93ms | 33.24ms | 39.98ms | 12.67ms | 10.53ms |
| comp_4to1 | 16.79ms | 1.62ms | 24.32ms | 4.99ms | 1.94ms | 8.01ms |
| comp_1000to1 | 44μs | 5μs | 20μs | 20μs | 9μs | 4μs |
| comp_1to2 | 47.30ms | 11.68ms | 35.27ms | 28.72ms | 21.02ms | 23.09ms |
| comp_1to4 | 47.05ms | 11.13ms | 19.05ms | 26.15ms | 10.72ms | 20.96ms |
| comp_1to8 | 45.40ms | 7.53ms | 22.24ms | 25.36ms | 6.90ms | 7.81ms |
| comp_1to1000 | 40.68ms | 3.57ms | 14.79ms | 16.85ms | 4.44ms | 8.49ms |
| update_1to1 | 5.73ms | 11.30ms | 25.69ms | 16.16ms | 9.29ms | 8.24ms |
| update_2to1 | 2.88ms | 5.03ms | 12.13ms | 7.93ms | 4.58ms | 4.06ms |
| update_4to1 | 1.48ms | 2.76ms | 6.81ms | 4.03ms | 2.32ms | 2.06ms |
| update_1000to1 | 15μs | 18μs | 64μs | 40μs | 34μs | 20μs |
| update_1to2 | 2.97ms | 5.58ms | 12.39ms | 8.06ms | 4.95ms | 4.12ms |
| update_1to4 | 1.50ms | 2.43ms | 5.42ms | 4.03ms | 2.34ms | 2.05ms |
| update_1to1000 | 405μs | 47μs | 176μs | 173μs | 44μs | 44μs |
| cellx1000 | 7.06ms | 7.86ms | 82.99ms | 11.22ms | 9.78ms | 10.27ms |
| cellx2500 | 25.93ms | 19.42ms | 255.15ms | 31.84ms | 32.06ms | 38.22ms |
| cellx5000 | 69.94ms | 40.96ms | 537.30ms | 69.00ms | 73.26ms | 78.64ms |
| 10x5 - 2 sources - read 20.0% (simple) | 241.80ms | 226.10ms | 2.06s | 349.19ms | 505.27ms | 446.03ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 199.21ms | 178.91ms | 1.67s | 248.46ms | 279.19ms | 278.12ms |
| 1000x12 - 4 sources - dynamic (large) | 352.94ms | 285.06ms | 2.03s | 467.70ms | 4.03s | 3.51s |
| 1000x5 - 25 sources (wide dense) | 498.61ms | 405.55ms | 3.58s | 590.19ms | 3.57s | 2.61s |
| 5x500 - 3 sources (deep) | 205.01ms | 193.44ms | 1.15s | 258.96ms | 228.66ms | 232.59ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 258.07ms | 264.38ms | 1.75s | 377.97ms | 486.89ms | 448.96ms |

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
