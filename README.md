# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.29s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.01s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.25s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.53s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.48s |

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
| avoidablePropagation | 288.78ms | 204.89ms | 2.33s | 186.55ms | 210.78ms | 152.30ms (fail) |
| broadPropagation | 504.56ms | 453.72ms | 4.22s | 356.56ms | 464.70ms | 6.34ms (fail) |
| deepPropagation | 168.36ms | 178.65ms | 1.53s | 127.17ms | 173.03ms | 138.54ms (fail) |
| diamond | 364.52ms | 283.16ms | 2.40s | 236.67ms | 291.54ms | 184.02ms (fail) |
| mux | 449.25ms | 384.36ms | 1.79s | 374.87ms | 412.45ms | 191.59ms (fail) |
| repeatedObservers | 78.12ms | 38.58ms | 234.85ms | 45.37ms | 46.09ms | 52.16ms (fail) |
| triangle | 114.42ms | 99.61ms | 771.05ms | 85.72ms | 105.78ms | 76.89ms (fail) |
| unstable | 93.94ms | 71.89ms | 345.19ms | 60.37ms | 72.22ms | 337.35ms (fail) |
| molBench | 491.96ms | 491.41ms | 576.80ms | 491.76ms | 488.30ms | 1.00ms |
| create_signals | 71.78ms | 4.69ms | 75.72ms | 20.94ms | 26.50ms | 70.83ms |
| comp_0to1 | 27.75ms | 22.64ms | 20.36ms | 7.66ms | 12.14ms | 63.99ms |
| comp_1to1 | 35.55ms | 14.47ms | 27.55ms | 4.28ms | 28.25ms | 55.39ms |
| comp_2to1 | 26.84ms | 15.97ms | 8.56ms | 2.29ms | 18.38ms | 37.62ms |
| comp_4to1 | 10.45ms | 13.00ms | 18.17ms | 10.87ms | 9.09ms | 16.72ms |
| comp_1000to1 | 14μs | 4μs | 15μs | 4μs | 5μs | 41μs |
| comp_1to2 | 39.03ms | 18.78ms | 30.71ms | 11.58ms | 25.39ms | 45.35ms |
| comp_1to4 | 20.04ms | 33.79ms | 24.04ms | 11.42ms | 17.72ms | 44.81ms |
| comp_1to8 | 29.70ms | 7.21ms | 23.31ms | 5.25ms | 6.82ms | 44.15ms |
| comp_1to1000 | 15.19ms | 6.98ms | 15.24ms | 3.57ms | 4.43ms | 39.18ms |
| update_1to1 | 16.31ms | 8.16ms | 23.82ms | 11.35ms | 9.16ms | 5.72ms |
| update_2to1 | 9.07ms | 4.04ms | 10.71ms | 5.00ms | 4.54ms | 4.64ms |
| update_4to1 | 4.11ms | 2.06ms | 7.03ms | 2.76ms | 2.30ms | 1.48ms |
| update_1000to1 | 67μs | 20μs | 66μs | 10μs | 22μs | 15μs |
| update_1to2 | 8.33ms | 4.06ms | 11.81ms | 5.60ms | 4.82ms | 2.96ms |
| update_1to4 | 4.09ms | 2.06ms | 5.44ms | 2.46ms | 2.29ms | 1.48ms |
| update_1to1000 | 152μs | 926μs | 169μs | 35μs | 43μs | 392μs |
| cellx1000 | 12.46ms | 9.66ms | 78.75ms | 8.41ms | 9.98ms | 5.49ms |
| cellx2500 | 34.29ms | 27.76ms | 260.74ms | 20.64ms | 44.20ms | 28.85ms |
| cellx5000 | 76.96ms | 79.02ms | 563.41ms | 46.60ms | 93.24ms | 66.99ms |
| 10x5 - 2 sources - read 20.0% (simple) | 359.72ms | 439.06ms | 2.02s | 231.49ms | 513.07ms | 249.91ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 243.17ms | 269.40ms | 1.56s | 176.64ms | 278.21ms | 213.28ms |
| 1000x12 - 4 sources - dynamic (large) | 463.05ms | 3.52s | 1.97s | 277.86ms | 3.78s | 359.52ms |
| 1000x5 - 25 sources (wide dense) | 595.10ms | 2.60s | 3.62s | 409.30ms | 3.37s | 517.49ms |
| 5x500 - 3 sources (deep) | 253.11ms | 236.53ms | 1.18s | 187.30ms | 226.61ms | 204.35ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 379.08ms | 455.26ms | 1.78s | 263.19ms | 491.31ms | 261.77ms |

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
