# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.33s |
| 🥉 | signals | 0.28 | 100.0% | 35/35 | 11.17s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.16s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.41s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.45s |

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
| avoidablePropagation | 217.38ms | 186.60ms | 144.43ms (fail) | 275.82ms | 201.59ms | 2.38s |
| broadPropagation | 461.79ms | 353.52ms | 6.62ms (fail) | 497.19ms | 453.18ms | 4.41s |
| deepPropagation | 184.04ms | 130.19ms | 142.28ms (fail) | 168.76ms | 179.26ms | 1.52s |
| diamond | 291.38ms | 230.99ms | 185.01ms (fail) | 353.87ms | 283.22ms | 2.40s |
| mux | 392.41ms | 362.53ms | 181.96ms (fail) | 425.47ms | 379.21ms | 1.87s |
| repeatedObservers | 46.36ms | 45.10ms | 52.65ms (fail) | 79.94ms | 41.13ms | 241.82ms |
| triangle | 101.10ms | 84.92ms | 76.36ms (fail) | 115.87ms | 101.40ms | 776.03ms |
| unstable | 78.83ms | 63.69ms | 341.62ms (fail) | 95.27ms | 70.64ms | 345.22ms |
| molBench | 496.08ms | 486.22ms | 1.53ms | 490.84ms | 486.56ms | 592.43ms |
| create_signals | 27.01ms | 21.12ms | 62.86ms | 80.04ms | 19.74ms | 51.10ms |
| comp_0to1 | 12.81ms | 7.93ms | 53.19ms | 26.76ms | 17.75ms | 15.51ms |
| comp_1to1 | 28.91ms | 4.34ms | 54.23ms | 28.59ms | 7.48ms | 32.00ms |
| comp_2to1 | 9.25ms | 2.34ms | 39.58ms | 47.93ms | 11.03ms | 35.24ms |
| comp_4to1 | 2.98ms | 10.59ms | 17.00ms | 4.68ms | 15.98ms | 28.29ms |
| comp_1000to1 | 4μs | 6μs | 41μs | 15μs | 5μs | 27μs |
| comp_1to2 | 21.70ms | 18.72ms | 44.59ms | 34.88ms | 26.48ms | 31.73ms |
| comp_1to4 | 13.74ms | 8.95ms | 44.36ms | 20.97ms | 27.45ms | 17.61ms |
| comp_1to8 | 7.49ms | 3.91ms | 42.34ms | 24.99ms | 7.10ms | 20.54ms |
| comp_1to1000 | 4.56ms | 3.62ms | 38.42ms | 15.01ms | 6.23ms | 15.31ms |
| update_1to1 | 9.31ms | 5.40ms | 6.10ms | 15.49ms | 8.97ms | 27.65ms |
| update_2to1 | 4.72ms | 3.16ms | 3.06ms | 8.54ms | 4.36ms | 13.68ms |
| update_4to1 | 2.32ms | 1.76ms | 1.55ms | 3.88ms | 2.23ms | 7.35ms |
| update_1000to1 | 24μs | 11μs | 16μs | 49μs | 22μs | 67μs |
| update_1to2 | 4.67ms | 3.13ms | 3.07ms | 8.36ms | 4.39ms | 13.84ms |
| update_1to4 | 2.50ms | 2.12ms | 1.58ms | 3.85ms | 2.26ms | 6.92ms |
| update_1to1000 | 44μs | 35μs | 383μs | 148μs | 825μs | 170μs |
| cellx1000 | 9.99ms | 7.68ms | 6.76ms | 12.91ms | 11.35ms | 75.26ms |
| cellx2500 | 39.75ms | 23.63ms | 39.79ms | 41.82ms | 49.85ms | 291.57ms |
| cellx5000 | 101.23ms | 57.90ms | 98.69ms | 153.76ms | 142.79ms | 569.00ms |
| 10x5 - 2 sources - read 20.0% (simple) | 508.05ms | 235.15ms | 232.52ms | 348.19ms | 431.39ms | 1.94s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 276.63ms | 174.82ms | 197.40ms | 244.77ms | 270.43ms | 1.49s |
| 1000x12 - 4 sources - dynamic (large) | 3.78s | 274.76ms | 354.44ms | 470.34ms | 3.69s | 1.88s |
| 1000x5 - 25 sources (wide dense) | 3.32s | 395.10ms | 514.40ms | 589.67ms | 2.54s | 3.44s |
| 5x500 - 3 sources (deep) | 228.98ms | 195.12ms | 201.90ms | 259.26ms | 225.29ms | 1.18s |
| 100x15 - 6 sources - dynamic (very dynamic) | 480.61ms | 283.35ms | 257.73ms | 382.15ms | 448.04ms | 1.71s |

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
