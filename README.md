# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.66s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.29s |
| 🥉 | preact_signals | 0.25 | 100.0% | 35/35 | 9.98s |
| 4 | signals | 0.24 | 100.0% | 35/35 | 10.98s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.03s |
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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 212.26ms | 187.38ms | 146.19ms (fail) | 283.59ms | 216.43ms | 2.37s |
| broadPropagation | 477.16ms | 355.59ms | 6.40ms (fail) | 505.38ms | 452.71ms | 4.35s |
| deepPropagation | 176.09ms | 134.66ms | 145.34ms (fail) | 169.87ms | 177.34ms | 1.50s |
| diamond | 299.60ms | 230.06ms | 193.42ms (fail) | 360.78ms | 281.52ms | 2.38s |
| mux | 392.19ms | 358.54ms | 182.59ms (fail) | 423.88ms | 372.55ms | 1.86s |
| repeatedObservers | 45.94ms | 43.33ms | 53.80ms (fail) | 81.06ms | 40.26ms | 226.27ms |
| triangle | 103.08ms | 88.49ms | 77.82ms (fail) | 116.45ms | 101.49ms | 752.89ms |
| unstable | 79.28ms | 63.31ms | 339.15ms (fail) | 95.93ms | 69.26ms | 344.29ms |
| molBench | 495.80ms | 485.44ms | 1.02ms | 492.79ms | 481.35ms | 589.22ms |
| create_signals | 25.40ms | 27.21ms | 58.69ms | 56.32ms | 5.41ms | 70.11ms |
| comp_0to1 | 11.59ms | 7.48ms | 52.53ms | 26.12ms | 17.59ms | 28.55ms |
| comp_1to1 | 41.77ms | 4.17ms | 53.37ms | 37.64ms | 11.09ms | 39.73ms |
| comp_2to1 | 14.06ms | 2.33ms | 36.54ms | 37.00ms | 13.33ms | 22.03ms |
| comp_4to1 | 5.19ms | 8.44ms | 15.98ms | 12.27ms | 13.97ms | 18.55ms |
| comp_1000to1 | 8μs | 4μs | 39μs | 17μs | 4μs | 15μs |
| comp_1to2 | 19.99ms | 16.78ms | 44.40ms | 28.01ms | 24.27ms | 38.70ms |
| comp_1to4 | 30.43ms | 6.83ms | 42.62ms | 21.36ms | 21.39ms | 32.45ms |
| comp_1to8 | 8.30ms | 4.68ms | 41.60ms | 20.45ms | 11.18ms | 21.05ms |
| comp_1to1000 | 6.44ms | 3.79ms | 37.80ms | 15.72ms | 6.68ms | 15.59ms |
| update_1to1 | 9.31ms | 4.65ms | 6.10ms | 15.51ms | 8.80ms | 21.89ms |
| update_2to1 | 4.72ms | 2.36ms | 3.04ms | 7.77ms | 4.45ms | 10.69ms |
| update_4to1 | 2.35ms | 1.29ms | 1.57ms | 3.88ms | 2.23ms | 5.27ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 52μs |
| update_1to2 | 4.62ms | 2.30ms | 3.05ms | 7.90ms | 4.37ms | 11.14ms |
| update_1to4 | 2.54ms | 1.22ms | 1.59ms | 3.87ms | 2.22ms | 5.32ms |
| update_1to1000 | 50μs | 51μs | 380μs | 156μs | 1.57ms | 157μs |
| cellx1000 | 10.52ms | 7.66ms | 5.14ms | 14.06ms | 9.73ms | 86.12ms |
| cellx2500 | 27.38ms | 20.81ms | 24.09ms | 37.78ms | 27.57ms | 232.56ms |
| cellx5000 | 70.36ms | 48.42ms | 65.61ms | 104.69ms | 91.23ms | 583.70ms |
| 10x5 - 2 sources - read 20.0% (simple) | 512.23ms | 234.73ms | 244.37ms | 348.17ms | 439.31ms | 1.90s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.24ms | 174.97ms | 205.03ms | 245.92ms | 264.90ms | 1.47s |
| 1000x12 - 4 sources - dynamic (large) | 3.56s | 275.36ms | 343.27ms | 478.50ms | 3.63s | 1.77s |
| 1000x5 - 25 sources (wide dense) | 3.36s | 404.65ms | 523.17ms | 595.63ms | 2.49s | 3.49s |
| 5x500 - 3 sources (deep) | 225.70ms | 188.76ms | 202.41ms | 261.54ms | 231.20ms | 1.11s |
| 100x15 - 6 sources - dynamic (very dynamic) | 474.10ms | 262.84ms | 261.18ms | 383.78ms | 450.40ms | 1.67s |

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
