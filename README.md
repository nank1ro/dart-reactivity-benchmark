# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.39s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.09s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.52s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.61s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.45s |

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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 276.90ms | 205.88ms | 2.36s | 185.97ms | 206.17ms | 154.83ms (fail) |
| broadPropagation | 504.85ms | 470.61ms | 4.32s | 362.29ms | 464.44ms | 6.07ms (fail) |
| deepPropagation | 166.20ms | 181.91ms | 1.53s | 125.93ms | 182.39ms | 139.29ms (fail) |
| diamond | 355.85ms | 280.59ms | 2.41s | 236.22ms | 293.03ms | 186.27ms (fail) |
| mux | 445.14ms | 387.22ms | 1.83s | 376.29ms | 410.55ms | 194.56ms (fail) |
| repeatedObservers | 78.34ms | 38.43ms | 230.16ms | 45.18ms | 46.78ms | 52.40ms (fail) |
| triangle | 118.41ms | 99.41ms | 784.49ms | 86.74ms | 104.34ms | 78.28ms (fail) |
| unstable | 96.53ms | 70.14ms | 355.13ms | 62.03ms | 74.89ms | 340.42ms (fail) |
| molBench | 493.43ms | 491.54ms | 581.77ms | 491.88ms | 488.89ms | 1.10ms |
| create_signals | 72.95ms | 4.57ms | 79.43ms | 26.27ms | 26.65ms | 59.50ms |
| comp_0to1 | 28.33ms | 23.02ms | 19.12ms | 7.02ms | 12.07ms | 52.57ms |
| comp_1to1 | 44.55ms | 12.16ms | 37.00ms | 4.13ms | 27.36ms | 53.78ms |
| comp_2to1 | 25.30ms | 20.50ms | 24.48ms | 2.21ms | 10.18ms | 37.02ms |
| comp_4to1 | 17.71ms | 14.83ms | 25.79ms | 8.63ms | 7.88ms | 16.56ms |
| comp_1000to1 | 15μs | 4μs | 22μs | 5μs | 5μs | 42μs |
| comp_1to2 | 33.05ms | 18.96ms | 34.89ms | 19.70ms | 20.43ms | 44.31ms |
| comp_1to4 | 15.19ms | 30.62ms | 19.03ms | 11.53ms | 9.98ms | 43.38ms |
| comp_1to8 | 21.51ms | 7.50ms | 22.75ms | 5.05ms | 6.97ms | 42.24ms |
| comp_1to1000 | 14.34ms | 7.05ms | 14.88ms | 3.52ms | 4.48ms | 37.61ms |
| update_1to1 | 16.24ms | 8.19ms | 22.09ms | 11.25ms | 9.20ms | 5.72ms |
| update_2to1 | 7.93ms | 4.05ms | 11.23ms | 5.11ms | 4.61ms | 2.87ms |
| update_4to1 | 4.05ms | 2.09ms | 6.65ms | 2.81ms | 2.37ms | 1.46ms |
| update_1000to1 | 41μs | 20μs | 67μs | 10μs | 23μs | 14μs |
| update_1to2 | 8.28ms | 4.14ms | 11.35ms | 5.61ms | 4.91ms | 2.95ms |
| update_1to4 | 4.03ms | 2.04ms | 5.51ms | 2.46ms | 2.31ms | 1.48ms |
| update_1to1000 | 153μs | 935μs | 170μs | 42μs | 44μs | 370μs |
| cellx1000 | 12.99ms | 10.21ms | 82.39ms | 7.72ms | 10.61ms | 5.64ms |
| cellx2500 | 48.02ms | 38.55ms | 279.17ms | 25.07ms | 36.84ms | 30.86ms |
| cellx5000 | 142.00ms | 96.81ms | 590.27ms | 61.10ms | 93.59ms | 91.71ms |
| 10x5 - 2 sources - read 20.0% (simple) | 392.70ms | 444.23ms | 2.02s | 233.46ms | 513.21ms | 240.16ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 247.13ms | 278.77ms | 1.56s | 178.78ms | 279.56ms | 202.31ms |
| 1000x12 - 4 sources - dynamic (large) | 468.89ms | 3.53s | 1.83s | 283.98ms | 3.95s | 348.08ms |
| 1000x5 - 25 sources (wide dense) | 598.94ms | 2.61s | 3.63s | 420.45ms | 3.51s | 506.94ms |
| 5x500 - 3 sources (deep) | 255.05ms | 231.71ms | 1.17s | 187.04ms | 227.23ms | 207.47ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 378.83ms | 459.21ms | 1.71s | 263.74ms | 482.32ms | 259.18ms |

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
