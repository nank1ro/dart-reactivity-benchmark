# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.78 | 100.0% | 35/35 | 4.00s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.81s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.64s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 11.21s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 29.33s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.88s |

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
| avoidablePropagation | 203.69ms | 2.32s | 156.80ms (fail) | 194.78ms | 207.70ms | 277.48ms |
| broadPropagation | 463.82ms | 4.27s | 7.13ms (fail) | 360.61ms | 477.46ms | 497.95ms |
| deepPropagation | 174.85ms | 1.56s | 142.72ms (fail) | 126.20ms | 182.69ms | 167.90ms |
| diamond | 288.72ms | 2.44s | 216.68ms (fail) | 246.50ms | 286.64ms | 349.31ms |
| mux | 414.31ms | 1.93s | 193.85ms (fail) | 379.23ms | 397.64ms | 484.20ms |
| repeatedObservers | 46.23ms | 228.48ms | 55.68ms (fail) | 46.07ms | 42.38ms | 81.04ms |
| triangle | 102.22ms | 770.39ms | 88.80ms (fail) | 88.25ms | 100.41ms | 114.54ms |
| unstable | 76.52ms | 343.89ms | 344.44ms (fail) | 64.55ms | 73.02ms | 95.69ms |
| molBench | 499.04ms | 598.82ms | 1.44ms | 492.10ms | 499.92ms | 498.32ms |
| create_signals | 35.52ms | 106.73ms | 69.42ms | 33.24ms | 15.20ms | 80.34ms |
| comp_0to1 | 38.40ms | 18.54ms | 60.95ms | 9.46ms | 26.68ms | 32.40ms |
| comp_1to1 | 26.06ms | 54.51ms | 60.89ms | 5.72ms | 10.13ms | 35.61ms |
| comp_2to1 | 11.91ms | 50.99ms | 46.02ms | 3.16ms | 14.32ms | 48.20ms |
| comp_4to1 | 3.08ms | 28.64ms | 22.09ms | 9.30ms | 18.85ms | 5.11ms |
| comp_1000to1 | 8μs | 18μs | 49μs | 4μs | 11μs | 30μs |
| comp_1to2 | 20.39ms | 42.88ms | 49.36ms | 15.58ms | 27.32ms | 47.16ms |
| comp_1to4 | 20.51ms | 33.28ms | 51.08ms | 12.26ms | 44.03ms | 27.17ms |
| comp_1to8 | 12.74ms | 31.15ms | 51.47ms | 6.66ms | 9.36ms | 30.23ms |
| comp_1to1000 | 8.03ms | 16.42ms | 40.65ms | 4.70ms | 8.63ms | 15.19ms |
| update_1to1 | 9.09ms | 21.88ms | 6.91ms | 4.80ms | 9.22ms | 15.87ms |
| update_2to1 | 4.59ms | 10.78ms | 2.96ms | 2.35ms | 4.57ms | 7.85ms |
| update_4to1 | 2.36ms | 5.62ms | 2.20ms | 1.24ms | 2.22ms | 3.93ms |
| update_1000to1 | 22μs | 54μs | 15μs | 11μs | 22μs | 39μs |
| update_1to2 | 4.48ms | 10.81ms | 3.46ms | 2.34ms | 4.46ms | 8.13ms |
| update_1to4 | 2.28ms | 5.54ms | 1.61ms | 1.34ms | 2.34ms | 3.96ms |
| update_1to1000 | 81μs | 169μs | 392μs | 49μs | 1.18ms | 155μs |
| cellx1000 | 22.63ms | 173.21ms | 11.01ms | 10.44ms | 22.12ms | 25.36ms |
| cellx2500 | 106.27ms | 457.66ms | 68.81ms | 53.52ms | 86.97ms | 144.91ms |
| cellx5000 | 247.25ms | 977.51ms | 160.05ms | 191.37ms | 275.40ms | 321.61ms |
| 10x5 - 2 sources - read 20.0% (simple) | 498.85ms | 2.04s | 304.88ms | 237.86ms | 457.38ms | 350.48ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.79ms | 1.51s | 210.88ms | 178.05ms | 270.10ms | 251.10ms |
| 1000x12 - 4 sources - dynamic (large) | 3.58s | 2.11s | 383.63ms | 300.44ms | 3.99s | 488.73ms |
| 1000x5 - 25 sources (wide dense) | 3.69s | 3.72s | 530.86ms | 423.26ms | 2.91s | 597.18ms |
| 5x500 - 3 sources (deep) | 237.53ms | 1.57s | 241.66ms | 215.92ms | 242.21ms | 287.69ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 515.60ms | 1.87s | 286.63ms | 280.57ms | 482.51ms | 411.62ms |

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
