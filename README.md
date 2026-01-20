# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.66s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.11s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.35s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.07s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.53s |
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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 210.03ms | 189.09ms | 162.66ms (fail) | 280.73ms | 204.40ms | 2.39s |
| broadPropagation | 449.61ms | 352.24ms | 6.65ms (fail) | 502.44ms | 447.52ms | 4.42s |
| deepPropagation | 170.87ms | 127.11ms | 140.76ms (fail) | 170.31ms | 173.82ms | 1.50s |
| diamond | 287.23ms | 232.86ms | 204.06ms (fail) | 362.44ms | 287.15ms | 2.38s |
| mux | 394.91ms | 357.82ms | 185.73ms (fail) | 415.74ms | 375.12ms | 1.87s |
| repeatedObservers | 46.34ms | 44.22ms | 52.50ms (fail) | 80.47ms | 41.18ms | 233.34ms |
| triangle | 100.54ms | 86.73ms | 79.68ms (fail) | 114.77ms | 101.36ms | 755.58ms |
| unstable | 77.97ms | 62.12ms | 336.99ms (fail) | 96.29ms | 68.95ms | 343.29ms |
| molBench | 495.94ms | 485.69ms | 930μs | 490.71ms | 484.69ms | 589.51ms |
| create_signals | 26.65ms | 21.29ms | 71.83ms | 93.95ms | 5.38ms | 78.06ms |
| comp_0to1 | 11.66ms | 8.86ms | 62.91ms | 35.86ms | 22.13ms | 25.95ms |
| comp_1to1 | 19.71ms | 4.33ms | 59.56ms | 55.43ms | 14.81ms | 30.21ms |
| comp_2to1 | 8.95ms | 2.27ms | 46.05ms | 20.89ms | 21.64ms | 11.76ms |
| comp_4to1 | 2.37ms | 8.53ms | 19.61ms | 16.88ms | 8.93ms | 15.89ms |
| comp_1000to1 | 5μs | 4μs | 42μs | 19μs | 6μs | 24μs |
| comp_1to2 | 21.77ms | 13.66ms | 49.20ms | 40.42ms | 28.96ms | 39.68ms |
| comp_1to4 | 11.85ms | 6.83ms | 48.34ms | 22.68ms | 26.86ms | 25.37ms |
| comp_1to8 | 6.38ms | 8.72ms | 44.60ms | 23.95ms | 5.91ms | 26.29ms |
| comp_1to1000 | 4.27ms | 5.24ms | 38.46ms | 14.57ms | 5.58ms | 15.56ms |
| update_1to1 | 9.29ms | 4.66ms | 6.16ms | 15.93ms | 8.77ms | 27.46ms |
| update_2to1 | 4.69ms | 3.69ms | 3.16ms | 7.75ms | 4.55ms | 13.81ms |
| update_4to1 | 2.37ms | 1.21ms | 1.56ms | 3.87ms | 2.21ms | 7.48ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 26μs | 68μs |
| update_1to2 | 4.58ms | 5.27ms | 3.14ms | 7.77ms | 4.44ms | 13.79ms |
| update_1to4 | 2.59ms | 2.54ms | 1.63ms | 3.87ms | 2.23ms | 6.94ms |
| update_1to1000 | 43μs | 35μs | 372μs | 150μs | 869μs | 163μs |
| cellx1000 | 9.60ms | 9.30ms | 6.64ms | 12.60ms | 9.66ms | 91.44ms |
| cellx2500 | 32.50ms | 19.50ms | 37.90ms | 41.72ms | 29.34ms | 324.11ms |
| cellx5000 | 66.44ms | 44.48ms | 109.75ms | 105.86ms | 81.92ms | 643.57ms |
| 10x5 - 2 sources - read 20.0% (simple) | 504.45ms | 236.71ms | 236.36ms | 350.01ms | 447.87ms | 1.93s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 277.72ms | 173.81ms | 197.86ms | 246.42ms | 274.95ms | 1.49s |
| 1000x12 - 4 sources - dynamic (large) | 3.88s | 278.65ms | 364.51ms | 472.25ms | 3.67s | 2.02s |
| 1000x5 - 25 sources (wide dense) | 3.27s | 407.53ms | 517.06ms | 596.21ms | 2.53s | 3.39s |
| 5x500 - 3 sources (deep) | 228.27ms | 195.54ms | 205.85ms | 261.22ms | 228.98ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 472.32ms | 260.42ms | 256.75ms | 385.99ms | 443.72ms | 1.70s |

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
