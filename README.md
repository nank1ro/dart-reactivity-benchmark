# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.74s |
| 🥈 | signals | 0.28 | 100.0% | 35/35 | 11.24s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 9.75s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.51s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 40.07s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.57s |

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
| avoidablePropagation | 2.28s | 2.36s | 158.49ms (fail) | 211.50ms | 187.32ms | 210.65ms |
| broadPropagation | 5.60s | 4.40s | 6.21ms (fail) | 464.06ms | 345.73ms | 455.42ms |
| deepPropagation | 2.05s | 1.56s | 140.80ms (fail) | 173.57ms | 122.46ms | 176.83ms |
| diamond | 3.53s | 2.47s | 195.50ms (fail) | 281.59ms | 236.90ms | 273.68ms |
| mux | 2.04s | 1.84s | 201.62ms (fail) | 411.00ms | 380.12ms | 390.22ms |
| repeatedObservers | 220.45ms | 245.63ms | 53.73ms (fail) | 45.29ms | 43.66ms | 40.86ms |
| triangle | 1.16s | 780.21ms | 91.72ms (fail) | 102.74ms | 85.64ms | 102.19ms |
| unstable | 351.61ms | 363.50ms | 335.35ms (fail) | 78.97ms | 60.27ms | 68.15ms |
| molBench | 1.75s | 593.96ms | 1.24ms | 487.72ms | 483.17ms | 483.83ms |
| create_signals | 62.80ms | 65.32ms | 73.31ms | 33.95ms | 21.41ms | 4.68ms |
| comp_0to1 | 35.51ms | 21.99ms | 56.30ms | 16.95ms | 4.97ms | 16.95ms |
| comp_1to1 | 42.07ms | 33.01ms | 52.91ms | 19.22ms | 8.88ms | 20.85ms |
| comp_2to1 | 27.26ms | 21.54ms | 36.58ms | 11.93ms | 14.61ms | 21.78ms |
| comp_4to1 | 13.05ms | 16.92ms | 17.55ms | 1.92ms | 14.75ms | 15.98ms |
| comp_1000to1 | 2.13ms | 20μs | 43μs | 8μs | 7μs | 8μs |
| comp_1to2 | 31.77ms | 38.11ms | 45.90ms | 22.49ms | 22.08ms | 21.26ms |
| comp_1to4 | 27.99ms | 19.20ms | 42.86ms | 6.50ms | 16.76ms | 32.53ms |
| comp_1to8 | 23.97ms | 23.23ms | 43.04ms | 10.95ms | 8.36ms | 7.84ms |
| comp_1to1000 | 19.28ms | 15.94ms | 39.26ms | 5.49ms | 6.00ms | 6.04ms |
| update_1to1 | 43.12ms | 25.18ms | 7.42ms | 11.14ms | 4.84ms | 8.78ms |
| update_2to1 | 21.12ms | 13.03ms | 3.04ms | 4.70ms | 2.84ms | 4.38ms |
| update_4to1 | 12.66ms | 6.83ms | 1.60ms | 2.39ms | 1.15ms | 2.21ms |
| update_1000to1 | 115μs | 70μs | 14μs | 23μs | 11μs | 21μs |
| update_1to2 | 21.48ms | 14.14ms | 3.05ms | 4.73ms | 2.25ms | 4.35ms |
| update_1to4 | 10.91ms | 7.00ms | 1.52ms | 2.37ms | 1.71ms | 2.20ms |
| update_1to1000 | 219μs | 164μs | 399μs | 44μs | 38μs | 948μs |
| cellx1000 | 162.49ms | 76.50ms | 7.12ms | 11.24ms | 7.51ms | 9.55ms |
| cellx2500 | 518.21ms | 270.23ms | 25.13ms | 30.16ms | 20.69ms | 25.86ms |
| cellx5000 | 1.14s | 564.24ms | 68.99ms | 91.03ms | 58.47ms | 68.81ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.69s (partial) | 2.00s | 260.66ms | 505.23ms | 234.82ms | 431.49ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.41s (partial) | 1.51s | 207.37ms | 295.17ms | 179.18ms | 272.64ms |
| 1000x12 - 4 sources - dynamic (large) | 4.09s (partial) | 1.83s | 362.37ms | 3.67s | 288.19ms | 3.37s |
| 1000x5 - 25 sources (wide dense) | 4.91s (partial) | 3.47s | 522.65ms | 3.51s | 407.01ms | 2.52s |
| 5x500 - 3 sources (deep) | 2.02s (partial) | 1.14s | 235.65ms | 231.29ms | 203.51ms | 229.08ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.76s (partial) | 1.71s | 268.13ms | 487.54ms | 265.19ms | 451.11ms |

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
