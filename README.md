# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.68s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 10.38s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.45s |
| 4 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.38s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 28.40s |
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
| Test Case | solidart(2.0-dev) | signals | mobx | preact_signals | state_beacon | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 274.73ms | 206.82ms | 2.39s | 203.25ms | 148.26ms (fail) | 182.78ms |
| broadPropagation | 504.54ms | 459.63ms | 4.66s | 501.91ms | 5.88ms (fail) | 343.14ms |
| deepPropagation | 174.86ms | 171.35ms | 1.56s | 178.86ms | 142.03ms (fail) | 121.66ms |
| diamond | 354.54ms | 278.69ms | 2.52s | 300.26ms | 183.74ms (fail) | 230.28ms |
| mux | 442.30ms | 448.98ms | 1.90s | 409.12ms | 201.07ms (fail) | 372.88ms |
| repeatedObservers | 82.15ms | 44.80ms | 242.32ms | 40.97ms | 52.77ms (fail) | 45.67ms |
| triangle | 121.86ms | 104.45ms | 796.79ms | 103.28ms | 75.81ms (fail) | 85.70ms |
| unstable | 99.37ms | 79.77ms | 355.16ms | 73.68ms | 335.81ms (fail) | 68.17ms |
| molBench | 493.09ms | 487.14ms | 577.22ms | 489.78ms | 1.24ms | 486.19ms |
| create_signals | 78.53ms | 27.02ms | 72.56ms | 5.26ms | 68.65ms | 29.51ms |
| comp_0to1 | 28.59ms | 11.92ms | 28.21ms | 21.09ms | 60.09ms | 7.90ms |
| comp_1to1 | 40.44ms | 27.80ms | 32.98ms | 12.69ms | 60.71ms | 4.20ms |
| comp_2to1 | 38.96ms | 9.62ms | 42.66ms | 11.52ms | 43.93ms | 2.31ms |
| comp_4to1 | 12.35ms | 2.02ms | 16.70ms | 8.76ms | 17.70ms | 10.06ms |
| comp_1000to1 | 22μs | 5μs | 43μs | 4μs | 42μs | 5μs |
| comp_1to2 | 29.88ms | 21.66ms | 35.42ms | 25.55ms | 48.14ms | 20.10ms |
| comp_1to4 | 28.24ms | 12.08ms | 24.17ms | 24.41ms | 47.31ms | 11.09ms |
| comp_1to8 | 26.88ms | 6.28ms | 25.42ms | 12.96ms | 44.44ms | 4.05ms |
| comp_1to1000 | 17.13ms | 4.27ms | 16.68ms | 5.47ms | 38.33ms | 3.44ms |
| update_1to1 | 16.04ms | 9.05ms | 25.44ms | 8.77ms | 5.69ms | 10.27ms |
| update_2to1 | 7.80ms | 4.72ms | 12.94ms | 4.24ms | 3.69ms | 2.26ms |
| update_4to1 | 5.86ms | 2.26ms | 7.45ms | 2.15ms | 1.56ms | 2.56ms |
| update_1000to1 | 40μs | 22μs | 69μs | 21μs | 15μs | 24μs |
| update_1to2 | 8.00ms | 4.47ms | 13.22ms | 4.61ms | 2.85ms | 5.07ms |
| update_1to4 | 3.99ms | 2.22ms | 6.51ms | 2.17ms | 1.44ms | 2.48ms |
| update_1to1000 | 171μs | 43μs | 185μs | 54μs | 371μs | 43μs |
| cellx1000 | 12.92ms | 9.56ms | 81.37ms | 9.95ms | 5.66ms | 7.30ms |
| cellx2500 | 47.22ms | 35.47ms | 285.38ms | 35.55ms | 30.85ms | 20.15ms |
| cellx5000 | 118.92ms | 84.39ms | 633.99ms | 91.94ms | 77.06ms | 50.22ms |
| 10x5 - 2 sources - read 20.0% (simple) | 360.52ms | 504.66ms | 2.03s | 444.54ms | 242.55ms | 225.77ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 245.71ms | 279.86ms | 1.61s | 269.13ms | 200.21ms | 173.58ms |
| 1000x12 - 4 sources - dynamic (large) | 470.95ms | 3.96s | 1.93s | 3.71s | 346.78ms | 282.54ms |
| 1000x5 - 25 sources (wide dense) | 594.36ms | 3.43s | 3.51s | 2.69s | 510.00ms | 413.83ms |
| 5x500 - 3 sources (deep) | 257.65ms | 228.20ms | 1.20s | 226.26ms | 205.28ms | 190.03ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 384.61ms | 496.54ms | 1.76s | 450.51ms | 258.51ms | 261.68ms |

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
