# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.34s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.07s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.35s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.54s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.40s |

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
| avoidablePropagation | 217.55ms | 188.32ms | 144.03ms (fail) | 280.51ms | 208.28ms | 2.36s |
| broadPropagation | 460.52ms | 354.29ms | 6.17ms (fail) | 506.70ms | 451.84ms | 4.40s |
| deepPropagation | 173.38ms | 137.37ms | 138.88ms (fail) | 169.19ms | 177.99ms | 1.53s |
| diamond | 281.43ms | 230.70ms | 191.65ms (fail) | 359.08ms | 282.87ms | 2.44s |
| mux | 397.14ms | 362.54ms | 185.56ms (fail) | 413.89ms | 368.98ms | 1.86s |
| repeatedObservers | 46.03ms | 43.59ms | 53.34ms (fail) | 80.48ms | 40.83ms | 236.20ms |
| triangle | 102.05ms | 84.94ms | 76.26ms (fail) | 113.06ms | 101.73ms | 764.69ms |
| unstable | 78.13ms | 61.90ms | 336.34ms (fail) | 95.91ms | 70.03ms | 344.32ms |
| molBench | 495.35ms | 485.51ms | 971μs | 490.68ms | 485.08ms | 591.39ms |
| create_signals | 26.54ms | 28.31ms | 57.52ms | 100.60ms | 4.68ms | 76.10ms |
| comp_0to1 | 11.79ms | 7.75ms | 52.09ms | 36.76ms | 17.81ms | 31.54ms |
| comp_1to1 | 27.44ms | 10.91ms | 54.03ms | 39.04ms | 14.81ms | 17.35ms |
| comp_2to1 | 12.28ms | 2.28ms | 36.94ms | 38.23ms | 20.13ms | 25.98ms |
| comp_4to1 | 2.16ms | 10.52ms | 16.43ms | 13.12ms | 14.53ms | 19.78ms |
| comp_1000to1 | 5μs | 3μs | 42μs | 19μs | 4μs | 37μs |
| comp_1to2 | 13.99ms | 12.35ms | 48.19ms | 27.94ms | 18.71ms | 39.63ms |
| comp_1to4 | 18.86ms | 5.19ms | 47.09ms | 20.48ms | 35.21ms | 27.32ms |
| comp_1to8 | 6.39ms | 5.29ms | 43.30ms | 24.16ms | 8.04ms | 25.32ms |
| comp_1to1000 | 6.84ms | 3.60ms | 38.00ms | 14.61ms | 5.31ms | 15.60ms |
| update_1to1 | 9.32ms | 4.64ms | 6.16ms | 15.48ms | 8.82ms | 23.66ms |
| update_2to1 | 4.84ms | 2.34ms | 3.04ms | 7.75ms | 4.41ms | 11.03ms |
| update_4to1 | 2.34ms | 2.44ms | 1.56ms | 3.91ms | 2.52ms | 6.13ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 57μs |
| update_1to2 | 4.64ms | 2.29ms | 3.06ms | 7.92ms | 4.39ms | 11.02ms |
| update_1to4 | 2.53ms | 1.22ms | 1.57ms | 3.86ms | 2.25ms | 5.71ms |
| update_1to1000 | 45μs | 60μs | 379μs | 154μs | 174μs | 157μs |
| cellx1000 | 9.98ms | 8.99ms | 6.68ms | 15.59ms | 9.86ms | 84.03ms |
| cellx2500 | 32.51ms | 20.45ms | 34.83ms | 43.88ms | 32.50ms | 289.35ms |
| cellx5000 | 84.93ms | 55.27ms | 81.51ms | 122.93ms | 85.70ms | 617.73ms |
| 10x5 - 2 sources - read 20.0% (simple) | 512.26ms | 233.24ms | 239.89ms | 345.65ms | 429.45ms | 1.99s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.30ms | 172.45ms | 196.46ms | 244.39ms | 266.53ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 3.81s | 281.88ms | 346.43ms | 470.20ms | 3.68s | 1.89s |
| 1000x5 - 25 sources (wide dense) | 3.51s | 403.55ms | 493.06ms | 596.21ms | 2.53s | 3.45s |
| 5x500 - 3 sources (deep) | 224.68ms | 199.84ms | 200.67ms | 255.03ms | 227.51ms | 1.15s |
| 100x15 - 6 sources - dynamic (very dynamic) | 474.72ms | 265.36ms | 256.91ms | 385.91ms | 453.01ms | 1.67s |

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
