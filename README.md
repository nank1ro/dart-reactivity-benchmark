# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.28s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.17s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.08s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.94s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.35s |

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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 271.64ms | 206.17ms | 2.38s | 185.36ms | 207.32ms | 158.23ms (fail) |
| broadPropagation | 508.46ms | 455.22ms | 4.33s | 356.61ms | 462.71ms | 6.29ms (fail) |
| deepPropagation | 171.32ms | 178.41ms | 1.54s | 126.89ms | 180.52ms | 136.18ms (fail) |
| diamond | 351.69ms | 297.82ms | 2.50s | 234.38ms | 302.78ms | 187.65ms (fail) |
| mux | 436.78ms | 383.99ms | 1.89s | 372.23ms | 412.49ms | 194.02ms (fail) |
| repeatedObservers | 78.28ms | 38.21ms | 234.92ms | 45.30ms | 46.73ms | 52.26ms (fail) |
| triangle | 117.40ms | 99.42ms | 782.12ms | 85.00ms | 100.97ms | 75.65ms (fail) |
| unstable | 93.90ms | 71.02ms | 354.91ms | 60.52ms | 75.14ms | 336.73ms (fail) |
| molBench | 492.55ms | 492.53ms | 581.84ms | 492.18ms | 488.11ms | 908μs |
| create_signals | 70.54ms | 11.27ms | 80.57ms | 27.63ms | 25.82ms | 67.72ms |
| comp_0to1 | 34.03ms | 21.98ms | 36.94ms | 7.42ms | 12.27ms | 53.05ms |
| comp_1to1 | 53.38ms | 7.45ms | 17.48ms | 4.18ms | 26.68ms | 53.77ms |
| comp_2to1 | 24.41ms | 19.45ms | 23.09ms | 2.29ms | 10.40ms | 38.26ms |
| comp_4to1 | 12.49ms | 8.35ms | 25.16ms | 10.76ms | 2.27ms | 18.73ms |
| comp_1000to1 | 27μs | 6μs | 33μs | 6μs | 5μs | 46μs |
| comp_1to2 | 34.40ms | 14.50ms | 34.55ms | 18.45ms | 18.91ms | 45.30ms |
| comp_1to4 | 19.89ms | 22.25ms | 21.49ms | 4.86ms | 9.48ms | 44.03ms |
| comp_1to8 | 25.20ms | 6.64ms | 23.15ms | 5.15ms | 6.44ms | 43.30ms |
| comp_1to1000 | 14.75ms | 6.10ms | 15.18ms | 3.27ms | 4.54ms | 38.48ms |
| update_1to1 | 16.11ms | 8.27ms | 25.40ms | 9.66ms | 9.23ms | 5.73ms |
| update_2to1 | 7.92ms | 4.04ms | 12.43ms | 5.04ms | 4.55ms | 2.89ms |
| update_4to1 | 4.04ms | 2.06ms | 6.29ms | 2.80ms | 2.32ms | 1.48ms |
| update_1000to1 | 40μs | 20μs | 52μs | 10μs | 23μs | 15μs |
| update_1to2 | 7.93ms | 4.06ms | 12.42ms | 5.64ms | 4.90ms | 2.95ms |
| update_1to4 | 4.04ms | 2.10ms | 6.37ms | 2.46ms | 2.32ms | 1.49ms |
| update_1to1000 | 149μs | 423μs | 194μs | 46μs | 43μs | 379μs |
| cellx1000 | 11.55ms | 9.85ms | 73.11ms | 10.06ms | 9.69ms | 5.05ms |
| cellx2500 | 34.48ms | 29.21ms | 260.82ms | 21.35ms | 31.68ms | 25.34ms |
| cellx5000 | 73.48ms | 83.07ms | 583.90ms | 44.60ms | 62.26ms | 60.44ms |
| 10x5 - 2 sources - read 20.0% (simple) | 378.31ms | 439.49ms | 2.09s | 235.50ms | 511.29ms | 244.51ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 239.67ms | 289.99ms | 1.59s | 178.90ms | 281.06ms | 194.65ms |
| 1000x12 - 4 sources - dynamic (large) | 460.36ms | 3.54s | 1.89s | 286.40ms | 3.74s | 328.66ms |
| 1000x5 - 25 sources (wide dense) | 591.68ms | 2.63s | 3.57s | 405.85ms | 3.40s | 471.32ms |
| 5x500 - 3 sources (deep) | 254.60ms | 231.99ms | 1.18s | 194.29ms | 224.77ms | 202.94ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 379.57ms | 461.73ms | 1.77s | 265.01ms | 484.19ms | 251.65ms |

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
