# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 4.09s |
| 🥈 | signals | 0.55 | 100.0% | 35/35 | 10.98s |
| 🥉 | preact_signals | 0.53 | 100.0% | 35/35 | 9.76s |
| 4 | mobx | 0.15 | 100.0% | 35/35 | 27.11s |
| 5 | solidart | 0.09 | 82.9% | 29/35 | 39.84s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.54s |

<!-- ranking end -->

> [!TIP]
> ## Ranking algorithm
>
> The ranking system evaluates frameworks based on multiple factors:
>
> 1. **Performance Score**
>    - For each test case, the fastest passing implementation (with coefficient ≥ 0.5) serves as the baseline
>    - Individual test scores are calculated as: `(baseline_time / actual_time) * coefficient * weight`
>    - Test weights vary based on complexity and importance:
>      - Simple operations: 1.0
>      - Computed properties: 1.2
>      - Collection operations: 1.3
>      - Deep updates: 1.4
>      - Complex updates: 1.5
>
> 2. **Success Rate**
>    - Full pass (coefficient = 1.0): Test completely successful
>    - Partial pass (0 < coefficient < 1.0): Some aspects failed
>    - Fail (coefficient = 0): Test completely failed
>
> 3. **Final Score**
>    - Uses geometric mean of all test scores to balance different test magnitudes
>    - Final score = ∛(performance_score * success_rate * total_tests)
>
> The ranking reflects both performance and reliability, ensuring frameworks are evaluated on both speed and correctness.

## Benchmark results of each framework

<!-- test-case start -->
| Test Case | preact_signals | mobx | alien_signals | solidart | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 211.02ms | 2.27s | 202.90ms | 2.18s | 208.81ms | 164.54ms (fail) |
| broadPropagation | 457.21ms | 4.34s | 412.81ms | 5.49s | 471.62ms | 6.63ms (fail) |
| deepPropagation | 173.18ms | 1.53s | 148.52ms | 2.01s | 174.69ms | 142.43ms (fail) |
| diamond | 277.90ms | 2.40s | 250.69ms | 3.48s | 291.23ms | 199.28ms (fail) |
| mux | 386.43ms | 1.81s | 390.45ms | 2.06s | 412.64ms | 192.99ms (fail) |
| repeatedObservers | 41.71ms | 234.29ms | 37.20ms | 210.86ms | 44.99ms | 53.71ms (fail) |
| triangle | 99.80ms | 762.02ms | 101.36ms | 1.15s | 102.41ms | 80.44ms (fail) |
| unstable | 70.20ms | 344.01ms | 88.85ms | 343.36ms | 78.58ms | 337.04ms (fail) |
| molBench | 483.75ms | 586.59ms | 493.59ms | 1.74s | 486.19ms | 1.39ms |
| create_signals | 4.82ms | 75.69ms | 21.22ms | 73.53ms | 30.45ms | 63.90ms |
| comp_0to1 | 17.05ms | 28.03ms | 4.56ms | 28.62ms | 11.25ms | 50.95ms |
| comp_1to1 | 14.84ms | 40.05ms | 17.32ms | 42.06ms | 15.42ms | 52.90ms |
| comp_2to1 | 15.45ms | 23.96ms | 16.41ms | 26.09ms | 13.78ms | 33.62ms |
| comp_4to1 | 11.30ms | 24.25ms | 15.92ms | 21.10ms | 8.04ms | 17.49ms |
| comp_1000to1 | 4μs | 15μs | 6μs | 2.16ms | 5μs | 50μs |
| comp_1to2 | 16.81ms | 36.21ms | 9.94ms | 29.46ms | 18.74ms | 50.00ms |
| comp_1to4 | 20.33ms | 18.49ms | 10.28ms | 27.75ms | 10.19ms | 43.90ms |
| comp_1to8 | 7.39ms | 21.16ms | 4.05ms | 24.57ms | 6.82ms | 44.54ms |
| comp_1to1000 | 5.89ms | 15.47ms | 3.81ms | 18.91ms | 4.59ms | 40.55ms |
| update_1to1 | 8.82ms | 27.14ms | 7.14ms | 43.96ms | 9.36ms | 8.22ms |
| update_2to1 | 4.37ms | 13.98ms | 1.97ms | 21.66ms | 4.66ms | 2.90ms |
| update_4to1 | 2.17ms | 7.63ms | 2.54ms | 10.97ms | 2.37ms | 1.92ms |
| update_1000to1 | 22μs | 69μs | 18μs | 119μs | 23μs | 14μs |
| update_1to2 | 4.37ms | 12.53ms | 2.69ms | 21.68ms | 4.73ms | 2.98ms |
| update_1to4 | 2.17ms | 7.04ms | 2.36ms | 11.14ms | 2.36ms | 1.45ms |
| update_1to1000 | 531μs | 165μs | 40μs | 219μs | 44μs | 403μs |
| cellx1000 | 9.44ms | 72.64ms | 8.89ms | 192.83ms | 9.37ms | 5.50ms |
| cellx2500 | 25.32ms | 263.82ms | 22.44ms | 567.37ms | 30.07ms | 20.82ms |
| cellx5000 | 65.16ms | 570.44ms | 48.21ms | 1.18s | 60.15ms | 61.82ms |
| 10x5 - 2 sources - read 20.0% (simple) | 438.02ms | 2.00s | 258.98ms | 2.64s (partial) | 504.78ms | 262.98ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.57ms | 1.49s | 209.84ms | 2.37s (partial) | 275.69ms | 213.00ms |
| 1000x12 - 4 sources - dynamic (large) | 3.40s | 1.79s | 291.86ms | 4.03s (partial) | 3.68s | 340.26ms |
| 1000x5 - 25 sources (wide dense) | 2.51s | 3.49s | 489.39ms | 4.98s (partial) | 3.30s | 542.40ms |
| 5x500 - 3 sources (deep) | 232.16ms | 1.12s | 231.16ms | 2.01s (partial) | 226.29ms | 233.45ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 456.10ms | 1.69s | 285.71ms | 2.78s (partial) | 476.14ms | 268.24ms |

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
