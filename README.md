# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.30s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 9.99s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.31s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.20s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.43s |

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
| avoidablePropagation | 279.06ms | 204.01ms | 2.33s | 184.47ms | 206.68ms | 153.38ms (fail) |
| broadPropagation | 504.48ms | 466.05ms | 4.20s | 352.39ms | 461.92ms | 6.34ms (fail) |
| deepPropagation | 180.45ms | 178.88ms | 1.50s | 125.63ms | 181.44ms | 138.19ms (fail) |
| diamond | 354.90ms | 279.02ms | 2.41s | 239.45ms | 291.87ms | 186.21ms (fail) |
| mux | 444.72ms | 383.42ms | 1.83s | 376.46ms | 411.42ms | 192.82ms (fail) |
| repeatedObservers | 78.60ms | 38.38ms | 221.75ms | 44.91ms | 45.86ms | 52.19ms (fail) |
| triangle | 118.77ms | 100.98ms | 794.64ms | 85.04ms | 102.24ms | 78.12ms (fail) |
| unstable | 94.13ms | 70.58ms | 347.54ms | 60.93ms | 73.41ms | 336.45ms (fail) |
| molBench | 493.65ms | 490.87ms | 578.04ms | 492.42ms | 486.51ms | 1.17ms |
| create_signals | 94.33ms | 4.55ms | 60.63ms | 29.46ms | 26.11ms | 63.19ms |
| comp_0to1 | 36.75ms | 17.51ms | 15.34ms | 10.41ms | 11.55ms | 54.76ms |
| comp_1to1 | 40.44ms | 11.74ms | 45.32ms | 4.09ms | 28.58ms | 52.70ms |
| comp_2to1 | 11.41ms | 17.05ms | 34.00ms | 2.25ms | 12.13ms | 36.47ms |
| comp_4to1 | 9.88ms | 9.74ms | 16.55ms | 8.54ms | 8.36ms | 16.47ms |
| comp_1000to1 | 19μs | 9μs | 21μs | 4μs | 6μs | 42μs |
| comp_1to2 | 35.62ms | 20.21ms | 33.92ms | 15.53ms | 19.48ms | 44.16ms |
| comp_1to4 | 17.97ms | 38.71ms | 17.60ms | 5.50ms | 9.23ms | 44.95ms |
| comp_1to8 | 22.37ms | 8.08ms | 19.47ms | 4.54ms | 8.55ms | 42.54ms |
| comp_1to1000 | 14.99ms | 7.07ms | 15.65ms | 3.51ms | 4.66ms | 37.54ms |
| update_1to1 | 16.11ms | 8.37ms | 22.26ms | 11.38ms | 9.19ms | 5.73ms |
| update_2to1 | 7.91ms | 4.04ms | 11.05ms | 5.01ms | 4.58ms | 2.90ms |
| update_4to1 | 4.02ms | 2.06ms | 6.86ms | 2.78ms | 2.32ms | 1.43ms |
| update_1000to1 | 40μs | 20μs | 67μs | 10μs | 22μs | 15μs |
| update_1to2 | 7.90ms | 4.06ms | 11.31ms | 5.44ms | 4.95ms | 2.93ms |
| update_1to4 | 4.02ms | 2.08ms | 5.64ms | 2.51ms | 2.32ms | 1.43ms |
| update_1to1000 | 149μs | 892μs | 165μs | 51μs | 43μs | 382μs |
| cellx1000 | 11.27ms | 9.52ms | 69.88ms | 7.21ms | 9.62ms | 5.27ms |
| cellx2500 | 30.30ms | 25.48ms | 252.66ms | 19.69ms | 31.71ms | 31.08ms |
| cellx5000 | 71.21ms | 65.12ms | 563.09ms | 46.94ms | 62.99ms | 78.35ms |
| 10x5 - 2 sources - read 20.0% (simple) | 366.37ms | 444.72ms | 1.99s | 230.79ms | 508.81ms | 241.97ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 244.66ms | 271.14ms | 1.56s | 177.41ms | 279.97ms | 201.56ms |
| 1000x12 - 4 sources - dynamic (large) | 460.94ms | 3.52s | 1.85s | 280.76ms | 3.86s | 347.51ms |
| 1000x5 - 25 sources (wide dense) | 597.52ms | 2.60s | 3.51s | 406.91ms | 3.43s | 503.02ms |
| 5x500 - 3 sources (deep) | 261.23ms | 229.66ms | 1.17s | 192.25ms | 231.05ms | 204.55ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 385.52ms | 451.64ms | 1.70s | 262.02ms | 477.38ms | 264.52ms |

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
