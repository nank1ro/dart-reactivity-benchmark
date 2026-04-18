# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.18s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.30s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.42s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.75s |
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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.25s | 206.69ms | 201.31ms | 206.52ms | 278.93ms | 147.78ms (fail) |
| broadPropagation | 4.30s | 463.41ms | 360.54ms | 454.04ms | 495.34ms | 6.29ms (fail) |
| deepPropagation | 1.54s | 170.82ms | 129.36ms | 173.10ms | 166.85ms | 192.59ms (fail) |
| diamond | 2.33s | 288.83ms | 245.91ms | 285.46ms | 344.39ms | 186.10ms (fail) |
| mux | 1.76s | 399.88ms | 366.99ms | 369.54ms | 418.29ms | 184.50ms (fail) |
| repeatedObservers | 232.52ms | 45.56ms | 44.80ms | 43.04ms | 80.68ms | 55.52ms (fail) |
| triangle | 759.09ms | 100.13ms | 89.57ms | 99.68ms | 115.52ms | 96.24ms (fail) |
| unstable | 346.25ms | 77.65ms | 61.33ms | 71.89ms | 95.21ms | 335.03ms (fail) |
| molBench | 587.62ms | 493.67ms | 482.33ms | 496.05ms | 492.07ms | 1.11ms |
| create_signals | 69.47ms | 25.21ms | 28.05ms | 5.49ms | 52.37ms | 59.58ms |
| comp_0to1 | 32.86ms | 10.91ms | 8.14ms | 17.67ms | 30.50ms | 54.63ms |
| comp_1to1 | 44.37ms | 26.83ms | 4.27ms | 12.96ms | 39.37ms | 55.98ms |
| comp_2to1 | 35.23ms | 9.35ms | 2.37ms | 19.34ms | 23.68ms | 36.45ms |
| comp_4to1 | 13.18ms | 2.87ms | 7.52ms | 11.04ms | 13.41ms | 16.97ms |
| comp_1000to1 | 15μs | 5μs | 3μs | 5μs | 17μs | 43μs |
| comp_1to2 | 36.79ms | 16.78ms | 10.35ms | 16.75ms | 37.00ms | 46.94ms |
| comp_1to4 | 22.41ms | 9.40ms | 9.36ms | 25.18ms | 20.02ms | 45.55ms |
| comp_1to8 | 24.03ms | 6.13ms | 4.98ms | 6.94ms | 18.93ms | 45.16ms |
| comp_1to1000 | 15.48ms | 3.99ms | 3.50ms | 4.62ms | 13.89ms | 41.35ms |
| update_1to1 | 21.21ms | 8.89ms | 4.63ms | 9.23ms | 15.69ms | 10.10ms |
| update_2to1 | 10.63ms | 4.54ms | 2.34ms | 4.61ms | 7.82ms | 2.85ms |
| update_4to1 | 5.88ms | 2.26ms | 1.20ms | 2.33ms | 3.92ms | 2.03ms |
| update_1000to1 | 52μs | 22μs | 11μs | 23μs | 52μs | 14μs |
| update_1to2 | 10.52ms | 4.45ms | 2.30ms | 4.55ms | 8.07ms | 3.29ms |
| update_1to4 | 5.23ms | 2.27ms | 1.20ms | 2.44ms | 3.94ms | 1.46ms |
| update_1to1000 | 152μs | 41μs | 44μs | 155μs | 163μs | 389μs |
| cellx1000 | 72.84ms | 9.60ms | 7.53ms | 9.98ms | 11.59ms | 5.25ms |
| cellx2500 | 251.45ms | 31.46ms | 19.39ms | 27.20ms | 30.63ms | 25.89ms |
| cellx5000 | 587.06ms | 59.62ms | 42.20ms | 65.78ms | 70.94ms | 59.58ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.97s | 509.83ms | 241.92ms | 460.65ms | 343.95ms | 242.60ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.48s | 280.65ms | 177.79ms | 272.44ms | 249.16ms | 200.08ms |
| 1000x12 - 4 sources - dynamic (large) | 1.81s | 3.84s | 273.55ms | 3.78s | 459.32ms | 335.31ms |
| 1000x5 - 25 sources (wide dense) | 3.34s | 3.49s | 410.05ms | 2.77s | 598.25ms | 514.05ms |
| 5x500 - 3 sources (deep) | 1.12s | 225.47ms | 199.51ms | 233.52ms | 253.32ms | 206.75ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.66s | 480.01ms | 264.55ms | 450.18ms | 381.87ms | 257.84ms |

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
