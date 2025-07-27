# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.29s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.48s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.36s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 28.44s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.40s |

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
| Test Case | state_beacon | mobx | solidart(2.0-dev) | preact_signals | signals | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 164.40ms (fail) | 2.42s | 273.58ms | 202.48ms | 210.55ms | 182.40ms |
| broadPropagation | 6.43ms (fail) | 4.53s | 507.27ms | 513.57ms | 466.15ms | 342.98ms |
| deepPropagation | 140.86ms (fail) | 1.57s | 168.71ms | 179.10ms | 172.62ms | 122.10ms |
| diamond | 190.19ms (fail) | 2.50s | 351.33ms | 300.07ms | 282.67ms | 229.39ms |
| mux | 192.25ms (fail) | 1.82s | 438.35ms | 405.17ms | 413.26ms | 368.67ms |
| repeatedObservers | 51.96ms (fail) | 241.97ms | 81.29ms | 41.05ms | 44.84ms | 47.48ms |
| triangle | 81.76ms (fail) | 788.00ms | 117.08ms | 103.41ms | 98.72ms | 86.36ms |
| unstable | 336.92ms (fail) | 362.90ms | 97.16ms | 73.45ms | 79.88ms | 67.44ms |
| molBench | 1.44ms | 583.46ms | 493.65ms | 490.50ms | 491.00ms | 487.53ms |
| create_signals | 67.87ms | 83.33ms | 71.37ms | 4.55ms | 24.75ms | 27.88ms |
| comp_0to1 | 55.85ms | 35.65ms | 30.45ms | 17.62ms | 11.18ms | 7.87ms |
| comp_1to1 | 55.79ms | 19.10ms | 47.35ms | 12.46ms | 27.25ms | 4.19ms |
| comp_2to1 | 37.02ms | 18.75ms | 19.23ms | 17.36ms | 8.70ms | 2.38ms |
| comp_4to1 | 16.50ms | 23.53ms | 9.95ms | 17.83ms | 2.02ms | 9.98ms |
| comp_1000to1 | 41μs | 18μs | 21μs | 4μs | 4μs | 3μs |
| comp_1to2 | 44.77ms | 36.77ms | 37.35ms | 32.30ms | 15.34ms | 15.84ms |
| comp_1to4 | 43.70ms | 24.01ms | 19.31ms | 20.11ms | 9.99ms | 15.59ms |
| comp_1to8 | 42.53ms | 24.99ms | 24.27ms | 8.95ms | 11.58ms | 4.69ms |
| comp_1to1000 | 38.65ms | 16.13ms | 17.83ms | 6.77ms | 9.71ms | 3.17ms |
| update_1to1 | 5.64ms | 24.23ms | 16.16ms | 8.60ms | 12.66ms | 10.34ms |
| update_2to1 | 3.13ms | 12.37ms | 9.56ms | 4.29ms | 4.49ms | 2.27ms |
| update_4to1 | 1.44ms | 6.25ms | 4.04ms | 2.39ms | 2.25ms | 2.55ms |
| update_1000to1 | 15μs | 69μs | 41μs | 21μs | 22μs | 36μs |
| update_1to2 | 2.87ms | 12.84ms | 8.07ms | 4.59ms | 4.47ms | 4.36ms |
| update_1to4 | 1.45ms | 8.31ms | 4.01ms | 2.15ms | 2.29ms | 2.54ms |
| update_1to1000 | 388μs | 190μs | 243μs | 512μs | 55μs | 34μs |
| cellx1000 | 5.26ms | 72.59ms | 12.65ms | 9.68ms | 9.50ms | 7.35ms |
| cellx2500 | 27.52ms | 256.92ms | 36.33ms | 26.38ms | 30.53ms | 20.78ms |
| cellx5000 | 59.77ms | 590.10ms | 95.22ms | 67.36ms | 58.42ms | 51.28ms |
| 10x5 - 2 sources - read 20.0% (simple) | 251.82ms | 2.05s | 370.36ms | 438.71ms | 567.57ms | 226.33ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 196.68ms | 1.60s | 243.20ms | 273.89ms | 293.55ms | 173.88ms |
| 1000x12 - 4 sources - dynamic (large) | 328.51ms | 2.14s | 464.42ms | 3.70s | 3.84s | 281.68ms |
| 1000x5 - 25 sources (wide dense) | 490.87ms | 3.65s | 590.27ms | 2.70s | 3.57s | 404.51ms |
| 5x500 - 3 sources (deep) | 201.52ms | 1.22s | 245.46ms | 225.97ms | 224.84ms | 191.18ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 255.83ms | 1.72s | 382.06ms | 450.83ms | 483.10ms | 260.71ms |

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
