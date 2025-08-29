# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.75s |
| 🥈 | preact_signals | 0.30 | 100.0% | 35/35 | 10.41s |
| 🥉 | signals | 0.28 | 100.0% | 35/35 | 11.24s |
| 4 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.43s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.86s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.64s |

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
| Test Case | preact_signals | state_beacon | solidart(2.0-dev) | signals | alien_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 201.33ms | 153.53ms (fail) | 262.63ms | 212.25ms | 195.18ms | 2.37s |
| broadPropagation | 471.53ms | 6.59ms (fail) | 506.07ms | 457.18ms | 350.94ms | 4.41s |
| deepPropagation | 177.25ms | 143.18ms (fail) | 164.21ms | 183.97ms | 125.69ms | 1.55s |
| diamond | 278.52ms | 191.39ms (fail) | 357.04ms | 283.57ms | 235.90ms | 2.43s |
| mux | 395.30ms | 192.69ms (fail) | 434.06ms | 410.49ms | 378.52ms | 1.84s |
| repeatedObservers | 40.30ms | 53.47ms (fail) | 80.76ms | 47.38ms | 44.07ms | 233.54ms |
| triangle | 99.61ms | 80.27ms (fail) | 114.86ms | 103.02ms | 83.15ms | 779.47ms |
| unstable | 73.41ms | 345.36ms (fail) | 98.41ms | 76.78ms | 60.12ms | 344.69ms |
| molBench | 487.18ms | 1.24ms | 499.82ms | 485.83ms | 485.51ms | 584.34ms |
| create_signals | 5.34ms | 70.32ms | 81.10ms | 26.83ms | 21.79ms | 63.80ms |
| comp_0to1 | 18.66ms | 59.43ms | 29.13ms | 11.98ms | 7.63ms | 15.80ms |
| comp_1to1 | 13.03ms | 65.88ms | 29.83ms | 30.70ms | 4.15ms | 50.35ms |
| comp_2to1 | 18.94ms | 41.95ms | 32.97ms | 9.49ms | 2.32ms | 35.52ms |
| comp_4to1 | 7.79ms | 18.11ms | 13.77ms | 1.82ms | 8.88ms | 25.84ms |
| comp_1000to1 | 5μs | 45μs | 18μs | 5μs | 6μs | 16μs |
| comp_1to2 | 16.30ms | 49.12ms | 33.92ms | 26.04ms | 18.56ms | 33.10ms |
| comp_1to4 | 22.27ms | 47.88ms | 23.06ms | 12.16ms | 5.70ms | 19.39ms |
| comp_1to8 | 7.10ms | 47.09ms | 25.79ms | 6.59ms | 7.38ms | 24.24ms |
| comp_1to1000 | 5.11ms | 42.76ms | 15.98ms | 4.48ms | 3.56ms | 15.38ms |
| update_1to1 | 8.29ms | 7.41ms | 17.50ms | 10.30ms | 10.14ms | 27.37ms |
| update_2to1 | 4.38ms | 3.98ms | 8.59ms | 4.61ms | 2.74ms | 13.75ms |
| update_4to1 | 2.07ms | 1.91ms | 4.42ms | 2.61ms | 2.47ms | 7.45ms |
| update_1000to1 | 20μs | 16μs | 42μs | 25μs | 19μs | 59μs |
| update_1to2 | 4.07ms | 3.78ms | 8.98ms | 4.55ms | 5.01ms | 13.58ms |
| update_1to4 | 2.06ms | 1.95ms | 4.40ms | 2.54ms | 2.40ms | 6.82ms |
| update_1to1000 | 42μs | 429μs | 164μs | 43μs | 48μs | 189μs |
| cellx1000 | 11.29ms | 6.93ms | 15.79ms | 10.21ms | 7.90ms | 94.89ms |
| cellx2500 | 42.04ms | 36.61ms | 63.37ms | 40.74ms | 25.41ms | 293.17ms |
| cellx5000 | 129.47ms | 92.98ms | 184.88ms | 119.82ms | 71.16ms | 654.87ms |
| 10x5 - 2 sources - read 20.0% (simple) | 444.99ms | 238.24ms | 352.62ms | 503.55ms | 235.00ms | 2.01s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 282.30ms | 210.59ms | 251.66ms | 271.93ms | 179.26ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 3.73s | 380.14ms | 469.15ms | 3.76s | 288.27ms | 1.87s |
| 1000x5 - 25 sources (wide dense) | 2.72s | 559.25ms | 615.32ms | 3.42s | 409.72ms | 3.53s |
| 5x500 - 3 sources (deep) | 230.21ms | 211.86ms | 252.68ms | 221.97ms | 199.65ms | 1.24s |
| 100x15 - 6 sources - dynamic (very dynamic) | 461.97ms | 275.15ms | 381.91ms | 480.20ms | 271.65ms | 1.74s |

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
