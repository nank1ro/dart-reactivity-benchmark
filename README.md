# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.36s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 8.87s |
| 🥉 | signals | 0.29 | 100.0% | 35/35 | 9.29s |
| 4 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 4.92s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.93s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.12s |

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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.46s | 199.28ms | 170.61ms | 184.88ms | 242.93ms | 134.81ms (fail) |
| broadPropagation | 4.12s | 380.50ms | 303.59ms | 383.90ms | 460.90ms | 5.53ms (fail) |
| deepPropagation | 1.45s | 180.54ms | 107.88ms | 181.45ms | 151.83ms | 154.79ms (fail) |
| diamond | 2.34s | 259.56ms | 233.79ms | 252.79ms | 345.48ms | 176.06ms (fail) |
| mux | 1.79s | 332.03ms | 332.16ms | 327.56ms | 385.14ms | 161.32ms (fail) |
| repeatedObservers | 247.20ms | 39.84ms | 39.57ms | 33.53ms | 72.83ms | 45.66ms (fail) |
| triangle | 769.33ms | 92.67ms | 80.08ms | 92.31ms | 111.59ms | 75.42ms (fail) |
| unstable | 336.03ms | 66.62ms | 59.63ms | 58.66ms | 97.39ms | 322.02ms (fail) |
| molBench | 458.10ms | 366.52ms | 364.47ms | 389.94ms | 371.20ms | 860μs |
| create_signals | 75.46ms | 24.77ms | 32.71ms | 6.92ms | 75.83ms | 64.05ms |
| comp_0to1 | 24.28ms | 12.18ms | 9.32ms | 21.12ms | 34.27ms | 53.88ms |
| comp_1to1 | 34.20ms | 20.73ms | 5.84ms | 17.90ms | 52.80ms | 55.90ms |
| comp_2to1 | 12.93ms | 9.02ms | 3.55ms | 12.80ms | 25.30ms | 40.92ms |
| comp_4to1 | 28.54ms | 2.79ms | 10.59ms | 16.26ms | 16.89ms | 17.16ms |
| comp_1000to1 | 18μs | 7μs | 5μs | 6μs | 18μs | 51μs |
| comp_1to2 | 41.97ms | 24.23ms | 18.65ms | 22.93ms | 37.42ms | 47.70ms |
| comp_1to4 | 33.70ms | 14.40ms | 8.42ms | 25.68ms | 18.32ms | 46.59ms |
| comp_1to8 | 26.68ms | 8.41ms | 8.16ms | 8.53ms | 22.47ms | 45.95ms |
| comp_1to1000 | 16.98ms | 7.60ms | 5.26ms | 6.38ms | 15.40ms | 42.83ms |
| update_1to1 | 20.41ms | 8.31ms | 3.79ms | 8.42ms | 14.50ms | 4.53ms |
| update_2to1 | 10.08ms | 4.61ms | 1.81ms | 3.55ms | 7.35ms | 2.40ms |
| update_4to1 | 5.56ms | 2.17ms | 1.21ms | 2.05ms | 3.61ms | 1.08ms |
| update_1000to1 | 49μs | 20μs | 9μs | 17μs | 38μs | 12μs |
| update_1to2 | 10.18ms | 4.30ms | 1.93ms | 3.99ms | 7.23ms | 2.23ms |
| update_1to4 | 4.79ms | 2.00ms | 981μs | 1.98ms | 3.64ms | 1.13ms |
| update_1to1000 | 170μs | 57μs | 47μs | 59μs | 148μs | 390μs |
| cellx1000 | 89.74ms | 11.61ms | 9.84ms | 11.48ms | 20.50ms | 9.54ms |
| cellx2500 | 278.18ms | 37.58ms | 29.29ms | 32.59ms | 57.45ms | 31.15ms |
| cellx5000 | 599.13ms | 82.50ms | 72.72ms | 89.67ms | 141.09ms | 88.99ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.05s | 427.67ms | 231.91ms | 398.81ms | 361.42ms | 222.88ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.48s | 241.03ms | 171.33ms | 236.55ms | 252.22ms | 172.65ms |
| 1000x12 - 4 sources - dynamic (large) | 1.77s | 3.20s | 251.88ms | 3.09s | 370.89ms | 282.20ms |
| 1000x5 - 25 sources (wide dense) | 3.45s | 2.62s | 354.44ms | 2.32s | 548.13ms | 380.08ms |
| 5x500 - 3 sources (deep) | 1.20s | 218.31ms | 211.67ms | 231.42ms | 280.39ms | 206.90ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.69s | 390.42ms | 223.77ms | 394.42ms | 309.11ms | 219.63ms |

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
