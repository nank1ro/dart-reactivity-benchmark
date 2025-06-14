# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.70s |
| 🥈 | preact_signals | 0.26 | 100.0% | 35/35 | 10.36s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.31s |
| 4 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.46s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 28.40s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.57s |

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
| Test Case | solidart(2.0-dev) | signals | mobx | preact_signals | state_beacon | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 270.74ms | 209.82ms | 2.45s | 206.97ms | 164.08ms (fail) | 183.17ms |
| broadPropagation | 512.55ms | 456.16ms | 4.48s | 496.71ms | 6.46ms (fail) | 345.21ms |
| deepPropagation | 171.71ms | 168.06ms | 1.55s | 178.57ms | 142.53ms (fail) | 125.39ms |
| diamond | 355.96ms | 281.12ms | 2.52s | 296.83ms | 186.38ms (fail) | 230.77ms |
| mux | 451.65ms | 404.80ms | 1.82s | 407.86ms | 199.64ms (fail) | 367.02ms |
| repeatedObservers | 81.30ms | 44.51ms | 244.67ms | 41.70ms | 52.34ms (fail) | 45.50ms |
| triangle | 118.48ms | 104.99ms | 776.05ms | 102.62ms | 80.35ms (fail) | 85.43ms |
| unstable | 96.68ms | 79.45ms | 363.78ms | 73.39ms | 336.87ms (fail) | 67.71ms |
| molBench | 493.30ms | 486.13ms | 576.66ms | 489.73ms | 921μs | 487.80ms |
| create_signals | 84.34ms | 27.81ms | 71.97ms | 5.27ms | 66.17ms | 28.40ms |
| comp_0to1 | 49.19ms | 13.20ms | 28.69ms | 17.35ms | 53.75ms | 7.52ms |
| comp_1to1 | 42.14ms | 30.91ms | 44.90ms | 14.96ms | 59.36ms | 4.22ms |
| comp_2to1 | 44.72ms | 8.52ms | 35.98ms | 16.85ms | 44.43ms | 2.43ms |
| comp_4to1 | 16.39ms | 2.01ms | 17.08ms | 10.60ms | 18.65ms | 8.77ms |
| comp_1000to1 | 17μs | 8μs | 28μs | 4μs | 41μs | 3μs |
| comp_1to2 | 31.07ms | 23.34ms | 35.34ms | 18.29ms | 44.74ms | 17.46ms |
| comp_1to4 | 23.37ms | 7.08ms | 24.36ms | 36.06ms | 43.44ms | 8.99ms |
| comp_1to8 | 26.08ms | 6.72ms | 25.85ms | 7.84ms | 42.39ms | 3.75ms |
| comp_1to1000 | 17.20ms | 4.31ms | 16.43ms | 5.05ms | 37.97ms | 3.55ms |
| update_1to1 | 16.02ms | 8.85ms | 22.88ms | 8.60ms | 5.67ms | 10.22ms |
| update_2to1 | 7.83ms | 4.67ms | 13.24ms | 4.42ms | 3.15ms | 2.27ms |
| update_4to1 | 4.09ms | 2.27ms | 7.23ms | 2.19ms | 1.50ms | 2.52ms |
| update_1000to1 | 40μs | 22μs | 70μs | 21μs | 15μs | 26μs |
| update_1to2 | 8.06ms | 4.65ms | 12.07ms | 4.60ms | 2.95ms | 5.32ms |
| update_1to4 | 4.04ms | 2.25ms | 6.60ms | 2.20ms | 1.52ms | 2.49ms |
| update_1to1000 | 171μs | 45μs | 172μs | 187μs | 370μs | 31μs |
| cellx1000 | 15.32ms | 11.55ms | 91.80ms | 10.80ms | 7.08ms | 7.69ms |
| cellx2500 | 56.91ms | 55.07ms | 320.46ms | 35.86ms | 34.30ms | 23.47ms |
| cellx5000 | 165.41ms | 125.29ms | 646.16ms | 107.45ms | 97.98ms | 63.20ms |
| 10x5 - 2 sources - read 20.0% (simple) | 348.41ms | 507.38ms | 2.05s | 438.18ms | 258.57ms | 231.70ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 244.54ms | 280.65ms | 1.50s | 268.95ms | 224.35ms | 179.45ms |
| 1000x12 - 4 sources - dynamic (large) | 476.93ms | 3.77s | 1.99s | 3.66s | 365.43ms | 287.07ms |
| 1000x5 - 25 sources (wide dense) | 587.53ms | 3.45s | 3.65s | 2.71s | 509.42ms | 406.62ms |
| 5x500 - 3 sources (deep) | 252.75ms | 224.89ms | 1.26s | 233.16ms | 205.25ms | 192.06ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 389.24ms | 495.06ms | 1.75s | 451.61ms | 269.92ms | 258.45ms |

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
