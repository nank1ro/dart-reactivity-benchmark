# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.56s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.31s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.02s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.60s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.51s |

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
| Test Case | preact_signals | state_beacon | signals | alien_signals | mobx | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 195.21ms | 145.85ms (fail) | 202.11ms | 188.01ms | 2.38s | 275.80ms |
| broadPropagation | 458.08ms | 6.55ms (fail) | 518.44ms | 349.93ms | 4.43s | 520.20ms |
| deepPropagation | 176.44ms | 139.43ms (fail) | 174.56ms | 123.89ms | 1.53s | 170.97ms |
| diamond | 287.26ms | 180.69ms (fail) | 284.37ms | 229.04ms | 2.39s | 368.45ms |
| mux | 383.96ms | 191.84ms (fail) | 397.79ms | 360.38ms | 1.79s | 429.05ms |
| repeatedObservers | 41.05ms | 52.94ms (fail) | 45.93ms | 43.17ms | 233.54ms | 79.93ms |
| triangle | 98.63ms | 80.73ms (fail) | 100.59ms | 84.29ms | 754.10ms | 116.78ms |
| unstable | 73.98ms | 333.34ms (fail) | 72.80ms | 60.27ms | 351.45ms | 96.14ms |
| molBench | 484.61ms | 988μs | 496.65ms | 487.83ms | 594.27ms | 491.97ms |
| create_signals | 20.32ms | 68.56ms | 29.22ms | 27.05ms | 87.68ms | 100.64ms |
| comp_0to1 | 18.38ms | 60.54ms | 12.83ms | 9.82ms | 30.34ms | 36.76ms |
| comp_1to1 | 6.93ms | 62.92ms | 29.63ms | 4.53ms | 51.77ms | 48.08ms |
| comp_2to1 | 14.77ms | 40.68ms | 11.80ms | 2.51ms | 42.69ms | 39.58ms |
| comp_4to1 | 11.82ms | 16.67ms | 2.15ms | 13.64ms | 22.76ms | 4.25ms |
| comp_1000to1 | 5μs | 43μs | 5μs | 4μs | 15μs | 17μs |
| comp_1to2 | 22.23ms | 46.98ms | 25.46ms | 17.51ms | 37.59ms | 37.95ms |
| comp_1to4 | 33.29ms | 48.38ms | 21.21ms | 7.75ms | 22.24ms | 22.03ms |
| comp_1to8 | 7.77ms | 44.35ms | 6.94ms | 4.59ms | 25.97ms | 25.29ms |
| comp_1to1000 | 6.69ms | 39.91ms | 4.27ms | 3.87ms | 16.05ms | 14.85ms |
| update_1to1 | 9.37ms | 5.75ms | 9.79ms | 10.04ms | 25.03ms | 16.00ms |
| update_2to1 | 4.66ms | 3.00ms | 5.06ms | 2.28ms | 12.30ms | 7.83ms |
| update_4to1 | 2.41ms | 1.49ms | 2.56ms | 2.50ms | 6.76ms | 4.01ms |
| update_1000to1 | 51μs | 15μs | 24μs | 10μs | 59μs | 38μs |
| update_1to2 | 4.67ms | 2.94ms | 4.87ms | 5.00ms | 12.87ms | 8.23ms |
| update_1to4 | 2.35ms | 1.53ms | 2.62ms | 1.11ms | 6.96ms | 4.04ms |
| update_1to1000 | 764μs | 380μs | 78μs | 52μs | 187μs | 146μs |
| cellx1000 | 11.07ms | 6.47ms | 12.83ms | 7.90ms | 105.55ms | 17.64ms |
| cellx2500 | 36.84ms | 28.34ms | 55.39ms | 28.86ms | 358.76ms | 73.41ms |
| cellx5000 | 117.63ms | 81.21ms | 134.53ms | 88.81ms | 689.33ms | 187.07ms |
| 10x5 - 2 sources - read 20.0% (simple) | 438.48ms | 269.35ms | 499.37ms | 234.47ms | 1.93s | 351.22ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 271.30ms | 205.06ms | 287.88ms | 174.79ms | 1.47s | 250.73ms |
| 1000x12 - 4 sources - dynamic (large) | 3.53s | 355.21ms | 3.72s | 283.91ms | 1.90s | 483.92ms |
| 1000x5 - 25 sources (wide dense) | 2.57s | 518.47ms | 3.44s | 409.10ms | 3.42s | 619.42ms |
| 5x500 - 3 sources (deep) | 230.14ms | 205.47ms | 223.51ms | 190.92ms | 1.18s | 257.44ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 455.11ms | 261.30ms | 480.71ms | 272.05ms | 1.70s | 401.92ms |

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
