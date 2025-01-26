# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.70s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 9.72s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.04s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.26s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 41.62s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.53s |

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
| Test Case | solidart | mobx | state_beacon | signals | alien_signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.23s | 2.30s | 169.69ms (fail) | 214.22ms | 189.19ms | 210.09ms |
| broadPropagation | 5.69s | 4.36s | 7.29ms (fail) | 461.74ms | 351.28ms | 453.35ms |
| deepPropagation | 2.04s | 1.56s | 148.05ms (fail) | 179.37ms | 123.45ms | 176.28ms |
| diamond | 3.54s | 2.48s | 191.56ms (fail) | 290.69ms | 235.45ms | 274.87ms |
| mux | 2.13s | 1.81s | 195.51ms (fail) | 408.43ms | 379.41ms | 387.14ms |
| repeatedObservers | 214.61ms | 233.68ms | 53.92ms (fail) | 45.68ms | 44.47ms | 40.84ms |
| triangle | 1.14s | 764.85ms | 91.87ms (fail) | 100.50ms | 91.20ms | 97.22ms |
| unstable | 345.60ms | 358.00ms | 339.16ms (fail) | 78.11ms | 60.83ms | 69.59ms |
| molBench | 1.79s | 588.53ms | 1.41ms | 487.84ms | 488.99ms | 484.09ms |
| create_signals | 69.73ms | 68.60ms | 70.16ms | 30.11ms | 20.63ms | 4.62ms |
| comp_0to1 | 31.70ms | 20.85ms | 49.93ms | 15.02ms | 5.22ms | 16.77ms |
| comp_1to1 | 55.34ms | 31.54ms | 54.13ms | 18.04ms | 11.01ms | 16.33ms |
| comp_2to1 | 30.47ms | 22.52ms | 33.97ms | 16.59ms | 14.63ms | 11.44ms |
| comp_4to1 | 12.95ms | 21.61ms | 17.63ms | 1.99ms | 2.48ms | 13.17ms |
| comp_1000to1 | 2.03ms | 19μs | 48μs | 7μs | 17μs | 4μs |
| comp_1to2 | 31.99ms | 32.83ms | 46.81ms | 11.41ms | 17.81ms | 19.57ms |
| comp_1to4 | 27.56ms | 21.74ms | 45.06ms | 14.43ms | 12.02ms | 20.22ms |
| comp_1to8 | 23.56ms | 20.38ms | 45.48ms | 10.86ms | 4.12ms | 7.62ms |
| comp_1to1000 | 18.70ms | 15.21ms | 41.35ms | 4.58ms | 3.71ms | 6.49ms |
| update_1to1 | 43.20ms | 24.31ms | 9.73ms | 12.29ms | 4.52ms | 8.77ms |
| update_2to1 | 21.36ms | 11.80ms | 2.94ms | 5.68ms | 2.80ms | 4.38ms |
| update_4to1 | 10.78ms | 7.30ms | 1.90ms | 2.41ms | 1.16ms | 2.27ms |
| update_1000to1 | 126μs | 68μs | 24μs | 23μs | 13μs | 38μs |
| update_1to2 | 21.51ms | 14.17ms | 5.18ms | 5.71ms | 2.21ms | 4.41ms |
| update_1to4 | 11.01ms | 6.98ms | 1.46ms | 2.38ms | 1.15ms | 2.24ms |
| update_1to1000 | 213μs | 182μs | 408μs | 46μs | 49μs | 513μs |
| cellx1000 | 159.66ms | 70.54ms | 6.05ms | 11.13ms | 7.42ms | 9.56ms |
| cellx2500 | 495.52ms | 257.97ms | 19.23ms | 35.57ms | 19.68ms | 25.58ms |
| cellx5000 | 1.12s | 541.75ms | 58.84ms | 63.50ms | 42.82ms | 66.28ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.86s (partial) | 2.00s | 266.32ms | 530.88ms | 241.59ms | 425.18ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.50s (partial) | 1.53s | 207.11ms | 276.56ms | 179.29ms | 272.03ms |
| 1000x12 - 4 sources - dynamic (large) | 4.44s (partial) | 1.83s | 344.54ms | 3.65s | 279.74ms | 3.41s |
| 1000x5 - 25 sources (wide dense) | 5.60s (partial) | 3.48s | 506.13ms | 3.36s | 404.96ms | 2.50s |
| 5x500 - 3 sources (deep) | 1.98s (partial) | 1.12s | 234.18ms | 228.84ms | 197.97ms | 228.96ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.92s (partial) | 1.65s | 263.33ms | 470.43ms | 263.01ms | 447.68ms |

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
