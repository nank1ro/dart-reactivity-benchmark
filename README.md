# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.33s |
| 🥈 | preact_signals | 0.30 | 100.0% | 35/35 | 8.58s |
| 🥉 | signals | 0.30 | 100.0% | 35/35 | 9.17s |
| 4 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 4.92s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.33s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.06s |

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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 194.88ms | 167.63ms | 136.13ms (fail) | 246.86ms | 183.47ms | 2.35s |
| broadPropagation | 392.39ms | 302.57ms | 5.96ms (fail) | 454.94ms | 383.96ms | 4.11s |
| deepPropagation | 171.22ms | 107.81ms | 151.26ms (fail) | 150.99ms | 176.61ms | 1.44s |
| diamond | 256.77ms | 233.84ms | 176.73ms (fail) | 344.87ms | 252.64ms | 2.33s |
| mux | 335.04ms | 322.80ms | 159.68ms (fail) | 390.31ms | 328.16ms | 1.76s |
| repeatedObservers | 39.19ms | 40.97ms | 48.30ms (fail) | 73.20ms | 32.82ms | 227.14ms |
| triangle | 92.74ms | 79.93ms | 74.20ms (fail) | 112.65ms | 92.68ms | 737.59ms |
| unstable | 64.58ms | 58.81ms | 323.64ms (fail) | 97.75ms | 56.79ms | 340.25ms |
| molBench | 390.18ms | 364.64ms | 835μs | 396.25ms | 363.72ms | 480.13ms |
| create_signals | 23.94ms | 28.33ms | 59.91ms | 76.88ms | 6.99ms | 72.12ms |
| comp_0to1 | 11.78ms | 11.14ms | 50.64ms | 27.23ms | 19.96ms | 25.92ms |
| comp_1to1 | 29.75ms | 10.22ms | 52.42ms | 51.73ms | 14.94ms | 17.97ms |
| comp_2to1 | 8.75ms | 17.61ms | 44.26ms | 25.34ms | 13.94ms | 22.20ms |
| comp_4to1 | 2.53ms | 3.61ms | 15.82ms | 10.21ms | 12.46ms | 27.70ms |
| comp_1000to1 | 7μs | 5μs | 42μs | 19μs | 7μs | 17μs |
| comp_1to2 | 18.44ms | 11.68ms | 48.52ms | 41.55ms | 20.82ms | 38.94ms |
| comp_1to4 | 13.72ms | 10.74ms | 44.52ms | 26.64ms | 38.17ms | 27.27ms |
| comp_1to8 | 9.04ms | 6.16ms | 42.83ms | 26.22ms | 10.04ms | 23.78ms |
| comp_1to1000 | 7.60ms | 5.09ms | 38.32ms | 15.53ms | 6.68ms | 15.53ms |
| update_1to1 | 8.98ms | 4.10ms | 4.69ms | 14.39ms | 8.29ms | 19.47ms |
| update_2to1 | 4.38ms | 1.96ms | 2.48ms | 7.18ms | 3.81ms | 9.82ms |
| update_4to1 | 2.27ms | 926μs | 1.34ms | 3.60ms | 2.17ms | 5.37ms |
| update_1000to1 | 21μs | 16μs | 12μs | 35μs | 17μs | 45μs |
| update_1to2 | 4.70ms | 3.44ms | 2.45ms | 7.18ms | 4.27ms | 9.99ms |
| update_1to4 | 2.24ms | 1.83ms | 1.24ms | 3.60ms | 2.15ms | 4.94ms |
| update_1to1000 | 58μs | 61μs | 388μs | 151μs | 190μs | 190μs |
| cellx1000 | 10.79ms | 10.67ms | 8.81ms | 19.35ms | 9.99ms | 81.04ms |
| cellx2500 | 37.95ms | 25.88ms | 29.67ms | 55.86ms | 26.49ms | 264.25ms |
| cellx5000 | 77.86ms | 61.92ms | 69.33ms | 128.55ms | 74.91ms | 555.32ms |
| 10x5 - 2 sources - read 20.0% (simple) | 417.44ms | 226.30ms | 223.02ms | 359.56ms | 382.85ms | 2.04s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 236.25ms | 173.53ms | 172.54ms | 251.90ms | 234.75ms | 1.49s |
| 1000x12 - 4 sources - dynamic (large) | 3.10s | 254.00ms | 268.64ms | 372.12ms | 2.96s | 1.69s |
| 1000x5 - 25 sources (wide dense) | 2.59s | 355.86ms | 377.37ms | 547.75ms | 2.26s | 3.35s |
| 5x500 - 3 sources (deep) | 217.69ms | 199.29ms | 202.16ms | 274.24ms | 220.53ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 398.87ms | 223.54ms | 218.87ms | 308.16ms | 370.88ms | 1.62s |

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
