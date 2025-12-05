# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.39s |
| 🥈 | signals | 0.29 | 100.0% | 35/35 | 9.45s |
| 🥉 | preact_signals | 0.29 | 100.0% | 35/35 | 8.88s |
| 4 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.02s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.05s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.14s |

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
| avoidablePropagation | 195.87ms | 168.24ms | 137.03ms (fail) | 249.34ms | 184.17ms | 2.26s |
| broadPropagation | 388.16ms | 303.99ms | 5.80ms (fail) | 456.70ms | 384.20ms | 4.18s |
| deepPropagation | 171.18ms | 108.18ms | 160.54ms (fail) | 150.26ms | 174.17ms | 1.46s |
| diamond | 261.03ms | 237.02ms | 181.44ms (fail) | 348.65ms | 266.32ms | 2.30s |
| mux | 341.77ms | 337.50ms | 165.64ms (fail) | 390.15ms | 331.27ms | 1.99s |
| repeatedObservers | 39.44ms | 41.23ms | 47.89ms (fail) | 72.77ms | 33.34ms | 230.34ms |
| triangle | 94.45ms | 80.15ms | 77.31ms (fail) | 112.54ms | 92.71ms | 791.76ms |
| unstable | 65.07ms | 59.22ms | 329.11ms (fail) | 97.76ms | 57.85ms | 344.09ms |
| molBench | 390.83ms | 365.99ms | 910μs | 397.00ms | 365.92ms | 483.95ms |
| create_signals | 25.65ms | 29.44ms | 69.57ms | 75.52ms | 7.74ms | 48.77ms |
| comp_0to1 | 13.07ms | 12.81ms | 59.87ms | 34.61ms | 20.14ms | 42.74ms |
| comp_1to1 | 31.22ms | 6.64ms | 54.52ms | 49.43ms | 15.77ms | 48.21ms |
| comp_2to1 | 8.33ms | 3.82ms | 36.09ms | 30.00ms | 22.49ms | 22.87ms |
| comp_4to1 | 10.22ms | 8.97ms | 16.53ms | 18.44ms | 13.60ms | 14.24ms |
| comp_1000to1 | 7μs | 6μs | 49μs | 49μs | 6μs | 18μs |
| comp_1to2 | 23.07ms | 13.97ms | 46.05ms | 47.13ms | 29.20ms | 38.74ms |
| comp_1to4 | 14.23ms | 8.68ms | 46.69ms | 20.39ms | 23.91ms | 26.41ms |
| comp_1to8 | 9.82ms | 6.59ms | 45.20ms | 31.17ms | 13.05ms | 27.00ms |
| comp_1to1000 | 6.61ms | 5.93ms | 39.77ms | 16.87ms | 8.25ms | 17.49ms |
| update_1to1 | 8.58ms | 4.08ms | 4.75ms | 14.36ms | 8.49ms | 20.84ms |
| update_2to1 | 4.58ms | 2.15ms | 2.41ms | 7.20ms | 4.23ms | 9.88ms |
| update_4to1 | 2.36ms | 1.01ms | 1.18ms | 3.60ms | 1.96ms | 5.41ms |
| update_1000to1 | 22μs | 26μs | 12μs | 37μs | 17μs | 53μs |
| update_1to2 | 4.16ms | 2.12ms | 2.33ms | 7.19ms | 4.28ms | 10.26ms |
| update_1to4 | 2.09ms | 1.03ms | 1.25ms | 3.59ms | 1.98ms | 4.90ms |
| update_1to1000 | 62μs | 55μs | 374μs | 155μs | 397μs | 177μs |
| cellx1000 | 11.53ms | 10.35ms | 10.28ms | 22.51ms | 12.07ms | 106.22ms |
| cellx2500 | 42.37ms | 30.69ms | 32.16ms | 74.09ms | 38.14ms | 319.43ms |
| cellx5000 | 97.69ms | 101.58ms | 79.96ms | 175.53ms | 106.54ms | 640.50ms |
| 10x5 - 2 sources - read 20.0% (simple) | 421.85ms | 227.03ms | 225.53ms | 364.92ms | 383.67ms | 2.05s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 241.32ms | 173.39ms | 174.02ms | 251.59ms | 232.75ms | 1.45s |
| 1000x12 - 4 sources - dynamic (large) | 3.18s | 250.70ms | 274.02ms | 369.02ms | 3.04s | 1.75s |
| 1000x5 - 25 sources (wide dense) | 2.72s | 356.29ms | 380.72ms | 546.81ms | 2.40s | 3.44s |
| 5x500 - 3 sources (deep) | 217.75ms | 203.51ms | 205.79ms | 273.68ms | 225.94ms | 1.23s |
| 100x15 - 6 sources - dynamic (very dynamic) | 397.91ms | 224.39ms | 220.19ms | 307.85ms | 381.98ms | 1.70s |

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
