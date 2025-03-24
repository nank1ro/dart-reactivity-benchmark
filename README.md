# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.33s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.13s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 9.97s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.48s |
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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 274.28ms | 205.36ms | 2.37s | 185.57ms | 210.32ms | 154.78ms (fail) |
| broadPropagation | 510.01ms | 453.13ms | 4.26s | 360.20ms | 447.61ms | 5.96ms (fail) |
| deepPropagation | 170.14ms | 177.52ms | 1.54s | 127.82ms | 179.19ms | 137.71ms (fail) |
| diamond | 366.28ms | 292.21ms | 2.47s | 236.98ms | 286.88ms | 186.93ms (fail) |
| mux | 436.71ms | 385.95ms | 1.80s | 372.87ms | 409.70ms | 189.06ms (fail) |
| repeatedObservers | 78.33ms | 38.78ms | 235.94ms | 44.96ms | 46.98ms | 52.36ms (fail) |
| triangle | 117.45ms | 100.53ms | 783.98ms | 86.27ms | 102.63ms | 80.39ms (fail) |
| unstable | 95.52ms | 70.63ms | 350.75ms | 61.21ms | 75.92ms | 336.64ms (fail) |
| molBench | 493.17ms | 491.89ms | 581.54ms | 491.35ms | 487.53ms | 1.09ms |
| create_signals | 51.63ms | 4.61ms | 79.57ms | 26.35ms | 25.03ms | 63.74ms |
| comp_0to1 | 32.27ms | 17.91ms | 21.55ms | 7.93ms | 11.59ms | 56.96ms |
| comp_1to1 | 48.30ms | 14.23ms | 30.27ms | 4.17ms | 27.73ms | 58.14ms |
| comp_2to1 | 10.08ms | 10.23ms | 19.94ms | 2.24ms | 16.42ms | 37.69ms |
| comp_4to1 | 17.99ms | 11.34ms | 18.60ms | 10.39ms | 1.98ms | 17.23ms |
| comp_1000to1 | 41μs | 5μs | 24μs | 4μs | 5μs | 45μs |
| comp_1to2 | 50.86ms | 26.59ms | 47.35ms | 19.00ms | 20.60ms | 49.05ms |
| comp_1to4 | 18.32ms | 24.14ms | 23.32ms | 9.26ms | 7.50ms | 51.35ms |
| comp_1to8 | 24.24ms | 5.97ms | 24.76ms | 6.27ms | 6.79ms | 48.19ms |
| comp_1to1000 | 14.41ms | 6.36ms | 15.36ms | 3.46ms | 4.44ms | 43.01ms |
| update_1to1 | 16.11ms | 8.24ms | 23.83ms | 9.79ms | 9.19ms | 5.73ms |
| update_2to1 | 8.59ms | 4.05ms | 11.19ms | 4.91ms | 4.59ms | 2.90ms |
| update_4to1 | 4.50ms | 2.10ms | 6.66ms | 2.80ms | 2.33ms | 1.49ms |
| update_1000to1 | 40μs | 20μs | 56μs | 10μs | 23μs | 15μs |
| update_1to2 | 7.95ms | 4.07ms | 11.79ms | 5.61ms | 4.90ms | 2.94ms |
| update_1to4 | 4.04ms | 2.08ms | 6.18ms | 2.49ms | 2.32ms | 1.47ms |
| update_1to1000 | 149μs | 861μs | 162μs | 34μs | 44μs | 422μs |
| cellx1000 | 11.81ms | 9.68ms | 75.25ms | 7.43ms | 9.57ms | 5.10ms |
| cellx2500 | 33.78ms | 25.72ms | 243.13ms | 20.30ms | 32.22ms | 22.61ms |
| cellx5000 | 69.68ms | 76.79ms | 566.92ms | 49.38ms | 64.75ms | 77.34ms |
| 10x5 - 2 sources - read 20.0% (simple) | 389.96ms | 443.11ms | 1.99s | 231.76ms | 504.63ms | 244.41ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 253.21ms | 291.43ms | 1.54s | 178.24ms | 277.39ms | 204.69ms |
| 1000x12 - 4 sources - dynamic (large) | 468.87ms | 3.49s | 1.91s | 278.92ms | 3.76s | 341.42ms |
| 1000x5 - 25 sources (wide dense) | 600.18ms | 2.58s | 3.57s | 412.75ms | 3.37s | 499.61ms |
| 5x500 - 3 sources (deep) | 263.67ms | 231.22ms | 1.13s | 189.12ms | 230.44ms | 207.32ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 384.73ms | 457.52ms | 1.72s | 263.68ms | 486.31ms | 261.20ms |

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
