# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.38s |
| 🥉 | preact_signals | 0.25 | 100.0% | 35/35 | 9.95s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.39s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.97s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.45s |

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
| avoidablePropagation | 271.66ms | 202.87ms | 2.34s | 195.12ms | 144.66ms (fail) | 184.00ms |
| broadPropagation | 503.80ms | 513.35ms | 4.43s | 445.33ms | 6.99ms (fail) | 342.71ms |
| deepPropagation | 175.19ms | 168.32ms | 1.52s | 175.04ms | 138.87ms (fail) | 127.16ms |
| diamond | 363.07ms | 279.64ms | 2.40s | 286.58ms | 179.69ms (fail) | 230.42ms |
| mux | 422.36ms | 400.58ms | 1.78s | 375.48ms | 190.25ms (fail) | 402.22ms |
| repeatedObservers | 80.31ms | 45.85ms | 227.53ms | 40.78ms | 52.81ms (fail) | 43.62ms |
| triangle | 121.49ms | 100.52ms | 744.87ms | 98.69ms | 79.15ms (fail) | 86.48ms |
| unstable | 96.34ms | 72.83ms | 342.62ms | 74.21ms | 337.06ms (fail) | 58.74ms |
| molBench | 492.64ms | 495.56ms | 590.50ms | 484.15ms | 946μs | 488.57ms |
| create_signals | 75.81ms | 26.19ms | 54.52ms | 4.80ms | 67.72ms | 29.34ms |
| comp_0to1 | 36.43ms | 11.70ms | 19.78ms | 17.79ms | 56.03ms | 8.53ms |
| comp_1to1 | 50.79ms | 45.59ms | 31.52ms | 14.09ms | 56.48ms | 4.23ms |
| comp_2to1 | 26.79ms | 11.25ms | 9.82ms | 27.28ms | 39.21ms | 2.41ms |
| comp_4to1 | 8.92ms | 2.10ms | 29.07ms | 8.58ms | 16.55ms | 13.23ms |
| comp_1000to1 | 18μs | 5μs | 16μs | 5μs | 57μs | 3μs |
| comp_1to2 | 40.67ms | 19.89ms | 44.06ms | 31.90ms | 46.56ms | 15.93ms |
| comp_1to4 | 24.10ms | 15.45ms | 23.09ms | 32.52ms | 46.31ms | 7.46ms |
| comp_1to8 | 25.39ms | 6.61ms | 26.37ms | 7.19ms | 44.73ms | 4.42ms |
| comp_1to1000 | 14.61ms | 4.26ms | 15.93ms | 6.27ms | 39.99ms | 3.73ms |
| update_1to1 | 16.04ms | 9.76ms | 22.10ms | 9.44ms | 5.74ms | 10.05ms |
| update_2to1 | 7.80ms | 4.95ms | 10.90ms | 4.64ms | 2.96ms | 2.30ms |
| update_4to1 | 3.98ms | 2.48ms | 7.31ms | 2.41ms | 1.49ms | 1.57ms |
| update_1000to1 | 39μs | 24μs | 70μs | 23μs | 15μs | 27μs |
| update_1to2 | 8.05ms | 4.87ms | 13.75ms | 4.69ms | 2.93ms | 4.96ms |
| update_1to4 | 4.01ms | 2.49ms | 5.43ms | 2.33ms | 1.50ms | 1.45ms |
| update_1to1000 | 145μs | 83μs | 167μs | 642μs | 414μs | 51μs |
| cellx1000 | 12.76ms | 10.31ms | 78.60ms | 10.46ms | 5.51ms | 7.41ms |
| cellx2500 | 36.91ms | 37.40ms | 269.83ms | 31.32ms | 23.39ms | 19.92ms |
| cellx5000 | 105.84ms | 85.33ms | 611.03ms | 86.58ms | 61.72ms | 48.30ms |
| 10x5 - 2 sources - read 20.0% (simple) | 352.00ms | 566.76ms | 1.94s | 437.33ms | 259.89ms | 235.30ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 252.29ms | 280.78ms | 1.43s | 277.70ms | 203.29ms | 174.16ms |
| 1000x12 - 4 sources - dynamic (large) | 474.58ms | 3.69s | 1.82s | 3.54s | 350.76ms | 281.00ms |
| 1000x5 - 25 sources (wide dense) | 615.11ms | 3.56s | 3.36s | 2.54s | 517.09ms | 409.83ms |
| 5x500 - 3 sources (deep) | 252.88ms | 222.89ms | 1.10s | 228.69ms | 202.54ms | 191.06ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 407.82ms | 485.65ms | 1.68s | 447.86ms | 262.28ms | 264.49ms |

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
