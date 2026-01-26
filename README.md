# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.26s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 10.88s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.10s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.04s |
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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 214.10ms | 186.66ms | 147.76ms (fail) | 281.21ms | 208.19ms | 2.34s |
| broadPropagation | 472.21ms | 351.08ms | 6.30ms (fail) | 494.94ms | 464.88ms | 4.33s |
| deepPropagation | 173.71ms | 126.72ms | 138.31ms (fail) | 170.34ms | 175.72ms | 1.49s |
| diamond | 294.19ms | 230.20ms | 183.17ms (fail) | 351.68ms | 282.74ms | 2.38s |
| mux | 386.22ms | 361.26ms | 180.53ms (fail) | 414.28ms | 374.62ms | 1.86s |
| repeatedObservers | 43.91ms | 43.31ms | 52.73ms (fail) | 81.00ms | 40.47ms | 225.20ms |
| triangle | 101.80ms | 84.22ms | 76.78ms (fail) | 115.13ms | 100.29ms | 741.28ms |
| unstable | 76.65ms | 61.87ms | 335.13ms (fail) | 96.45ms | 69.67ms | 345.53ms |
| molBench | 494.89ms | 484.58ms | 974μs | 491.37ms | 486.38ms | 589.85ms |
| create_signals | 25.53ms | 32.61ms | 59.67ms | 93.22ms | 5.43ms | 61.17ms |
| comp_0to1 | 13.05ms | 6.62ms | 54.05ms | 33.77ms | 23.71ms | 16.14ms |
| comp_1to1 | 26.23ms | 4.18ms | 54.79ms | 50.94ms | 13.20ms | 39.05ms |
| comp_2to1 | 12.04ms | 2.31ms | 43.65ms | 46.05ms | 17.57ms | 24.05ms |
| comp_4to1 | 4.35ms | 7.62ms | 16.87ms | 11.82ms | 8.89ms | 20.54ms |
| comp_1000to1 | 5μs | 4μs | 42μs | 15μs | 7μs | 16μs |
| comp_1to2 | 17.05ms | 22.56ms | 47.56ms | 27.59ms | 27.57ms | 36.29ms |
| comp_1to4 | 10.54ms | 8.96ms | 47.98ms | 20.75ms | 30.25ms | 21.18ms |
| comp_1to8 | 6.05ms | 6.49ms | 44.49ms | 19.56ms | 8.02ms | 24.79ms |
| comp_1to1000 | 4.21ms | 4.29ms | 40.10ms | 15.14ms | 8.70ms | 16.16ms |
| update_1to1 | 9.33ms | 4.62ms | 6.09ms | 15.47ms | 8.88ms | 23.58ms |
| update_2to1 | 4.73ms | 3.10ms | 3.10ms | 7.74ms | 4.36ms | 11.50ms |
| update_4to1 | 2.33ms | 1.71ms | 1.57ms | 3.87ms | 2.28ms | 6.08ms |
| update_1000to1 | 23μs | 11μs | 16μs | 38μs | 22μs | 58μs |
| update_1to2 | 4.67ms | 3.38ms | 3.08ms | 7.89ms | 4.39ms | 11.63ms |
| update_1to4 | 2.41ms | 1.74ms | 1.62ms | 3.87ms | 2.24ms | 6.00ms |
| update_1to1000 | 72μs | 49μs | 390μs | 146μs | 1.86ms | 204μs |
| cellx1000 | 9.90ms | 7.34ms | 6.16ms | 11.58ms | 9.76ms | 95.31ms |
| cellx2500 | 32.45ms | 21.32ms | 30.03ms | 31.89ms | 26.95ms | 284.96ms |
| cellx5000 | 65.28ms | 51.33ms | 93.73ms | 76.37ms | 75.32ms | 606.15ms |
| 10x5 - 2 sources - read 20.0% (simple) | 511.49ms | 234.67ms | 245.10ms | 342.80ms | 434.18ms | 1.94s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.07ms | 173.00ms | 199.88ms | 246.18ms | 269.89ms | 1.44s |
| 1000x12 - 4 sources - dynamic (large) | 3.60s | 278.31ms | 351.97ms | 463.37ms | 3.71s | 1.87s |
| 1000x5 - 25 sources (wide dense) | 3.27s | 408.77ms | 501.40ms | 593.74ms | 2.51s | 3.40s |
| 5x500 - 3 sources (deep) | 225.77ms | 192.83ms | 204.56ms | 252.38ms | 228.39ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 486.02ms | 264.13ms | 258.59ms | 389.94ms | 461.01ms | 1.65s |

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
