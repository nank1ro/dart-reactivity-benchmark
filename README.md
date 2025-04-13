# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.70s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 9.97s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.09s |
| 4 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.31s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.33s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.39s |

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
| avoidablePropagation | 270.88ms | 212.00ms | 2.27s | 186.46ms | 210.84ms | 151.06ms (fail) |
| broadPropagation | 500.45ms | 464.13ms | 4.23s | 353.15ms | 455.98ms | 6.43ms (fail) |
| deepPropagation | 169.12ms | 176.56ms | 1.51s | 125.61ms | 176.99ms | 138.38ms (fail) |
| diamond | 353.72ms | 280.81ms | 2.39s | 234.28ms | 290.45ms | 191.52ms (fail) |
| mux | 443.13ms | 383.61ms | 1.82s | 374.57ms | 413.14ms | 190.36ms (fail) |
| repeatedObservers | 78.08ms | 39.24ms | 240.44ms | 45.46ms | 46.92ms | 52.30ms (fail) |
| triangle | 117.44ms | 100.72ms | 756.71ms | 86.50ms | 101.87ms | 77.87ms (fail) |
| unstable | 94.97ms | 70.83ms | 348.92ms | 60.99ms | 75.64ms | 335.50ms (fail) |
| molBench | 492.19ms | 490.92ms | 579.73ms | 491.43ms | 488.90ms | 1.36ms |
| create_signals | 74.37ms | 4.65ms | 84.26ms | 26.45ms | 25.12ms | 63.16ms |
| comp_0to1 | 26.03ms | 19.79ms | 36.92ms | 6.89ms | 11.65ms | 56.21ms |
| comp_1to1 | 42.95ms | 14.51ms | 17.00ms | 4.11ms | 26.95ms | 52.84ms |
| comp_2to1 | 32.44ms | 16.43ms | 8.82ms | 2.23ms | 9.82ms | 35.40ms |
| comp_4to1 | 15.33ms | 14.57ms | 25.93ms | 8.55ms | 2.28ms | 16.13ms |
| comp_1000to1 | 29μs | 4μs | 15μs | 5μs | 5μs | 41μs |
| comp_1to2 | 38.83ms | 17.95ms | 36.14ms | 18.88ms | 13.32ms | 43.77ms |
| comp_1to4 | 34.57ms | 28.88ms | 23.66ms | 8.78ms | 11.41ms | 43.31ms |
| comp_1to8 | 28.78ms | 7.60ms | 23.61ms | 5.10ms | 6.86ms | 42.07ms |
| comp_1to1000 | 19.94ms | 5.58ms | 15.14ms | 3.50ms | 4.49ms | 37.59ms |
| update_1to1 | 20.44ms | 8.09ms | 23.30ms | 11.33ms | 9.22ms | 5.75ms |
| update_2to1 | 8.14ms | 4.04ms | 10.53ms | 5.05ms | 4.54ms | 2.87ms |
| update_4to1 | 4.05ms | 2.04ms | 6.47ms | 2.83ms | 2.33ms | 1.47ms |
| update_1000to1 | 40μs | 20μs | 66μs | 10μs | 23μs | 15μs |
| update_1to2 | 8.10ms | 4.07ms | 10.85ms | 5.18ms | 4.90ms | 2.94ms |
| update_1to4 | 4.10ms | 2.06ms | 5.32ms | 2.51ms | 2.33ms | 1.48ms |
| update_1to1000 | 153μs | 206μs | 165μs | 44μs | 44μs | 380μs |
| cellx1000 | 11.21ms | 9.66ms | 70.30ms | 7.43ms | 9.73ms | 5.24ms |
| cellx2500 | 33.71ms | 26.69ms | 241.74ms | 20.53ms | 32.58ms | 27.85ms |
| cellx5000 | 86.74ms | 75.72ms | 543.56ms | 47.52ms | 66.76ms | 56.99ms |
| 10x5 - 2 sources - read 20.0% (simple) | 346.74ms | 441.24ms | 1.99s | 230.87ms | 508.25ms | 248.16ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 243.47ms | 271.62ms | 1.57s | 176.21ms | 277.36ms | 202.37ms |
| 1000x12 - 4 sources - dynamic (large) | 471.13ms | 3.50s | 1.95s | 277.94ms | 3.77s | 342.65ms |
| 1000x5 - 25 sources (wide dense) | 597.52ms | 2.59s | 3.64s | 417.51ms | 3.31s | 493.55ms |
| 5x500 - 3 sources (deep) | 261.50ms | 231.66ms | 1.14s | 190.40ms | 228.49ms | 206.66ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 380.48ms | 448.80ms | 1.71s | 264.51ms | 485.24ms | 258.10ms |

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
