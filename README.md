# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.70s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 9.95s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.33s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.35s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.09s |
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
| Test Case | alien_signals | mobx | solidart | state_beacon | preact_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 185.01ms | 2.36s | 2.17s | 151.22ms (fail) | 205.56ms | 214.51ms |
| broadPropagation | 352.11ms | 4.22s | 5.37s | 6.12ms (fail) | 453.53ms | 470.90ms |
| deepPropagation | 123.10ms | 1.51s | 1.98s | 138.65ms (fail) | 183.03ms | 182.63ms |
| diamond | 232.90ms | 2.43s | 3.35s | 183.76ms (fail) | 282.31ms | 296.34ms |
| mux | 385.01ms | 1.84s | 2.02s | 196.12ms (fail) | 388.29ms | 408.02ms |
| repeatedObservers | 44.98ms | 233.26ms | 202.76ms | 52.14ms (fail) | 38.05ms | 47.25ms |
| triangle | 84.45ms | 761.82ms | 1.17s | 75.22ms (fail) | 99.60ms | 103.37ms |
| unstable | 60.13ms | 350.24ms | 334.06ms | 336.29ms (fail) | 70.40ms | 74.35ms |
| molBench | 492.64ms | 580.18ms | 1.71s | 1.10ms | 491.23ms | 488.45ms |
| create_signals | 26.60ms | 80.29ms | 66.59ms | 58.72ms | 4.69ms | 24.57ms |
| comp_0to1 | 8.03ms | 23.01ms | 29.98ms | 52.04ms | 17.22ms | 11.54ms |
| comp_1to1 | 4.13ms | 54.40ms | 43.40ms | 53.92ms | 11.43ms | 29.00ms |
| comp_2to1 | 2.27ms | 22.81ms | 22.59ms | 37.22ms | 11.38ms | 8.11ms |
| comp_4to1 | 10.72ms | 13.41ms | 20.09ms | 16.65ms | 11.41ms | 9.22ms |
| comp_1000to1 | 3μs | 15μs | 2.20ms | 52μs | 8μs | 5μs |
| comp_1to2 | 18.92ms | 32.65ms | 37.42ms | 48.38ms | 18.07ms | 14.39ms |
| comp_1to4 | 11.11ms | 34.19ms | 29.53ms | 46.84ms | 27.90ms | 14.41ms |
| comp_1to8 | 6.72ms | 20.94ms | 26.72ms | 44.20ms | 8.83ms | 12.62ms |
| comp_1to1000 | 3.57ms | 14.65ms | 18.07ms | 38.79ms | 6.26ms | 10.10ms |
| update_1to1 | 9.02ms | 21.49ms | 41.09ms | 5.72ms | 8.11ms | 9.35ms |
| update_2to1 | 4.90ms | 11.97ms | 20.45ms | 2.89ms | 4.04ms | 4.64ms |
| update_4to1 | 2.48ms | 5.31ms | 10.35ms | 1.43ms | 2.06ms | 2.32ms |
| update_1000to1 | 24μs | 76μs | 111μs | 15μs | 20μs | 22μs |
| update_1to2 | 5.15ms | 10.57ms | 20.70ms | 2.93ms | 4.05ms | 4.95ms |
| update_1to4 | 2.46ms | 6.24ms | 10.35ms | 1.44ms | 2.06ms | 2.40ms |
| update_1to1000 | 44μs | 160μs | 210μs | 398μs | 919μs | 45μs |
| cellx1000 | 7.51ms | 68.79ms | 164.44ms | 5.29ms | 9.77ms | 10.31ms |
| cellx2500 | 20.81ms | 248.71ms | 509.75ms | 25.22ms | 26.88ms | 36.47ms |
| cellx5000 | 49.96ms | 552.27ms | 1.14s | 77.62ms | 66.49ms | 71.33ms |
| 10x5 - 2 sources - read 20.0% (simple) | 227.86ms | 2.02s | 2.57s (partial) | 234.77ms | 439.68ms | 493.31ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 176.54ms | 1.54s | 2.36s (partial) | 200.36ms | 279.98ms | 277.08ms |
| 1000x12 - 4 sources - dynamic (large) | 281.22ms | 1.88s | 4.02s (partial) | 343.69ms | 3.51s | 3.94s |
| 1000x5 - 25 sources (wide dense) | 404.46ms | 3.57s | 4.86s (partial) | 507.21ms | 2.58s | 3.34s |
| 5x500 - 3 sources (deep) | 189.55ms | 1.14s | 1.98s (partial) | 214.19ms | 230.85ms | 229.57ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 265.22ms | 1.69s | 2.78s (partial) | 274.18ms | 447.64ms | 490.00ms |

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
