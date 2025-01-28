# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.75s |
| 🥈 | signals | 0.28 | 100.0% | 35/35 | 10.99s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 9.84s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.39s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 40.29s |
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
| Test Case | solidart | mobx | state_beacon | signals | alien_signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.19s | 2.29s | 161.41ms (fail) | 210.65ms | 187.75ms | 209.71ms |
| broadPropagation | 5.55s | 4.34s | 6.77ms (fail) | 462.30ms | 345.79ms | 455.43ms |
| deepPropagation | 2.06s | 1.56s | 142.70ms (fail) | 173.02ms | 123.74ms | 175.47ms |
| diamond | 3.53s | 2.45s | 205.70ms (fail) | 286.65ms | 235.84ms | 274.65ms |
| mux | 2.06s | 1.80s | 194.67ms (fail) | 411.57ms | 375.95ms | 384.67ms |
| repeatedObservers | 221.56ms | 238.96ms | 53.80ms (fail) | 47.24ms | 45.17ms | 41.66ms |
| triangle | 1.17s | 762.31ms | 80.09ms (fail) | 102.30ms | 86.28ms | 103.25ms |
| unstable | 347.76ms | 352.68ms | 340.35ms (fail) | 77.98ms | 60.69ms | 70.50ms |
| molBench | 1.74s | 590.76ms | 935μs | 486.34ms | 487.50ms | 483.43ms |
| create_signals | 78.04ms | 77.82ms | 73.71ms | 32.88ms | 20.75ms | 4.69ms |
| comp_0to1 | 32.23ms | 20.73ms | 55.41ms | 16.15ms | 5.13ms | 17.28ms |
| comp_1to1 | 54.20ms | 33.03ms | 53.32ms | 19.07ms | 9.06ms | 15.78ms |
| comp_2to1 | 33.51ms | 19.25ms | 34.55ms | 10.71ms | 14.98ms | 23.45ms |
| comp_4to1 | 17.98ms | 19.27ms | 17.66ms | 3.16ms | 19.11ms | 24.20ms |
| comp_1000to1 | 4.18ms | 23μs | 46μs | 5μs | 5μs | 4μs |
| comp_1to2 | 25.26ms | 43.03ms | 46.31ms | 18.43ms | 21.69ms | 24.40ms |
| comp_1to4 | 31.59ms | 28.18ms | 43.59ms | 25.02ms | 16.91ms | 21.12ms |
| comp_1to8 | 25.35ms | 22.43ms | 43.82ms | 5.82ms | 8.58ms | 12.67ms |
| comp_1to1000 | 19.26ms | 15.90ms | 40.08ms | 5.19ms | 6.05ms | 6.11ms |
| update_1to1 | 43.59ms | 28.15ms | 8.91ms | 9.34ms | 4.38ms | 8.83ms |
| update_2to1 | 21.37ms | 13.84ms | 2.91ms | 4.66ms | 2.25ms | 4.40ms |
| update_4to1 | 10.85ms | 7.16ms | 1.92ms | 2.34ms | 1.20ms | 2.18ms |
| update_1000to1 | 116μs | 84μs | 15μs | 23μs | 11μs | 21μs |
| update_1to2 | 21.48ms | 15.49ms | 3.44ms | 4.73ms | 2.18ms | 4.36ms |
| update_1to4 | 11.03ms | 6.99ms | 1.50ms | 2.35ms | 1.59ms | 2.18ms |
| update_1to1000 | 215μs | 167μs | 406μs | 58μs | 32μs | 1.90ms |
| cellx1000 | 187.67ms | 77.95ms | 5.47ms | 9.90ms | 7.53ms | 9.71ms |
| cellx2500 | 541.54ms | 283.58ms | 22.59ms | 28.44ms | 19.82ms | 27.57ms |
| cellx5000 | 1.25s | 588.92ms | 69.51ms | 78.94ms | 48.43ms | 84.63ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.69s (partial) | 2.02s | 260.30ms | 515.82ms | 234.26ms | 428.08ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.36s (partial) | 1.50s | 207.84ms | 284.16ms | 179.65ms | 271.40ms |
| 1000x12 - 4 sources - dynamic (large) | 4.06s (partial) | 1.83s | 355.00ms | 3.70s | 288.88ms | 3.45s |
| 1000x5 - 25 sources (wide dense) | 5.03s (partial) | 3.52s | 523.50ms | 3.24s | 414.45ms | 2.52s |
| 5x500 - 3 sources (deep) | 2.09s (partial) | 1.16s | 236.74ms | 230.75ms | 206.62ms | 228.10ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.78s (partial) | 1.69s | 263.61ms | 481.25ms | 265.40ms | 450.99ms |

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
