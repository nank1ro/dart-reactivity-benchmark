# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.10s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.52s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 10.77s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 27.09s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| avoidablePropagation | 2.30s | 200.46ms | 197.22ms | 214.26ms | 273.46ms | 149.36ms (fail) |
| broadPropagation | 4.35s | 471.94ms | 354.88ms | 455.60ms | 492.51ms | 6.44ms (fail) |
| deepPropagation | 1.54s | 171.52ms | 125.87ms | 176.07ms | 165.12ms | 139.53ms (fail) |
| diamond | 2.35s | 288.76ms | 244.47ms | 284.39ms | 353.52ms | 181.17ms (fail) |
| mux | 1.78s | 400.14ms | 362.51ms | 373.10ms | 422.65ms | 179.63ms (fail) |
| repeatedObservers | 230.66ms | 45.91ms | 45.68ms | 43.26ms | 80.50ms | 55.74ms (fail) |
| triangle | 754.24ms | 102.27ms | 88.06ms | 99.51ms | 115.79ms | 76.04ms (fail) |
| unstable | 345.04ms | 75.29ms | 61.61ms | 71.59ms | 94.96ms | 335.51ms (fail) |
| molBench | 585.15ms | 493.68ms | 480.94ms | 496.37ms | 369.60ms | 1.01ms |
| create_signals | 81.73ms | 26.42ms | 24.84ms | 5.36ms | 55.77ms | 65.38ms |
| comp_0to1 | 21.57ms | 12.30ms | 7.01ms | 18.02ms | 24.80ms | 59.20ms |
| comp_1to1 | 39.93ms | 26.97ms | 4.29ms | 11.85ms | 42.98ms | 62.88ms |
| comp_2to1 | 33.29ms | 12.26ms | 2.39ms | 19.77ms | 17.84ms | 44.98ms |
| comp_4to1 | 17.77ms | 3.50ms | 10.42ms | 1.77ms | 13.79ms | 18.99ms |
| comp_1000to1 | 21μs | 5μs | 4μs | 4μs | 19μs | 44μs |
| comp_1to2 | 33.38ms | 13.30ms | 14.74ms | 16.21ms | 30.76ms | 47.65ms |
| comp_1to4 | 18.32ms | 11.04ms | 9.79ms | 17.22ms | 18.35ms | 49.41ms |
| comp_1to8 | 23.09ms | 6.42ms | 6.18ms | 14.65ms | 24.02ms | 45.43ms |
| comp_1to1000 | 14.89ms | 4.11ms | 3.51ms | 5.65ms | 14.28ms | 39.96ms |
| update_1to1 | 23.30ms | 8.93ms | 4.63ms | 9.25ms | 15.63ms | 7.43ms |
| update_2to1 | 19.55ms | 4.43ms | 2.35ms | 4.77ms | 7.83ms | 2.85ms |
| update_4to1 | 11.08ms | 2.29ms | 1.20ms | 2.35ms | 3.94ms | 1.88ms |
| update_1000to1 | 63μs | 22μs | 11μs | 29μs | 39μs | 15μs |
| update_1to2 | 20.71ms | 4.42ms | 2.41ms | 4.53ms | 7.81ms | 5.32ms |
| update_1to4 | 10.00ms | 2.25ms | 1.25ms | 2.46ms | 3.94ms | 1.44ms |
| update_1to1000 | 327μs | 41μs | 47μs | 67μs | 147μs | 387μs |
| cellx1000 | 71.11ms | 10.03ms | 7.45ms | 10.13ms | 11.98ms | 6.12ms |
| cellx2500 | 272.40ms | 32.77ms | 19.65ms | 29.24ms | 32.18ms | 28.10ms |
| cellx5000 | 627.23ms | 63.88ms | 42.71ms | 73.34ms | 99.84ms | 86.56ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.96s | 508.97ms | 239.53ms | 452.09ms | 344.38ms | 243.33ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.51s | 283.00ms | 179.86ms | 277.10ms | 247.13ms | 200.89ms |
| 1000x12 - 4 sources - dynamic (large) | 1.90s | 3.48s | 280.23ms | 3.84s | 469.94ms | 344.95ms |
| 1000x5 - 25 sources (wide dense) | 3.37s | 3.30s | 413.52ms | 2.80s | 602.43ms | 513.12ms |
| 5x500 - 3 sources (deep) | 1.13s | 226.81ms | 192.73ms | 234.78ms | 256.40ms | 206.38ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.65s | 477.36ms | 267.18ms | 453.29ms | 386.75ms | 256.85ms |

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
