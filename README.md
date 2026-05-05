# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.79s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.28s |
| 🥉 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.39s |
| 4 | signals | 0.24 | 100.0% | 35/35 | 11.65s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.84s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.35s |

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
| avoidablePropagation | 2.21s | 215.19ms | 184.85ms | 217.60ms | 268.47ms | 151.91ms (fail) |
| broadPropagation | 4.21s | 482.61ms | 354.41ms | 533.77ms | 492.96ms | 6.43ms (fail) |
| deepPropagation | 1.51s | 192.11ms | 117.30ms | 204.12ms | 164.83ms | 148.80ms (fail) |
| diamond | 2.22s | 281.77ms | 270.38ms | 289.16ms | 368.21ms | 191.07ms (fail) |
| mux | 1.72s | 386.67ms | 367.24ms | 386.80ms | 423.57ms | 184.98ms (fail) |
| repeatedObservers | 223.79ms | 46.17ms | 45.47ms | 42.38ms | 88.88ms | 54.88ms (fail) |
| triangle | 724.07ms | 106.93ms | 91.48ms | 106.03ms | 122.72ms | 79.93ms (fail) |
| unstable | 338.07ms | 78.74ms | 61.24ms | 72.96ms | 107.39ms | 339.69ms (fail) |
| molBench | 641.70ms | 547.58ms | 560.58ms | 547.35ms | 568.33ms | 990μs |
| create_signals | 68.42ms | 28.38ms | 30.60ms | 5.78ms | 98.50ms | 64.01ms |
| comp_0to1 | 14.75ms | 12.41ms | 8.87ms | 23.79ms | 35.43ms | 57.29ms |
| comp_1to1 | 40.27ms | 35.59ms | 9.03ms | 14.27ms | 56.08ms | 61.27ms |
| comp_2to1 | 25.38ms | 34.34ms | 4.35ms | 17.46ms | 22.41ms | 37.92ms |
| comp_4to1 | 28.05ms | 26.66ms | 17.86ms | 12.76ms | 9.58ms | 17.04ms |
| comp_1000to1 | 23μs | 7μs | 4μs | 6μs | 18μs | 39μs |
| comp_1to2 | 37.99ms | 18.46ms | 13.85ms | 21.25ms | 36.78ms | 43.51ms |
| comp_1to4 | 16.80ms | 14.37ms | 7.50ms | 23.32ms | 17.55ms | 43.13ms |
| comp_1to8 | 19.92ms | 10.60ms | 6.51ms | 6.57ms | 21.86ms | 41.17ms |
| comp_1to1000 | 14.57ms | 3.64ms | 3.33ms | 3.65ms | 14.48ms | 36.75ms |
| update_1to1 | 23.39ms | 9.48ms | 4.74ms | 9.64ms | 16.80ms | 6.00ms |
| update_2to1 | 11.38ms | 4.68ms | 2.39ms | 4.85ms | 8.44ms | 3.01ms |
| update_4to1 | 5.83ms | 2.43ms | 1.33ms | 2.36ms | 4.21ms | 1.51ms |
| update_1000to1 | 57μs | 23μs | 11μs | 23μs | 42μs | 15μs |
| update_1to2 | 11.31ms | 4.68ms | 2.36ms | 4.75ms | 10.87ms | 3.02ms |
| update_1to4 | 5.76ms | 2.37ms | 1.23ms | 2.42ms | 4.18ms | 1.54ms |
| update_1to1000 | 166μs | 42μs | 27μs | 42μs | 145μs | 355μs |
| cellx1000 | 81.49ms | 9.33ms | 6.85ms | 10.00ms | 11.52ms | 5.17ms |
| cellx2500 | 283.86ms | 27.00ms | 20.06ms | 28.09ms | 32.85ms | 28.28ms |
| cellx5000 | 658.67ms | 68.42ms | 48.26ms | 72.49ms | 79.26ms | 74.99ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.08s | 499.97ms | 244.25ms | 433.16ms | 371.94ms | 247.99ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.47s | 272.64ms | 192.69ms | 263.09ms | 269.41ms | 203.65ms |
| 1000x12 - 4 sources - dynamic (large) | 1.82s | 3.93s | 272.56ms | 3.50s | 423.40ms | 300.77ms |
| 1000x5 - 25 sources (wide dense) | 3.45s | 3.60s | 410.69ms | 2.75s | 639.34ms | 466.19ms |
| 5x500 - 3 sources (deep) | 1.16s | 230.38ms | 193.34ms | 233.23ms | 262.95ms | 202.28ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.71s | 467.08ms | 234.05ms | 438.07ms | 338.03ms | 240.96ms |

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
