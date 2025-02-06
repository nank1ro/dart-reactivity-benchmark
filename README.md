# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.72s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.21s |
| 🥉 | preact_signals | 0.25 | 100.0% | 35/35 | 9.87s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.60s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.94s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.55s |

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
| avoidablePropagation | 2.21s | 2.33s | 169.73ms (fail) | 210.97ms | 190.54ms | 209.38ms |
| broadPropagation | 5.51s | 4.32s | 6.99ms (fail) | 462.14ms | 348.24ms | 454.44ms |
| deepPropagation | 2.08s | 1.55s | 145.17ms (fail) | 173.99ms | 123.37ms | 170.24ms |
| diamond | 3.48s | 2.43s | 210.65ms (fail) | 283.43ms | 240.13ms | 278.91ms |
| mux | 2.09s | 1.78s | 193.41ms (fail) | 419.68ms | 383.89ms | 390.91ms |
| repeatedObservers | 214.66ms | 232.92ms | 53.45ms (fail) | 44.50ms | 43.74ms | 41.27ms |
| triangle | 1.16s | 765.22ms | 80.75ms (fail) | 101.40ms | 86.18ms | 98.04ms |
| unstable | 345.58ms | 349.77ms | 342.48ms (fail) | 77.79ms | 59.63ms | 69.70ms |
| molBench | 1.75s | 586.89ms | 901μs | 486.53ms | 472.02ms | 484.97ms |
| create_signals | 59.74ms | 78.57ms | 63.02ms | 31.54ms | 20.66ms | 4.66ms |
| comp_0to1 | 45.34ms | 15.98ms | 54.61ms | 14.63ms | 4.99ms | 17.88ms |
| comp_1to1 | 41.99ms | 54.04ms | 52.48ms | 23.52ms | 8.80ms | 14.85ms |
| comp_2to1 | 27.99ms | 23.91ms | 33.28ms | 11.52ms | 4.27ms | 16.09ms |
| comp_4to1 | 16.49ms | 14.76ms | 17.06ms | 2.01ms | 12.24ms | 10.99ms |
| comp_1000to1 | 2.12ms | 15μs | 46μs | 5μs | 4μs | 5μs |
| comp_1to2 | 28.75ms | 37.52ms | 45.75ms | 13.19ms | 17.25ms | 24.25ms |
| comp_1to4 | 27.94ms | 17.68ms | 43.28ms | 20.25ms | 16.07ms | 26.09ms |
| comp_1to8 | 23.33ms | 21.41ms | 43.54ms | 6.76ms | 5.18ms | 5.67ms |
| comp_1to1000 | 18.42ms | 15.73ms | 40.05ms | 7.22ms | 3.62ms | 5.52ms |
| update_1to1 | 43.89ms | 27.95ms | 8.79ms | 9.39ms | 4.37ms | 15.81ms |
| update_2to1 | 22.17ms | 14.55ms | 2.89ms | 4.70ms | 2.80ms | 6.72ms |
| update_4to1 | 11.01ms | 7.54ms | 2.43ms | 2.37ms | 1.13ms | 3.48ms |
| update_1000to1 | 118μs | 68μs | 15μs | 23μs | 11μs | 22μs |
| update_1to2 | 22.40ms | 14.18ms | 3.27ms | 4.72ms | 2.24ms | 6.95ms |
| update_1to4 | 11.16ms | 6.87ms | 1.82ms | 2.38ms | 1.13ms | 3.86ms |
| update_1to1000 | 218μs | 185μs | 409μs | 48μs | 46μs | 703μs |
| cellx1000 | 188.26ms | 100.08ms | 5.42ms | 9.86ms | 7.80ms | 9.71ms |
| cellx2500 | 513.28ms | 315.26ms | 19.59ms | 29.27ms | 23.16ms | 26.12ms |
| cellx5000 | 1.17s | 652.33ms | 56.09ms | 79.18ms | 62.25ms | 64.70ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.64s (partial) | 2.06s | 277.25ms | 499.33ms | 236.58ms | 419.26ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.38s (partial) | 1.54s | 211.21ms | 276.63ms | 187.09ms | 280.18ms |
| 1000x12 - 4 sources - dynamic (large) | 4.06s (partial) | 1.83s | 342.91ms | 3.86s | 287.40ms | 3.43s |
| 1000x5 - 25 sources (wide dense) | 4.92s (partial) | 3.58s | 527.57ms | 3.33s | 399.69ms | 2.59s |
| 5x500 - 3 sources (deep) | 1.98s (partial) | 1.13s | 234.67ms | 228.53ms | 205.51ms | 233.13ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.86s (partial) | 1.71s | 263.55ms | 475.34ms | 262.89ms | 462.36ms |

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
