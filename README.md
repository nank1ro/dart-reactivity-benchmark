# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.71s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 10.31s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.34s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 10.82s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.73s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.49s |

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
| avoidablePropagation | 201.35ms | 197.26ms | 146.23ms (fail) | 281.15ms | 207.29ms | 2.35s |
| broadPropagation | 462.43ms | 359.26ms | 6.68ms (fail) | 505.46ms | 447.82ms | 4.17s |
| deepPropagation | 172.89ms | 131.59ms | 136.97ms (fail) | 175.64ms | 174.75ms | 1.51s |
| diamond | 291.90ms | 244.30ms | 188.08ms (fail) | 358.08ms | 285.69ms | 2.37s |
| mux | 401.54ms | 361.72ms | 190.84ms (fail) | 422.45ms | 375.02ms | 1.75s |
| repeatedObservers | 45.66ms | 45.64ms | 58.26ms (fail) | 81.17ms | 42.42ms | 225.22ms |
| triangle | 102.06ms | 89.16ms | 76.27ms (fail) | 115.83ms | 100.92ms | 743.97ms |
| unstable | 76.19ms | 61.38ms | 334.69ms (fail) | 97.31ms | 71.54ms | 337.64ms |
| molBench | 493.73ms | 487.28ms | 968μs | 493.96ms | 494.77ms | 583.64ms |
| create_signals | 25.21ms | 27.03ms | 65.85ms | 97.27ms | 4.57ms | 69.70ms |
| comp_0to1 | 12.13ms | 7.93ms | 64.11ms | 36.80ms | 17.26ms | 26.60ms |
| comp_1to1 | 32.40ms | 4.32ms | 53.81ms | 51.56ms | 12.58ms | 31.51ms |
| comp_2to1 | 17.46ms | 2.26ms | 36.63ms | 20.76ms | 16.49ms | 28.68ms |
| comp_4to1 | 1.77ms | 8.54ms | 16.78ms | 20.75ms | 11.04ms | 27.89ms |
| comp_1000to1 | 8μs | 5μs | 42μs | 19μs | 6μs | 15μs |
| comp_1to2 | 19.54ms | 14.79ms | 48.99ms | 33.04ms | 14.62ms | 37.84ms |
| comp_1to4 | 14.99ms | 10.40ms | 44.83ms | 16.96ms | 25.70ms | 22.41ms |
| comp_1to8 | 7.42ms | 6.39ms | 44.97ms | 21.55ms | 7.07ms | 24.55ms |
| comp_1to1000 | 4.09ms | 3.44ms | 39.29ms | 13.99ms | 4.43ms | 15.29ms |
| update_1to1 | 8.97ms | 4.68ms | 8.91ms | 15.63ms | 8.87ms | 21.27ms |
| update_2to1 | 4.51ms | 2.33ms | 2.83ms | 7.81ms | 4.59ms | 10.37ms |
| update_4to1 | 2.43ms | 1.31ms | 2.66ms | 3.89ms | 2.25ms | 5.34ms |
| update_1000to1 | 22μs | 11μs | 14μs | 39μs | 22μs | 52μs |
| update_1to2 | 4.43ms | 2.31ms | 4.73ms | 7.88ms | 4.41ms | 10.38ms |
| update_1to4 | 2.24ms | 1.19ms | 1.42ms | 3.96ms | 2.28ms | 5.31ms |
| update_1to1000 | 44μs | 42μs | 407μs | 167μs | 166μs | 171μs |
| cellx1000 | 12.72ms | 7.58ms | 6.39ms | 14.13ms | 9.86ms | 76.59ms |
| cellx2500 | 42.80ms | 20.61ms | 20.24ms | 34.45ms | 26.09ms | 254.57ms |
| cellx5000 | 99.76ms | 46.85ms | 72.44ms | 93.05ms | 70.24ms | 574.10ms |
| 10x5 - 2 sources - read 20.0% (simple) | 504.88ms | 238.96ms | 248.80ms | 351.76ms | 448.97ms | 1.97s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.99ms | 181.77ms | 205.52ms | 249.51ms | 278.16ms | 1.47s |
| 1000x12 - 4 sources - dynamic (large) | 3.50s | 278.24ms | 346.46ms | 464.05ms | 3.67s | 1.87s |
| 1000x5 - 25 sources (wide dense) | 3.27s | 404.70ms | 519.86ms | 600.05ms | 2.79s | 3.36s |
| 5x500 - 3 sources (deep) | 226.55ms | 190.16ms | 211.19ms | 255.63ms | 236.97ms | 1.11s |
| 100x15 - 6 sources - dynamic (very dynamic) | 482.45ms | 268.43ms | 281.33ms | 392.04ms | 445.06ms | 1.67s |

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
