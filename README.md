# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.22s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.06s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.44s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.99s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.49s |

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
| avoidablePropagation | 275.45ms | 206.38ms | 2.42s | 187.92ms | 208.83ms | 155.87ms (fail) |
| broadPropagation | 510.79ms | 455.51ms | 4.33s | 353.62ms | 458.95ms | 6.61ms (fail) |
| deepPropagation | 177.92ms | 176.02ms | 1.55s | 124.83ms | 179.30ms | 142.36ms (fail) |
| diamond | 347.25ms | 281.41ms | 2.48s | 237.07ms | 286.72ms | 198.39ms (fail) |
| mux | 441.77ms | 388.29ms | 1.87s | 372.32ms | 410.19ms | 191.30ms (fail) |
| repeatedObservers | 78.14ms | 38.50ms | 245.08ms | 44.69ms | 45.34ms | 52.29ms (fail) |
| triangle | 119.33ms | 100.74ms | 804.95ms | 83.52ms | 104.14ms | 78.47ms (fail) |
| unstable | 94.10ms | 70.30ms | 362.79ms | 59.51ms | 74.60ms | 337.43ms (fail) |
| molBench | 492.50ms | 489.01ms | 585.61ms | 491.31ms | 488.91ms | 1.27ms |
| create_signals | 74.09ms | 4.82ms | 88.19ms | 26.61ms | 24.39ms | 58.51ms |
| comp_0to1 | 28.43ms | 18.76ms | 21.82ms | 6.96ms | 11.57ms | 52.15ms |
| comp_1to1 | 38.91ms | 11.79ms | 46.10ms | 4.11ms | 26.86ms | 53.33ms |
| comp_2to1 | 24.96ms | 10.78ms | 23.23ms | 2.35ms | 10.04ms | 35.33ms |
| comp_4to1 | 10.43ms | 14.11ms | 25.91ms | 8.50ms | 2.01ms | 15.94ms |
| comp_1000to1 | 15μs | 6μs | 21μs | 4μs | 9μs | 41μs |
| comp_1to2 | 38.95ms | 22.48ms | 35.87ms | 20.62ms | 24.69ms | 44.60ms |
| comp_1to4 | 20.47ms | 23.70ms | 16.92ms | 7.08ms | 19.61ms | 43.52ms |
| comp_1to8 | 19.61ms | 7.86ms | 19.27ms | 4.45ms | 6.88ms | 42.13ms |
| comp_1to1000 | 14.21ms | 6.37ms | 14.96ms | 3.49ms | 4.53ms | 37.93ms |
| update_1to1 | 16.09ms | 8.32ms | 21.80ms | 11.39ms | 9.32ms | 5.78ms |
| update_2to1 | 8.43ms | 4.09ms | 11.71ms | 5.04ms | 4.63ms | 2.87ms |
| update_4to1 | 4.41ms | 2.06ms | 5.82ms | 2.77ms | 2.36ms | 1.45ms |
| update_1000to1 | 41μs | 20μs | 63μs | 24μs | 23μs | 15μs |
| update_1to2 | 8.09ms | 4.05ms | 10.47ms | 5.43ms | 4.97ms | 2.92ms |
| update_1to4 | 4.03ms | 2.06ms | 6.22ms | 2.47ms | 2.35ms | 1.46ms |
| update_1to1000 | 150μs | 937μs | 170μs | 49μs | 44μs | 378μs |
| cellx1000 | 11.21ms | 9.93ms | 70.21ms | 7.21ms | 9.72ms | 5.06ms |
| cellx2500 | 29.37ms | 27.28ms | 244.01ms | 19.22ms | 32.62ms | 25.90ms |
| cellx5000 | 63.85ms | 81.98ms | 557.71ms | 41.40ms | 58.28ms | 63.76ms |
| 10x5 - 2 sources - read 20.0% (simple) | 352.70ms | 455.68ms | 2.08s | 234.94ms | 565.87ms | 270.03ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 242.42ms | 278.68ms | 1.58s | 176.12ms | 281.65ms | 234.52ms |
| 1000x12 - 4 sources - dynamic (large) | 452.72ms | 3.55s | 1.86s | 279.58ms | 3.86s | 344.58ms |
| 1000x5 - 25 sources (wide dense) | 594.01ms | 2.62s | 3.65s | 412.67ms | 3.53s | 512.45ms |
| 5x500 - 3 sources (deep) | 252.49ms | 230.13ms | 1.20s | 191.47ms | 224.32ms | 204.60ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 376.49ms | 453.89ms | 1.75s | 262.59ms | 473.49ms | 263.77ms |

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
