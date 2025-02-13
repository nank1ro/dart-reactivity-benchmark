# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.69s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.01s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.40s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.64s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 40.33s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.44s |

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
| avoidablePropagation | 185.26ms | 2.38s | 2.21s | 153.03ms (fail) | 205.51ms | 210.04ms |
| broadPropagation | 353.55ms | 4.35s | 5.58s | 6.02ms (fail) | 452.25ms | 458.37ms |
| deepPropagation | 122.00ms | 1.52s | 2.02s | 140.63ms (fail) | 181.41ms | 173.98ms |
| diamond | 232.38ms | 2.42s | 3.47s | 183.91ms (fail) | 280.89ms | 290.39ms |
| mux | 382.37ms | 1.84s | 2.06s | 189.79ms (fail) | 384.46ms | 410.18ms |
| repeatedObservers | 45.33ms | 234.71ms | 214.69ms | 52.44ms (fail) | 38.07ms | 46.37ms |
| triangle | 82.58ms | 773.15ms | 1.15s | 77.08ms (fail) | 99.30ms | 100.57ms |
| unstable | 59.62ms | 355.78ms | 339.08ms | 338.53ms (fail) | 70.38ms | 75.70ms |
| molBench | 491.08ms | 583.23ms | 1.71s | 1.29ms | 492.01ms | 488.98ms |
| create_signals | 26.07ms | 51.47ms | 49.80ms | 67.17ms | 4.72ms | 32.95ms |
| comp_0to1 | 8.81ms | 18.35ms | 34.74ms | 57.89ms | 18.15ms | 14.75ms |
| comp_1to1 | 10.33ms | 22.85ms | 33.42ms | 62.18ms | 14.25ms | 22.25ms |
| comp_2to1 | 2.26ms | 8.67ms | 35.38ms | 43.63ms | 15.75ms | 11.29ms |
| comp_4to1 | 10.65ms | 14.26ms | 11.99ms | 16.82ms | 18.58ms | 5.65ms |
| comp_1000to1 | 3μs | 15μs | 4.50ms | 64μs | 5μs | 5μs |
| comp_1to2 | 16.54ms | 37.35ms | 25.42ms | 45.50ms | 28.06ms | 22.69ms |
| comp_1to4 | 5.63ms | 23.12ms | 28.65ms | 44.19ms | 21.73ms | 16.62ms |
| comp_1to8 | 4.74ms | 21.21ms | 25.10ms | 43.75ms | 7.15ms | 6.80ms |
| comp_1to1000 | 3.68ms | 15.18ms | 17.18ms | 38.84ms | 6.00ms | 4.52ms |
| update_1to1 | 6.61ms | 21.55ms | 44.06ms | 5.92ms | 8.16ms | 9.21ms |
| update_2to1 | 5.10ms | 10.51ms | 22.95ms | 2.88ms | 4.05ms | 4.61ms |
| update_4to1 | 2.56ms | 5.40ms | 11.03ms | 1.46ms | 2.10ms | 2.33ms |
| update_1000to1 | 11μs | 52μs | 117μs | 15μs | 20μs | 23μs |
| update_1to2 | 4.87ms | 10.60ms | 22.26ms | 2.94ms | 4.08ms | 4.91ms |
| update_1to4 | 1.80ms | 5.22ms | 11.06ms | 1.48ms | 2.06ms | 2.33ms |
| update_1to1000 | 43μs | 166μs | 209μs | 387μs | 192μs | 43μs |
| cellx1000 | 8.73ms | 74.46ms | 163.24ms | 5.07ms | 9.80ms | 9.56ms |
| cellx2500 | 19.94ms | 265.95ms | 461.04ms | 25.93ms | 28.73ms | 31.35ms |
| cellx5000 | 42.54ms | 584.00ms | 1.17s | 61.87ms | 78.47ms | 60.76ms |
| 10x5 - 2 sources - read 20.0% (simple) | 228.66ms | 2.00s | 2.70s (partial) | 239.53ms | 439.92ms | 510.77ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 176.15ms | 1.57s | 2.49s (partial) | 201.21ms | 273.63ms | 280.65ms |
| 1000x12 - 4 sources - dynamic (large) | 285.75ms | 1.93s | 4.20s (partial) | 340.13ms | 3.55s | 3.96s |
| 1000x5 - 25 sources (wide dense) | 407.85ms | 3.58s | 5.18s (partial) | 509.68ms | 2.59s | 3.41s |
| 5x500 - 3 sources (deep) | 199.53ms | 1.14s | 2.00s (partial) | 205.32ms | 230.83ms | 228.21ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 261.40ms | 1.76s | 2.82s (partial) | 269.08ms | 451.83ms | 490.10ms |

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
