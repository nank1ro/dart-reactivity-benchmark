# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.38s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 10.27s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 11.56s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.56s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.66s |

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
| Test Case | preact_signals | state_beacon | solidart(2.0-dev) | signals | alien_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 201.09ms | 161.94ms (fail) | 259.06ms | 215.43ms | 192.89ms | 2.37s |
| broadPropagation | 459.15ms | 6.61ms (fail) | 495.18ms | 458.12ms | 352.97ms | 4.34s |
| deepPropagation | 178.46ms | 144.27ms (fail) | 165.18ms | 168.10ms | 128.13ms | 1.55s |
| diamond | 281.82ms | 202.69ms (fail) | 351.48ms | 287.30ms | 235.18ms | 2.44s |
| mux | 387.40ms | 192.69ms (fail) | 474.42ms | 412.02ms | 377.94ms | 1.83s |
| repeatedObservers | 40.71ms | 53.47ms (fail) | 81.30ms | 45.99ms | 43.66ms | 230.38ms |
| triangle | 99.16ms | 79.67ms (fail) | 115.34ms | 102.83ms | 84.80ms | 768.90ms |
| unstable | 74.32ms | 339.63ms (fail) | 95.10ms | 76.16ms | 61.34ms | 341.52ms |
| molBench | 489.08ms | 1.03ms | 500.32ms | 484.90ms | 490.95ms | 583.97ms |
| create_signals | 5.19ms | 68.86ms | 102.54ms | 27.12ms | 25.05ms | 68.57ms |
| comp_0to1 | 18.22ms | 60.97ms | 37.13ms | 13.70ms | 8.99ms | 24.71ms |
| comp_1to1 | 11.30ms | 61.06ms | 53.77ms | 28.52ms | 4.21ms | 32.60ms |
| comp_2to1 | 18.72ms | 43.72ms | 47.45ms | 9.48ms | 2.35ms | 41.23ms |
| comp_4to1 | 12.91ms | 19.26ms | 4.28ms | 2.12ms | 7.87ms | 27.71ms |
| comp_1000to1 | 7μs | 45μs | 18μs | 5μs | 3μs | 26μs |
| comp_1to2 | 15.04ms | 52.55ms | 26.73ms | 15.80ms | 16.32ms | 38.23ms |
| comp_1to4 | 27.10ms | 47.67ms | 25.08ms | 8.61ms | 11.94ms | 22.19ms |
| comp_1to8 | 7.80ms | 46.81ms | 25.88ms | 10.41ms | 5.13ms | 23.88ms |
| comp_1to1000 | 5.80ms | 42.36ms | 14.37ms | 4.85ms | 3.63ms | 15.38ms |
| update_1to1 | 8.31ms | 7.49ms | 16.41ms | 11.75ms | 10.05ms | 24.14ms |
| update_2to1 | 7.21ms | 3.95ms | 8.01ms | 4.58ms | 2.72ms | 12.22ms |
| update_4to1 | 2.29ms | 1.89ms | 4.12ms | 2.55ms | 2.46ms | 6.55ms |
| update_1000to1 | 37μs | 16μs | 40μs | 27μs | 26μs | 64μs |
| update_1to2 | 4.10ms | 3.69ms | 8.41ms | 4.53ms | 5.08ms | 11.88ms |
| update_1to4 | 2.12ms | 1.95ms | 4.22ms | 2.58ms | 2.41ms | 5.87ms |
| update_1to1000 | 165μs | 409μs | 150μs | 45μs | 49μs | 170μs |
| cellx1000 | 9.83ms | 5.10ms | 13.31ms | 10.20ms | 7.61ms | 79.87ms |
| cellx2500 | 27.56ms | 27.50ms | 37.50ms | 37.29ms | 20.30ms | 268.84ms |
| cellx5000 | 73.27ms | 74.88ms | 88.59ms | 85.04ms | 44.77ms | 623.25ms |
| 10x5 - 2 sources - read 20.0% (simple) | 444.73ms | 262.65ms | 361.22ms | 511.97ms | 235.50ms | 2.04s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 272.68ms | 215.31ms | 252.72ms | 281.80ms | 184.57ms | 1.50s |
| 1000x12 - 4 sources - dynamic (large) | 3.69s | 371.56ms | 460.59ms | 3.97s | 285.89ms | 1.89s |
| 1000x5 - 25 sources (wide dense) | 2.72s | 557.88ms | 608.39ms | 3.57s | 402.88ms | 3.47s |
| 5x500 - 3 sources (deep) | 233.87ms | 225.04ms | 258.15ms | 223.32ms | 190.46ms | 1.16s |
| 100x15 - 6 sources - dynamic (very dynamic) | 450.46ms | 277.40ms | 385.78ms | 476.70ms | 265.70ms | 1.72s |

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
