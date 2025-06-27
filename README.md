# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.64 | 100.0% | 35/35 | 3.65s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.29s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.34s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.31s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.92s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.40s |

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
| Test Case | solidart(2.0-dev) | state_beacon | preact_signals | signals | mobx | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 276.31ms | 156.37ms (fail) | 200.96ms | 208.66ms | 2.29s | 182.27ms |
| broadPropagation | 509.64ms | 6.11ms (fail) | 446.47ms | 526.08ms | 4.56s | 343.35ms |
| deepPropagation | 173.07ms | 145.55ms (fail) | 178.33ms | 171.44ms | 1.55s | 125.60ms |
| diamond | 365.35ms | 201.36ms (fail) | 276.85ms | 291.30ms | 2.47s | 229.73ms |
| mux | 439.82ms | 190.81ms (fail) | 406.32ms | 410.13ms | 1.91s | 373.56ms |
| repeatedObservers | 81.63ms | 53.78ms (fail) | 39.79ms | 46.28ms | 233.71ms | 47.38ms |
| triangle | 118.85ms | 81.15ms (fail) | 98.13ms | 103.56ms | 763.23ms | 85.10ms |
| unstable | 98.16ms | 346.64ms (fail) | 70.54ms | 81.51ms | 346.63ms | 67.24ms |
| molBench | 495.38ms | 946μs | 488.42ms | 485.34ms | 575.55ms | 482.79ms |
| create_signals | 74.91ms | 58.84ms | 4.58ms | 24.50ms | 60.28ms | 21.12ms |
| comp_0to1 | 28.38ms | 53.23ms | 17.14ms | 11.48ms | 16.50ms | 7.40ms |
| comp_1to1 | 42.13ms | 69.70ms | 14.92ms | 27.49ms | 46.21ms | 4.22ms |
| comp_2to1 | 40.24ms | 35.58ms | 15.75ms | 8.71ms | 22.98ms | 2.30ms |
| comp_4to1 | 10.87ms | 16.79ms | 14.28ms | 1.95ms | 17.09ms | 7.76ms |
| comp_1000to1 | 17μs | 42μs | 5μs | 7μs | 16μs | 23μs |
| comp_1to2 | 29.59ms | 45.52ms | 18.29ms | 15.62ms | 35.00ms | 10.44ms |
| comp_1to4 | 22.77ms | 43.99ms | 32.35ms | 11.43ms | 17.96ms | 8.28ms |
| comp_1to8 | 24.24ms | 42.84ms | 6.45ms | 6.14ms | 20.56ms | 5.37ms |
| comp_1to1000 | 17.18ms | 39.31ms | 5.44ms | 4.26ms | 16.67ms | 3.48ms |
| update_1to1 | 16.00ms | 5.65ms | 8.67ms | 8.86ms | 25.77ms | 10.28ms |
| update_2to1 | 7.81ms | 3.15ms | 4.34ms | 4.46ms | 13.57ms | 2.30ms |
| update_4to1 | 3.99ms | 1.46ms | 2.19ms | 2.25ms | 6.84ms | 2.54ms |
| update_1000to1 | 40μs | 14μs | 21μs | 22μs | 71μs | 23μs |
| update_1to2 | 7.98ms | 2.88ms | 4.62ms | 4.47ms | 11.79ms | 5.03ms |
| update_1to4 | 4.00ms | 1.45ms | 2.54ms | 2.23ms | 6.22ms | 2.47ms |
| update_1to1000 | 170μs | 393μs | 948μs | 42μs | 176μs | 44μs |
| cellx1000 | 11.88ms | 5.23ms | 9.72ms | 9.80ms | 70.98ms | 8.73ms |
| cellx2500 | 36.55ms | 23.34ms | 26.29ms | 31.32ms | 254.47ms | 19.52ms |
| cellx5000 | 72.54ms | 55.22ms | 71.54ms | 59.61ms | 548.50ms | 43.51ms |
| 10x5 - 2 sources - read 20.0% (simple) | 354.44ms | 241.79ms | 435.20ms | 520.43ms | 2.02s | 228.75ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 244.52ms | 197.76ms | 274.20ms | 285.94ms | 1.52s | 173.96ms |
| 1000x12 - 4 sources - dynamic (large) | 462.35ms | 329.30ms | 3.75s | 3.85s | 2.01s | 281.52ms |
| 1000x5 - 25 sources (wide dense) | 580.89ms | 489.23ms | 2.71s | 3.42s | 3.60s | 410.67ms |
| 5x500 - 3 sources (deep) | 250.24ms | 204.29ms | 228.38ms | 226.46ms | 1.15s | 191.19ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 385.57ms | 254.97ms | 450.27ms | 483.51ms | 1.72s | 264.50ms |

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
