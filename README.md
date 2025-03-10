# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.27s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 9.97s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.31s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.84s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.42s |

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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 270.68ms | 205.46ms | 2.32s | 187.11ms | 211.55ms | 148.76ms (fail) |
| broadPropagation | 507.80ms | 453.37ms | 4.33s | 360.54ms | 460.60ms | 5.96ms (fail) |
| deepPropagation | 169.88ms | 177.91ms | 1.55s | 126.86ms | 174.54ms | 139.62ms (fail) |
| diamond | 347.42ms | 281.30ms | 2.43s | 241.78ms | 292.13ms | 180.03ms (fail) |
| mux | 437.95ms | 382.80ms | 1.82s | 374.55ms | 409.07ms | 190.42ms (fail) |
| repeatedObservers | 78.15ms | 44.27ms | 239.72ms | 46.36ms | 45.72ms | 53.47ms (fail) |
| triangle | 115.47ms | 100.83ms | 774.26ms | 86.53ms | 103.78ms | 77.03ms (fail) |
| unstable | 95.09ms | 70.32ms | 353.44ms | 61.34ms | 73.51ms | 338.30ms (fail) |
| molBench | 493.48ms | 490.78ms | 579.61ms | 492.15ms | 490.43ms | 1.41ms |
| create_signals | 51.97ms | 4.69ms | 68.29ms | 27.35ms | 25.86ms | 70.59ms |
| comp_0to1 | 25.38ms | 17.59ms | 26.82ms | 8.02ms | 11.60ms | 57.48ms |
| comp_1to1 | 33.49ms | 13.39ms | 36.51ms | 4.27ms | 19.12ms | 54.91ms |
| comp_2to1 | 35.38ms | 22.13ms | 23.05ms | 2.33ms | 17.51ms | 37.16ms |
| comp_4to1 | 21.83ms | 8.80ms | 31.80ms | 7.77ms | 2.01ms | 16.54ms |
| comp_1000to1 | 20μs | 5μs | 15μs | 4μs | 5μs | 41μs |
| comp_1to2 | 31.81ms | 18.04ms | 33.98ms | 27.08ms | 14.41ms | 47.18ms |
| comp_1to4 | 14.65ms | 23.28ms | 22.22ms | 5.72ms | 13.78ms | 43.95ms |
| comp_1to8 | 20.62ms | 6.06ms | 22.31ms | 6.01ms | 6.57ms | 43.57ms |
| comp_1to1000 | 14.14ms | 6.44ms | 15.12ms | 3.25ms | 4.54ms | 39.05ms |
| update_1to1 | 16.27ms | 8.17ms | 22.34ms | 9.64ms | 9.30ms | 5.90ms |
| update_2to1 | 11.43ms | 4.06ms | 10.60ms | 4.98ms | 5.31ms | 2.92ms |
| update_4to1 | 4.11ms | 2.09ms | 6.26ms | 2.75ms | 2.33ms | 1.49ms |
| update_1000to1 | 40μs | 20μs | 65μs | 10μs | 23μs | 15μs |
| update_1to2 | 8.13ms | 4.09ms | 10.60ms | 5.46ms | 4.89ms | 2.96ms |
| update_1to4 | 4.05ms | 2.06ms | 5.23ms | 2.42ms | 2.33ms | 1.49ms |
| update_1to1000 | 152μs | 830μs | 175μs | 47μs | 44μs | 388μs |
| cellx1000 | 12.00ms | 9.65ms | 75.86ms | 7.84ms | 9.50ms | 5.29ms |
| cellx2500 | 32.95ms | 27.08ms | 265.77ms | 20.59ms | 33.34ms | 26.33ms |
| cellx5000 | 124.21ms | 79.54ms | 608.99ms | 52.47ms | 71.71ms | 70.75ms |
| 10x5 - 2 sources - read 20.0% (simple) | 347.67ms | 442.11ms | 2.05s | 235.17ms | 505.43ms | 238.83ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 240.85ms | 276.74ms | 1.56s | 177.47ms | 277.72ms | 199.11ms |
| 1000x12 - 4 sources - dynamic (large) | 466.91ms | 3.52s | 1.95s | 287.88ms | 3.75s | 349.19ms |
| 1000x5 - 25 sources (wide dense) | 596.63ms | 2.59s | 3.68s | 412.00ms | 3.56s | 503.21ms |
| 5x500 - 3 sources (deep) | 253.37ms | 231.56ms | 1.17s | 193.56ms | 226.03ms | 207.54ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 384.08ms | 445.44ms | 1.75s | 265.99ms | 478.88ms | 257.04ms |

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
