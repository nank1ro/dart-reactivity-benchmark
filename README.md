# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.30 | 100.0% | 35/35 | 5.37s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.69s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 11.36s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.47s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.62s |

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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 213.46ms | 192.05ms | 161.06ms (fail) | 260.14ms | 208.76ms | 2.37s |
| broadPropagation | 464.82ms | 353.05ms | 6.91ms (fail) | 486.46ms | 456.83ms | 4.35s |
| deepPropagation | 183.11ms | 128.59ms | 143.04ms (fail) | 162.73ms | 179.85ms | 1.56s |
| diamond | 299.26ms | 239.58ms | 204.33ms (fail) | 359.87ms | 281.26ms | 2.42s |
| mux | 423.16ms | 387.52ms | 191.02ms (fail) | 452.11ms | 402.32ms | 1.81s |
| repeatedObservers | 46.22ms | 43.56ms | 52.53ms (fail) | 80.68ms | 40.48ms | 239.81ms |
| triangle | 99.89ms | 84.67ms | 81.24ms (fail) | 112.62ms | 98.97ms | 776.76ms |
| unstable | 76.19ms | 60.09ms | 375.12ms (fail) | 95.65ms | 76.25ms | 349.11ms |
| molBench | 486.06ms | 491.01ms | 956μs | 493.52ms | 487.08ms | 583.30ms |
| create_signals | 27.30ms | 28.91ms | 64.12ms | 78.86ms | 5.36ms | 52.15ms |
| comp_0to1 | 12.12ms | 8.18ms | 60.82ms | 26.54ms | 18.24ms | 18.98ms |
| comp_1to1 | 29.05ms | 4.22ms | 64.50ms | 49.47ms | 14.90ms | 32.26ms |
| comp_2to1 | 14.67ms | 2.32ms | 42.74ms | 38.18ms | 16.99ms | 8.87ms |
| comp_4to1 | 3.70ms | 8.34ms | 17.40ms | 4.19ms | 9.27ms | 27.06ms |
| comp_1000to1 | 6μs | 5μs | 61μs | 14μs | 5μs | 33μs |
| comp_1to2 | 14.40ms | 9.96ms | 51.22ms | 33.85ms | 28.27ms | 34.99ms |
| comp_1to4 | 13.45ms | 11.88ms | 47.77ms | 14.58ms | 25.31ms | 18.98ms |
| comp_1to8 | 9.29ms | 5.06ms | 47.22ms | 21.05ms | 13.72ms | 21.30ms |
| comp_1to1000 | 4.51ms | 3.59ms | 43.76ms | 14.23ms | 5.99ms | 15.12ms |
| update_1to1 | 10.38ms | 10.02ms | 7.58ms | 16.32ms | 9.56ms | 25.26ms |
| update_2to1 | 4.75ms | 2.20ms | 3.93ms | 8.03ms | 5.14ms | 11.17ms |
| update_4to1 | 2.63ms | 2.44ms | 1.93ms | 4.13ms | 2.69ms | 7.57ms |
| update_1000to1 | 27μs | 22μs | 16μs | 40μs | 21μs | 81μs |
| update_1to2 | 4.70ms | 5.02ms | 3.82ms | 8.36ms | 4.80ms | 14.01ms |
| update_1to4 | 2.63ms | 2.48ms | 1.91ms | 4.16ms | 2.50ms | 6.05ms |
| update_1to1000 | 47μs | 42μs | 401μs | 149μs | 49μs | 172μs |
| cellx1000 | 11.46ms | 7.32ms | 5.12ms | 16.22ms | 9.96ms | 70.30ms |
| cellx2500 | 40.73ms | 21.31ms | 23.17ms | 52.92ms | 31.54ms | 270.62ms |
| cellx5000 | 96.33ms | 58.20ms | 56.90ms | 135.59ms | 89.05ms | 554.23ms |
| 10x5 - 2 sources - read 20.0% (simple) | 519.33ms | 235.49ms | 262.97ms | 347.23ms | 512.19ms | 2.03s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.02ms | 182.23ms | 212.84ms | 247.84ms | 299.58ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 3.78s | 284.40ms | 355.28ms | 475.37ms | 3.84s | 1.88s |
| 1000x5 - 25 sources (wide dense) | 3.47s | 411.16ms | 552.65ms | 619.86ms | 2.78s | 3.50s |
| 5x500 - 3 sources (deep) | 224.57ms | 195.95ms | 205.04ms | 257.38ms | 248.44ms | 1.17s |
| 100x15 - 6 sources - dynamic (very dynamic) | 489.61ms | 267.65ms | 270.34ms | 387.55ms | 485.49ms | 1.73s |

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
