# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.74 | 100.0% | 35/35 | 3.72s |
| 🥈 | signals | 0.28 | 100.0% | 35/35 | 10.94s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.20s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.44s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.47s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.41s |

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
| avoidablePropagation | 203.01ms | 194.10ms | 170.24ms (fail) | 273.94ms | 205.64ms | 2.29s |
| broadPropagation | 452.30ms | 360.88ms | 6.66ms (fail) | 493.71ms | 460.15ms | 4.22s |
| deepPropagation | 174.03ms | 127.47ms | 136.79ms (fail) | 164.35ms | 176.43ms | 1.50s |
| diamond | 286.39ms | 247.06ms | 183.13ms (fail) | 345.33ms | 283.01ms | 2.36s |
| mux | 397.14ms | 361.02ms | 178.23ms (fail) | 412.23ms | 372.27ms | 1.76s |
| repeatedObservers | 45.52ms | 45.60ms | 55.71ms (fail) | 81.20ms | 41.22ms | 223.97ms |
| triangle | 101.75ms | 89.04ms | 76.70ms (fail) | 114.98ms | 103.84ms | 750.39ms |
| unstable | 76.06ms | 60.85ms | 334.94ms (fail) | 95.38ms | 71.63ms | 336.59ms |
| molBench | 494.56ms | 482.21ms | 1.10ms | 490.03ms | 495.61ms | 585.36ms |
| create_signals | 27.40ms | 29.97ms | 66.24ms | 53.68ms | 17.40ms | 64.29ms |
| comp_0to1 | 11.52ms | 7.00ms | 52.61ms | 24.76ms | 21.30ms | 19.73ms |
| comp_1to1 | 16.90ms | 4.17ms | 53.69ms | 41.12ms | 8.14ms | 47.47ms |
| comp_2to1 | 8.57ms | 2.36ms | 43.32ms | 11.79ms | 21.74ms | 22.30ms |
| comp_4to1 | 1.88ms | 8.54ms | 18.18ms | 17.45ms | 12.41ms | 30.53ms |
| comp_1000to1 | 5μs | 4μs | 41μs | 183μs | 7μs | 26μs |
| comp_1to2 | 18.92ms | 14.01ms | 45.11ms | 35.07ms | 14.49ms | 32.41ms |
| comp_1to4 | 9.98ms | 16.35ms | 44.47ms | 22.00ms | 23.69ms | 20.76ms |
| comp_1to8 | 6.44ms | 4.71ms | 43.66ms | 23.62ms | 14.63ms | 22.91ms |
| comp_1to1000 | 4.06ms | 3.22ms | 38.97ms | 14.55ms | 6.02ms | 15.08ms |
| update_1to1 | 9.01ms | 4.67ms | 8.08ms | 15.66ms | 9.02ms | 21.12ms |
| update_2to1 | 4.50ms | 2.33ms | 2.91ms | 7.82ms | 4.57ms | 10.34ms |
| update_4to1 | 2.24ms | 1.20ms | 2.00ms | 3.91ms | 2.24ms | 5.36ms |
| update_1000to1 | 22μs | 11μs | 14μs | 39μs | 23μs | 55μs |
| update_1to2 | 4.44ms | 2.32ms | 4.21ms | 7.83ms | 4.48ms | 10.35ms |
| update_1to4 | 2.25ms | 1.17ms | 1.45ms | 3.92ms | 2.34ms | 5.29ms |
| update_1to1000 | 41μs | 32μs | 387μs | 147μs | 49μs | 154μs |
| cellx1000 | 9.70ms | 7.50ms | 5.03ms | 11.62ms | 10.13ms | 68.66ms |
| cellx2500 | 31.55ms | 21.07ms | 21.81ms | 35.72ms | 28.81ms | 245.33ms |
| cellx5000 | 58.74ms | 53.61ms | 57.99ms | 108.72ms | 67.74ms | 546.53ms |
| 10x5 - 2 sources - read 20.0% (simple) | 511.72ms | 240.46ms | 246.23ms | 344.07ms | 450.67ms | 1.95s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 277.52ms | 182.08ms | 200.22ms | 249.11ms | 280.81ms | 1.44s |
| 1000x12 - 4 sources - dynamic (large) | 3.64s | 281.23ms | 339.85ms | 460.12ms | 3.77s | 1.79s |
| 1000x5 - 25 sources (wide dense) | 3.35s | 412.39ms | 512.84ms | 600.56ms | 2.77s | 3.33s |
| 5x500 - 3 sources (deep) | 222.66ms | 193.16ms | 204.16ms | 253.46ms | 240.20ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 473.85ms | 262.18ms | 257.25ms | 381.92ms | 451.03ms | 1.65s |

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
