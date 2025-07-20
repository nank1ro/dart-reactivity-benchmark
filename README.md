# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.67s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.24s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.45s |
| 4 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.25s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 27.78s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.43s |

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
| Test Case | state_beacon | mobx | solidart(2.0-dev) | preact_signals | signals | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 161.93ms (fail) | 2.31s | 273.54ms | 197.23ms | 204.62ms | 185.02ms |
| broadPropagation | 6.21ms (fail) | 4.40s | 509.76ms | 445.66ms | 459.06ms | 351.58ms |
| deepPropagation | 142.94ms (fail) | 1.55s | 168.05ms | 178.50ms | 177.10ms | 116.49ms |
| diamond | 190.16ms (fail) | 2.44s | 350.08ms | 278.73ms | 281.01ms | 230.11ms |
| mux | 199.88ms (fail) | 1.86s | 439.53ms | 413.72ms | 403.53ms | 376.50ms |
| repeatedObservers | 52.32ms (fail) | 243.83ms | 83.90ms | 39.99ms | 44.37ms | 45.45ms |
| triangle | 77.56ms (fail) | 771.71ms | 117.85ms | 99.82ms | 104.75ms | 85.96ms |
| unstable | 336.31ms (fail) | 374.46ms | 98.38ms | 70.07ms | 78.68ms | 66.84ms |
| molBench | 899μs | 570.02ms | 492.62ms | 487.06ms | 485.25ms | 481.92ms |
| create_signals | 63.67ms | 82.86ms | 57.31ms | 4.69ms | 24.21ms | 28.48ms |
| comp_0to1 | 55.57ms | 16.40ms | 30.91ms | 17.10ms | 11.42ms | 7.91ms |
| comp_1to1 | 60.96ms | 47.07ms | 49.38ms | 11.39ms | 27.22ms | 4.13ms |
| comp_2to1 | 42.92ms | 23.13ms | 24.94ms | 11.76ms | 9.00ms | 2.30ms |
| comp_4to1 | 17.77ms | 17.58ms | 14.03ms | 9.39ms | 1.92ms | 10.02ms |
| comp_1000to1 | 43μs | 21μs | 17μs | 5μs | 4μs | 3μs |
| comp_1to2 | 47.65ms | 33.61ms | 29.45ms | 18.04ms | 17.64ms | 11.03ms |
| comp_1to4 | 47.45ms | 22.29ms | 23.07ms | 18.87ms | 9.26ms | 8.76ms |
| comp_1to8 | 43.10ms | 23.69ms | 24.14ms | 6.84ms | 6.04ms | 4.96ms |
| comp_1to1000 | 39.62ms | 16.24ms | 16.90ms | 3.85ms | 4.25ms | 3.40ms |
| update_1to1 | 5.68ms | 27.77ms | 15.96ms | 8.61ms | 8.95ms | 10.31ms |
| update_2to1 | 3.11ms | 12.12ms | 7.79ms | 4.25ms | 4.50ms | 2.26ms |
| update_4to1 | 1.41ms | 7.29ms | 4.00ms | 2.13ms | 2.25ms | 2.59ms |
| update_1000to1 | 14μs | 70μs | 51μs | 21μs | 22μs | 25μs |
| update_1to2 | 2.82ms | 12.85ms | 7.99ms | 4.59ms | 4.47ms | 5.27ms |
| update_1to4 | 1.44ms | 5.53ms | 4.00ms | 2.15ms | 2.25ms | 2.48ms |
| update_1to1000 | 377μs | 183μs | 171μs | 58μs | 42μs | 45μs |
| cellx1000 | 5.28ms | 72.44ms | 12.05ms | 9.66ms | 9.52ms | 8.39ms |
| cellx2500 | 23.72ms | 253.32ms | 32.07ms | 25.27ms | 30.82ms | 20.86ms |
| cellx5000 | 74.02ms | 563.48ms | 71.17ms | 60.76ms | 59.62ms | 40.51ms |
| 10x5 - 2 sources - read 20.0% (simple) | 246.72ms | 2.05s | 369.07ms | 457.11ms | 529.25ms | 237.06ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 198.34ms | 1.59s | 242.58ms | 273.38ms | 289.16ms | 179.10ms |
| 1000x12 - 4 sources - dynamic (large) | 340.55ms | 1.92s | 457.93ms | 3.69s | 3.86s | 277.43ms |
| 1000x5 - 25 sources (wide dense) | 474.84ms | 3.59s | 589.04ms | 2.72s | 3.59s | 408.99ms |
| 5x500 - 3 sources (deep) | 204.78ms | 1.14s | 249.92ms | 225.02ms | 223.70ms | 189.15ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 260.26ms | 1.73s | 380.44ms | 446.20ms | 479.59ms | 264.25ms |

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
