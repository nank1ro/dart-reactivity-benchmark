# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.35s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.34s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.42s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.46s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.50s |

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
| avoidablePropagation | 208.29ms | 160.00ms (fail) | 267.04ms | 212.89ms | 194.99ms | 2.31s |
| broadPropagation | 464.55ms | 6.49ms (fail) | 503.97ms | 453.50ms | 355.37ms | 4.35s |
| deepPropagation | 180.46ms | 141.97ms (fail) | 166.09ms | 169.69ms | 125.30ms | 1.53s |
| diamond | 278.05ms | 193.22ms (fail) | 354.94ms | 282.66ms | 236.02ms | 2.39s |
| mux | 397.84ms | 194.29ms (fail) | 433.76ms | 410.01ms | 373.82ms | 1.83s |
| repeatedObservers | 40.63ms | 54.10ms (fail) | 80.76ms | 46.77ms | 44.03ms | 230.70ms |
| triangle | 98.20ms | 80.98ms (fail) | 114.33ms | 104.01ms | 85.58ms | 763.61ms |
| unstable | 73.76ms | 339.75ms (fail) | 97.95ms | 76.02ms | 60.55ms | 344.19ms |
| molBench | 487.98ms | 1.19ms | 500.92ms | 485.53ms | 489.36ms | 584.01ms |
| create_signals | 5.35ms | 62.35ms | 77.84ms | 24.84ms | 28.92ms | 81.82ms |
| comp_0to1 | 17.82ms | 56.02ms | 25.54ms | 11.90ms | 7.33ms | 35.42ms |
| comp_1to1 | 14.88ms | 57.53ms | 32.67ms | 28.18ms | 4.12ms | 17.60ms |
| comp_2to1 | 10.68ms | 38.75ms | 32.85ms | 9.00ms | 2.25ms | 28.25ms |
| comp_4to1 | 11.38ms | 17.10ms | 14.32ms | 2.00ms | 8.48ms | 23.79ms |
| comp_1000to1 | 4μs | 70μs | 15μs | 5μs | 5μs | 33μs |
| comp_1to2 | 27.36ms | 48.05ms | 37.03ms | 18.09ms | 14.04ms | 45.61ms |
| comp_1to4 | 28.73ms | 46.18ms | 20.76ms | 14.52ms | 9.07ms | 25.81ms |
| comp_1to8 | 5.30ms | 45.46ms | 24.41ms | 7.90ms | 4.88ms | 26.29ms |
| comp_1to1000 | 6.90ms | 41.37ms | 14.35ms | 4.40ms | 3.45ms | 15.52ms |
| update_1to1 | 9.26ms | 6.03ms | 16.46ms | 10.24ms | 9.97ms | 27.72ms |
| update_2to1 | 4.92ms | 3.11ms | 7.99ms | 4.55ms | 2.40ms | 13.46ms |
| update_4to1 | 2.34ms | 1.54ms | 4.07ms | 2.57ms | 2.46ms | 7.42ms |
| update_1000to1 | 21μs | 15μs | 40μs | 25μs | 13μs | 84μs |
| update_1to2 | 4.78ms | 3.06ms | 8.36ms | 4.60ms | 4.99ms | 13.77ms |
| update_1to4 | 2.28ms | 1.55ms | 4.08ms | 2.57ms | 2.50ms | 6.78ms |
| update_1to1000 | 868μs | 417μs | 149μs | 43μs | 46μs | 184μs |
| cellx1000 | 9.96ms | 5.38ms | 13.60ms | 10.00ms | 7.25ms | 77.61ms |
| cellx2500 | 28.60ms | 28.05ms | 53.66ms | 34.02ms | 19.82ms | 266.38ms |
| cellx5000 | 81.19ms | 74.66ms | 106.33ms | 79.20ms | 49.62ms | 617.19ms |
| 10x5 - 2 sources - read 20.0% (simple) | 438.29ms | 267.27ms | 349.55ms | 507.43ms | 239.67ms | 2.03s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 277.18ms | 199.62ms | 247.74ms | 282.65ms | 181.73ms | 1.51s |
| 1000x12 - 4 sources - dynamic (large) | 3.76s | 355.77ms | 469.25ms | 3.77s | 282.46ms | 1.92s |
| 1000x5 - 25 sources (wide dense) | 2.75s | 503.01ms | 621.23ms | 3.56s | 410.17ms | 3.49s |
| 5x500 - 3 sources (deep) | 228.10ms | 204.55ms | 254.47ms | 224.44ms | 190.35ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 458.47ms | 263.68ms | 389.70ms | 490.02ms | 264.88ms | 1.72s |

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
