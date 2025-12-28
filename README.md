# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.74s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.23s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 10.89s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.14s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.65s |
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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 212.97ms | 188.74ms | 163.36ms (fail) | 282.06ms | 207.79ms | 2.40s |
| broadPropagation | 453.55ms | 351.85ms | 6.54ms (fail) | 497.36ms | 463.17ms | 4.43s |
| deepPropagation | 171.73ms | 138.69ms | 141.58ms (fail) | 169.95ms | 178.15ms | 1.52s |
| diamond | 282.51ms | 232.41ms | 185.12ms (fail) | 353.53ms | 285.97ms | 2.45s |
| mux | 391.81ms | 358.34ms | 185.20ms (fail) | 412.08ms | 376.65ms | 1.87s |
| repeatedObservers | 46.55ms | 43.39ms | 52.64ms (fail) | 82.33ms | 40.40ms | 232.62ms |
| triangle | 102.27ms | 84.52ms | 76.82ms (fail) | 114.53ms | 102.12ms | 761.49ms |
| unstable | 78.17ms | 61.94ms | 336.45ms (fail) | 95.14ms | 71.53ms | 353.81ms |
| molBench | 495.97ms | 486.45ms | 1.08ms | 490.04ms | 488.57ms | 592.16ms |
| create_signals | 27.35ms | 27.17ms | 64.39ms | 60.05ms | 4.72ms | 79.24ms |
| comp_0to1 | 11.85ms | 9.03ms | 57.40ms | 26.21ms | 18.46ms | 20.63ms |
| comp_1to1 | 18.79ms | 4.43ms | 58.42ms | 47.65ms | 13.44ms | 30.53ms |
| comp_2to1 | 18.27ms | 2.42ms | 44.56ms | 37.84ms | 18.49ms | 8.98ms |
| comp_4to1 | 2.19ms | 9.45ms | 17.65ms | 11.31ms | 9.08ms | 17.61ms |
| comp_1000to1 | 5μs | 4μs | 41μs | 16μs | 6μs | 15μs |
| comp_1to2 | 15.37ms | 15.89ms | 48.45ms | 28.15ms | 28.19ms | 35.86ms |
| comp_1to4 | 11.82ms | 5.82ms | 44.52ms | 20.65ms | 28.64ms | 19.89ms |
| comp_1to8 | 6.48ms | 5.10ms | 44.29ms | 21.90ms | 6.44ms | 22.14ms |
| comp_1to1000 | 4.45ms | 3.93ms | 38.42ms | 15.27ms | 5.81ms | 15.56ms |
| update_1to1 | 9.35ms | 5.03ms | 6.09ms | 15.44ms | 9.85ms | 23.30ms |
| update_2to1 | 4.73ms | 2.36ms | 3.05ms | 7.74ms | 4.71ms | 12.16ms |
| update_4to1 | 2.36ms | 1.21ms | 1.53ms | 3.86ms | 2.84ms | 7.41ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 23μs | 71μs |
| update_1to2 | 4.63ms | 2.26ms | 3.08ms | 7.88ms | 4.72ms | 13.88ms |
| update_1to4 | 2.59ms | 1.22ms | 1.58ms | 3.87ms | 2.21ms | 6.90ms |
| update_1to1000 | 45μs | 42μs | 366μs | 159μs | 839μs | 183μs |
| cellx1000 | 10.39ms | 9.68ms | 6.65ms | 13.13ms | 11.61ms | 79.31ms |
| cellx2500 | 36.50ms | 29.93ms | 49.79ms | 33.56ms | 33.66ms | 281.62ms |
| cellx5000 | 86.59ms | 81.28ms | 104.39ms | 72.71ms | 102.64ms | 676.03ms |
| 10x5 - 2 sources - read 20.0% (simple) | 503.47ms | 258.19ms | 235.43ms | 343.34ms | 455.14ms | 1.94s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 287.65ms | 172.93ms | 199.04ms | 245.84ms | 273.29ms | 1.49s |
| 1000x12 - 4 sources - dynamic (large) | 3.61s | 284.16ms | 356.83ms | 469.11ms | 3.70s | 1.90s |
| 1000x5 - 25 sources (wide dense) | 3.26s | 410.34ms | 523.63ms | 595.31ms | 2.52s | 3.50s |
| 5x500 - 3 sources (deep) | 224.91ms | 191.76ms | 207.11ms | 260.28ms | 232.41ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 492.83ms | 264.00ms | 259.85ms | 388.46ms | 440.50ms | 1.72s |

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
