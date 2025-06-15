# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.25s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.31s |
| 4 | preact_signals | 0.27 | 100.0% | 35/35 | 10.25s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.09s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.44s |

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
| avoidablePropagation | 274.43ms | 207.31ms | 2.37s | 201.10ms | 167.84ms (fail) | 191.32ms |
| broadPropagation | 507.07ms | 451.43ms | 4.56s | 452.14ms | 6.51ms (fail) | 346.71ms |
| deepPropagation | 170.82ms | 170.56ms | 1.56s | 177.60ms | 146.35ms (fail) | 117.77ms |
| diamond | 352.75ms | 278.19ms | 2.47s | 281.18ms | 188.49ms (fail) | 231.02ms |
| mux | 442.11ms | 407.12ms | 1.85s | 403.10ms | 191.76ms (fail) | 367.73ms |
| repeatedObservers | 81.09ms | 44.52ms | 241.03ms | 40.42ms | 52.26ms (fail) | 48.38ms |
| triangle | 118.15ms | 101.22ms | 779.73ms | 98.54ms | 76.39ms (fail) | 84.86ms |
| unstable | 97.35ms | 79.27ms | 360.80ms | 69.45ms | 337.00ms (fail) | 67.31ms |
| molBench | 493.39ms | 485.24ms | 571.84ms | 488.81ms | 855μs | 487.71ms |
| create_signals | 57.70ms | 25.06ms | 86.66ms | 4.64ms | 68.67ms | 27.52ms |
| comp_0to1 | 26.95ms | 11.46ms | 23.49ms | 17.42ms | 53.13ms | 10.20ms |
| comp_1to1 | 46.75ms | 27.02ms | 41.94ms | 14.71ms | 55.44ms | 10.42ms |
| comp_2to1 | 42.41ms | 8.60ms | 23.39ms | 19.50ms | 35.95ms | 2.32ms |
| comp_4to1 | 15.27ms | 2.59ms | 19.82ms | 13.65ms | 16.24ms | 10.09ms |
| comp_1000to1 | 17μs | 10μs | 16μs | 4μs | 42μs | 4μs |
| comp_1to2 | 28.58ms | 20.39ms | 35.65ms | 15.89ms | 45.75ms | 15.39ms |
| comp_1to4 | 26.17ms | 9.39ms | 20.25ms | 28.01ms | 47.08ms | 8.46ms |
| comp_1to8 | 25.07ms | 6.51ms | 23.88ms | 6.59ms | 43.43ms | 6.77ms |
| comp_1to1000 | 17.12ms | 4.12ms | 15.84ms | 5.56ms | 39.27ms | 3.50ms |
| update_1to1 | 15.98ms | 9.14ms | 26.39ms | 8.63ms | 5.64ms | 10.31ms |
| update_2to1 | 7.81ms | 4.57ms | 13.01ms | 4.32ms | 3.13ms | 2.27ms |
| update_4to1 | 4.03ms | 2.23ms | 6.76ms | 2.19ms | 1.45ms | 2.52ms |
| update_1000to1 | 40μs | 22μs | 65μs | 21μs | 14μs | 24μs |
| update_1to2 | 7.99ms | 4.53ms | 12.87ms | 4.62ms | 2.85ms | 5.04ms |
| update_1to4 | 4.01ms | 2.23ms | 6.49ms | 2.15ms | 1.47ms | 2.48ms |
| update_1to1000 | 170μs | 42μs | 173μs | 998μs | 390μs | 58μs |
| cellx1000 | 11.95ms | 9.49ms | 70.65ms | 9.69ms | 5.25ms | 7.26ms |
| cellx2500 | 33.36ms | 32.71ms | 241.53ms | 25.39ms | 21.64ms | 19.92ms |
| cellx5000 | 72.89ms | 65.94ms | 539.74ms | 63.94ms | 56.94ms | 42.27ms |
| 10x5 - 2 sources - read 20.0% (simple) | 350.65ms | 507.99ms | 2.05s | 440.01ms | 280.64ms | 232.84ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 242.33ms | 278.84ms | 1.56s | 271.05ms | 203.10ms | 178.04ms |
| 1000x12 - 4 sources - dynamic (large) | 459.78ms | 3.97s | 1.98s | 3.68s | 336.39ms | 280.17ms |
| 1000x5 - 25 sources (wide dense) | 582.63ms | 3.37s | 3.63s | 2.71s | 481.11ms | 414.86ms |
| 5x500 - 3 sources (deep) | 249.53ms | 229.52ms | 1.18s | 233.29ms | 203.73ms | 193.85ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 382.56ms | 485.33ms | 1.72s | 452.01ms | 259.08ms | 264.67ms |

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
