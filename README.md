# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.70s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.36s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.22s |
| 4 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.48s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.54s |
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
| Test Case | state_beacon | alien_signals | mobx | solidart(2.0-dev) | signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 158.55ms (fail) | 186.47ms | 2.38s | 274.43ms | 205.81ms | 203.29ms |
| broadPropagation | 5.84ms (fail) | 346.77ms | 4.44s | 507.75ms | 452.93ms | 452.21ms |
| deepPropagation | 140.02ms (fail) | 123.53ms | 1.58s | 171.25ms | 175.63ms | 177.47ms |
| diamond | 180.38ms (fail) | 229.72ms | 2.51s | 349.59ms | 285.72ms | 284.93ms |
| mux | 191.19ms (fail) | 373.87ms | 1.85s | 448.34ms | 410.00ms | 410.91ms |
| repeatedObservers | 53.05ms (fail) | 45.70ms | 242.56ms | 81.27ms | 44.36ms | 40.38ms |
| triangle | 76.81ms (fail) | 85.31ms | 781.05ms | 118.53ms | 104.00ms | 101.62ms |
| unstable | 337.66ms (fail) | 69.49ms | 363.50ms | 97.61ms | 79.57ms | 70.65ms |
| molBench | 873μs | 483.22ms | 573.47ms | 493.82ms | 486.48ms | 487.61ms |
| create_signals | 61.06ms | 21.75ms | 90.93ms | 101.89ms | 27.19ms | 4.60ms |
| comp_0to1 | 54.13ms | 8.80ms | 16.66ms | 38.67ms | 12.36ms | 17.78ms |
| comp_1to1 | 56.48ms | 4.33ms | 55.45ms | 59.27ms | 26.24ms | 12.80ms |
| comp_2to1 | 38.13ms | 2.36ms | 25.25ms | 27.13ms | 8.52ms | 10.48ms |
| comp_4to1 | 16.89ms | 8.54ms | 21.13ms | 15.30ms | 2.90ms | 7.93ms |
| comp_1000to1 | 42μs | 4μs | 16μs | 20μs | 4μs | 4μs |
| comp_1to2 | 45.66ms | 20.39ms | 36.46ms | 40.32ms | 20.78ms | 16.76ms |
| comp_1to4 | 43.83ms | 7.02ms | 23.64ms | 23.58ms | 9.64ms | 26.67ms |
| comp_1to8 | 43.00ms | 4.46ms | 24.28ms | 26.07ms | 8.54ms | 6.87ms |
| comp_1to1000 | 38.45ms | 3.57ms | 16.37ms | 17.38ms | 4.32ms | 4.60ms |
| update_1to1 | 5.65ms | 10.21ms | 22.35ms | 16.26ms | 8.90ms | 8.63ms |
| update_2to1 | 3.10ms | 2.33ms | 10.93ms | 7.93ms | 6.91ms | 4.29ms |
| update_4to1 | 1.44ms | 2.49ms | 5.64ms | 4.07ms | 2.22ms | 2.14ms |
| update_1000to1 | 15μs | 24μs | 66μs | 41μs | 23μs | 21μs |
| update_1to2 | 2.83ms | 5.09ms | 10.86ms | 8.08ms | 4.67ms | 4.68ms |
| update_1to4 | 1.44ms | 2.47ms | 5.46ms | 4.16ms | 2.59ms | 2.13ms |
| update_1to1000 | 378μs | 48μs | 168μs | 172μs | 43μs | 173μs |
| cellx1000 | 6.54ms | 7.34ms | 85.96ms | 13.53ms | 10.33ms | 10.25ms |
| cellx2500 | 32.30ms | 22.76ms | 314.95ms | 55.93ms | 43.98ms | 33.60ms |
| cellx5000 | 84.59ms | 56.13ms | 671.06ms | 169.34ms | 91.27ms | 101.48ms |
| 10x5 - 2 sources - read 20.0% (simple) | 241.23ms | 230.80ms | 2.04s | 360.58ms | 504.16ms | 440.94ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 200.29ms | 178.92ms | 1.60s | 244.21ms | 283.54ms | 270.71ms |
| 1000x12 - 4 sources - dynamic (large) | 353.52ms | 282.70ms | 2.15s | 473.91ms | 3.74s | 3.73s |
| 1000x5 - 25 sources (wide dense) | 504.20ms | 415.16ms | 3.65s | 587.64ms | 3.44s | 2.73s |
| 5x500 - 3 sources (deep) | 206.75ms | 189.89ms | 1.21s | 257.62ms | 228.10ms | 230.84ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 260.29ms | 265.67ms | 1.75s | 383.98ms | 483.50ms | 455.07ms |

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
