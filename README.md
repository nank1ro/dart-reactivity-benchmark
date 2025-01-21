# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.72s |
| 🥈 | signals | 0.28 | 100.0% | 35/35 | 10.98s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 9.73s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.55s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 41.62s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.54s |

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
| Test Case | alien_signals | signals | preact_signals | solidart | state_beacon | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 217.21ms | 210.10ms | 208.20ms | 2.37s | 150.41ms (fail) | 2.32s |
| broadPropagation | 346.44ms | 455.09ms | 453.01ms | 5.77s | 6.34ms (fail) | 4.31s |
| deepPropagation | 123.16ms | 168.98ms | 171.96ms | 2.11s | 140.81ms (fail) | 1.54s |
| diamond | 236.34ms | 284.92ms | 275.11ms | 3.63s | 194.65ms (fail) | 2.42s |
| mux | 375.82ms | 404.87ms | 385.25ms | 2.20s | 196.35ms (fail) | 1.84s |
| repeatedObservers | 44.07ms | 45.15ms | 41.25ms | 222.59ms | 53.98ms (fail) | 237.69ms |
| triangle | 85.80ms | 100.88ms | 104.47ms | 1.21s | 79.20ms (fail) | 785.81ms |
| unstable | 60.66ms | 78.65ms | 69.96ms | 361.69ms | 336.72ms (fail) | 353.30ms |
| molBench | 487.03ms | 485.70ms | 483.52ms | 1.77s | 950μs | 571.52ms |
| create_signals | 20.33ms | 29.14ms | 4.58ms | 81.55ms | 76.64ms | 80.37ms |
| comp_0to1 | 4.96ms | 13.89ms | 17.03ms | 33.06ms | 58.06ms | 15.92ms |
| comp_1to1 | 11.55ms | 19.16ms | 15.48ms | 41.09ms | 53.09ms | 38.87ms |
| comp_2to1 | 14.68ms | 9.40ms | 13.04ms | 23.34ms | 34.44ms | 34.53ms |
| comp_4to1 | 2.54ms | 2.15ms | 13.80ms | 13.79ms | 17.77ms | 16.91ms |
| comp_1000to1 | 3μs | 5μs | 4μs | 3.19ms | 46μs | 17μs |
| comp_1to2 | 17.50ms | 20.75ms | 20.58ms | 25.96ms | 46.10ms | 35.14ms |
| comp_1to4 | 11.69ms | 9.64ms | 22.47ms | 30.48ms | 43.73ms | 18.42ms |
| comp_1to8 | 4.04ms | 6.74ms | 7.58ms | 23.65ms | 43.56ms | 21.59ms |
| comp_1to1000 | 3.74ms | 4.74ms | 6.63ms | 19.17ms | 39.88ms | 15.96ms |
| update_1to1 | 4.40ms | 9.35ms | 8.87ms | 43.16ms | 8.19ms | 24.72ms |
| update_2to1 | 2.23ms | 4.66ms | 4.37ms | 22.09ms | 2.93ms | 14.27ms |
| update_4to1 | 1.27ms | 2.38ms | 2.19ms | 10.71ms | 1.58ms | 6.89ms |
| update_1000to1 | 11μs | 25μs | 21μs | 114μs | 25μs | 70μs |
| update_1to2 | 2.22ms | 4.73ms | 4.35ms | 21.60ms | 3.88ms | 13.65ms |
| update_1to4 | 1.24ms | 2.36ms | 2.19ms | 10.95ms | 1.50ms | 5.83ms |
| update_1to1000 | 50μs | 45μs | 457μs | 214μs | 416μs | 179μs |
| cellx1000 | 8.08ms | 9.85ms | 9.82ms | 184.54ms | 6.28ms | 98.60ms |
| cellx2500 | 21.11ms | 32.28ms | 30.21ms | 551.86ms | 25.24ms | 313.60ms |
| cellx5000 | 47.17ms | 71.93ms | 84.89ms | 1.26s | 78.25ms | 602.02ms |
| 10x5 - 2 sources - read 20.0% (simple) | 234.31ms | 505.53ms | 443.76ms | 2.78s (partial) | 250.22ms | 2.01s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 180.10ms | 276.23ms | 278.26ms | 2.44s (partial) | 210.00ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 286.87ms | 3.72s | 3.37s | 4.23s (partial) | 357.99ms | 1.81s |
| 1000x5 - 25 sources (wide dense) | 402.57ms | 3.28s | 2.51s | 5.10s (partial) | 509.10ms | 3.57s |
| 5x500 - 3 sources (deep) | 197.22ms | 230.45ms | 225.93ms | 2.15s (partial) | 239.70ms | 1.19s |
| 100x15 - 6 sources - dynamic (very dynamic) | 264.28ms | 478.57ms | 440.96ms | 2.87s (partial) | 267.11ms | 1.72s |

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
