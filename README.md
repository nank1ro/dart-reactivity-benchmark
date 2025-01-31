# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.71s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 9.68s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.20s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.31s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.64s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.53s |

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
| avoidablePropagation | 2.24s | 2.31s | 163.99ms (fail) | 210.13ms | 186.78ms | 210.65ms |
| broadPropagation | 5.52s | 4.32s | 6.08ms (fail) | 462.27ms | 348.14ms | 453.07ms |
| deepPropagation | 2.01s | 1.55s | 140.18ms (fail) | 170.80ms | 125.05ms | 169.16ms |
| diamond | 3.50s | 2.44s | 228.24ms (fail) | 287.65ms | 240.02ms | 275.53ms |
| mux | 2.08s | 1.82s | 192.11ms (fail) | 413.46ms | 379.80ms | 383.23ms |
| repeatedObservers | 212.86ms | 246.13ms | 53.52ms (fail) | 45.04ms | 43.69ms | 40.98ms |
| triangle | 1.14s | 772.21ms | 76.60ms (fail) | 102.65ms | 85.94ms | 96.97ms |
| unstable | 346.00ms | 352.60ms | 335.76ms (fail) | 78.76ms | 60.27ms | 72.92ms |
| molBench | 1.74s | 590.47ms | 875μs | 486.60ms | 486.12ms | 483.08ms |
| create_signals | 74.07ms | 64.09ms | 73.57ms | 29.82ms | 20.35ms | 5.03ms |
| comp_0to1 | 31.36ms | 26.89ms | 53.10ms | 14.87ms | 5.08ms | 17.36ms |
| comp_1to1 | 57.82ms | 31.26ms | 52.99ms | 19.52ms | 8.95ms | 14.19ms |
| comp_2to1 | 37.48ms | 9.24ms | 38.44ms | 17.19ms | 11.63ms | 19.43ms |
| comp_4to1 | 17.50ms | 22.22ms | 17.43ms | 1.89ms | 17.72ms | 10.81ms |
| comp_1000to1 | 2.08ms | 16μs | 44μs | 5μs | 4μs | 4μs |
| comp_1to2 | 24.55ms | 35.89ms | 46.02ms | 18.94ms | 20.35ms | 16.23ms |
| comp_1to4 | 29.25ms | 19.73ms | 43.10ms | 9.35ms | 12.38ms | 21.27ms |
| comp_1to8 | 23.37ms | 21.66ms | 42.99ms | 6.55ms | 8.16ms | 7.30ms |
| comp_1to1000 | 18.68ms | 15.62ms | 39.66ms | 4.85ms | 6.23ms | 5.99ms |
| update_1to1 | 43.17ms | 27.76ms | 7.93ms | 9.42ms | 4.36ms | 8.81ms |
| update_2to1 | 21.95ms | 14.49ms | 2.90ms | 4.73ms | 2.50ms | 4.41ms |
| update_4to1 | 11.05ms | 7.43ms | 2.46ms | 2.39ms | 1.14ms | 2.25ms |
| update_1000to1 | 128μs | 72μs | 15μs | 23μs | 11μs | 34μs |
| update_1to2 | 21.54ms | 13.90ms | 4.90ms | 4.73ms | 2.21ms | 4.57ms |
| update_1to4 | 10.85ms | 6.80ms | 1.81ms | 2.35ms | 1.15ms | 2.20ms |
| update_1to1000 | 220μs | 164μs | 398μs | 45μs | 48μs | 552μs |
| cellx1000 | 160.19ms | 77.93ms | 5.40ms | 9.66ms | 7.24ms | 9.78ms |
| cellx2500 | 494.05ms | 280.62ms | 20.53ms | 34.83ms | 19.24ms | 29.66ms |
| cellx5000 | 1.13s | 591.18ms | 62.16ms | 68.02ms | 42.27ms | 80.46ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.65s (partial) | 2.00s | 242.65ms | 512.67ms | 232.82ms | 426.08ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.34s (partial) | 1.51s | 207.13ms | 279.39ms | 180.66ms | 278.55ms |
| 1000x12 - 4 sources - dynamic (large) | 4.03s (partial) | 1.81s | 347.28ms | 3.83s | 279.13ms | 3.36s |
| 1000x5 - 25 sources (wide dense) | 4.87s (partial) | 3.51s | 520.62ms | 3.36s | 406.64ms | 2.51s |
| 5x500 - 3 sources (deep) | 1.99s (partial) | 1.12s | 233.19ms | 229.63ms | 201.22ms | 223.88ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.76s (partial) | 1.69s | 269.18ms | 474.69ms | 265.43ms | 448.31ms |

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
