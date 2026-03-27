# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.81s |
| 🥈 | preact_signals | 0.25 | 100.0% | 35/35 | 10.52s |
| 🥉 | signals | 0.23 | 100.0% | 35/35 | 12.14s |
| 4 | solidart(2.0-dev) | 0.22 | 100.0% | 35/35 | 5.65s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.03s |
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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 217.64ms | 2.20s | 159.86ms (fail) | 187.70ms | 220.62ms | 268.47ms |
| broadPropagation | 488.27ms | 4.18s | 6.05ms (fail) | 357.19ms | 532.08ms | 494.68ms |
| deepPropagation | 183.13ms | 1.49s | 181.40ms (fail) | 116.54ms | 206.16ms | 164.43ms |
| diamond | 289.58ms | 2.22s | 191.89ms (fail) | 267.19ms | 286.61ms | 372.49ms |
| mux | 381.36ms | 1.74s | 184.62ms (fail) | 363.08ms | 392.02ms | 433.08ms |
| repeatedObservers | 46.80ms | 230.71ms | 54.51ms (fail) | 44.37ms | 43.36ms | 87.45ms |
| triangle | 105.99ms | 723.95ms | 84.12ms (fail) | 89.16ms | 111.45ms | 120.23ms |
| unstable | 81.12ms | 334.58ms | 343.93ms (fail) | 59.82ms | 74.27ms | 109.21ms |
| molBench | 548.68ms | 641.89ms | 1.24ms | 560.70ms | 548.60ms | 569.13ms |
| create_signals | 33.37ms | 84.26ms | 58.85ms | 30.21ms | 6.15ms | 90.96ms |
| comp_0to1 | 13.96ms | 31.18ms | 53.21ms | 8.21ms | 25.22ms | 28.72ms |
| comp_1to1 | 25.34ms | 52.60ms | 54.30ms | 4.15ms | 15.33ms | 51.66ms |
| comp_2to1 | 19.94ms | 38.53ms | 37.82ms | 2.27ms | 18.37ms | 25.24ms |
| comp_4to1 | 7.00ms | 36.47ms | 16.86ms | 9.70ms | 14.04ms | 9.98ms |
| comp_1000to1 | 5μs | 26μs | 39μs | 4μs | 6μs | 313μs |
| comp_1to2 | 26.41ms | 37.96ms | 43.48ms | 13.03ms | 21.70ms | 48.76ms |
| comp_1to4 | 19.43ms | 17.69ms | 43.54ms | 15.69ms | 22.23ms | 19.96ms |
| comp_1to8 | 8.10ms | 20.45ms | 40.64ms | 3.90ms | 7.18ms | 28.68ms |
| comp_1to1000 | 4.13ms | 14.79ms | 36.08ms | 3.01ms | 3.82ms | 14.90ms |
| update_1to1 | 9.60ms | 23.40ms | 6.00ms | 4.80ms | 9.60ms | 18.12ms |
| update_2to1 | 4.67ms | 11.43ms | 3.01ms | 2.44ms | 4.76ms | 8.97ms |
| update_4to1 | 2.40ms | 5.98ms | 2.33ms | 1.28ms | 2.44ms | 4.88ms |
| update_1000to1 | 23μs | 57μs | 23μs | 16μs | 24μs | 45μs |
| update_1to2 | 4.68ms | 11.40ms | 4.64ms | 2.41ms | 4.73ms | 8.98ms |
| update_1to4 | 2.38ms | 5.76ms | 2.35ms | 1.25ms | 2.40ms | 4.52ms |
| update_1to1000 | 40μs | 160μs | 351μs | 49μs | 81μs | 146μs |
| cellx1000 | 12.62ms | 99.94ms | 5.11ms | 8.04ms | 11.45ms | 16.95ms |
| cellx2500 | 65.55ms | 318.26ms | 27.76ms | 20.55ms | 48.30ms | 89.65ms |
| cellx5000 | 160.22ms | 721.29ms | 90.28ms | 55.96ms | 130.04ms | 230.57ms |
| 10x5 - 2 sources - read 20.0% (simple) | 502.17ms | 2.01s | 250.65ms | 242.74ms | 434.04ms | 368.76ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 271.04ms | 1.46s | 204.73ms | 198.52ms | 262.22ms | 269.82ms |
| 1000x12 - 4 sources - dynamic (large) | 4.19s | 1.87s | 305.60ms | 272.29ms | 3.59s | 431.42ms |
| 1000x5 - 25 sources (wide dense) | 3.71s | 3.47s | 467.07ms | 429.89ms | 2.79s | 642.74ms |
| 5x500 - 3 sources (deep) | 230.38ms | 1.22s | 202.69ms | 191.42ms | 235.05ms | 265.15ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 472.16ms | 1.71s | 235.58ms | 237.63ms | 442.53ms | 353.81ms |

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
