# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.72s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.40s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.58s |
| 4 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.40s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.31s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.52s |

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
| Test Case | mobx | state_beacon | preact_signals | alien_signals | solidart(2.0-dev) | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.33s | 163.23ms (fail) | 202.69ms | 194.91ms | 271.19ms | 214.29ms |
| broadPropagation | 4.33s | 6.51ms (fail) | 463.23ms | 355.08ms | 491.29ms | 462.96ms |
| deepPropagation | 1.52s | 140.32ms (fail) | 176.32ms | 130.86ms | 162.36ms | 182.20ms |
| diamond | 2.40s | 184.59ms (fail) | 281.76ms | 237.78ms | 358.05ms | 300.69ms |
| mux | 1.85s | 193.64ms (fail) | 394.10ms | 376.81ms | 427.35ms | 407.35ms |
| repeatedObservers | 232.80ms | 52.47ms (fail) | 42.33ms | 43.87ms | 82.47ms | 46.42ms |
| triangle | 774.34ms | 76.19ms (fail) | 99.31ms | 86.23ms | 118.67ms | 103.20ms |
| unstable | 343.03ms | 341.68ms (fail) | 73.91ms | 61.38ms | 98.84ms | 77.05ms |
| molBench | 583.66ms | 947μs | 480.63ms | 489.31ms | 498.13ms | 486.12ms |
| create_signals | 52.93ms | 71.32ms | 5.24ms | 26.96ms | 72.98ms | 26.82ms |
| comp_0to1 | 15.68ms | 59.12ms | 17.83ms | 7.67ms | 31.55ms | 12.26ms |
| comp_1to1 | 47.62ms | 57.69ms | 15.28ms | 4.22ms | 44.59ms | 27.48ms |
| comp_2to1 | 24.44ms | 38.81ms | 19.10ms | 2.31ms | 9.77ms | 13.18ms |
| comp_4to1 | 16.20ms | 17.81ms | 8.96ms | 7.65ms | 16.87ms | 3.52ms |
| comp_1000to1 | 15μs | 45μs | 4μs | 3μs | 265μs | 5μs |
| comp_1to2 | 36.02ms | 50.31ms | 16.61ms | 10.86ms | 42.17ms | 18.02ms |
| comp_1to4 | 40.96ms | 52.06ms | 25.92ms | 12.04ms | 19.05ms | 12.01ms |
| comp_1to8 | 21.31ms | 47.25ms | 7.05ms | 6.33ms | 25.42ms | 6.50ms |
| comp_1to1000 | 15.48ms | 41.55ms | 5.79ms | 3.54ms | 14.82ms | 4.60ms |
| update_1to1 | 26.84ms | 6.00ms | 8.29ms | 10.10ms | 16.33ms | 9.95ms |
| update_2to1 | 14.51ms | 3.10ms | 4.37ms | 2.66ms | 8.03ms | 4.57ms |
| update_4to1 | 7.07ms | 1.51ms | 2.08ms | 2.52ms | 4.08ms | 2.54ms |
| update_1000to1 | 72μs | 15μs | 20μs | 26μs | 39μs | 26μs |
| update_1to2 | 13.66ms | 3.04ms | 4.07ms | 4.95ms | 8.14ms | 4.49ms |
| update_1to4 | 6.99ms | 1.53ms | 2.08ms | 2.44ms | 4.07ms | 2.53ms |
| update_1to1000 | 168μs | 421μs | 130μs | 49μs | 150μs | 42μs |
| cellx1000 | 69.67ms | 5.21ms | 10.11ms | 7.12ms | 15.01ms | 10.15ms |
| cellx2500 | 286.21ms | 30.96ms | 30.48ms | 20.04ms | 70.21ms | 37.27ms |
| cellx5000 | 594.56ms | 76.34ms | 91.80ms | 50.22ms | 166.38ms | 77.41ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.00s | 254.75ms | 446.92ms | 235.96ms | 348.01ms | 513.08ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.52s | 204.78ms | 270.66ms | 179.85ms | 250.66ms | 281.55ms |
| 1000x12 - 4 sources - dynamic (large) | 1.82s | 354.31ms | 3.76s | 283.87ms | 479.70ms | 3.97s |
| 1000x5 - 25 sources (wide dense) | 3.48s | 517.06ms | 2.74s | 408.55ms | 607.08ms | 3.55s |
| 5x500 - 3 sources (deep) | 1.13s | 205.81ms | 231.27ms | 190.01ms | 253.82ms | 224.59ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.72s | 263.70ms | 456.67ms | 263.33ms | 387.36ms | 483.61ms |

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
