# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.70s |
| 🥈 | preact_signals | 0.26 | 100.0% | 35/35 | 9.80s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.18s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.41s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 40.53s |
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
| Test Case | solidart | mobx | state_beacon | signals | alien_signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.26s | 2.29s | 156.51ms (fail) | 210.46ms | 188.18ms | 213.77ms |
| broadPropagation | 5.66s | 4.39s | 6.90ms (fail) | 454.36ms | 346.41ms | 456.89ms |
| deepPropagation | 2.06s | 1.56s | 149.54ms (fail) | 167.28ms | 126.14ms | 174.01ms |
| diamond | 3.61s | 2.44s | 184.09ms (fail) | 281.68ms | 236.49ms | 288.52ms |
| mux | 2.11s | 1.81s | 191.02ms (fail) | 410.34ms | 375.04ms | 386.92ms |
| repeatedObservers | 213.58ms | 242.86ms | 53.52ms (fail) | 44.95ms | 43.81ms | 40.94ms |
| triangle | 1.20s | 767.41ms | 78.55ms (fail) | 103.36ms | 84.82ms | 99.64ms |
| unstable | 345.37ms | 363.15ms | 338.36ms (fail) | 78.05ms | 60.87ms | 69.00ms |
| molBench | 1.76s | 593.00ms | 844μs | 486.03ms | 487.14ms | 483.57ms |
| create_signals | 63.41ms | 73.62ms | 73.38ms | 30.06ms | 20.96ms | 4.77ms |
| comp_0to1 | 38.19ms | 21.18ms | 57.81ms | 14.80ms | 5.04ms | 18.17ms |
| comp_1to1 | 60.12ms | 32.12ms | 54.55ms | 18.59ms | 11.34ms | 15.82ms |
| comp_2to1 | 25.48ms | 19.91ms | 33.77ms | 11.66ms | 14.58ms | 8.77ms |
| comp_4to1 | 13.38ms | 17.67ms | 17.40ms | 1.94ms | 1.74ms | 13.28ms |
| comp_1000to1 | 2.06ms | 32μs | 45μs | 5μs | 13μs | 4μs |
| comp_1to2 | 32.64ms | 36.23ms | 46.03ms | 16.12ms | 10.21ms | 27.70ms |
| comp_1to4 | 27.96ms | 19.95ms | 44.03ms | 9.74ms | 7.13ms | 19.82ms |
| comp_1to8 | 24.06ms | 22.19ms | 44.14ms | 6.92ms | 3.72ms | 8.72ms |
| comp_1to1000 | 18.60ms | 15.51ms | 40.52ms | 4.75ms | 3.67ms | 6.56ms |
| update_1to1 | 43.09ms | 27.42ms | 8.87ms | 9.62ms | 4.39ms | 8.81ms |
| update_2to1 | 21.29ms | 13.82ms | 2.89ms | 4.68ms | 4.23ms | 4.43ms |
| update_4to1 | 10.83ms | 7.37ms | 2.53ms | 2.33ms | 1.10ms | 2.21ms |
| update_1000to1 | 116μs | 68μs | 14μs | 23μs | 11μs | 21μs |
| update_1to2 | 21.44ms | 13.90ms | 4.15ms | 4.72ms | 2.18ms | 4.54ms |
| update_1to4 | 11.01ms | 6.81ms | 1.45ms | 2.34ms | 1.09ms | 2.20ms |
| update_1to1000 | 209μs | 164μs | 400μs | 45μs | 28μs | 446μs |
| cellx1000 | 165.13ms | 73.63ms | 5.30ms | 9.54ms | 9.43ms | 9.48ms |
| cellx2500 | 487.34ms | 265.80ms | 18.77ms | 31.18ms | 19.87ms | 25.44ms |
| cellx5000 | 1.11s | 529.93ms | 53.45ms | 64.85ms | 43.72ms | 67.75ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.72s (partial) | 2.02s | 255.94ms | 505.66ms | 233.08ms | 434.69ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.39s (partial) | 1.54s | 208.40ms | 289.28ms | 183.73ms | 274.07ms |
| 1000x12 - 4 sources - dynamic (large) | 4.18s (partial) | 1.86s | 348.19ms | 3.68s | 292.31ms | 3.42s |
| 1000x5 - 25 sources (wide dense) | 4.97s (partial) | 3.51s | 520.10ms | 3.51s | 415.00ms | 2.53s |
| 5x500 - 3 sources (deep) | 2.07s (partial) | 1.13s | 234.29ms | 228.54ms | 196.57ms | 231.61ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.82s (partial) | 1.70s | 266.58ms | 482.08ms | 267.85ms | 449.06ms |

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
