# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.33s |
| 🥉 | preact_signals | 0.25 | 100.0% | 35/35 | 9.92s |
| 4 | signals | 0.24 | 100.0% | 35/35 | 11.04s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.97s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.44s |

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
| Test Case | preact_signals | solidart(2.0-dev) | mobx | alien_signals | state_beacon | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 198.85ms | 274.65ms | 2.37s | 185.63ms | 144.87ms (fail) | 200.86ms |
| broadPropagation | 443.20ms | 505.46ms | 4.40s | 345.10ms | 6.39ms (fail) | 460.30ms |
| deepPropagation | 173.93ms | 172.33ms | 1.51s | 135.28ms | 138.80ms (fail) | 172.93ms |
| diamond | 280.87ms | 366.17ms | 2.39s | 232.97ms | 176.21ms (fail) | 288.98ms |
| mux | 384.91ms | 434.90ms | 1.77s | 402.15ms | 183.01ms (fail) | 405.22ms |
| repeatedObservers | 40.83ms | 80.15ms | 236.24ms | 43.57ms | 52.57ms (fail) | 48.60ms |
| triangle | 99.57ms | 118.48ms | 756.63ms | 83.76ms | 78.85ms (fail) | 101.24ms |
| unstable | 73.66ms | 95.81ms | 348.73ms | 59.79ms | 337.12ms (fail) | 73.23ms |
| molBench | 483.74ms | 493.14ms | 593.04ms | 487.73ms | 902μs | 496.45ms |
| create_signals | 4.67ms | 59.22ms | 70.59ms | 31.55ms | 61.75ms | 26.02ms |
| comp_0to1 | 18.01ms | 26.64ms | 31.85ms | 8.70ms | 55.27ms | 11.61ms |
| comp_1to1 | 13.79ms | 44.12ms | 32.12ms | 4.26ms | 56.19ms | 28.93ms |
| comp_2to1 | 18.32ms | 39.02ms | 37.49ms | 2.30ms | 38.24ms | 20.30ms |
| comp_4to1 | 8.11ms | 4.54ms | 17.23ms | 10.28ms | 16.72ms | 6.03ms |
| comp_1000to1 | 4μs | 15μs | 16μs | 3μs | 44μs | 4μs |
| comp_1to2 | 29.32ms | 33.28ms | 36.31ms | 13.58ms | 47.51ms | 16.94ms |
| comp_1to4 | 28.24ms | 21.22ms | 17.82ms | 9.09ms | 48.75ms | 20.70ms |
| comp_1to8 | 7.32ms | 23.53ms | 20.59ms | 3.84ms | 44.77ms | 6.51ms |
| comp_1to1000 | 6.08ms | 14.71ms | 15.53ms | 3.60ms | 39.55ms | 4.04ms |
| update_1to1 | 9.50ms | 16.07ms | 26.07ms | 10.05ms | 5.80ms | 9.76ms |
| update_2to1 | 4.59ms | 7.78ms | 11.13ms | 2.25ms | 3.78ms | 4.96ms |
| update_4to1 | 2.46ms | 3.98ms | 6.39ms | 2.49ms | 1.54ms | 3.31ms |
| update_1000to1 | 23μs | 38μs | 68μs | 10μs | 15μs | 24μs |
| update_1to2 | 4.71ms | 8.26ms | 11.18ms | 5.21ms | 2.92ms | 4.90ms |
| update_1to4 | 2.44ms | 4.02ms | 6.83ms | 1.08ms | 1.53ms | 2.53ms |
| update_1to1000 | 631μs | 147μs | 163μs | 34μs | 398μs | 69μs |
| cellx1000 | 9.96ms | 12.92ms | 76.86ms | 7.43ms | 5.51ms | 10.09ms |
| cellx2500 | 29.34ms | 43.92ms | 273.82ms | 20.42ms | 27.25ms | 36.83ms |
| cellx5000 | 86.90ms | 109.85ms | 568.77ms | 51.41ms | 80.75ms | 82.22ms |
| 10x5 - 2 sources - read 20.0% (simple) | 444.98ms | 350.45ms | 1.92s | 238.96ms | 245.25ms | 499.80ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 268.23ms | 252.75ms | 1.46s | 175.83ms | 203.04ms | 288.88ms |
| 1000x12 - 4 sources - dynamic (large) | 3.53s | 476.42ms | 1.84s | 288.06ms | 354.56ms | 3.65s |
| 1000x5 - 25 sources (wide dense) | 2.54s | 608.91ms | 3.33s | 408.28ms | 513.14ms | 3.37s |
| 5x500 - 3 sources (deep) | 229.20ms | 252.18ms | 1.10s | 189.08ms | 205.06ms | 220.35ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 441.53ms | 378.48ms | 1.69s | 266.09ms | 257.50ms | 477.50ms |

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
