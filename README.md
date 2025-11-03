# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.76s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.31s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.42s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.68s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.54s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.59s |

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
| avoidablePropagation | 214.27ms | 195.18ms | 164.52ms (fail) | 264.25ms | 200.94ms | 2.35s |
| broadPropagation | 453.73ms | 357.61ms | 6.44ms (fail) | 507.49ms | 462.39ms | 4.30s |
| deepPropagation | 176.88ms | 126.55ms | 142.06ms (fail) | 163.41ms | 183.99ms | 1.54s |
| diamond | 284.44ms | 237.28ms | 190.01ms (fail) | 348.71ms | 279.78ms | 2.42s |
| mux | 410.44ms | 380.10ms | 206.45ms (fail) | 439.31ms | 388.61ms | 1.85s |
| repeatedObservers | 48.33ms | 44.13ms | 52.55ms (fail) | 80.30ms | 40.66ms | 231.57ms |
| triangle | 103.69ms | 86.65ms | 78.25ms (fail) | 113.34ms | 101.36ms | 772.44ms |
| unstable | 76.72ms | 60.43ms | 344.41ms (fail) | 94.50ms | 76.81ms | 344.75ms |
| molBench | 487.59ms | 490.24ms | 938μs | 497.17ms | 487.08ms | 584.28ms |
| create_signals | 26.19ms | 23.99ms | 73.34ms | 75.98ms | 5.21ms | 70.96ms |
| comp_0to1 | 12.13ms | 10.59ms | 69.87ms | 27.82ms | 17.45ms | 29.77ms |
| comp_1to1 | 29.66ms | 4.39ms | 70.47ms | 29.29ms | 14.74ms | 39.62ms |
| comp_2to1 | 9.56ms | 2.25ms | 48.82ms | 32.94ms | 20.63ms | 22.13ms |
| comp_4to1 | 1.90ms | 7.80ms | 19.81ms | 5.05ms | 14.01ms | 28.54ms |
| comp_1000to1 | 4μs | 3μs | 52μs | 19μs | 4μs | 16μs |
| comp_1to2 | 23.52ms | 10.28ms | 56.65ms | 28.83ms | 18.33ms | 36.92ms |
| comp_1to4 | 9.52ms | 11.99ms | 54.01ms | 27.71ms | 34.80ms | 18.68ms |
| comp_1to8 | 10.28ms | 4.99ms | 53.07ms | 27.03ms | 7.63ms | 21.56ms |
| comp_1to1000 | 7.01ms | 3.32ms | 47.73ms | 16.71ms | 6.25ms | 15.72ms |
| update_1to1 | 10.34ms | 10.12ms | 6.01ms | 16.36ms | 8.42ms | 26.48ms |
| update_2to1 | 4.73ms | 2.17ms | 3.09ms | 8.00ms | 4.40ms | 12.99ms |
| update_4to1 | 2.68ms | 2.46ms | 1.53ms | 4.08ms | 2.10ms | 7.12ms |
| update_1000to1 | 26μs | 30μs | 15μs | 40μs | 20μs | 70μs |
| update_1to2 | 4.73ms | 4.91ms | 3.03ms | 8.35ms | 4.07ms | 12.99ms |
| update_1to4 | 2.61ms | 2.42ms | 1.53ms | 4.10ms | 2.09ms | 6.39ms |
| update_1to1000 | 43μs | 43μs | 475μs | 172μs | 175μs | 176μs |
| cellx1000 | 10.04ms | 7.28ms | 5.63ms | 11.94ms | 9.99ms | 80.10ms |
| cellx2500 | 36.52ms | 21.54ms | 26.58ms | 38.00ms | 28.76ms | 276.65ms |
| cellx5000 | 81.01ms | 50.74ms | 89.12ms | 105.40ms | 84.26ms | 618.00ms |
| 10x5 - 2 sources - read 20.0% (simple) | 510.87ms | 277.05ms | 242.31ms | 360.09ms | 451.01ms | 2.01s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.06ms | 178.29ms | 195.84ms | 256.01ms | 272.78ms | 1.54s |
| 1000x12 - 4 sources - dynamic (large) | 4.05s | 283.14ms | 357.63ms | 463.45ms | 3.77s | 1.88s |
| 1000x5 - 25 sources (wide dense) | 3.59s | 408.81ms | 512.15ms | 608.27ms | 2.73s | 3.50s |
| 5x500 - 3 sources (deep) | 224.29ms | 190.14ms | 207.29ms | 254.58ms | 231.53ms | 1.14s |
| 100x15 - 6 sources - dynamic (very dynamic) | 478.81ms | 263.23ms | 257.43ms | 386.62ms | 463.17ms | 1.76s |

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
