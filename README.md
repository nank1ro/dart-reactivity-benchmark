# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.65s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.32s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.18s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.18s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.75s |
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
| Test Case | state_beacon | alien_signals | mobx | solidart(2.0-dev) | signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 163.40ms (fail) | 183.39ms | 2.33s | 290.02ms | 208.54ms | 197.12ms |
| broadPropagation | 6.02ms (fail) | 342.06ms | 4.39s | 522.88ms | 451.33ms | 462.79ms |
| deepPropagation | 138.24ms (fail) | 121.10ms | 1.58s | 181.42ms | 170.08ms | 176.73ms |
| diamond | 186.65ms (fail) | 231.10ms | 2.47s | 361.49ms | 281.81ms | 279.21ms |
| mux | 194.24ms (fail) | 362.12ms | 1.85s | 447.10ms | 444.91ms | 404.27ms |
| repeatedObservers | 52.49ms (fail) | 45.46ms | 232.84ms | 81.75ms | 45.27ms | 39.70ms |
| triangle | 82.33ms (fail) | 84.15ms | 770.61ms | 123.68ms | 103.42ms | 102.12ms |
| unstable | 342.06ms (fail) | 67.42ms | 348.29ms | 98.95ms | 79.29ms | 71.02ms |
| molBench | 988μs | 487.55ms | 572.51ms | 493.30ms | 486.61ms | 487.74ms |
| create_signals | 59.90ms | 28.73ms | 81.08ms | 56.91ms | 25.28ms | 5.51ms |
| comp_0to1 | 54.23ms | 7.05ms | 16.50ms | 28.04ms | 11.14ms | 17.11ms |
| comp_1to1 | 54.09ms | 4.17ms | 42.08ms | 39.73ms | 17.51ms | 14.56ms |
| comp_2to1 | 35.40ms | 2.38ms | 23.76ms | 43.24ms | 19.45ms | 19.04ms |
| comp_4to1 | 15.92ms | 8.49ms | 17.81ms | 18.29ms | 6.22ms | 9.68ms |
| comp_1000to1 | 40μs | 4μs | 17μs | 17μs | 5μs | 9μs |
| comp_1to2 | 44.31ms | 16.32ms | 35.70ms | 43.87ms | 13.33ms | 27.18ms |
| comp_1to4 | 46.24ms | 8.72ms | 18.59ms | 22.74ms | 12.53ms | 20.36ms |
| comp_1to8 | 42.48ms | 3.77ms | 20.73ms | 21.65ms | 8.48ms | 9.05ms |
| comp_1to1000 | 38.16ms | 3.50ms | 16.31ms | 16.95ms | 4.32ms | 6.69ms |
| update_1to1 | 5.93ms | 10.17ms | 23.16ms | 15.96ms | 8.98ms | 8.59ms |
| update_2to1 | 3.23ms | 2.27ms | 11.33ms | 7.83ms | 4.49ms | 4.22ms |
| update_4to1 | 1.48ms | 2.51ms | 6.26ms | 4.05ms | 2.27ms | 2.12ms |
| update_1000to1 | 16μs | 24μs | 67μs | 40μs | 22μs | 21μs |
| update_1to2 | 2.97ms | 5.18ms | 13.96ms | 8.02ms | 4.46ms | 4.61ms |
| update_1to4 | 1.51ms | 2.52ms | 7.11ms | 4.06ms | 2.27ms | 2.13ms |
| update_1to1000 | 390μs | 28μs | 176μs | 170μs | 41μs | 509μs |
| cellx1000 | 5.42ms | 7.20ms | 72.73ms | 11.99ms | 9.58ms | 9.89ms |
| cellx2500 | 21.14ms | 20.07ms | 260.61ms | 31.50ms | 31.10ms | 26.17ms |
| cellx5000 | 59.26ms | 51.87ms | 586.13ms | 69.67ms | 60.62ms | 63.05ms |
| 10x5 - 2 sources - read 20.0% (simple) | 242.82ms | 227.47ms | 2.03s | 363.56ms | 501.35ms | 442.49ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 201.49ms | 173.95ms | 1.55s | 245.92ms | 283.56ms | 276.28ms |
| 1000x12 - 4 sources - dynamic (large) | 349.13ms | 282.15ms | 1.92s | 454.05ms | 3.76s | 3.63s |
| 1000x5 - 25 sources (wide dense) | 503.61ms | 409.26ms | 3.60s | 582.32ms | 3.42s | 2.69s |
| 5x500 - 3 sources (deep) | 204.78ms | 189.19ms | 1.16s | 252.92ms | 225.44ms | 228.07ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 256.72ms | 260.53ms | 1.68s | 379.07ms | 482.72ms | 448.28ms |

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
