# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.66s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.28s |
| 🥉 | preact_signals | 0.25 | 100.0% | 35/35 | 10.22s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.65s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 27.74s |
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
| Test Case | state_beacon | mobx | solidart(2.0-dev) | preact_signals | signals | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 164.00ms (fail) | 2.37s | 283.82ms | 196.53ms | 208.05ms | 189.74ms |
| broadPropagation | 5.83ms (fail) | 4.49s | 502.27ms | 448.65ms | 456.67ms | 344.92ms |
| deepPropagation | 138.31ms (fail) | 1.56s | 169.30ms | 181.66ms | 175.72ms | 123.94ms |
| diamond | 180.30ms (fail) | 2.49s | 350.69ms | 284.99ms | 279.13ms | 232.46ms |
| mux | 189.45ms (fail) | 1.85s | 437.41ms | 402.97ms | 446.22ms | 366.39ms |
| repeatedObservers | 52.78ms (fail) | 236.38ms | 81.34ms | 40.39ms | 44.53ms | 45.78ms |
| triangle | 76.53ms (fail) | 764.96ms | 116.63ms | 99.47ms | 99.19ms | 84.61ms |
| unstable | 341.98ms (fail) | 353.30ms | 98.46ms | 69.94ms | 79.10ms | 67.34ms |
| molBench | 917μs | 578.84ms | 493.88ms | 486.07ms | 486.17ms | 487.39ms |
| create_signals | 63.20ms | 72.99ms | 59.63ms | 5.19ms | 24.61ms | 24.99ms |
| comp_0to1 | 61.30ms | 25.93ms | 28.01ms | 17.39ms | 10.84ms | 7.78ms |
| comp_1to1 | 61.66ms | 29.04ms | 45.87ms | 14.10ms | 36.11ms | 4.18ms |
| comp_2to1 | 39.04ms | 23.53ms | 37.63ms | 21.36ms | 9.53ms | 2.31ms |
| comp_4to1 | 18.10ms | 34.50ms | 5.23ms | 8.60ms | 2.21ms | 7.62ms |
| comp_1000to1 | 42μs | 37μs | 17μs | 5μs | 5μs | 3μs |
| comp_1to2 | 47.74ms | 36.03ms | 30.94ms | 15.60ms | 13.88ms | 10.23ms |
| comp_1to4 | 46.30ms | 24.35ms | 22.32ms | 24.54ms | 15.33ms | 11.75ms |
| comp_1to8 | 43.11ms | 26.91ms | 24.85ms | 5.87ms | 10.67ms | 4.81ms |
| comp_1to1000 | 38.26ms | 16.36ms | 16.84ms | 5.82ms | 6.54ms | 3.46ms |
| update_1to1 | 5.63ms | 25.44ms | 16.08ms | 8.68ms | 8.96ms | 10.35ms |
| update_2to1 | 3.11ms | 13.06ms | 7.85ms | 4.27ms | 4.48ms | 2.28ms |
| update_4to1 | 1.46ms | 6.73ms | 4.01ms | 2.17ms | 2.25ms | 2.59ms |
| update_1000to1 | 14μs | 63μs | 40μs | 21μs | 22μs | 29μs |
| update_1to2 | 2.87ms | 12.16ms | 8.06ms | 4.61ms | 4.48ms | 5.05ms |
| update_1to4 | 1.46ms | 6.24ms | 4.03ms | 2.15ms | 2.25ms | 2.62ms |
| update_1to1000 | 373μs | 172μs | 171μs | 779μs | 41μs | 47μs |
| cellx1000 | 5.24ms | 81.59ms | 12.75ms | 9.64ms | 9.45ms | 7.01ms |
| cellx2500 | 23.89ms | 277.41ms | 33.30ms | 25.59ms | 30.84ms | 19.37ms |
| cellx5000 | 72.68ms | 556.59ms | 71.00ms | 67.42ms | 60.06ms | 40.35ms |
| 10x5 - 2 sources - read 20.0% (simple) | 242.21ms | 2.02s | 377.16ms | 437.36ms | 513.52ms | 232.24ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 200.33ms | 1.52s | 246.14ms | 266.53ms | 281.47ms | 177.92ms |
| 1000x12 - 4 sources - dynamic (large) | 330.11ms | 1.89s | 462.29ms | 3.69s | 4.01s | 278.76ms |
| 1000x5 - 25 sources (wide dense) | 505.98ms | 3.53s | 596.76ms | 2.69s | 3.61s | 407.70ms |
| 5x500 - 3 sources (deep) | 202.26ms | 1.14s | 259.78ms | 228.93ms | 224.80ms | 192.10ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 260.04ms | 1.69s | 379.78ms | 450.28ms | 487.00ms | 264.23ms |

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
