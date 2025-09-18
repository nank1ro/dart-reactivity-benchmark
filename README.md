# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.31s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.53s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.39s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.33s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.47s |

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
| avoidablePropagation | 206.60ms | 157.88ms (fail) | 280.72ms | 216.73ms | 196.33ms | 2.34s |
| broadPropagation | 459.02ms | 6.24ms (fail) | 497.57ms | 461.64ms | 357.26ms | 4.39s |
| deepPropagation | 178.37ms | 141.19ms (fail) | 163.94ms | 176.58ms | 131.22ms | 1.53s |
| diamond | 279.73ms | 206.38ms (fail) | 350.44ms | 288.43ms | 238.13ms | 2.39s |
| mux | 393.91ms | 196.04ms (fail) | 435.44ms | 412.86ms | 376.60ms | 1.83s |
| repeatedObservers | 40.02ms | 52.43ms (fail) | 81.23ms | 46.16ms | 44.23ms | 229.83ms |
| triangle | 100.06ms | 77.24ms (fail) | 113.29ms | 107.88ms | 85.69ms | 746.63ms |
| unstable | 74.25ms | 372.68ms (fail) | 99.06ms | 75.26ms | 60.38ms | 340.20ms |
| molBench | 488.08ms | 1.03ms | 493.48ms | 486.92ms | 488.74ms | 582.10ms |
| create_signals | 5.14ms | 70.14ms | 93.51ms | 24.63ms | 27.98ms | 80.82ms |
| comp_0to1 | 17.52ms | 57.85ms | 32.79ms | 11.30ms | 8.36ms | 16.12ms |
| comp_1to1 | 10.92ms | 58.38ms | 45.14ms | 26.84ms | 4.27ms | 52.37ms |
| comp_2to1 | 24.68ms | 45.03ms | 22.69ms | 13.19ms | 2.29ms | 23.05ms |
| comp_4to1 | 15.62ms | 17.34ms | 8.40ms | 3.45ms | 8.54ms | 31.07ms |
| comp_1000to1 | 4μs | 44μs | 19μs | 8μs | 5μs | 28μs |
| comp_1to2 | 25.86ms | 47.45ms | 35.58ms | 20.21ms | 14.28ms | 36.41ms |
| comp_1to4 | 27.47ms | 45.68ms | 16.69ms | 7.37ms | 5.34ms | 22.22ms |
| comp_1to8 | 5.62ms | 45.32ms | 20.93ms | 6.45ms | 7.07ms | 22.95ms |
| comp_1to1000 | 7.52ms | 41.22ms | 14.04ms | 4.38ms | 3.42ms | 15.58ms |
| update_1to1 | 9.45ms | 6.01ms | 16.42ms | 10.39ms | 10.10ms | 27.80ms |
| update_2to1 | 4.92ms | 3.09ms | 8.03ms | 4.76ms | 2.17ms | 13.86ms |
| update_4to1 | 2.31ms | 1.53ms | 4.07ms | 2.69ms | 2.46ms | 7.21ms |
| update_1000to1 | 35μs | 15μs | 40μs | 26μs | 24μs | 64μs |
| update_1to2 | 4.58ms | 3.02ms | 8.18ms | 4.75ms | 4.16ms | 13.90ms |
| update_1to4 | 2.25ms | 1.53ms | 4.10ms | 2.60ms | 2.38ms | 6.94ms |
| update_1to1000 | 931μs | 407μs | 149μs | 42μs | 46μs | 186μs |
| cellx1000 | 9.83ms | 5.79ms | 12.23ms | 9.52ms | 7.21ms | 69.78ms |
| cellx2500 | 26.41ms | 22.94ms | 33.42ms | 32.36ms | 19.57ms | 255.41ms |
| cellx5000 | 68.00ms | 48.83ms | 69.41ms | 68.26ms | 45.15ms | 539.49ms |
| 10x5 - 2 sources - read 20.0% (simple) | 447.24ms | 241.15ms | 348.82ms | 510.14ms | 235.34ms | 2.01s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 272.57ms | 196.32ms | 272.55ms | 283.32ms | 178.72ms | 1.54s |
| 1000x12 - 4 sources - dynamic (large) | 3.73s | 342.59ms | 463.93ms | 3.99s | 281.08ms | 1.88s |
| 1000x5 - 25 sources (wide dense) | 2.76s | 490.45ms | 629.61ms | 3.52s | 401.36ms | 3.47s |
| 5x500 - 3 sources (deep) | 232.52ms | 205.03ms | 248.57ms | 227.10ms | 196.37ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 456.84ms | 259.18ms | 389.25ms | 475.80ms | 263.64ms | 1.70s |

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
