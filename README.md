# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.65s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 9.76s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.10s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.44s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.74s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.50s |

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
| Test Case | solidart | mobx | state_beacon | signals | alien_signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.21s | 2.32s | 171.02ms (fail) | 210.48ms | 187.86ms | 210.73ms |
| broadPropagation | 5.49s | 4.39s | 6.40ms (fail) | 459.49ms | 346.86ms | 454.59ms |
| deepPropagation | 2.03s | 1.56s | 143.09ms (fail) | 174.05ms | 121.27ms | 175.39ms |
| diamond | 3.45s | 2.43s | 183.84ms (fail) | 288.36ms | 236.48ms | 278.88ms |
| mux | 2.06s | 1.82s | 193.75ms (fail) | 427.99ms | 380.10ms | 385.57ms |
| repeatedObservers | 210.78ms | 243.76ms | 53.42ms (fail) | 45.99ms | 43.62ms | 40.99ms |
| triangle | 1.13s | 787.52ms | 78.46ms (fail) | 102.09ms | 86.87ms | 98.17ms |
| unstable | 344.13ms | 352.01ms | 337.13ms (fail) | 77.29ms | 59.61ms | 67.33ms |
| molBench | 1.76s | 590.31ms | 883μs | 485.90ms | 487.57ms | 483.18ms |
| create_signals | 75.82ms | 67.70ms | 73.47ms | 29.08ms | 20.20ms | 4.64ms |
| comp_0to1 | 31.49ms | 19.98ms | 53.45ms | 12.99ms | 4.92ms | 17.07ms |
| comp_1to1 | 46.96ms | 43.32ms | 53.41ms | 18.55ms | 9.39ms | 15.03ms |
| comp_2to1 | 20.95ms | 9.80ms | 34.27ms | 10.37ms | 4.25ms | 12.04ms |
| comp_4to1 | 22.20ms | 24.66ms | 18.00ms | 3.16ms | 8.94ms | 13.56ms |
| comp_1000to1 | 2.23ms | 16μs | 45μs | 8μs | 3μs | 6μs |
| comp_1to2 | 35.38ms | 30.36ms | 46.59ms | 20.35ms | 9.21ms | 15.98ms |
| comp_1to4 | 22.11ms | 19.20ms | 43.39ms | 7.54ms | 8.01ms | 20.03ms |
| comp_1to8 | 22.60ms | 21.52ms | 43.78ms | 6.66ms | 4.82ms | 11.22ms |
| comp_1to1000 | 19.11ms | 15.38ms | 39.92ms | 4.56ms | 3.76ms | 5.09ms |
| update_1to1 | 44.69ms | 25.85ms | 10.70ms | 9.37ms | 5.82ms | 8.80ms |
| update_2to1 | 21.76ms | 14.59ms | 2.94ms | 4.67ms | 2.18ms | 4.35ms |
| update_4to1 | 10.73ms | 7.35ms | 2.28ms | 2.36ms | 1.09ms | 2.19ms |
| update_1000to1 | 134μs | 64μs | 14μs | 23μs | 11μs | 31μs |
| update_1to2 | 21.59ms | 13.99ms | 2.96ms | 4.73ms | 2.21ms | 4.35ms |
| update_1to4 | 10.92ms | 6.99ms | 1.85ms | 2.35ms | 1.41ms | 2.19ms |
| update_1to1000 | 222μs | 174μs | 416μs | 45μs | 29μs | 41μs |
| cellx1000 | 157.67ms | 72.79ms | 5.46ms | 9.59ms | 8.61ms | 9.84ms |
| cellx2500 | 484.28ms | 254.32ms | 23.38ms | 31.10ms | 20.45ms | 27.46ms |
| cellx5000 | 1.06s | 571.97ms | 65.06ms | 61.24ms | 42.84ms | 67.35ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.71s (partial) | 2.03s | 241.95ms | 509.26ms | 225.87ms | 430.16ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.39s (partial) | 1.52s | 212.55ms | 278.03ms | 172.63ms | 270.89ms |
| 1000x12 - 4 sources - dynamic (large) | 4.07s (partial) | 1.81s | 334.08ms | 3.74s | 278.50ms | 3.43s |
| 1000x5 - 25 sources (wide dense) | 4.96s (partial) | 3.52s | 519.98ms | 3.36s | 402.97ms | 2.52s |
| 5x500 - 3 sources (deep) | 1.96s (partial) | 1.13s | 232.35ms | 231.27ms | 204.51ms | 232.54ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.85s (partial) | 1.72s | 264.70ms | 474.72ms | 261.18ms | 442.75ms |

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
