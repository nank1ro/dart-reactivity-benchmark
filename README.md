# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.68s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.17s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.37s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.70s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.80s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.47s |

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
| avoidablePropagation | 174.07ms (fail) | 2.34s | 276.25ms | 200.92ms | 207.46ms | 183.73ms |
| broadPropagation | 6.35ms (fail) | 4.39s | 511.37ms | 445.86ms | 450.73ms | 344.89ms |
| deepPropagation | 148.24ms (fail) | 1.57s | 169.14ms | 174.86ms | 177.87ms | 125.13ms |
| diamond | 181.79ms (fail) | 2.46s | 361.54ms | 279.66ms | 286.00ms | 228.89ms |
| mux | 197.10ms (fail) | 1.84s | 441.65ms | 403.44ms | 443.63ms | 365.16ms |
| repeatedObservers | 52.23ms (fail) | 234.95ms | 81.46ms | 39.33ms | 44.38ms | 45.39ms |
| triangle | 77.06ms (fail) | 773.27ms | 118.40ms | 97.84ms | 99.56ms | 84.66ms |
| unstable | 338.04ms (fail) | 354.80ms | 97.25ms | 70.37ms | 79.09ms | 66.86ms |
| molBench | 950μs | 574.17ms | 493.85ms | 489.86ms | 486.51ms | 485.56ms |
| create_signals | 65.32ms | 70.82ms | 89.81ms | 5.30ms | 26.32ms | 27.61ms |
| comp_0to1 | 56.27ms | 16.25ms | 42.49ms | 21.28ms | 11.89ms | 7.03ms |
| comp_1to1 | 62.62ms | 46.18ms | 29.86ms | 12.47ms | 29.16ms | 4.19ms |
| comp_2to1 | 43.40ms | 24.15ms | 38.00ms | 9.21ms | 17.84ms | 2.33ms |
| comp_4to1 | 16.40ms | 31.88ms | 19.36ms | 7.11ms | 1.99ms | 10.11ms |
| comp_1000to1 | 41μs | 16μs | 18μs | 4μs | 5μs | 4μs |
| comp_1to2 | 45.28ms | 36.12ms | 37.82ms | 18.79ms | 22.85ms | 12.61ms |
| comp_1to4 | 43.52ms | 18.36ms | 22.93ms | 29.20ms | 16.08ms | 13.54ms |
| comp_1to8 | 42.18ms | 20.94ms | 24.84ms | 6.82ms | 6.96ms | 4.15ms |
| comp_1to1000 | 38.17ms | 15.73ms | 17.17ms | 4.79ms | 4.34ms | 3.21ms |
| update_1to1 | 5.65ms | 23.95ms | 16.08ms | 8.64ms | 8.96ms | 10.41ms |
| update_2to1 | 3.23ms | 11.04ms | 7.79ms | 4.24ms | 4.49ms | 2.29ms |
| update_4to1 | 1.46ms | 6.95ms | 4.71ms | 2.17ms | 2.26ms | 2.54ms |
| update_1000to1 | 26μs | 70μs | 40μs | 21μs | 22μs | 24μs |
| update_1to2 | 2.84ms | 11.29ms | 8.00ms | 4.63ms | 4.47ms | 5.28ms |
| update_1to4 | 1.46ms | 6.29ms | 4.00ms | 2.19ms | 2.24ms | 2.64ms |
| update_1to1000 | 382μs | 172μs | 170μs | 138μs | 42μs | 47μs |
| cellx1000 | 5.47ms | 80.86ms | 12.43ms | 9.98ms | 9.86ms | 7.05ms |
| cellx2500 | 28.21ms | 271.75ms | 37.98ms | 30.23ms | 37.02ms | 19.86ms |
| cellx5000 | 73.32ms | 594.51ms | 106.17ms | 84.70ms | 81.82ms | 48.98ms |
| 10x5 - 2 sources - read 20.0% (simple) | 240.73ms | 2.02s | 369.96ms | 439.19ms | 515.20ms | 230.91ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 201.91ms | 1.56s | 245.68ms | 269.21ms | 294.76ms | 187.77ms |
| 1000x12 - 4 sources - dynamic (large) | 344.72ms | 1.96s | 470.83ms | 3.64s | 4.05s | 282.21ms |
| 1000x5 - 25 sources (wide dense) | 511.66ms | 3.49s | 578.03ms | 2.69s | 3.55s | 412.62ms |
| 5x500 - 3 sources (deep) | 205.71ms | 1.20s | 259.05ms | 225.78ms | 229.91ms | 187.34ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 256.08ms | 1.74s | 379.97ms | 442.94ms | 487.83ms | 264.30ms |

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
