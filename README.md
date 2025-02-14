# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.68s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 9.96s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.55s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.67s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 38.98s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.42s |

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
| avoidablePropagation | 189.38ms | 2.32s | 2.14s | 148.47ms (fail) | 205.14ms | 203.72ms |
| broadPropagation | 357.85ms | 4.27s | 5.30s | 5.73ms (fail) | 462.32ms | 456.46ms |
| deepPropagation | 124.51ms | 1.54s | 2.00s | 140.26ms (fail) | 180.54ms | 172.02ms |
| diamond | 232.85ms | 2.42s | 3.39s | 183.29ms (fail) | 279.83ms | 288.90ms |
| mux | 385.45ms | 1.85s | 2.00s | 189.76ms (fail) | 385.33ms | 415.84ms |
| repeatedObservers | 45.20ms | 240.20ms | 205.50ms | 53.11ms (fail) | 38.02ms | 46.75ms |
| triangle | 84.73ms | 790.96ms | 1.12s | 78.84ms (fail) | 104.25ms | 104.34ms |
| unstable | 60.34ms | 349.58ms | 331.29ms | 336.75ms (fail) | 70.49ms | 72.08ms |
| molBench | 492.11ms | 582.72ms | 1.71s | 1.24ms | 492.32ms | 487.13ms |
| create_signals | 23.28ms | 71.62ms | 62.58ms | 65.82ms | 4.53ms | 24.98ms |
| comp_0to1 | 7.41ms | 23.86ms | 29.25ms | 51.40ms | 23.19ms | 11.88ms |
| comp_1to1 | 4.25ms | 30.10ms | 43.14ms | 58.20ms | 11.54ms | 18.27ms |
| comp_2to1 | 2.25ms | 27.84ms | 27.24ms | 39.18ms | 16.91ms | 17.64ms |
| comp_4to1 | 11.10ms | 30.66ms | 18.25ms | 18.15ms | 8.67ms | 2.09ms |
| comp_1000to1 | 6μs | 15μs | 2.11ms | 41μs | 4μs | 5μs |
| comp_1to2 | 20.73ms | 32.98ms | 31.01ms | 46.33ms | 16.48ms | 19.84ms |
| comp_1to4 | 5.50ms | 23.68ms | 27.30ms | 43.49ms | 31.85ms | 9.11ms |
| comp_1to8 | 4.33ms | 24.54ms | 24.48ms | 42.58ms | 9.18ms | 6.74ms |
| comp_1to1000 | 3.56ms | 16.28ms | 17.84ms | 37.59ms | 6.12ms | 4.57ms |
| update_1to1 | 7.14ms | 23.30ms | 42.57ms | 5.73ms | 8.15ms | 9.25ms |
| update_2to1 | 5.15ms | 10.66ms | 21.96ms | 2.87ms | 4.05ms | 4.61ms |
| update_4to1 | 2.20ms | 5.36ms | 10.63ms | 1.44ms | 2.08ms | 2.31ms |
| update_1000to1 | 24μs | 63μs | 118μs | 15μs | 20μs | 23μs |
| update_1to2 | 3.67ms | 10.47ms | 21.46ms | 2.93ms | 4.06ms | 4.91ms |
| update_1to4 | 1.47ms | 5.71ms | 10.75ms | 1.46ms | 2.13ms | 2.37ms |
| update_1to1000 | 51μs | 188μs | 209μs | 373μs | 185μs | 43μs |
| cellx1000 | 7.48ms | 75.65ms | 156.99ms | 5.31ms | 9.49ms | 9.53ms |
| cellx2500 | 19.35ms | 246.60ms | 449.69ms | 22.87ms | 25.32ms | 33.63ms |
| cellx5000 | 42.62ms | 569.17ms | 1.10s | 73.22ms | 63.94ms | 67.89ms |
| 10x5 - 2 sources - read 20.0% (simple) | 222.32ms | 2.04s | 2.63s (partial) | 254.04ms | 441.04ms | 505.51ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 184.86ms | 1.56s | 2.41s (partial) | 217.04ms | 271.27ms | 277.53ms |
| 1000x12 - 4 sources - dynamic (large) | 277.13ms | 1.89s | 4.06s (partial) | 336.02ms | 3.53s | 3.99s |
| 1000x5 - 25 sources (wide dense) | 399.98ms | 3.65s | 4.86s (partial) | 484.25ms | 2.58s | 3.55s |
| 5x500 - 3 sources (deep) | 187.07ms | 1.17s | 1.96s (partial) | 207.62ms | 231.66ms | 229.25ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 263.44ms | 1.76s | 2.78s (partial) | 264.80ms | 444.01ms | 495.75ms |

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
