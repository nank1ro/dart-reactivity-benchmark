# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.69s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 9.72s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.26s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.13s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.68s |
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
| Test Case | solidart | mobx | state_beacon | signals | alien_signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.19s | 2.27s | 165.29ms (fail) | 209.71ms | 186.82ms | 210.59ms |
| broadPropagation | 5.49s | 4.31s | 6.22ms (fail) | 470.28ms | 347.69ms | 456.44ms |
| deepPropagation | 2.04s | 1.54s | 140.50ms (fail) | 174.12ms | 118.90ms | 174.21ms |
| diamond | 3.49s | 2.40s | 189.43ms (fail) | 286.67ms | 248.04ms | 276.41ms |
| mux | 2.07s | 1.83s | 191.70ms (fail) | 410.74ms | 377.29ms | 384.57ms |
| repeatedObservers | 213.77ms | 231.46ms | 55.81ms (fail) | 44.98ms | 44.68ms | 41.03ms |
| triangle | 1.16s | 761.52ms | 78.96ms (fail) | 102.43ms | 86.14ms | 97.56ms |
| unstable | 344.51ms | 347.52ms | 335.99ms (fail) | 78.00ms | 59.68ms | 69.58ms |
| molBench | 1.74s | 589.15ms | 948μs | 486.77ms | 487.00ms | 483.21ms |
| create_signals | 68.71ms | 71.27ms | 63.00ms | 29.07ms | 20.07ms | 4.64ms |
| comp_0to1 | 32.03ms | 15.51ms | 54.05ms | 14.59ms | 4.91ms | 17.01ms |
| comp_1to1 | 44.53ms | 53.29ms | 52.24ms | 17.50ms | 8.90ms | 14.72ms |
| comp_2to1 | 23.85ms | 22.81ms | 33.51ms | 9.48ms | 4.29ms | 14.56ms |
| comp_4to1 | 16.42ms | 19.99ms | 17.43ms | 3.54ms | 8.62ms | 10.97ms |
| comp_1000to1 | 1.93ms | 15μs | 46μs | 5μs | 4μs | 4μs |
| comp_1to2 | 20.73ms | 34.80ms | 46.95ms | 19.64ms | 14.03ms | 17.61ms |
| comp_1to4 | 31.78ms | 17.52ms | 42.93ms | 10.31ms | 8.82ms | 20.33ms |
| comp_1to8 | 21.91ms | 20.77ms | 43.37ms | 6.33ms | 3.87ms | 7.62ms |
| comp_1to1000 | 19.10ms | 15.31ms | 39.85ms | 4.66ms | 3.56ms | 5.68ms |
| update_1to1 | 43.99ms | 27.86ms | 7.72ms | 9.38ms | 4.37ms | 8.76ms |
| update_2to1 | 21.79ms | 13.72ms | 2.89ms | 4.69ms | 2.17ms | 4.36ms |
| update_4to1 | 10.87ms | 7.60ms | 2.67ms | 2.37ms | 1.09ms | 2.19ms |
| update_1000to1 | 117μs | 69μs | 14μs | 23μs | 11μs | 21μs |
| update_1to2 | 21.83ms | 13.86ms | 3.48ms | 4.74ms | 2.18ms | 4.44ms |
| update_1to4 | 10.94ms | 6.86ms | 1.45ms | 2.35ms | 1.10ms | 2.21ms |
| update_1to1000 | 221μs | 163μs | 410μs | 45μs | 31μs | 526μs |
| cellx1000 | 154.21ms | 74.30ms | 5.53ms | 9.87ms | 7.67ms | 10.07ms |
| cellx2500 | 481.61ms | 253.27ms | 19.73ms | 35.52ms | 19.95ms | 28.08ms |
| cellx5000 | 1.10s | 555.76ms | 59.38ms | 64.63ms | 46.35ms | 66.34ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.70s (partial) | 2.00s | 248.95ms | 503.98ms | 234.58ms | 428.61ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.36s (partial) | 1.50s | 207.06ms | 286.91ms | 179.74ms | 278.26ms |
| 1000x12 - 4 sources - dynamic (large) | 4.05s (partial) | 1.82s | 339.89ms | 3.69s | 286.93ms | 3.37s |
| 1000x5 - 25 sources (wide dense) | 4.94s (partial) | 3.49s | 507.92ms | 3.51s | 406.28ms | 2.53s |
| 5x500 - 3 sources (deep) | 2.01s (partial) | 1.11s | 234.16ms | 238.32ms | 204.46ms | 225.92ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.77s (partial) | 1.72s | 266.98ms | 514.04ms | 259.74ms | 449.30ms |

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
