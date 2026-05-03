# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.24s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.15s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.53s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.17s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.31s | 202.05ms | 197.73ms | 208.38ms | 276.10ms | 148.00ms (fail) |
| broadPropagation | 4.33s | 465.06ms | 360.77ms | 456.27ms | 499.76ms | 5.83ms (fail) |
| deepPropagation | 1.56s | 169.82ms | 127.92ms | 175.20ms | 166.11ms | 144.33ms (fail) |
| diamond | 2.37s | 289.22ms | 245.86ms | 285.02ms | 344.16ms | 179.49ms (fail) |
| mux | 1.79s | 398.24ms | 362.78ms | 371.64ms | 421.61ms | 185.00ms (fail) |
| repeatedObservers | 230.51ms | 46.12ms | 45.66ms | 42.52ms | 80.88ms | 58.71ms (fail) |
| triangle | 756.49ms | 99.83ms | 88.52ms | 102.50ms | 114.80ms | 75.70ms (fail) |
| unstable | 353.82ms | 75.65ms | 62.03ms | 72.18ms | 96.19ms | 336.51ms (fail) |
| molBench | 587.00ms | 494.83ms | 481.16ms | 495.81ms | 490.07ms | 1.02ms |
| create_signals | 69.97ms | 26.11ms | 31.89ms | 5.38ms | 73.65ms | 62.13ms |
| comp_0to1 | 27.05ms | 11.46ms | 8.04ms | 17.77ms | 25.27ms | 56.61ms |
| comp_1to1 | 39.63ms | 22.20ms | 4.29ms | 12.01ms | 42.46ms | 57.61ms |
| comp_2to1 | 23.21ms | 11.79ms | 2.33ms | 11.74ms | 36.48ms | 38.61ms |
| comp_4to1 | 27.19ms | 2.08ms | 7.67ms | 14.98ms | 11.35ms | 17.10ms |
| comp_1000to1 | 27μs | 5μs | 3μs | 4μs | 17μs | 44μs |
| comp_1to2 | 38.17ms | 17.88ms | 15.76ms | 22.58ms | 27.05ms | 48.47ms |
| comp_1to4 | 21.21ms | 13.48ms | 6.90ms | 28.88ms | 36.20ms | 47.66ms |
| comp_1to8 | 23.82ms | 6.49ms | 6.07ms | 9.62ms | 24.59ms | 46.56ms |
| comp_1to1000 | 14.78ms | 4.02ms | 3.22ms | 9.95ms | 14.64ms | 41.93ms |
| update_1to1 | 21.70ms | 8.94ms | 4.63ms | 10.11ms | 15.79ms | 9.17ms |
| update_2to1 | 11.64ms | 4.44ms | 2.37ms | 4.61ms | 7.83ms | 2.86ms |
| update_4to1 | 6.03ms | 2.26ms | 1.28ms | 2.32ms | 3.92ms | 1.94ms |
| update_1000to1 | 55μs | 22μs | 11μs | 23μs | 39μs | 14μs |
| update_1to2 | 11.00ms | 4.46ms | 2.34ms | 4.61ms | 8.03ms | 5.37ms |
| update_1to4 | 5.45ms | 2.28ms | 1.21ms | 2.46ms | 3.95ms | 1.48ms |
| update_1to1000 | 155μs | 67μs | 47μs | 2.43ms | 158μs | 407μs |
| cellx1000 | 77.07ms | 9.66ms | 7.24ms | 9.88ms | 11.80ms | 5.99ms |
| cellx2500 | 278.37ms | 33.52ms | 18.93ms | 27.05ms | 35.25ms | 28.71ms |
| cellx5000 | 612.04ms | 63.89ms | 42.44ms | 67.03ms | 92.18ms | 83.94ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.05s | 511.64ms | 242.47ms | 450.25ms | 343.59ms | 235.27ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.49s | 278.52ms | 178.47ms | 275.50ms | 248.70ms | 199.00ms |
| 1000x12 - 4 sources - dynamic (large) | 1.85s | 3.80s | 282.79ms | 3.81s | 463.62ms | 354.52ms |
| 1000x5 - 25 sources (wide dense) | 3.36s | 3.37s | 412.91ms | 2.83s | 594.34ms | 519.80ms |
| 5x500 - 3 sources (deep) | 1.14s | 225.71ms | 196.98ms | 243.41ms | 251.22ms | 207.95ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.69s | 477.68ms | 258.44ms | 448.80ms | 379.96ms | 254.64ms |

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
