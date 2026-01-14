# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.66s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.28s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.12s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 9.98s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.17s |
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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 212.08ms | 187.47ms | 156.38ms (fail) | 284.43ms | 207.66ms | 2.39s |
| broadPropagation | 452.86ms | 352.18ms | 6.76ms (fail) | 509.03ms | 450.26ms | 4.35s |
| deepPropagation | 176.83ms | 127.14ms | 136.95ms (fail) | 164.96ms | 176.66ms | 1.51s |
| diamond | 284.40ms | 232.26ms | 183.89ms (fail) | 354.41ms | 283.33ms | 2.38s |
| mux | 395.13ms | 356.82ms | 184.20ms (fail) | 419.21ms | 372.94ms | 1.84s |
| repeatedObservers | 46.30ms | 43.41ms | 52.53ms (fail) | 81.10ms | 40.60ms | 235.80ms |
| triangle | 104.08ms | 85.51ms | 77.00ms (fail) | 113.74ms | 100.40ms | 746.11ms |
| unstable | 78.71ms | 61.51ms | 342.64ms (fail) | 96.27ms | 71.78ms | 344.73ms |
| molBench | 494.63ms | 483.91ms | 1.01ms | 490.24ms | 478.57ms | 590.69ms |
| create_signals | 26.19ms | 22.51ms | 66.28ms | 94.24ms | 5.48ms | 71.32ms |
| comp_0to1 | 11.27ms | 8.44ms | 60.19ms | 35.62ms | 18.25ms | 25.27ms |
| comp_1to1 | 26.96ms | 4.21ms | 60.96ms | 50.10ms | 13.17ms | 28.39ms |
| comp_2to1 | 7.88ms | 2.31ms | 35.52ms | 44.86ms | 17.50ms | 17.06ms |
| comp_4to1 | 2.82ms | 10.36ms | 16.02ms | 19.31ms | 19.97ms | 28.48ms |
| comp_1000to1 | 4μs | 6μs | 42μs | 15μs | 5μs | 15μs |
| comp_1to2 | 23.82ms | 15.90ms | 44.16ms | 31.11ms | 31.55ms | 37.46ms |
| comp_1to4 | 12.40ms | 7.01ms | 43.90ms | 20.31ms | 27.41ms | 25.34ms |
| comp_1to8 | 13.55ms | 4.51ms | 42.14ms | 22.68ms | 7.08ms | 24.45ms |
| comp_1to1000 | 4.64ms | 4.61ms | 38.53ms | 14.67ms | 6.21ms | 15.40ms |
| update_1to1 | 9.30ms | 7.89ms | 6.10ms | 15.89ms | 8.74ms | 27.47ms |
| update_2to1 | 4.81ms | 3.84ms | 3.08ms | 7.72ms | 4.55ms | 13.99ms |
| update_4to1 | 2.38ms | 1.25ms | 1.57ms | 3.86ms | 2.22ms | 7.37ms |
| update_1000to1 | 35μs | 19μs | 16μs | 38μs | 22μs | 69μs |
| update_1to2 | 4.80ms | 4.58ms | 3.07ms | 7.96ms | 4.38ms | 13.78ms |
| update_1to4 | 2.60ms | 2.60ms | 1.61ms | 3.85ms | 2.27ms | 6.90ms |
| update_1to1000 | 45μs | 52μs | 380μs | 153μs | 775μs | 162μs |
| cellx1000 | 9.77ms | 7.35ms | 5.14ms | 12.62ms | 9.70ms | 73.66ms |
| cellx2500 | 32.41ms | 22.15ms | 25.50ms | 33.18ms | 25.76ms | 276.28ms |
| cellx5000 | 64.83ms | 53.44ms | 62.48ms | 88.88ms | 75.65ms | 546.80ms |
| 10x5 - 2 sources - read 20.0% (simple) | 508.44ms | 239.30ms | 239.17ms | 345.98ms | 432.61ms | 1.98s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 284.75ms | 174.67ms | 199.31ms | 241.48ms | 271.43ms | 1.46s |
| 1000x12 - 4 sources - dynamic (large) | 3.69s | 272.10ms | 337.59ms | 460.68ms | 3.65s | 1.89s |
| 1000x5 - 25 sources (wide dense) | 3.43s | 409.00ms | 522.17ms | 586.51ms | 2.49s | 3.46s |
| 5x500 - 3 sources (deep) | 223.96ms | 191.03ms | 202.14ms | 252.64ms | 223.61ms | 1.12s |
| 100x15 - 6 sources - dynamic (very dynamic) | 477.89ms | 262.59ms | 256.90ms | 377.04ms | 450.90ms | 1.64s |

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
