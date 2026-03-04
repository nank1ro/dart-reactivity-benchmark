# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.68s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 10.67s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.29s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.42s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.62s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.42s |

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
| avoidablePropagation | 200.84ms | 2.27s | 149.59ms (fail) | 194.46ms | 206.23ms | 277.54ms |
| broadPropagation | 460.13ms | 4.24s | 5.96ms (fail) | 357.86ms | 457.71ms | 508.50ms |
| deepPropagation | 167.82ms | 1.53s | 138.46ms (fail) | 126.61ms | 176.34ms | 168.95ms |
| diamond | 285.35ms | 2.38s | 178.18ms (fail) | 246.40ms | 284.14ms | 343.40ms |
| mux | 401.73ms | 1.77s | 181.32ms (fail) | 359.55ms | 382.07ms | 420.65ms |
| repeatedObservers | 45.77ms | 229.26ms | 55.33ms (fail) | 46.29ms | 44.24ms | 80.57ms |
| triangle | 101.05ms | 747.98ms | 78.25ms (fail) | 88.54ms | 99.69ms | 115.68ms |
| unstable | 76.02ms | 344.46ms | 336.50ms (fail) | 62.07ms | 71.44ms | 95.43ms |
| molBench | 493.69ms | 581.72ms | 1.43ms | 487.59ms | 494.78ms | 488.99ms |
| create_signals | 29.77ms | 52.73ms | 65.87ms | 19.56ms | 6.10ms | 95.96ms |
| comp_0to1 | 10.82ms | 15.11ms | 54.46ms | 7.14ms | 18.37ms | 41.45ms |
| comp_1to1 | 27.42ms | 45.41ms | 62.94ms | 4.23ms | 13.47ms | 49.89ms |
| comp_2to1 | 9.65ms | 30.05ms | 38.10ms | 2.38ms | 19.27ms | 39.50ms |
| comp_4to1 | 2.07ms | 24.32ms | 16.83ms | 8.46ms | 14.88ms | 13.01ms |
| comp_1000to1 | 5μs | 20μs | 43μs | 3μs | 5μs | 14μs |
| comp_1to2 | 21.23ms | 29.15ms | 46.41ms | 11.08ms | 28.24ms | 27.87ms |
| comp_1to4 | 11.27ms | 39.73ms | 46.22ms | 14.38ms | 20.58ms | 20.25ms |
| comp_1to8 | 6.22ms | 25.10ms | 46.41ms | 4.07ms | 7.41ms | 19.32ms |
| comp_1to1000 | 4.09ms | 14.98ms | 40.20ms | 3.26ms | 4.56ms | 13.97ms |
| update_1to1 | 9.01ms | 21.81ms | 8.11ms | 4.65ms | 8.94ms | 15.66ms |
| update_2to1 | 4.49ms | 11.46ms | 7.72ms | 2.35ms | 4.55ms | 7.84ms |
| update_4to1 | 2.29ms | 5.38ms | 1.92ms | 1.21ms | 2.26ms | 3.92ms |
| update_1000to1 | 22μs | 55μs | 14μs | 11μs | 32μs | 39μs |
| update_1to2 | 4.45ms | 11.18ms | 3.95ms | 2.33ms | 4.44ms | 8.02ms |
| update_1to4 | 2.25ms | 5.83ms | 1.48ms | 1.22ms | 2.37ms | 4.25ms |
| update_1to1000 | 41μs | 153μs | 389μs | 49μs | 175μs | 147μs |
| cellx1000 | 9.63ms | 78.92ms | 5.56ms | 8.88ms | 9.94ms | 12.32ms |
| cellx2500 | 31.73ms | 226.64ms | 26.80ms | 20.46ms | 26.61ms | 31.73ms |
| cellx5000 | 60.14ms | 575.78ms | 63.19ms | 40.22ms | 70.61ms | 67.59ms |
| 10x5 - 2 sources - read 20.0% (simple) | 484.68ms | 1.95s | 242.48ms | 230.42ms | 451.86ms | 360.90ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.84ms | 1.46s | 201.19ms | 177.46ms | 275.20ms | 257.15ms |
| 1000x12 - 4 sources - dynamic (large) | 3.47s | 1.74s | 335.14ms | 277.55ms | 3.76s | 455.74ms |
| 1000x5 - 25 sources (wide dense) | 3.27s | 3.38s | 518.87ms | 414.57ms | 2.78s | 595.81ms |
| 5x500 - 3 sources (deep) | 219.47ms | 1.10s | 206.90ms | 191.99ms | 232.92ms | 262.85ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 468.87ms | 1.68s | 258.19ms | 261.80ms | 445.50ms | 382.37ms |

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
