# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.76s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.28s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 10.87s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.40s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.52s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.42s |

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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 202.14ms | 2.32s | 154.31ms (fail) | 196.14ms | 207.59ms | 292.19ms |
| broadPropagation | 460.54ms | 4.23s | 6.26ms (fail) | 358.76ms | 449.80ms | 500.25ms |
| deepPropagation | 176.26ms | 1.49s | 136.71ms (fail) | 125.32ms | 181.13ms | 165.80ms |
| diamond | 285.17ms | 2.34s | 183.92ms (fail) | 242.06ms | 282.22ms | 351.48ms |
| mux | 397.58ms | 1.75s | 180.78ms (fail) | 360.50ms | 369.08ms | 420.08ms |
| repeatedObservers | 45.85ms | 229.67ms | 55.26ms (fail) | 45.54ms | 41.52ms | 80.98ms |
| triangle | 102.68ms | 751.20ms | 84.08ms (fail) | 89.97ms | 99.14ms | 115.78ms |
| unstable | 72.47ms | 336.67ms | 331.94ms (fail) | 62.07ms | 72.01ms | 95.86ms |
| molBench | 493.32ms | 586.51ms | 983μs | 487.02ms | 497.10ms | 490.42ms |
| create_signals | 26.28ms | 72.94ms | 68.35ms | 27.22ms | 5.61ms | 99.25ms |
| comp_0to1 | 11.65ms | 24.21ms | 58.72ms | 7.98ms | 18.23ms | 33.41ms |
| comp_1to1 | 26.24ms | 36.24ms | 59.58ms | 4.14ms | 12.06ms | 50.83ms |
| comp_2to1 | 8.94ms | 22.93ms | 36.45ms | 2.31ms | 20.59ms | 43.48ms |
| comp_4to1 | 2.18ms | 20.07ms | 16.48ms | 10.46ms | 14.64ms | 4.86ms |
| comp_1000to1 | 5μs | 15μs | 44μs | 3μs | 4μs | 15μs |
| comp_1to2 | 19.38ms | 34.78ms | 49.15ms | 21.94ms | 18.30ms | 31.82ms |
| comp_1to4 | 10.19ms | 17.59ms | 47.98ms | 5.31ms | 34.83ms | 19.90ms |
| comp_1to8 | 6.06ms | 19.58ms | 44.79ms | 4.34ms | 9.34ms | 21.81ms |
| comp_1to1000 | 4.04ms | 14.76ms | 40.37ms | 3.61ms | 4.71ms | 14.39ms |
| update_1to1 | 8.96ms | 21.27ms | 8.24ms | 4.65ms | 9.01ms | 15.68ms |
| update_2to1 | 4.45ms | 10.34ms | 2.85ms | 2.36ms | 4.57ms | 7.81ms |
| update_4to1 | 2.26ms | 5.32ms | 2.00ms | 1.25ms | 2.29ms | 3.91ms |
| update_1000to1 | 22μs | 53μs | 15μs | 11μs | 33μs | 39μs |
| update_1to2 | 4.42ms | 10.48ms | 4.99ms | 2.35ms | 4.44ms | 7.99ms |
| update_1to4 | 2.25ms | 5.17ms | 1.48ms | 1.24ms | 2.37ms | 3.97ms |
| update_1to1000 | 41μs | 157μs | 383μs | 47μs | 146μs | 145μs |
| cellx1000 | 9.72ms | 70.29ms | 5.46ms | 7.30ms | 10.03ms | 11.85ms |
| cellx2500 | 31.82ms | 245.19ms | 23.50ms | 19.64ms | 25.93ms | 33.21ms |
| cellx5000 | 64.14ms | 532.08ms | 70.48ms | 42.45ms | 70.80ms | 70.47ms |
| 10x5 - 2 sources - read 20.0% (simple) | 504.00ms | 1.91s | 248.92ms | 288.53ms | 454.23ms | 346.09ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.98ms | 1.44s | 203.18ms | 183.55ms | 272.63ms | 248.81ms |
| 1000x12 - 4 sources - dynamic (large) | 3.59s | 1.88s | 332.64ms | 280.11ms | 3.75s | 458.23ms |
| 1000x5 - 25 sources (wide dense) | 3.32s | 3.36s | 494.86ms | 408.02ms | 2.78s | 603.05ms |
| 5x500 - 3 sources (deep) | 222.42ms | 1.10s | 205.22ms | 193.38ms | 230.84ms | 254.71ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 479.57ms | 1.63s | 261.25ms | 267.73ms | 451.33ms | 385.07ms |

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
