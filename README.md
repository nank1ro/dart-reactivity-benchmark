# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.74s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.24s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.08s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 9.97s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.60s |
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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 271.24ms | 204.17ms | 2.33s | 186.81ms | 214.49ms | 166.53ms (fail) |
| broadPropagation | 501.77ms | 453.69ms | 4.25s | 352.79ms | 458.38ms | 6.04ms (fail) |
| deepPropagation | 167.72ms | 178.61ms | 1.52s | 122.56ms | 169.49ms | 136.22ms (fail) |
| diamond | 349.86ms | 280.39ms | 2.44s | 236.06ms | 288.86ms | 193.23ms (fail) |
| mux | 437.77ms | 387.24ms | 1.86s | 371.32ms | 409.68ms | 193.32ms (fail) |
| repeatedObservers | 78.33ms | 38.75ms | 237.61ms | 45.47ms | 46.32ms | 52.17ms (fail) |
| triangle | 115.45ms | 99.39ms | 758.50ms | 89.13ms | 103.75ms | 77.17ms (fail) |
| unstable | 94.61ms | 70.56ms | 349.12ms | 61.58ms | 72.88ms | 336.74ms (fail) |
| molBench | 492.50ms | 490.98ms | 579.35ms | 491.90ms | 487.39ms | 1.35ms |
| create_signals | 50.72ms | 4.47ms | 66.64ms | 28.13ms | 26.80ms | 63.98ms |
| comp_0to1 | 25.88ms | 21.78ms | 26.48ms | 7.05ms | 12.53ms | 61.63ms |
| comp_1to1 | 26.21ms | 11.49ms | 36.20ms | 4.20ms | 26.88ms | 57.01ms |
| comp_2to1 | 40.35ms | 10.04ms | 34.21ms | 2.27ms | 11.82ms | 42.75ms |
| comp_4to1 | 12.91ms | 13.48ms | 15.95ms | 10.98ms | 3.52ms | 18.41ms |
| comp_1000to1 | 15μs | 6μs | 16μs | 5μs | 5μs | 44μs |
| comp_1to2 | 32.75ms | 14.81ms | 33.71ms | 19.92ms | 13.38ms | 45.79ms |
| comp_1to4 | 22.68ms | 28.95ms | 17.45ms | 5.39ms | 11.16ms | 44.73ms |
| comp_1to8 | 20.07ms | 7.81ms | 20.05ms | 4.36ms | 6.83ms | 44.27ms |
| comp_1to1000 | 14.30ms | 9.05ms | 15.38ms | 3.27ms | 4.50ms | 39.22ms |
| update_1to1 | 17.08ms | 8.21ms | 23.14ms | 11.26ms | 9.28ms | 5.73ms |
| update_2to1 | 8.48ms | 4.07ms | 10.52ms | 4.92ms | 4.57ms | 2.86ms |
| update_4to1 | 4.02ms | 2.07ms | 6.15ms | 2.80ms | 2.32ms | 1.43ms |
| update_1000to1 | 40μs | 20μs | 66μs | 10μs | 23μs | 15μs |
| update_1to2 | 8.09ms | 4.07ms | 10.47ms | 4.80ms | 4.99ms | 2.97ms |
| update_1to4 | 4.03ms | 2.09ms | 5.74ms | 2.56ms | 2.32ms | 1.44ms |
| update_1to1000 | 149μs | 1.51ms | 164μs | 47μs | 43μs | 402μs |
| cellx1000 | 11.64ms | 9.57ms | 70.52ms | 7.38ms | 9.58ms | 5.19ms |
| cellx2500 | 32.49ms | 25.52ms | 270.29ms | 20.15ms | 30.95ms | 25.33ms |
| cellx5000 | 68.42ms | 61.59ms | 560.91ms | 46.18ms | 60.19ms | 58.13ms |
| 10x5 - 2 sources - read 20.0% (simple) | 386.20ms | 442.12ms | 2.06s | 270.59ms | 519.66ms | 239.95ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 249.82ms | 268.46ms | 1.54s | 177.02ms | 277.15ms | 205.27ms |
| 1000x12 - 4 sources - dynamic (large) | 459.14ms | 3.55s | 1.91s | 281.10ms | 3.65s | 339.32ms |
| 1000x5 - 25 sources (wide dense) | 597.55ms | 2.58s | 3.65s | 415.22ms | 3.43s | 505.21ms |
| 5x500 - 3 sources (deep) | 250.72ms | 236.25ms | 1.16s | 190.58ms | 226.77ms | 208.18ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 384.62ms | 450.47ms | 1.73s | 264.99ms | 482.72ms | 258.85ms |

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
