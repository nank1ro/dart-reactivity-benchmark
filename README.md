# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.24s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.29s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.40s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.00s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.41s |

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
| Test Case | solidart(2.0-dev) | alien_signals | state_beacon | preact_signals | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 272.14ms | 198.92ms | 148.74ms (fail) | 209.10ms | 2.33s | 198.85ms |
| broadPropagation | 506.59ms | 358.12ms | 6.55ms (fail) | 456.65ms | 4.31s | 463.13ms |
| deepPropagation | 164.54ms | 128.54ms | 138.39ms (fail) | 174.49ms | 1.55s | 170.24ms |
| diamond | 351.55ms | 244.49ms | 190.71ms (fail) | 285.33ms | 2.37s | 288.30ms |
| mux | 417.00ms | 366.10ms | 182.49ms (fail) | 373.49ms | 1.76s | 402.24ms |
| repeatedObservers | 80.69ms | 45.89ms | 57.09ms (fail) | 42.18ms | 231.37ms | 45.88ms |
| triangle | 116.22ms | 89.02ms | 76.19ms (fail) | 100.49ms | 764.53ms | 100.79ms |
| unstable | 96.53ms | 62.95ms | 336.66ms (fail) | 71.48ms | 348.02ms | 75.96ms |
| molBench | 488.59ms | 481.23ms | 1.38ms | 496.23ms | 585.41ms | 493.86ms |
| create_signals | 74.49ms | 28.12ms | 58.12ms | 4.80ms | 68.26ms | 27.03ms |
| comp_0to1 | 26.78ms | 7.83ms | 52.97ms | 17.66ms | 27.40ms | 11.58ms |
| comp_1to1 | 39.34ms | 4.15ms | 54.04ms | 11.00ms | 37.02ms | 27.78ms |
| comp_2to1 | 38.72ms | 2.33ms | 35.90ms | 13.45ms | 21.63ms | 9.31ms |
| comp_4to1 | 12.54ms | 7.70ms | 16.87ms | 11.81ms | 22.79ms | 1.87ms |
| comp_1000to1 | 16μs | 4μs | 42μs | 6μs | 16μs | 4μs |
| comp_1to2 | 27.48ms | 9.77ms | 45.22ms | 18.87ms | 39.52ms | 16.34ms |
| comp_1to4 | 20.88ms | 12.33ms | 45.69ms | 29.30ms | 24.28ms | 9.57ms |
| comp_1to8 | 20.26ms | 4.77ms | 43.07ms | 8.70ms | 23.12ms | 6.07ms |
| comp_1to1000 | 14.68ms | 3.51ms | 39.37ms | 5.94ms | 15.34ms | 4.08ms |
| update_1to1 | 15.62ms | 4.63ms | 8.18ms | 9.28ms | 21.27ms | 8.92ms |
| update_2to1 | 7.83ms | 2.33ms | 2.85ms | 4.62ms | 10.47ms | 4.49ms |
| update_4to1 | 3.91ms | 1.21ms | 2.55ms | 2.28ms | 5.94ms | 2.28ms |
| update_1000to1 | 39μs | 11μs | 15μs | 23μs | 52μs | 22μs |
| update_1to2 | 8.01ms | 2.33ms | 4.03ms | 4.58ms | 10.43ms | 4.45ms |
| update_1to4 | 3.93ms | 1.20ms | 1.46ms | 2.43ms | 5.40ms | 2.24ms |
| update_1to1000 | 166μs | 45μs | 380μs | 833μs | 153μs | 41μs |
| cellx1000 | 11.46ms | 7.29ms | 5.10ms | 10.09ms | 78.34ms | 9.66ms |
| cellx2500 | 34.51ms | 19.82ms | 20.99ms | 31.79ms | 252.89ms | 33.26ms |
| cellx5000 | 84.47ms | 44.70ms | 64.90ms | 86.59ms | 559.48ms | 62.62ms |
| 10x5 - 2 sources - read 20.0% (simple) | 345.86ms | 239.83ms | 240.31ms | 466.09ms | 2.00s | 503.40ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 254.27ms | 185.48ms | 202.23ms | 277.17ms | 1.51s | 282.68ms |
| 1000x12 - 4 sources - dynamic (large) | 466.19ms | 275.53ms | 343.49ms | 3.73s | 1.87s | 3.87s |
| 1000x5 - 25 sources (wide dense) | 599.09ms | 409.29ms | 516.84ms | 2.76s | 3.36s | 3.46s |
| 5x500 - 3 sources (deep) | 251.33ms | 187.47ms | 206.55ms | 231.38ms | 1.13s | 221.21ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 381.21ms | 260.48ms | 255.71ms | 449.01ms | 1.65s | 471.47ms |

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
