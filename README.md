# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.35s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.56s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.30s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.09s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.40s |

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
| Test Case | state_beacon | alien_signals | mobx | solidart(2.0-dev) | signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 148.29ms (fail) | 183.35ms | 2.35s | 275.86ms | 213.34ms | 198.99ms |
| broadPropagation | 6.07ms (fail) | 344.78ms | 4.53s | 507.31ms | 516.76ms | 449.08ms |
| deepPropagation | 146.06ms (fail) | 119.55ms | 1.57s | 168.78ms | 173.65ms | 182.08ms |
| diamond | 182.15ms (fail) | 227.46ms | 2.49s | 351.32ms | 295.91ms | 289.42ms |
| mux | 195.32ms (fail) | 370.56ms | 1.87s | 440.99ms | 451.84ms | 400.14ms |
| repeatedObservers | 55.77ms (fail) | 45.48ms | 235.77ms | 81.78ms | 45.54ms | 40.26ms |
| triangle | 76.06ms (fail) | 84.62ms | 771.46ms | 117.33ms | 103.86ms | 99.48ms |
| unstable | 335.89ms (fail) | 66.78ms | 354.65ms | 96.96ms | 82.44ms | 70.98ms |
| molBench | 907μs | 485.27ms | 573.16ms | 493.55ms | 487.67ms | 489.61ms |
| create_signals | 59.39ms | 24.90ms | 69.19ms | 99.88ms | 25.33ms | 5.36ms |
| comp_0to1 | 53.25ms | 9.04ms | 20.23ms | 36.82ms | 11.34ms | 17.40ms |
| comp_1to1 | 55.07ms | 6.66ms | 32.03ms | 44.55ms | 29.99ms | 14.73ms |
| comp_2to1 | 36.69ms | 2.44ms | 9.40ms | 38.73ms | 11.58ms | 19.35ms |
| comp_4to1 | 16.39ms | 8.01ms | 27.85ms | 5.07ms | 2.06ms | 14.23ms |
| comp_1000to1 | 41μs | 3μs | 24μs | 18μs | 4μs | 4μs |
| comp_1to2 | 45.14ms | 10.03ms | 33.88ms | 34.96ms | 18.16ms | 17.90ms |
| comp_1to4 | 43.84ms | 11.56ms | 35.51ms | 22.30ms | 9.39ms | 35.47ms |
| comp_1to8 | 42.57ms | 5.04ms | 26.73ms | 26.64ms | 6.19ms | 7.88ms |
| comp_1to1000 | 38.59ms | 3.56ms | 16.35ms | 17.29ms | 4.19ms | 5.05ms |
| update_1to1 | 5.63ms | 8.88ms | 26.58ms | 15.97ms | 8.92ms | 8.58ms |
| update_2to1 | 3.19ms | 2.29ms | 13.15ms | 7.79ms | 4.48ms | 4.43ms |
| update_4to1 | 1.45ms | 2.05ms | 6.81ms | 4.05ms | 2.23ms | 2.18ms |
| update_1000to1 | 14μs | 20μs | 56μs | 40μs | 22μs | 21μs |
| update_1to2 | 2.92ms | 4.81ms | 13.22ms | 8.13ms | 4.48ms | 4.62ms |
| update_1to4 | 1.46ms | 2.49ms | 6.17ms | 4.14ms | 2.25ms | 2.16ms |
| update_1to1000 | 375μs | 48μs | 173μs | 172μs | 43μs | 165μs |
| cellx1000 | 5.31ms | 7.17ms | 83.46ms | 13.00ms | 9.77ms | 9.70ms |
| cellx2500 | 25.01ms | 19.62ms | 266.46ms | 38.61ms | 33.66ms | 26.36ms |
| cellx5000 | 62.12ms | 48.74ms | 601.52ms | 99.38ms | 72.67ms | 68.07ms |
| 10x5 - 2 sources - read 20.0% (simple) | 237.24ms | 269.10ms | 2.03s | 352.94ms | 508.16ms | 447.74ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 199.82ms | 175.19ms | 1.54s | 247.06ms | 278.72ms | 275.54ms |
| 1000x12 - 4 sources - dynamic (large) | 343.87ms | 280.61ms | 1.96s | 466.82ms | 3.92s | 3.72s |
| 1000x5 - 25 sources (wide dense) | 504.84ms | 414.98ms | 3.61s | 591.76ms | 3.51s | 2.70s |
| 5x500 - 3 sources (deep) | 207.46ms | 189.32ms | 1.18s | 254.15ms | 228.99ms | 228.04ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 262.52ms | 263.02ms | 1.74s | 383.96ms | 486.55ms | 451.14ms |

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
