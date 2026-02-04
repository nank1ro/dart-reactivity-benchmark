# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.77 | 100.0% | 35/35 | 3.66s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.26s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.32s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.02s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.31s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| avoidablePropagation | 209.39ms | 188.82ms | 154.82ms (fail) | 280.14ms | 208.18ms | 2.39s |
| broadPropagation | 463.33ms | 350.87ms | 6.48ms (fail) | 500.73ms | 467.97ms | 4.46s |
| deepPropagation | 179.24ms | 138.61ms | 140.48ms (fail) | 167.81ms | 180.69ms | 1.50s |
| diamond | 283.70ms | 231.10ms | 196.95ms (fail) | 348.55ms | 286.98ms | 2.38s |
| mux | 392.36ms | 360.18ms | 183.28ms (fail) | 415.28ms | 371.71ms | 1.85s |
| repeatedObservers | 46.44ms | 45.10ms | 53.96ms (fail) | 81.90ms | 40.37ms | 234.30ms |
| triangle | 103.03ms | 87.02ms | 88.66ms (fail) | 120.14ms | 100.83ms | 749.49ms |
| unstable | 78.29ms | 62.65ms | 336.22ms (fail) | 96.88ms | 69.70ms | 344.78ms |
| molBench | 495.01ms | 484.45ms | 1.11ms | 491.40ms | 483.32ms | 589.90ms |
| create_signals | 25.81ms | 27.65ms | 58.51ms | 77.89ms | 13.77ms | 69.69ms |
| comp_0to1 | 12.29ms | 8.60ms | 52.02ms | 26.61ms | 20.52ms | 28.47ms |
| comp_1to1 | 40.78ms | 4.15ms | 54.47ms | 37.87ms | 7.42ms | 40.31ms |
| comp_2to1 | 8.89ms | 2.29ms | 36.47ms | 35.85ms | 13.72ms | 34.80ms |
| comp_4to1 | 2.14ms | 7.93ms | 16.06ms | 4.47ms | 12.25ms | 16.97ms |
| comp_1000to1 | 5μs | 3μs | 39μs | 17μs | 9μs | 15μs |
| comp_1to2 | 19.07ms | 14.04ms | 44.33ms | 38.80ms | 22.41ms | 35.47ms |
| comp_1to4 | 14.08ms | 11.34ms | 43.97ms | 21.49ms | 32.11ms | 17.31ms |
| comp_1to8 | 7.44ms | 4.98ms | 41.58ms | 24.01ms | 8.76ms | 20.06ms |
| comp_1to1000 | 4.25ms | 3.37ms | 38.02ms | 14.83ms | 5.85ms | 15.55ms |
| update_1to1 | 9.31ms | 4.70ms | 6.10ms | 15.48ms | 8.85ms | 27.15ms |
| update_2to1 | 4.72ms | 2.32ms | 3.07ms | 8.52ms | 4.37ms | 13.66ms |
| update_4to1 | 2.34ms | 1.19ms | 1.56ms | 3.93ms | 2.22ms | 6.93ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 64μs |
| update_1to2 | 4.64ms | 2.24ms | 3.07ms | 7.89ms | 4.39ms | 13.85ms |
| update_1to4 | 2.54ms | 1.20ms | 1.60ms | 3.85ms | 2.21ms | 6.91ms |
| update_1to1000 | 44μs | 37μs | 365μs | 147μs | 997μs | 162μs |
| cellx1000 | 9.91ms | 7.97ms | 9.07ms | 12.96ms | 9.79ms | 75.22ms |
| cellx2500 | 33.38ms | 21.27ms | 30.06ms | 34.29ms | 26.52ms | 302.23ms |
| cellx5000 | 65.48ms | 44.60ms | 62.24ms | 109.15ms | 76.05ms | 570.08ms |
| 10x5 - 2 sources - read 20.0% (simple) | 502.16ms | 232.57ms | 242.75ms | 345.36ms | 429.56ms | 1.93s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 275.68ms | 172.11ms | 208.26ms | 246.99ms | 266.94ms | 1.49s |
| 1000x12 - 4 sources - dynamic (large) | 3.86s | 277.49ms | 345.53ms | 459.15ms | 3.64s | 1.89s |
| 1000x5 - 25 sources (wide dense) | 3.46s | 403.19ms | 520.61ms | 583.36ms | 2.52s | 3.47s |
| 5x500 - 3 sources (deep) | 227.06ms | 191.39ms | 207.87ms | 257.60ms | 228.93ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 475.26ms | 269.40ms | 265.72ms | 385.76ms | 451.84ms | 1.63s |

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
