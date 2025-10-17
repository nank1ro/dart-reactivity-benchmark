# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.71s |
| 🥈 | preact_signals | 0.30 | 100.0% | 35/35 | 10.26s |
| 🥉 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.26s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.21s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.82s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.56s |

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
| Test Case | state_beacon | alien_signals | signals | solidart(2.0-dev) | mobx | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 159.92ms (fail) | 198.78ms | 212.57ms | 264.05ms | 2.32s | 200.89ms |
| broadPropagation | 6.70ms (fail) | 354.49ms | 459.00ms | 488.05ms | 4.37s | 467.35ms |
| deepPropagation | 144.05ms (fail) | 127.87ms | 176.98ms | 165.02ms | 1.57s | 182.08ms |
| diamond | 203.63ms (fail) | 236.10ms | 282.43ms | 357.81ms | 2.48s | 280.08ms |
| mux | 192.61ms (fail) | 376.88ms | 408.92ms | 440.04ms | 1.85s | 393.86ms |
| repeatedObservers | 52.54ms (fail) | 43.72ms | 46.61ms | 81.34ms | 236.65ms | 39.99ms |
| triangle | 92.59ms (fail) | 85.08ms | 103.12ms | 112.88ms | 770.31ms | 99.56ms |
| unstable | 342.16ms (fail) | 59.60ms | 81.57ms | 96.57ms | 349.59ms | 76.66ms |
| molBench | 951μs | 490.24ms | 485.80ms | 497.68ms | 582.48ms | 483.64ms |
| create_signals | 62.38ms | 21.65ms | 26.62ms | 76.22ms | 88.14ms | 5.34ms |
| comp_0to1 | 57.44ms | 7.55ms | 12.69ms | 25.45ms | 16.38ms | 17.60ms |
| comp_1to1 | 59.27ms | 4.20ms | 28.97ms | 43.13ms | 47.51ms | 15.08ms |
| comp_2to1 | 38.72ms | 2.34ms | 20.25ms | 42.46ms | 23.75ms | 16.65ms |
| comp_4to1 | 16.85ms | 8.90ms | 5.30ms | 10.70ms | 31.78ms | 12.47ms |
| comp_1000to1 | 45μs | 6μs | 5μs | 15μs | 16μs | 5μs |
| comp_1to2 | 48.26ms | 15.31ms | 21.68ms | 32.98ms | 34.30ms | 26.42ms |
| comp_1to4 | 46.86ms | 11.49ms | 15.08ms | 20.45ms | 18.65ms | 18.95ms |
| comp_1to8 | 46.09ms | 5.29ms | 6.62ms | 21.51ms | 21.22ms | 5.89ms |
| comp_1to1000 | 42.24ms | 3.50ms | 4.46ms | 14.17ms | 15.88ms | 4.70ms |
| update_1to1 | 6.01ms | 10.14ms | 10.18ms | 16.45ms | 24.32ms | 8.27ms |
| update_2to1 | 3.13ms | 2.53ms | 4.55ms | 8.01ms | 13.09ms | 4.37ms |
| update_4to1 | 1.50ms | 2.46ms | 2.59ms | 4.08ms | 6.60ms | 2.09ms |
| update_1000to1 | 15μs | 17μs | 39μs | 40μs | 69μs | 20μs |
| update_1to2 | 3.01ms | 4.95ms | 4.94ms | 8.44ms | 10.93ms | 4.07ms |
| update_1to4 | 1.51ms | 2.36ms | 2.60ms | 4.10ms | 6.68ms | 2.08ms |
| update_1to1000 | 419μs | 46μs | 43μs | 150μs | 193μs | 39μs |
| cellx1000 | 5.50ms | 7.12ms | 9.94ms | 11.78ms | 72.12ms | 10.01ms |
| cellx2500 | 30.90ms | 19.69ms | 32.57ms | 35.74ms | 256.45ms | 26.67ms |
| cellx5000 | 71.66ms | 45.15ms | 72.62ms | 83.92ms | 570.20ms | 76.75ms |
| 10x5 - 2 sources - read 20.0% (simple) | 277.46ms | 236.72ms | 509.54ms | 351.08ms | 2.09s | 443.92ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 206.53ms | 180.87ms | 280.60ms | 251.49ms | 1.56s | 277.13ms |
| 1000x12 - 4 sources - dynamic (large) | 354.33ms | 283.21ms | 3.77s | 452.73ms | 1.94s | 3.67s |
| 1000x5 - 25 sources (wide dense) | 514.90ms | 407.97ms | 3.42s | 609.01ms | 3.54s | 2.71s |
| 5x500 - 3 sources (deep) | 209.26ms | 191.65ms | 222.57ms | 252.79ms | 1.14s | 231.00ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 264.47ms | 260.36ms | 479.04ms | 382.70ms | 1.75s | 454.84ms |

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
