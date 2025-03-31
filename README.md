# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.24s |
| 🥉 | preact_signals | 0.29 | 100.0% | 35/35 | 9.96s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.30s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.11s |
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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 272.35ms | 206.19ms | 2.31s | 184.65ms | 206.77ms | 149.05ms (fail) |
| broadPropagation | 505.26ms | 459.60ms | 4.70s | 349.24ms | 451.18ms | 5.77ms (fail) |
| deepPropagation | 169.48ms | 178.33ms | 1.54s | 124.52ms | 175.86ms | 134.75ms (fail) |
| diamond | 351.03ms | 281.85ms | 2.58s | 239.32ms | 293.82ms | 183.65ms (fail) |
| mux | 436.88ms | 390.52ms | 1.89s | 374.16ms | 405.20ms | 191.85ms (fail) |
| repeatedObservers | 78.90ms | 39.13ms | 226.41ms | 44.93ms | 46.13ms | 53.26ms (fail) |
| triangle | 114.65ms | 100.11ms | 805.61ms | 85.54ms | 102.38ms | 75.80ms (fail) |
| unstable | 94.83ms | 71.17ms | 365.73ms | 60.84ms | 73.27ms | 337.66ms (fail) |
| molBench | 493.36ms | 492.30ms | 590.48ms | 492.10ms | 487.71ms | 1.32ms |
| create_signals | 50.70ms | 5.28ms | 88.97ms | 27.54ms | 25.45ms | 63.80ms |
| comp_0to1 | 25.71ms | 17.34ms | 27.17ms | 8.12ms | 11.87ms | 64.07ms |
| comp_1to1 | 41.62ms | 11.43ms | 30.22ms | 9.19ms | 25.55ms | 56.60ms |
| comp_2to1 | 23.93ms | 16.77ms | 28.29ms | 2.29ms | 14.49ms | 37.78ms |
| comp_4to1 | 7.79ms | 12.19ms | 17.11ms | 10.55ms | 1.92ms | 17.11ms |
| comp_1000to1 | 14μs | 4μs | 20μs | 3μs | 5μs | 45μs |
| comp_1to2 | 24.91ms | 27.65ms | 32.87ms | 12.38ms | 20.98ms | 47.72ms |
| comp_1to4 | 15.46ms | 20.72ms | 17.35ms | 7.00ms | 9.89ms | 49.61ms |
| comp_1to8 | 20.61ms | 8.23ms | 19.12ms | 6.31ms | 13.43ms | 45.83ms |
| comp_1to1000 | 14.89ms | 7.34ms | 14.79ms | 3.52ms | 6.87ms | 41.16ms |
| update_1to1 | 16.16ms | 8.22ms | 23.70ms | 11.23ms | 9.28ms | 5.78ms |
| update_2to1 | 7.94ms | 4.05ms | 10.71ms | 5.09ms | 4.59ms | 5.54ms |
| update_4to1 | 4.06ms | 2.08ms | 6.31ms | 2.98ms | 2.31ms | 1.47ms |
| update_1000to1 | 40μs | 20μs | 65μs | 10μs | 22μs | 15μs |
| update_1to2 | 8.15ms | 4.13ms | 10.60ms | 5.57ms | 4.88ms | 2.94ms |
| update_1to4 | 4.05ms | 2.07ms | 5.63ms | 2.50ms | 2.30ms | 1.47ms |
| update_1to1000 | 149μs | 54μs | 175μs | 48μs | 43μs | 402μs |
| cellx1000 | 11.97ms | 9.64ms | 77.89ms | 7.33ms | 9.65ms | 5.14ms |
| cellx2500 | 32.00ms | 26.16ms | 258.55ms | 20.44ms | 34.20ms | 25.50ms |
| cellx5000 | 66.61ms | 65.66ms | 587.39ms | 48.93ms | 74.82ms | 65.87ms |
| 10x5 - 2 sources - read 20.0% (simple) | 397.32ms | 442.01ms | 1.99s | 229.92ms | 513.85ms | 236.20ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 251.19ms | 271.03ms | 1.51s | 179.55ms | 283.35ms | 199.75ms |
| 1000x12 - 4 sources - dynamic (large) | 468.15ms | 3.51s | 1.89s | 285.19ms | 3.75s | 346.02ms |
| 1000x5 - 25 sources (wide dense) | 586.36ms | 2.59s | 3.51s | 399.78ms | 3.53s | 503.40ms |
| 5x500 - 3 sources (deep) | 256.90ms | 233.38ms | 1.17s | 194.62ms | 225.17ms | 203.95ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 390.04ms | 447.84ms | 1.77s | 257.11ms | 480.67ms | 257.04ms |

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
