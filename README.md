# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.22s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.14s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 10.94s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.21s |
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
| avoidablePropagation | 210.55ms | 189.05ms | 148.30ms (fail) | 282.09ms | 208.33ms | 2.46s |
| broadPropagation | 464.92ms | 353.11ms | 5.83ms (fail) | 510.59ms | 461.79ms | 4.40s |
| deepPropagation | 172.70ms | 137.87ms | 136.75ms (fail) | 169.81ms | 179.90ms | 1.51s |
| diamond | 287.87ms | 230.17ms | 195.85ms (fail) | 361.00ms | 311.18ms | 2.41s |
| mux | 396.46ms | 360.09ms | 180.22ms (fail) | 427.30ms | 377.42ms | 1.85s |
| repeatedObservers | 45.98ms | 46.01ms | 52.23ms (fail) | 80.56ms | 40.26ms | 233.76ms |
| triangle | 100.46ms | 85.33ms | 76.11ms (fail) | 114.83ms | 102.50ms | 750.53ms |
| unstable | 78.43ms | 62.69ms | 336.81ms (fail) | 96.03ms | 70.26ms | 348.24ms |
| molBench | 496.53ms | 485.30ms | 986μs | 431.95ms | 480.70ms | 591.92ms |
| create_signals | 27.12ms | 24.68ms | 56.20ms | 75.55ms | 9.64ms | 81.32ms |
| comp_0to1 | 11.97ms | 8.77ms | 51.96ms | 26.91ms | 16.65ms | 20.41ms |
| comp_1to1 | 19.14ms | 4.38ms | 53.01ms | 44.05ms | 6.91ms | 30.64ms |
| comp_2to1 | 19.51ms | 2.55ms | 35.78ms | 18.56ms | 10.61ms | 20.20ms |
| comp_4to1 | 2.20ms | 8.82ms | 15.72ms | 8.38ms | 9.94ms | 26.94ms |
| comp_1000to1 | 5μs | 4μs | 39μs | 42μs | 7μs | 22μs |
| comp_1to2 | 14.64ms | 15.00ms | 43.98ms | 31.51ms | 19.55ms | 37.85ms |
| comp_1to4 | 10.77ms | 6.37ms | 43.66ms | 38.85ms | 37.96ms | 22.31ms |
| comp_1to8 | 6.89ms | 7.69ms | 41.49ms | 24.20ms | 8.36ms | 23.97ms |
| comp_1to1000 | 4.38ms | 3.66ms | 38.12ms | 14.56ms | 6.39ms | 15.58ms |
| update_1to1 | 9.39ms | 5.19ms | 6.11ms | 15.78ms | 8.89ms | 27.53ms |
| update_2to1 | 4.73ms | 2.31ms | 3.65ms | 7.93ms | 4.31ms | 10.78ms |
| update_4to1 | 2.39ms | 1.17ms | 1.56ms | 3.95ms | 2.19ms | 7.42ms |
| update_1000to1 | 24μs | 11μs | 16μs | 39μs | 21μs | 68μs |
| update_1to2 | 4.65ms | 2.28ms | 3.10ms | 7.97ms | 4.36ms | 11.92ms |
| update_1to4 | 2.56ms | 1.21ms | 1.64ms | 3.94ms | 2.24ms | 6.99ms |
| update_1to1000 | 44μs | 50μs | 373μs | 159μs | 66μs | 169μs |
| cellx1000 | 11.12ms | 8.49ms | 6.17ms | 12.23ms | 10.92ms | 72.50ms |
| cellx2500 | 38.14ms | 21.56ms | 30.00ms | 37.36ms | 30.35ms | 254.38ms |
| cellx5000 | 90.06ms | 49.75ms | 75.36ms | 87.74ms | 129.85ms | 582.46ms |
| 10x5 - 2 sources - read 20.0% (simple) | 501.62ms | 233.90ms | 237.77ms | 345.19ms | 433.60ms | 1.93s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.47ms | 172.14ms | 196.77ms | 242.68ms | 270.98ms | 1.47s |
| 1000x12 - 4 sources - dynamic (large) | 3.63s | 285.81ms | 362.93ms | 466.92ms | 3.65s | 1.87s |
| 1000x5 - 25 sources (wide dense) | 3.29s | 416.08ms | 525.16ms | 585.90ms | 2.56s | 3.41s |
| 5x500 - 3 sources (deep) | 224.01ms | 195.11ms | 204.33ms | 259.02ms | 230.26ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 478.77ms | 271.39ms | 255.19ms | 385.02ms | 442.43ms | 1.63s |

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
