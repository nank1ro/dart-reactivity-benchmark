# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.65s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.21s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.06s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.02s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.85s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.33s |

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
| avoidablePropagation | 206.04ms | 190.00ms | 156.79ms (fail) | 277.17ms | 207.75ms | 2.32s |
| broadPropagation | 460.70ms | 360.20ms | 6.42ms (fail) | 501.11ms | 454.75ms | 4.36s |
| deepPropagation | 173.50ms | 128.95ms | 136.82ms (fail) | 170.44ms | 179.63ms | 1.53s |
| diamond | 286.06ms | 231.57ms | 179.07ms (fail) | 352.38ms | 282.83ms | 2.39s |
| mux | 389.41ms | 362.29ms | 183.85ms (fail) | 416.82ms | 374.35ms | 1.83s |
| repeatedObservers | 45.95ms | 43.43ms | 52.72ms (fail) | 80.32ms | 41.09ms | 224.50ms |
| triangle | 102.50ms | 84.13ms | 76.42ms (fail) | 113.53ms | 101.23ms | 753.61ms |
| unstable | 77.91ms | 62.33ms | 336.45ms (fail) | 97.25ms | 71.55ms | 342.62ms |
| molBench | 494.97ms | 485.70ms | 1.00ms | 490.56ms | 482.52ms | 590.62ms |
| create_signals | 26.01ms | 27.10ms | 56.59ms | 94.63ms | 10.53ms | 68.27ms |
| comp_0to1 | 11.12ms | 8.55ms | 51.19ms | 33.92ms | 25.84ms | 28.77ms |
| comp_1to1 | 28.63ms | 4.20ms | 53.45ms | 46.86ms | 23.02ms | 29.72ms |
| comp_2to1 | 11.49ms | 2.33ms | 34.88ms | 44.58ms | 22.34ms | 11.53ms |
| comp_4to1 | 6.70ms | 7.62ms | 15.95ms | 4.44ms | 13.88ms | 27.25ms |
| comp_1000to1 | 5μs | 3μs | 44μs | 16μs | 4μs | 18μs |
| comp_1to2 | 18.30ms | 10.85ms | 44.79ms | 28.07ms | 18.91ms | 32.49ms |
| comp_1to4 | 12.40ms | 12.07ms | 43.68ms | 14.81ms | 31.94ms | 26.93ms |
| comp_1to8 | 8.87ms | 4.98ms | 41.42ms | 19.76ms | 6.80ms | 24.47ms |
| comp_1to1000 | 5.06ms | 3.67ms | 37.63ms | 14.59ms | 5.90ms | 15.36ms |
| update_1to1 | 9.31ms | 4.69ms | 6.10ms | 15.68ms | 8.98ms | 27.31ms |
| update_2to1 | 4.84ms | 5.26ms | 3.06ms | 7.78ms | 4.43ms | 14.07ms |
| update_4to1 | 2.35ms | 1.23ms | 1.58ms | 3.88ms | 2.96ms | 7.03ms |
| update_1000to1 | 24μs | 16μs | 16μs | 39μs | 22μs | 70μs |
| update_1to2 | 4.65ms | 2.63ms | 3.06ms | 7.92ms | 4.37ms | 13.26ms |
| update_1to4 | 2.55ms | 1.20ms | 1.59ms | 3.90ms | 2.21ms | 6.90ms |
| update_1to1000 | 43μs | 41μs | 375μs | 146μs | 772μs | 163μs |
| cellx1000 | 9.54ms | 7.24ms | 5.04ms | 11.70ms | 9.60ms | 67.57ms |
| cellx2500 | 30.78ms | 19.57ms | 21.45ms | 32.08ms | 25.59ms | 242.24ms |
| cellx5000 | 59.36ms | 40.27ms | 52.25ms | 65.90ms | 73.53ms | 546.49ms |
| 10x5 - 2 sources - read 20.0% (simple) | 510.46ms | 235.10ms | 237.67ms | 341.06ms | 444.80ms | 1.94s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.82ms | 175.36ms | 196.70ms | 243.32ms | 265.72ms | 1.48s |
| 1000x12 - 4 sources - dynamic (large) | 3.83s | 271.21ms | 333.74ms | 459.01ms | 3.64s | 1.83s |
| 1000x5 - 25 sources (wide dense) | 3.25s | 404.64ms | 503.38ms | 587.06ms | 2.50s | 3.36s |
| 5x500 - 3 sources (deep) | 225.13ms | 192.47ms | 200.69ms | 247.90ms | 227.60ms | 1.09s |
| 100x15 - 6 sources - dynamic (very dynamic) | 476.19ms | 260.28ms | 254.31ms | 381.24ms | 452.81ms | 1.62s |

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
