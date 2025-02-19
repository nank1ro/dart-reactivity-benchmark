# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.67s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 9.94s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.21s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.56s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.01s |
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
| Test Case | alien_signals | mobx | solidart | state_beacon | preact_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 185.92ms | 2.35s | 2.16s | 149.13ms (fail) | 208.57ms | 210.07ms |
| broadPropagation | 354.23ms | 4.22s | 5.28s | 6.17ms (fail) | 463.71ms | 460.07ms |
| deepPropagation | 124.42ms | 1.51s | 1.98s | 143.17ms (fail) | 179.56ms | 177.04ms |
| diamond | 235.04ms | 2.44s | 3.41s | 186.10ms (fail) | 283.71ms | 292.14ms |
| mux | 382.80ms | 1.80s | 2.01s | 192.22ms (fail) | 405.01ms | 412.29ms |
| repeatedObservers | 45.55ms | 235.91ms | 202.72ms | 53.29ms (fail) | 39.22ms | 45.82ms |
| triangle | 86.34ms | 789.89ms | 1.11s | 76.35ms (fail) | 101.35ms | 102.96ms |
| unstable | 60.07ms | 351.99ms | 343.81ms | 337.94ms (fail) | 70.56ms | 71.94ms |
| molBench | 491.98ms | 581.13ms | 1.70s | 1.30ms | 490.75ms | 488.71ms |
| create_signals | 27.51ms | 69.51ms | 48.74ms | 63.23ms | 4.61ms | 25.29ms |
| comp_0to1 | 7.84ms | 24.88ms | 34.03ms | 55.39ms | 17.40ms | 11.97ms |
| comp_1to1 | 4.37ms | 32.01ms | 32.58ms | 52.79ms | 11.01ms | 27.90ms |
| comp_2to1 | 2.21ms | 11.63ms | 32.70ms | 36.80ms | 13.71ms | 13.28ms |
| comp_4to1 | 7.57ms | 30.51ms | 11.57ms | 17.36ms | 14.91ms | 3.03ms |
| comp_1000to1 | 3μs | 15μs | 2.10ms | 41μs | 4μs | 5μs |
| comp_1to2 | 10.42ms | 37.12ms | 25.36ms | 47.38ms | 15.59ms | 19.71ms |
| comp_1to4 | 8.96ms | 23.82ms | 27.29ms | 46.23ms | 22.29ms | 17.30ms |
| comp_1to8 | 5.01ms | 20.53ms | 24.09ms | 43.08ms | 7.78ms | 6.36ms |
| comp_1to1000 | 3.53ms | 14.75ms | 17.46ms | 37.71ms | 6.74ms | 4.59ms |
| update_1to1 | 7.38ms | 21.51ms | 42.11ms | 5.73ms | 8.42ms | 9.26ms |
| update_2to1 | 5.08ms | 10.54ms | 20.62ms | 2.87ms | 4.05ms | 4.58ms |
| update_4to1 | 2.50ms | 5.40ms | 10.17ms | 1.43ms | 2.08ms | 2.41ms |
| update_1000to1 | 25μs | 52μs | 111μs | 15μs | 20μs | 22μs |
| update_1to2 | 3.65ms | 10.99ms | 20.78ms | 2.93ms | 4.06ms | 4.90ms |
| update_1to4 | 1.77ms | 5.25ms | 10.16ms | 1.43ms | 2.06ms | 2.31ms |
| update_1to1000 | 42μs | 166μs | 215μs | 389μs | 962μs | 43μs |
| cellx1000 | 7.87ms | 70.95ms | 159.86ms | 5.05ms | 9.56ms | 9.43ms |
| cellx2500 | 20.74ms | 248.64ms | 454.79ms | 24.75ms | 25.84ms | 32.06ms |
| cellx5000 | 41.25ms | 547.71ms | 1.13s | 69.20ms | 66.80ms | 71.42ms |
| 10x5 - 2 sources - read 20.0% (simple) | 225.05ms | 2.02s | 2.62s (partial) | 259.02ms | 448.29ms | 505.06ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 174.59ms | 1.56s | 2.40s (partial) | 223.08ms | 268.21ms | 278.29ms |
| 1000x12 - 4 sources - dynamic (large) | 279.45ms | 1.94s | 4.14s (partial) | 342.40ms | 3.47s | 3.76s |
| 1000x5 - 25 sources (wide dense) | 403.42ms | 3.71s | 4.86s (partial) | 506.04ms | 2.60s | 3.42s |
| 5x500 - 3 sources (deep) | 187.73ms | 1.15s | 1.95s (partial) | 203.19ms | 233.61ms | 226.81ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 261.21ms | 1.73s | 2.75s (partial) | 260.93ms | 441.25ms | 490.38ms |

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
