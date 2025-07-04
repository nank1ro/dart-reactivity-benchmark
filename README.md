# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.68s |
| 🥈 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.28s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.60s |
| 4 | preact_signals | 0.27 | 100.0% | 35/35 | 10.45s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.55s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.49s |

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
| avoidablePropagation | 279.78ms | 166.03ms (fail) | 197.80ms | 209.66ms | 2.29s | 182.94ms |
| broadPropagation | 505.33ms | 6.38ms (fail) | 453.61ms | 461.98ms | 4.52s | 346.07ms |
| deepPropagation | 171.08ms | 144.80ms (fail) | 176.25ms | 171.81ms | 1.54s | 117.58ms |
| diamond | 355.87ms | 200.66ms (fail) | 280.20ms | 281.52ms | 2.42s | 230.03ms |
| mux | 441.81ms | 194.42ms (fail) | 403.19ms | 409.69ms | 1.83s | 367.47ms |
| repeatedObservers | 81.85ms | 52.42ms (fail) | 39.68ms | 44.92ms | 228.76ms | 45.37ms |
| triangle | 119.63ms | 81.33ms (fail) | 98.90ms | 100.02ms | 759.54ms | 84.94ms |
| unstable | 97.19ms | 336.58ms (fail) | 70.55ms | 78.81ms | 354.12ms | 67.06ms |
| molBench | 493.69ms | 983μs | 483.03ms | 485.91ms | 571.12ms | 486.56ms |
| create_signals | 54.40ms | 60.27ms | 5.31ms | 26.02ms | 84.44ms | 27.54ms |
| comp_0to1 | 27.84ms | 53.48ms | 17.63ms | 11.60ms | 16.34ms | 10.72ms |
| comp_1to1 | 29.29ms | 55.21ms | 12.62ms | 27.39ms | 41.73ms | 9.29ms |
| comp_2to1 | 37.70ms | 36.58ms | 17.19ms | 20.51ms | 35.50ms | 15.23ms |
| comp_4to1 | 11.99ms | 16.65ms | 15.45ms | 5.51ms | 13.85ms | 1.63ms |
| comp_1000to1 | 17μs | 42μs | 7μs | 6μs | 34μs | 5μs |
| comp_1to2 | 31.89ms | 45.02ms | 23.23ms | 15.45ms | 33.95ms | 8.98ms |
| comp_1to4 | 23.32ms | 43.64ms | 28.89ms | 17.61ms | 23.36ms | 8.09ms |
| comp_1to8 | 24.68ms | 42.58ms | 6.16ms | 6.36ms | 24.01ms | 8.55ms |
| comp_1to1000 | 17.23ms | 38.47ms | 6.19ms | 4.18ms | 16.29ms | 3.26ms |
| update_1to1 | 16.20ms | 6.55ms | 8.72ms | 8.88ms | 26.20ms | 10.27ms |
| update_2to1 | 7.88ms | 3.80ms | 4.32ms | 4.55ms | 12.71ms | 2.32ms |
| update_4to1 | 4.04ms | 1.71ms | 2.20ms | 2.37ms | 6.42ms | 2.50ms |
| update_1000to1 | 40μs | 18μs | 22μs | 22μs | 70μs | 24μs |
| update_1to2 | 8.11ms | 3.39ms | 4.59ms | 4.51ms | 13.47ms | 5.09ms |
| update_1to4 | 4.04ms | 1.72ms | 2.18ms | 2.25ms | 6.85ms | 2.22ms |
| update_1to1000 | 174μs | 376μs | 928μs | 42μs | 174μs | 41μs |
| cellx1000 | 12.78ms | 5.82ms | 10.16ms | 9.93ms | 76.34ms | 7.16ms |
| cellx2500 | 37.40ms | 24.66ms | 31.23ms | 34.59ms | 275.29ms | 19.89ms |
| cellx5000 | 93.10ms | 71.45ms | 85.67ms | 73.96ms | 628.44ms | 49.43ms |
| 10x5 - 2 sources - read 20.0% (simple) | 360.94ms | 253.52ms | 440.80ms | 522.17ms | 2.00s | 225.19ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 250.13ms | 216.96ms | 276.67ms | 280.15ms | 1.53s | 173.97ms |
| 1000x12 - 4 sources - dynamic (large) | 464.84ms | 353.18ms | 3.84s | 3.99s | 1.81s | 285.60ms |
| 1000x5 - 25 sources (wide dense) | 584.16ms | 502.93ms | 2.71s | 3.58s | 3.48s | 413.63ms |
| 5x500 - 3 sources (deep) | 252.84ms | 205.33ms | 231.28ms | 226.40ms | 1.17s | 190.92ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 383.71ms | 261.23ms | 459.03ms | 479.20ms | 1.71s | 265.60ms |

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
