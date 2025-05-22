# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.68s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.19s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.34s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.32s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.92s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.50s |

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
| Test Case | state_beacon | alien_signals | mobx | solidart(2.0-dev) | signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 173.44ms (fail) | 195.89ms | 2.34s | 282.44ms | 211.42ms | 197.10ms |
| broadPropagation | 5.88ms (fail) | 348.99ms | 4.48s | 503.54ms | 458.39ms | 506.83ms |
| deepPropagation | 141.15ms (fail) | 118.05ms | 1.56s | 170.33ms | 177.77ms | 179.57ms |
| diamond | 201.72ms (fail) | 229.20ms | 2.47s | 349.84ms | 279.73ms | 302.06ms |
| mux | 194.05ms (fail) | 367.72ms | 1.80s | 441.49ms | 447.70ms | 405.12ms |
| repeatedObservers | 52.28ms (fail) | 45.41ms | 235.45ms | 81.82ms | 44.68ms | 41.32ms |
| triangle | 87.16ms (fail) | 85.73ms | 762.07ms | 118.56ms | 100.89ms | 102.06ms |
| unstable | 334.90ms (fail) | 67.47ms | 354.23ms | 98.46ms | 79.16ms | 72.95ms |
| molBench | 891μs | 484.55ms | 571.58ms | 494.69ms | 486.43ms | 488.82ms |
| create_signals | 62.62ms | 27.80ms | 73.35ms | 99.70ms | 24.89ms | 5.38ms |
| comp_0to1 | 58.54ms | 7.76ms | 25.20ms | 31.67ms | 10.88ms | 17.17ms |
| comp_1to1 | 61.20ms | 4.32ms | 18.24ms | 50.39ms | 27.14ms | 14.00ms |
| comp_2to1 | 41.22ms | 2.30ms | 11.55ms | 25.54ms | 8.21ms | 18.06ms |
| comp_4to1 | 17.75ms | 8.29ms | 22.97ms | 14.42ms | 1.93ms | 8.17ms |
| comp_1000to1 | 41μs | 4μs | 18μs | 20μs | 5μs | 5μs |
| comp_1to2 | 46.15ms | 19.29ms | 44.91ms | 41.45ms | 13.08ms | 30.24ms |
| comp_1to4 | 48.08ms | 6.36ms | 23.34ms | 23.42ms | 10.65ms | 30.30ms |
| comp_1to8 | 43.80ms | 8.27ms | 25.15ms | 23.34ms | 6.75ms | 9.53ms |
| comp_1to1000 | 39.00ms | 3.52ms | 16.25ms | 17.11ms | 4.23ms | 6.22ms |
| update_1to1 | 5.64ms | 8.99ms | 25.52ms | 16.01ms | 9.04ms | 8.60ms |
| update_2to1 | 3.15ms | 2.31ms | 13.49ms | 7.80ms | 4.52ms | 4.43ms |
| update_4to1 | 1.47ms | 2.55ms | 6.90ms | 4.00ms | 2.23ms | 2.19ms |
| update_1000to1 | 14μs | 24μs | 69μs | 40μs | 22μs | 21μs |
| update_1to2 | 2.87ms | 5.03ms | 12.67ms | 8.11ms | 4.47ms | 4.59ms |
| update_1to4 | 1.47ms | 2.48ms | 7.08ms | 4.00ms | 2.24ms | 2.16ms |
| update_1to1000 | 387μs | 47μs | 173μs | 170μs | 64μs | 138μs |
| cellx1000 | 5.34ms | 8.13ms | 72.13ms | 12.44ms | 9.54ms | 10.89ms |
| cellx2500 | 22.17ms | 18.67ms | 254.48ms | 38.82ms | 30.63ms | 26.31ms |
| cellx5000 | 55.95ms | 42.74ms | 575.75ms | 88.13ms | 56.08ms | 67.93ms |
| 10x5 - 2 sources - read 20.0% (simple) | 269.57ms | 235.24ms | 2.03s | 363.96ms | 509.89ms | 447.29ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 221.80ms | 178.12ms | 1.49s | 241.99ms | 278.79ms | 267.16ms |
| 1000x12 - 4 sources - dynamic (large) | 340.00ms | 279.48ms | 2.00s | 458.62ms | 3.74s | 3.67s |
| 1000x5 - 25 sources (wide dense) | 497.51ms | 410.57ms | 3.66s | 591.74ms | 3.44s | 2.70s |
| 5x500 - 3 sources (deep) | 203.22ms | 193.62ms | 1.20s | 254.38ms | 225.95ms | 226.35ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 260.95ms | 259.01ms | 1.72s | 377.16ms | 481.80ms | 453.46ms |

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
