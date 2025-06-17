# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.71s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.29s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.37s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.30s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.72s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.48s |

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
| avoidablePropagation | 268.68ms | 206.80ms | 2.31s | 200.52ms | 184.58ms (fail) | 184.74ms |
| broadPropagation | 500.69ms | 461.46ms | 4.49s | 451.09ms | 6.20ms (fail) | 342.72ms |
| deepPropagation | 168.19ms | 175.40ms | 1.54s | 175.04ms | 143.25ms (fail) | 121.55ms |
| diamond | 346.84ms | 282.67ms | 2.41s | 278.29ms | 185.65ms (fail) | 230.79ms |
| mux | 452.74ms | 409.28ms | 1.83s | 400.00ms | 194.74ms (fail) | 367.79ms |
| repeatedObservers | 81.42ms | 45.48ms | 234.73ms | 39.48ms | 52.33ms (fail) | 45.41ms |
| triangle | 135.16ms | 103.08ms | 770.46ms | 97.03ms | 76.65ms (fail) | 85.05ms |
| unstable | 99.07ms | 80.69ms | 347.74ms | 70.38ms | 338.47ms (fail) | 68.00ms |
| molBench | 493.37ms | 486.35ms | 569.67ms | 490.91ms | 937μs | 487.40ms |
| create_signals | 77.09ms | 31.43ms | 72.92ms | 5.34ms | 60.78ms | 28.58ms |
| comp_0to1 | 28.68ms | 12.54ms | 29.89ms | 17.74ms | 54.34ms | 8.47ms |
| comp_1to1 | 41.04ms | 18.72ms | 33.98ms | 14.25ms | 56.72ms | 4.34ms |
| comp_2to1 | 27.10ms | 8.96ms | 36.57ms | 23.61ms | 37.51ms | 2.37ms |
| comp_4to1 | 18.77ms | 3.02ms | 23.12ms | 8.65ms | 17.02ms | 7.82ms |
| comp_1000to1 | 18μs | 8μs | 16μs | 5μs | 40μs | 5μs |
| comp_1to2 | 38.45ms | 15.85ms | 33.78ms | 24.61ms | 45.77ms | 10.85ms |
| comp_1to4 | 22.69ms | 7.10ms | 20.01ms | 21.30ms | 44.14ms | 13.31ms |
| comp_1to8 | 25.64ms | 7.20ms | 22.85ms | 8.33ms | 42.79ms | 5.15ms |
| comp_1to1000 | 17.17ms | 4.18ms | 16.91ms | 12.00ms | 38.54ms | 3.88ms |
| update_1to1 | 16.07ms | 8.89ms | 24.09ms | 8.58ms | 5.65ms | 10.48ms |
| update_2to1 | 7.83ms | 4.46ms | 12.18ms | 4.40ms | 3.11ms | 2.35ms |
| update_4to1 | 4.02ms | 2.27ms | 7.29ms | 2.19ms | 1.43ms | 2.53ms |
| update_1000to1 | 40μs | 22μs | 71μs | 21μs | 14μs | 28μs |
| update_1to2 | 8.07ms | 4.45ms | 11.91ms | 4.65ms | 2.86ms | 5.12ms |
| update_1to4 | 4.02ms | 2.28ms | 5.64ms | 2.15ms | 1.43ms | 2.49ms |
| update_1to1000 | 170μs | 44μs | 174μs | 2.54ms | 393μs | 42μs |
| cellx1000 | 13.28ms | 12.47ms | 87.58ms | 10.34ms | 5.59ms | 7.64ms |
| cellx2500 | 45.27ms | 36.16ms | 296.83ms | 32.62ms | 28.67ms | 22.45ms |
| cellx5000 | 123.61ms | 86.71ms | 605.06ms | 90.55ms | 71.30ms | 60.10ms |
| 10x5 - 2 sources - read 20.0% (simple) | 369.39ms | 518.75ms | 2.01s | 436.80ms | 243.34ms | 230.89ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 245.38ms | 280.15ms | 1.52s | 271.27ms | 206.82ms | 179.14ms |
| 1000x12 - 4 sources - dynamic (large) | 467.32ms | 3.80s | 1.94s | 3.69s | 360.23ms | 291.18ms |
| 1000x5 - 25 sources (wide dense) | 589.17ms | 3.47s | 3.56s | 2.72s | 506.82ms | 423.12ms |
| 5x500 - 3 sources (deep) | 252.83ms | 224.56ms | 1.17s | 227.94ms | 204.35ms | 190.46ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 383.77ms | 482.81ms | 1.68s | 450.54ms | 261.06ms | 266.14ms |

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
