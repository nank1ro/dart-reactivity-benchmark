# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.36s |
| 🥈 | preact_signals | 0.32 | 100.0% | 35/35 | 8.74s |
| 🥉 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 4.97s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 9.34s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.17s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.08s |

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
| avoidablePropagation | 248.71ms | 200.74ms | 2.24s | 193.51ms | 132.26ms (fail) | 167.44ms |
| broadPropagation | 460.70ms | 427.63ms | 4.04s | 387.88ms | 5.55ms (fail) | 302.97ms |
| deepPropagation | 150.29ms | 173.90ms | 1.42s | 176.77ms | 153.61ms (fail) | 107.06ms |
| diamond | 347.60ms | 261.66ms | 2.23s | 256.52ms | 175.94ms (fail) | 232.24ms |
| mux | 383.74ms | 334.19ms | 1.82s | 333.96ms | 158.76ms (fail) | 328.70ms |
| repeatedObservers | 73.35ms | 39.07ms | 223.87ms | 34.05ms | 45.87ms (fail) | 40.78ms |
| triangle | 114.61ms | 92.67ms | 727.42ms | 93.83ms | 75.08ms (fail) | 80.27ms |
| unstable | 96.89ms | 65.90ms | 318.28ms | 58.47ms | 316.52ms (fail) | 57.85ms |
| molBench | 370.95ms | 390.18ms | 484.12ms | 365.39ms | 875μs | 362.99ms |
| create_signals | 104.08ms | 25.29ms | 72.63ms | 7.17ms | 61.92ms | 30.76ms |
| comp_0to1 | 37.34ms | 12.45ms | 38.47ms | 21.18ms | 53.40ms | 10.99ms |
| comp_1to1 | 53.57ms | 33.09ms | 49.14ms | 24.66ms | 55.50ms | 6.00ms |
| comp_2to1 | 23.96ms | 11.95ms | 22.29ms | 3.75ms | 37.87ms | 3.60ms |
| comp_4to1 | 17.07ms | 8.79ms | 27.11ms | 22.93ms | 16.10ms | 15.89ms |
| comp_1000to1 | 16μs | 18μs | 17μs | 6μs | 41μs | 6μs |
| comp_1to2 | 43.17ms | 26.57ms | 36.83ms | 18.26ms | 46.06ms | 20.54ms |
| comp_1to4 | 23.79ms | 9.62ms | 21.17ms | 18.47ms | 47.34ms | 10.69ms |
| comp_1to8 | 25.96ms | 8.76ms | 26.25ms | 9.40ms | 43.97ms | 9.57ms |
| comp_1to1000 | 15.89ms | 6.09ms | 16.54ms | 5.18ms | 38.23ms | 4.79ms |
| update_1to1 | 14.51ms | 10.22ms | 20.09ms | 7.90ms | 4.41ms | 4.27ms |
| update_2to1 | 7.21ms | 4.90ms | 10.30ms | 4.17ms | 2.50ms | 2.15ms |
| update_4to1 | 3.62ms | 2.58ms | 5.15ms | 2.20ms | 1.17ms | 1.26ms |
| update_1000to1 | 37μs | 29μs | 48μs | 21μs | 12μs | 11μs |
| update_1to2 | 7.40ms | 5.22ms | 9.85ms | 4.21ms | 2.27ms | 2.11ms |
| update_1to4 | 3.70ms | 2.63ms | 5.20ms | 2.10ms | 1.17ms | 1.16ms |
| update_1to1000 | 156μs | 64μs | 164μs | 83μs | 366μs | 47μs |
| cellx1000 | 20.82ms | 13.80ms | 91.10ms | 11.27ms | 10.77ms | 9.88ms |
| cellx2500 | 60.15ms | 38.42ms | 276.28ms | 33.58ms | 32.38ms | 29.63ms |
| cellx5000 | 137.65ms | 90.92ms | 604.33ms | 84.10ms | 79.09ms | 69.48ms |
| 10x5 - 2 sources - read 20.0% (simple) | 362.56ms | 441.46ms | 2.02s | 396.00ms | 225.54ms | 226.62ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 252.24ms | 240.60ms | 1.46s | 234.02ms | 173.57ms | 172.70ms |
| 1000x12 - 4 sources - dynamic (large) | 370.52ms | 3.15s | 1.62s | 3.03s | 276.27ms | 253.73ms |
| 1000x5 - 25 sources (wide dense) | 549.84ms | 2.59s | 3.38s | 2.28s | 383.62ms | 357.26ms |
| 5x500 - 3 sources (deep) | 279.73ms | 211.66ms | 1.18s | 225.37ms | 202.54ms | 211.12ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 309.45ms | 400.69ms | 1.68s | 388.30ms | 218.76ms | 225.97ms |

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
