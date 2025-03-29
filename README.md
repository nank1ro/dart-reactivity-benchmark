# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.30s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.44s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.17s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.04s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.47s |

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
| avoidablePropagation | 270.54ms | 203.09ms | 2.35s | 188.44ms | 215.38ms | 151.69ms (fail) |
| broadPropagation | 511.54ms | 455.19ms | 4.34s | 362.55ms | 461.58ms | 6.08ms (fail) |
| deepPropagation | 169.46ms | 181.50ms | 1.55s | 128.22ms | 182.38ms | 138.75ms (fail) |
| diamond | 352.67ms | 280.79ms | 2.45s | 236.90ms | 293.52ms | 190.50ms (fail) |
| mux | 438.09ms | 386.99ms | 1.85s | 372.84ms | 414.95ms | 191.34ms (fail) |
| repeatedObservers | 79.59ms | 38.24ms | 232.12ms | 45.60ms | 53.85ms | 52.10ms (fail) |
| triangle | 114.71ms | 98.89ms | 777.83ms | 86.44ms | 105.27ms | 76.59ms (fail) |
| unstable | 93.99ms | 70.28ms | 356.03ms | 60.97ms | 75.35ms | 336.30ms (fail) |
| molBench | 495.92ms | 492.51ms | 582.22ms | 497.50ms | 486.85ms | 972μs |
| create_signals | 77.11ms | 4.91ms | 55.36ms | 21.14ms | 30.50ms | 64.57ms |
| comp_0to1 | 30.45ms | 24.11ms | 15.74ms | 8.29ms | 12.79ms | 54.11ms |
| comp_1to1 | 33.51ms | 11.59ms | 41.21ms | 4.50ms | 28.33ms | 58.16ms |
| comp_2to1 | 22.20ms | 14.08ms | 35.69ms | 2.55ms | 13.24ms | 42.61ms |
| comp_4to1 | 13.52ms | 22.85ms | 15.15ms | 9.07ms | 2.15ms | 16.94ms |
| comp_1000to1 | 19μs | 8μs | 16μs | 4μs | 5μs | 44μs |
| comp_1to2 | 33.34ms | 22.75ms | 33.97ms | 20.50ms | 21.33ms | 48.48ms |
| comp_1to4 | 19.52ms | 32.99ms | 17.69ms | 5.15ms | 9.72ms | 46.78ms |
| comp_1to8 | 26.24ms | 9.02ms | 20.23ms | 5.21ms | 8.88ms | 42.96ms |
| comp_1to1000 | 15.43ms | 6.81ms | 15.19ms | 3.46ms | 4.59ms | 37.32ms |
| update_1to1 | 16.23ms | 8.23ms | 26.38ms | 10.79ms | 9.29ms | 5.73ms |
| update_2to1 | 7.98ms | 4.06ms | 12.45ms | 3.34ms | 4.65ms | 2.87ms |
| update_4to1 | 4.03ms | 2.04ms | 6.75ms | 2.77ms | 2.34ms | 1.46ms |
| update_1000to1 | 40μs | 20μs | 64μs | 11μs | 23μs | 15μs |
| update_1to2 | 7.94ms | 4.06ms | 13.01ms | 3.66ms | 4.83ms | 2.93ms |
| update_1to4 | 4.05ms | 2.05ms | 6.27ms | 1.57ms | 2.29ms | 1.46ms |
| update_1to1000 | 149μs | 990μs | 175μs | 37μs | 43μs | 366μs |
| cellx1000 | 12.20ms | 11.34ms | 80.59ms | 7.54ms | 9.83ms | 6.28ms |
| cellx2500 | 40.12ms | 29.46ms | 291.26ms | 20.35ms | 34.85ms | 31.80ms |
| cellx5000 | 104.83ms | 130.87ms | 626.88ms | 50.07ms | 79.49ms | 91.35ms |
| 10x5 - 2 sources - read 20.0% (simple) | 355.12ms | 470.17ms | 2.05s | 234.53ms | 507.86ms | 241.12ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 242.47ms | 279.73ms | 1.60s | 178.02ms | 278.04ms | 201.62ms |
| 1000x12 - 4 sources - dynamic (large) | 472.54ms | 3.56s | 1.98s | 288.39ms | 3.96s | 349.89ms |
| 1000x5 - 25 sources (wide dense) | 601.38ms | 2.62s | 3.62s | 410.11ms | 3.42s | 507.75ms |
| 5x500 - 3 sources (deep) | 254.01ms | 230.51ms | 1.18s | 195.64ms | 229.05ms | 206.82ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 380.45ms | 447.43ms | 1.80s | 264.24ms | 481.20ms | 266.56ms |

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
