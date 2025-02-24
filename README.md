# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.72s |
| 🥈 | preact_signals | 0.30 | 100.0% | 35/35 | 9.96s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.16s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.22s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.40s |
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
| Test Case | alien_signals | mobx | solidart | state_beacon | preact_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 187.79ms | 2.33s | 2.18s | 164.91ms (fail) | 206.54ms | 210.36ms |
| broadPropagation | 353.12ms | 4.23s | 5.45s | 7.56ms (fail) | 462.93ms | 456.69ms |
| deepPropagation | 124.45ms | 1.51s | 2.01s | 143.39ms (fail) | 179.10ms | 177.76ms |
| diamond | 232.83ms | 2.36s | 3.44s | 219.35ms (fail) | 278.36ms | 281.39ms |
| mux | 393.52ms | 1.79s | 2.04s | 191.28ms (fail) | 381.05ms | 409.71ms |
| repeatedObservers | 45.81ms | 225.69ms | 208.77ms | 52.71ms (fail) | 38.63ms | 45.82ms |
| triangle | 83.55ms | 756.36ms | 1.16s | 82.70ms (fail) | 99.37ms | 104.27ms |
| unstable | 60.70ms | 347.10ms | 340.04ms | 338.71ms (fail) | 70.50ms | 74.66ms |
| molBench | 493.36ms | 578.34ms | 1.71s | 1.14ms | 490.18ms | 483.25ms |
| create_signals | 28.07ms | 80.57ms | 79.47ms | 63.50ms | 4.90ms | 25.36ms |
| comp_0to1 | 8.02ms | 27.15ms | 31.70ms | 54.04ms | 17.54ms | 11.73ms |
| comp_1to1 | 4.40ms | 43.57ms | 44.28ms | 61.71ms | 11.48ms | 27.73ms |
| comp_2to1 | 2.33ms | 23.32ms | 33.65ms | 43.90ms | 21.59ms | 16.20ms |
| comp_4to1 | 8.01ms | 30.22ms | 12.23ms | 18.71ms | 7.58ms | 5.08ms |
| comp_1000to1 | 4μs | 15μs | 1.83ms | 42μs | 4μs | 5μs |
| comp_1to2 | 9.81ms | 37.94ms | 26.52ms | 48.38ms | 15.04ms | 13.58ms |
| comp_1to4 | 12.29ms | 20.80ms | 27.36ms | 44.70ms | 25.21ms | 16.01ms |
| comp_1to8 | 5.00ms | 22.86ms | 24.22ms | 44.78ms | 7.02ms | 6.99ms |
| comp_1to1000 | 6.08ms | 14.59ms | 17.56ms | 38.75ms | 5.54ms | 4.59ms |
| update_1to1 | 6.25ms | 24.95ms | 40.91ms | 5.72ms | 8.18ms | 9.19ms |
| update_2to1 | 5.05ms | 11.98ms | 20.83ms | 3.02ms | 4.05ms | 4.57ms |
| update_4to1 | 1.53ms | 6.83ms | 10.18ms | 1.43ms | 2.30ms | 2.33ms |
| update_1000to1 | 24μs | 77μs | 111μs | 15μs | 20μs | 33μs |
| update_1to2 | 3.59ms | 12.77ms | 20.74ms | 2.96ms | 4.05ms | 4.92ms |
| update_1to4 | 2.42ms | 5.71ms | 10.30ms | 1.44ms | 2.03ms | 2.33ms |
| update_1to1000 | 52μs | 165μs | 215μs | 400μs | 145μs | 43μs |
| cellx1000 | 7.39ms | 70.64ms | 165.87ms | 5.88ms | 9.54ms | 9.64ms |
| cellx2500 | 21.44ms | 256.92ms | 457.27ms | 28.93ms | 25.63ms | 31.15ms |
| cellx5000 | 60.52ms | 573.17ms | 1.14s | 89.38ms | 71.06ms | 61.77ms |
| 10x5 - 2 sources - read 20.0% (simple) | 227.50ms | 1.99s | 2.58s (partial) | 259.68ms | 439.39ms | 508.35ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 180.91ms | 1.56s | 2.39s (partial) | 214.30ms | 271.58ms | 277.90ms |
| 1000x12 - 4 sources - dynamic (large) | 281.69ms | 1.87s | 4.09s (partial) | 352.35ms | 3.51s | 3.74s |
| 1000x5 - 25 sources (wide dense) | 403.80ms | 3.52s | 4.91s (partial) | 507.91ms | 2.61s | 3.42s |
| 5x500 - 3 sources (deep) | 189.77ms | 1.14s | 1.98s (partial) | 207.15ms | 232.45ms | 229.91ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 264.26ms | 1.74s | 2.75s (partial) | 260.82ms | 448.91ms | 480.60ms |

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
