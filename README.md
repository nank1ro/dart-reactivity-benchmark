# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.27s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.20s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.24s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.60s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.47s |

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
| Test Case | state_beacon | alien_signals | mobx | solidart(2.0-dev) | signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 162.10ms (fail) | 184.46ms | 2.32s | 271.86ms | 208.68ms | 201.91ms |
| broadPropagation | 6.03ms (fail) | 343.87ms | 4.46s | 503.02ms | 455.64ms | 451.59ms |
| deepPropagation | 137.27ms (fail) | 122.39ms | 1.55s | 166.60ms | 169.11ms | 176.35ms |
| diamond | 184.75ms (fail) | 230.10ms | 2.44s | 345.35ms | 278.44ms | 278.89ms |
| mux | 194.60ms (fail) | 369.26ms | 1.86s | 454.27ms | 404.69ms | 406.53ms |
| repeatedObservers | 54.51ms (fail) | 45.36ms | 231.56ms | 81.55ms | 44.55ms | 39.86ms |
| triangle | 75.88ms (fail) | 84.81ms | 767.52ms | 118.93ms | 101.34ms | 98.32ms |
| unstable | 341.39ms (fail) | 66.88ms | 347.65ms | 96.31ms | 79.02ms | 70.27ms |
| molBench | 1.11ms | 484.47ms | 572.24ms | 493.07ms | 485.43ms | 489.71ms |
| create_signals | 72.57ms | 28.00ms | 74.61ms | 75.06ms | 25.49ms | 4.70ms |
| comp_0to1 | 66.11ms | 6.81ms | 20.40ms | 33.91ms | 11.37ms | 17.31ms |
| comp_1to1 | 60.56ms | 4.18ms | 31.52ms | 29.85ms | 17.86ms | 14.51ms |
| comp_2to1 | 39.47ms | 2.32ms | 20.46ms | 33.63ms | 18.35ms | 16.85ms |
| comp_4to1 | 18.23ms | 8.55ms | 28.06ms | 5.00ms | 6.09ms | 8.88ms |
| comp_1000to1 | 47μs | 3μs | 17μs | 21μs | 5μs | 4μs |
| comp_1to2 | 51.31ms | 20.50ms | 35.93ms | 29.21ms | 21.73ms | 24.02ms |
| comp_1to4 | 49.94ms | 11.08ms | 25.29ms | 27.28ms | 14.31ms | 20.55ms |
| comp_1to8 | 48.76ms | 6.79ms | 21.85ms | 26.59ms | 6.08ms | 7.67ms |
| comp_1to1000 | 45.28ms | 3.53ms | 16.06ms | 16.87ms | 4.16ms | 8.70ms |
| update_1to1 | 5.64ms | 10.41ms | 25.36ms | 15.98ms | 8.87ms | 8.64ms |
| update_2to1 | 3.11ms | 2.43ms | 12.30ms | 7.84ms | 4.58ms | 4.39ms |
| update_4to1 | 1.44ms | 2.53ms | 6.35ms | 4.01ms | 2.24ms | 2.17ms |
| update_1000to1 | 15μs | 25μs | 72μs | 40μs | 22μs | 21μs |
| update_1to2 | 2.85ms | 5.04ms | 11.04ms | 8.02ms | 4.46ms | 4.65ms |
| update_1to4 | 1.46ms | 2.48ms | 5.79ms | 4.01ms | 2.23ms | 2.17ms |
| update_1to1000 | 444μs | 45μs | 174μs | 180μs | 42μs | 2.93ms |
| cellx1000 | 5.04ms | 7.29ms | 72.28ms | 11.67ms | 9.56ms | 9.66ms |
| cellx2500 | 27.45ms | 20.61ms | 250.22ms | 35.96ms | 30.55ms | 26.43ms |
| cellx5000 | 70.25ms | 54.75ms | 558.64ms | 77.72ms | 62.11ms | 68.49ms |
| 10x5 - 2 sources - read 20.0% (simple) | 237.24ms | 231.37ms | 2.02s | 365.20ms | 518.55ms | 439.74ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 200.97ms | 181.46ms | 1.52s | 249.56ms | 283.28ms | 270.23ms |
| 1000x12 - 4 sources - dynamic (large) | 342.82ms | 288.68ms | 1.84s | 466.24ms | 3.74s | 3.69s |
| 1000x5 - 25 sources (wide dense) | 503.40ms | 410.23ms | 3.60s | 583.82ms | 3.49s | 2.70s |
| 5x500 - 3 sources (deep) | 201.92ms | 187.03ms | 1.17s | 253.99ms | 222.10ms | 233.01ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 260.99ms | 263.29ms | 1.67s | 382.26ms | 481.14ms | 444.41ms |

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
