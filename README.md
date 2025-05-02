# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.64 | 100.0% | 35/35 | 3.83s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.24s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 9.81s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.54s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.56s |
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
| Test Case | solidart(2.0-dev) | preact_signals | alien_signals | state_beacon | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 276.24ms | 204.27ms | 190.39ms | 182.96ms (fail) | 2.32s | 208.97ms |
| broadPropagation | 503.35ms | 451.91ms | 361.39ms | 6.01ms (fail) | 4.25s | 469.49ms |
| deepPropagation | 177.46ms | 176.31ms | 186.80ms | 142.71ms (fail) | 1.53s | 182.85ms |
| diamond | 348.60ms | 280.12ms | 238.90ms | 188.28ms (fail) | 2.39s | 285.53ms |
| mux | 435.52ms | 387.70ms | 372.46ms | 191.32ms (fail) | 1.81s | 411.68ms |
| repeatedObservers | 78.11ms | 39.59ms | 45.19ms | 53.37ms (fail) | 227.06ms | 46.16ms |
| triangle | 118.90ms | 98.66ms | 109.04ms | 79.24ms (fail) | 764.81ms | 101.62ms |
| unstable | 93.95ms | 70.36ms | 60.98ms | 337.50ms (fail) | 348.20ms | 70.85ms |
| molBench | 493.11ms | 491.17ms | 490.04ms | 1.17ms | 575.45ms | 487.42ms |
| create_signals | 85.51ms | 5.03ms | 27.81ms | 58.27ms | 49.64ms | 24.93ms |
| comp_0to1 | 38.56ms | 17.19ms | 8.01ms | 50.94ms | 15.17ms | 11.78ms |
| comp_1to1 | 26.90ms | 11.87ms | 4.11ms | 52.30ms | 43.50ms | 17.45ms |
| comp_2to1 | 38.15ms | 11.39ms | 2.32ms | 34.71ms | 22.22ms | 11.18ms |
| comp_4to1 | 11.13ms | 11.51ms | 8.44ms | 16.20ms | 13.88ms | 1.79ms |
| comp_1000to1 | 18μs | 9μs | 4μs | 41μs | 15μs | 9μs |
| comp_1to2 | 26.14ms | 18.84ms | 11.18ms | 43.93ms | 36.12ms | 19.34ms |
| comp_1to4 | 25.80ms | 31.53ms | 9.80ms | 43.10ms | 22.19ms | 12.57ms |
| comp_1to8 | 24.92ms | 6.84ms | 5.22ms | 42.06ms | 21.91ms | 10.92ms |
| comp_1to1000 | 15.46ms | 6.14ms | 4.72ms | 38.28ms | 15.02ms | 4.63ms |
| update_1to1 | 16.23ms | 8.40ms | 10.21ms | 5.79ms | 24.38ms | 9.40ms |
| update_2to1 | 7.90ms | 4.08ms | 5.07ms | 2.87ms | 10.47ms | 4.68ms |
| update_4to1 | 4.03ms | 2.08ms | 2.75ms | 1.48ms | 5.97ms | 2.34ms |
| update_1000to1 | 41μs | 20μs | 18μs | 15μs | 63μs | 22μs |
| update_1to2 | 8.06ms | 4.09ms | 5.62ms | 2.95ms | 11.06ms | 4.94ms |
| update_1to4 | 4.04ms | 2.06ms | 2.48ms | 1.47ms | 5.28ms | 2.40ms |
| update_1to1000 | 156μs | 929μs | 46μs | 371μs | 177μs | 43μs |
| cellx1000 | 10.85ms | 9.52ms | 9.05ms | 5.09ms | 67.96ms | 9.42ms |
| cellx2500 | 29.07ms | 24.80ms | 21.16ms | 25.77ms | 229.35ms | 30.53ms |
| cellx5000 | 62.75ms | 68.08ms | 47.46ms | 64.53ms | 528.94ms | 61.04ms |
| 10x5 - 2 sources - read 20.0% (simple) | 352.59ms | 440.93ms | 241.34ms | 240.87ms | 2.08s | 544.00ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 243.11ms | 275.89ms | 184.09ms | 196.53ms | 1.66s | 289.32ms |
| 1000x12 - 4 sources - dynamic (large) | 457.15ms | 3.38s | 287.30ms | 337.00ms | 1.92s | 3.91s |
| 1000x5 - 25 sources (wide dense) | 593.79ms | 2.59s | 423.43ms | 499.38ms | 3.66s | 3.57s |
| 5x500 - 3 sources (deep) | 253.40ms | 230.83ms | 190.12ms | 204.27ms | 1.16s | 245.52ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 380.36ms | 445.84ms | 264.15ms | 266.54ms | 1.76s | 478.35ms |

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
