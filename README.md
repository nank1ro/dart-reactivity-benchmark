# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.73s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.31s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 10.81s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.61s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.55s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.50s |

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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 200.55ms | 2.35s | 144.42ms (fail) | 197.56ms | 205.06ms | 274.60ms |
| broadPropagation | 460.46ms | 4.36s | 6.11ms (fail) | 355.27ms | 461.45ms | 520.14ms |
| deepPropagation | 169.53ms | 1.54s | 151.00ms (fail) | 123.37ms | 181.65ms | 166.20ms |
| diamond | 284.58ms | 2.47s | 184.34ms (fail) | 242.26ms | 282.87ms | 351.55ms |
| mux | 398.48ms | 1.79s | 181.42ms (fail) | 361.62ms | 377.16ms | 415.35ms |
| repeatedObservers | 46.14ms | 231.00ms | 57.06ms (fail) | 44.61ms | 41.43ms | 80.42ms |
| triangle | 100.37ms | 772.69ms | 84.44ms (fail) | 88.25ms | 99.44ms | 113.19ms |
| unstable | 79.98ms | 343.84ms | 335.21ms (fail) | 62.31ms | 71.25ms | 96.08ms |
| molBench | 494.45ms | 584.91ms | 1.21ms | 481.10ms | 495.90ms | 493.70ms |
| create_signals | 27.47ms | 78.17ms | 68.10ms | 31.79ms | 5.54ms | 78.33ms |
| comp_0to1 | 12.31ms | 24.54ms | 55.11ms | 8.43ms | 19.08ms | 27.32ms |
| comp_1to1 | 29.96ms | 31.17ms | 56.56ms | 4.32ms | 13.51ms | 49.83ms |
| comp_2to1 | 9.92ms | 31.56ms | 38.26ms | 2.39ms | 18.45ms | 25.94ms |
| comp_4to1 | 2.28ms | 20.35ms | 17.23ms | 7.86ms | 12.55ms | 17.69ms |
| comp_1000to1 | 5μs | 38μs | 44μs | 4μs | 4μs | 19μs |
| comp_1to2 | 21.38ms | 43.62ms | 46.61ms | 10.93ms | 30.84ms | 27.50ms |
| comp_1to4 | 10.66ms | 23.27ms | 46.38ms | 9.77ms | 26.50ms | 20.38ms |
| comp_1to8 | 6.17ms | 26.47ms | 44.95ms | 5.21ms | 7.25ms | 22.38ms |
| comp_1to1000 | 4.25ms | 15.30ms | 40.54ms | 3.83ms | 4.57ms | 14.06ms |
| update_1to1 | 9.04ms | 21.15ms | 7.84ms | 4.65ms | 8.88ms | 15.61ms |
| update_2to1 | 4.48ms | 10.73ms | 2.88ms | 2.50ms | 4.63ms | 7.89ms |
| update_4to1 | 2.25ms | 6.02ms | 2.33ms | 1.26ms | 2.28ms | 3.93ms |
| update_1000to1 | 22μs | 52μs | 14μs | 11μs | 28μs | 39μs |
| update_1to2 | 4.46ms | 12.34ms | 3.67ms | 2.38ms | 4.41ms | 8.44ms |
| update_1to4 | 2.24ms | 5.22ms | 1.52ms | 1.23ms | 2.39ms | 4.02ms |
| update_1to1000 | 41μs | 155μs | 387μs | 47μs | 189μs | 145μs |
| cellx1000 | 10.55ms | 95.39ms | 7.43ms | 8.01ms | 9.96ms | 12.61ms |
| cellx2500 | 44.06ms | 316.85ms | 35.94ms | 24.82ms | 35.40ms | 48.01ms |
| cellx5000 | 108.25ms | 621.60ms | 91.67ms | 53.32ms | 95.06ms | 98.05ms |
| 10x5 - 2 sources - read 20.0% (simple) | 506.81ms | 2.01s | 243.50ms | 238.27ms | 470.23ms | 344.16ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.82ms | 1.47s | 199.63ms | 184.84ms | 281.95ms | 248.64ms |
| 1000x12 - 4 sources - dynamic (large) | 3.48s | 1.90s | 360.35ms | 286.32ms | 3.85s | 466.17ms |
| 1000x5 - 25 sources (wide dense) | 3.30s | 3.43s | 518.13ms | 417.39ms | 2.81s | 602.35ms |
| 5x500 - 3 sources (deep) | 223.86ms | 1.23s | 207.39ms | 192.91ms | 229.28ms | 257.05ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 473.74ms | 1.68s | 258.54ms | 266.37ms | 454.84ms | 394.75ms |

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
