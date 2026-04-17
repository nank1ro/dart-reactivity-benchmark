# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.19s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.35s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 10.99s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.83s |
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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.27s | 204.51ms | 195.71ms | 208.38ms | 272.27ms | 149.33ms (fail) |
| broadPropagation | 4.32s | 466.94ms | 361.35ms | 465.04ms | 496.16ms | 5.76ms (fail) |
| deepPropagation | 1.54s | 173.00ms | 126.38ms | 174.06ms | 166.86ms | 136.13ms (fail) |
| diamond | 2.32s | 290.56ms | 244.25ms | 283.55ms | 351.36ms | 188.24ms (fail) |
| mux | 1.79s | 396.27ms | 366.48ms | 373.53ms | 415.05ms | 184.64ms (fail) |
| repeatedObservers | 228.98ms | 45.68ms | 45.54ms | 42.10ms | 80.88ms | 58.54ms (fail) |
| triangle | 757.89ms | 101.17ms | 88.31ms | 98.94ms | 115.50ms | 76.16ms (fail) |
| unstable | 337.87ms | 76.10ms | 61.35ms | 71.99ms | 94.92ms | 335.25ms (fail) |
| molBench | 584.41ms | 494.58ms | 480.53ms | 497.94ms | 490.18ms | 1.01ms |
| create_signals | 70.16ms | 25.32ms | 26.91ms | 4.64ms | 71.86ms | 63.77ms |
| comp_0to1 | 14.98ms | 12.84ms | 7.71ms | 17.69ms | 26.50ms | 61.63ms |
| comp_1to1 | 49.25ms | 23.67ms | 4.20ms | 12.79ms | 27.24ms | 61.20ms |
| comp_2to1 | 28.37ms | 9.20ms | 2.26ms | 9.01ms | 29.38ms | 38.68ms |
| comp_4to1 | 30.73ms | 9.06ms | 7.40ms | 13.24ms | 11.23ms | 16.28ms |
| comp_1000to1 | 27μs | 7μs | 3μs | 4μs | 15μs | 42μs |
| comp_1to2 | 36.06ms | 16.72ms | 10.17ms | 14.88ms | 35.68ms | 45.11ms |
| comp_1to4 | 19.53ms | 13.50ms | 8.85ms | 34.13ms | 20.47ms | 43.96ms |
| comp_1to8 | 24.02ms | 6.46ms | 5.12ms | 7.17ms | 21.27ms | 44.13ms |
| comp_1to1000 | 14.79ms | 4.09ms | 3.26ms | 4.64ms | 14.34ms | 39.51ms |
| update_1to1 | 21.12ms | 9.00ms | 4.64ms | 9.23ms | 15.85ms | 9.81ms |
| update_2to1 | 10.41ms | 4.47ms | 2.36ms | 4.60ms | 7.91ms | 2.84ms |
| update_4to1 | 5.57ms | 2.23ms | 1.28ms | 2.34ms | 3.95ms | 2.04ms |
| update_1000to1 | 65μs | 22μs | 11μs | 24μs | 39μs | 14μs |
| update_1to2 | 10.39ms | 4.42ms | 2.33ms | 4.53ms | 8.07ms | 5.32ms |
| update_1to4 | 5.20ms | 2.27ms | 1.22ms | 2.44ms | 3.96ms | 1.46ms |
| update_1to1000 | 157μs | 77μs | 46μs | 143μs | 148μs | 395μs |
| cellx1000 | 67.93ms | 9.68ms | 8.26ms | 9.77ms | 11.86ms | 5.20ms |
| cellx2500 | 233.36ms | 31.75ms | 19.55ms | 25.62ms | 30.43ms | 21.21ms |
| cellx5000 | 536.06ms | 57.71ms | 40.16ms | 63.93ms | 63.55ms | 55.54ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.02s | 503.15ms | 237.60ms | 448.73ms | 374.54ms | 240.86ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.50s | 279.24ms | 198.48ms | 270.25ms | 248.02ms | 199.15ms |
| 1000x12 - 4 sources - dynamic (large) | 1.85s | 3.79s | 302.54ms | 3.73s | 453.98ms | 330.13ms |
| 1000x5 - 25 sources (wide dense) | 3.35s | 3.24s | 410.06ms | 2.76s | 592.91ms | 516.49ms |
| 5x500 - 3 sources (deep) | 1.11s | 223.05ms | 200.91ms | 232.79ms | 255.41ms | 205.10ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.66s | 464.98ms | 270.38ms | 446.33ms | 381.95ms | 256.63ms |

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
