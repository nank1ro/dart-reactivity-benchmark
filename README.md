# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.68s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.27s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.42s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 9.99s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.99s |
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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 216.73ms | 186.46ms | 144.38ms (fail) | 276.47ms | 207.52ms | 2.37s |
| broadPropagation | 461.05ms | 356.88ms | 6.22ms (fail) | 503.56ms | 465.45ms | 4.38s |
| deepPropagation | 166.99ms | 135.65ms | 137.61ms (fail) | 168.34ms | 178.98ms | 1.52s |
| diamond | 282.08ms | 239.09ms | 193.69ms (fail) | 353.06ms | 281.54ms | 2.36s |
| mux | 404.76ms | 359.95ms | 182.62ms (fail) | 415.98ms | 370.40ms | 1.86s |
| repeatedObservers | 46.24ms | 43.30ms | 52.34ms (fail) | 80.70ms | 40.57ms | 225.76ms |
| triangle | 102.03ms | 85.19ms | 81.14ms (fail) | 112.90ms | 100.16ms | 751.71ms |
| unstable | 78.03ms | 61.42ms | 336.04ms (fail) | 95.87ms | 69.74ms | 343.86ms |
| molBench | 494.67ms | 486.25ms | 1.00ms | 490.95ms | 486.04ms | 589.37ms |
| create_signals | 25.81ms | 26.72ms | 56.59ms | 93.29ms | 4.76ms | 69.71ms |
| comp_0to1 | 11.52ms | 8.39ms | 51.55ms | 36.48ms | 21.82ms | 28.54ms |
| comp_1to1 | 29.97ms | 4.32ms | 53.49ms | 53.41ms | 14.87ms | 38.60ms |
| comp_2to1 | 19.21ms | 2.25ms | 35.39ms | 36.39ms | 20.56ms | 33.79ms |
| comp_4to1 | 3.10ms | 7.55ms | 15.85ms | 11.75ms | 14.84ms | 22.64ms |
| comp_1000to1 | 5μs | 3μs | 46μs | 16μs | 4μs | 14μs |
| comp_1to2 | 19.21ms | 13.17ms | 44.02ms | 35.28ms | 15.68ms | 34.88ms |
| comp_1to4 | 9.71ms | 6.07ms | 46.63ms | 21.00ms | 30.08ms | 22.36ms |
| comp_1to8 | 6.40ms | 6.64ms | 42.44ms | 22.57ms | 7.09ms | 22.89ms |
| comp_1to1000 | 4.26ms | 4.80ms | 38.42ms | 14.43ms | 5.54ms | 15.26ms |
| update_1to1 | 9.42ms | 5.19ms | 6.10ms | 15.46ms | 8.91ms | 27.21ms |
| update_2to1 | 4.71ms | 2.34ms | 3.05ms | 7.75ms | 4.52ms | 13.71ms |
| update_4to1 | 2.34ms | 1.22ms | 1.58ms | 3.87ms | 2.18ms | 7.39ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 21μs | 68μs |
| update_1to2 | 4.63ms | 2.59ms | 3.06ms | 7.88ms | 4.36ms | 13.89ms |
| update_1to4 | 2.57ms | 1.21ms | 1.59ms | 3.87ms | 2.22ms | 6.96ms |
| update_1to1000 | 42μs | 45μs | 377μs | 150μs | 1.00ms | 160μs |
| cellx1000 | 9.72ms | 7.60ms | 5.08ms | 14.02ms | 9.59ms | 71.70ms |
| cellx2500 | 31.97ms | 21.38ms | 24.70ms | 33.74ms | 26.45ms | 250.26ms |
| cellx5000 | 63.89ms | 45.42ms | 84.21ms | 74.80ms | 74.15ms | 597.67ms |
| 10x5 - 2 sources - read 20.0% (simple) | 510.93ms | 239.42ms | 234.41ms | 346.90ms | 431.85ms | 1.94s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 288.94ms | 175.57ms | 198.06ms | 243.41ms | 271.00ms | 1.45s |
| 1000x12 - 4 sources - dynamic (large) | 3.87s | 277.25ms | 345.53ms | 463.05ms | 3.64s | 1.77s |
| 1000x5 - 25 sources (wide dense) | 3.55s | 406.96ms | 521.37ms | 589.64ms | 2.50s | 3.37s |
| 5x500 - 3 sources (deep) | 225.78ms | 190.83ms | 204.63ms | 257.82ms | 228.87ms | 1.11s |
| 100x15 - 6 sources - dynamic (very dynamic) | 470.18ms | 270.58ms | 256.69ms | 383.05ms | 446.23ms | 1.66s |

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
