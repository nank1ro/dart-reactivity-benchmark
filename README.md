# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.26s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 9.98s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.13s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 27.06s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.40s |

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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 210.37ms | 188.92ms | 143.66ms (fail) | 279.91ms | 203.60ms | 2.36s |
| broadPropagation | 469.79ms | 353.37ms | 5.87ms (fail) | 504.61ms | 462.14ms | 4.37s |
| deepPropagation | 181.25ms | 128.27ms | 136.76ms (fail) | 171.12ms | 180.68ms | 1.49s |
| diamond | 291.35ms | 233.46ms | 193.62ms (fail) | 351.63ms | 285.19ms | 2.39s |
| mux | 398.73ms | 357.50ms | 180.74ms (fail) | 416.81ms | 373.96ms | 1.82s |
| repeatedObservers | 46.37ms | 44.28ms | 52.52ms (fail) | 80.69ms | 40.26ms | 230.87ms |
| triangle | 104.33ms | 86.17ms | 82.16ms (fail) | 116.09ms | 100.42ms | 745.95ms |
| unstable | 76.23ms | 62.13ms | 335.98ms (fail) | 95.84ms | 69.75ms | 341.14ms |
| molBench | 495.79ms | 484.77ms | 1.01ms | 491.02ms | 483.34ms | 589.82ms |
| create_signals | 28.85ms | 29.50ms | 64.29ms | 98.57ms | 5.33ms | 87.63ms |
| comp_0to1 | 11.30ms | 7.14ms | 56.26ms | 30.37ms | 17.87ms | 22.93ms |
| comp_1to1 | 26.84ms | 4.41ms | 57.32ms | 27.58ms | 13.24ms | 40.56ms |
| comp_2to1 | 9.38ms | 2.31ms | 37.99ms | 24.64ms | 17.14ms | 33.10ms |
| comp_4to1 | 2.20ms | 8.52ms | 16.60ms | 5.13ms | 11.44ms | 23.13ms |
| comp_1000to1 | 5μs | 4μs | 44μs | 15μs | 4μs | 28μs |
| comp_1to2 | 21.50ms | 11.24ms | 43.32ms | 34.48ms | 30.26ms | 36.63ms |
| comp_1to4 | 10.19ms | 15.42ms | 43.58ms | 20.36ms | 20.99ms | 21.98ms |
| comp_1to8 | 6.32ms | 4.66ms | 41.95ms | 22.54ms | 11.11ms | 23.80ms |
| comp_1to1000 | 4.21ms | 3.27ms | 37.63ms | 14.61ms | 6.80ms | 15.21ms |
| update_1to1 | 9.39ms | 4.67ms | 6.10ms | 15.51ms | 8.76ms | 29.08ms |
| update_2to1 | 4.71ms | 2.34ms | 3.07ms | 7.77ms | 4.45ms | 14.80ms |
| update_4to1 | 2.32ms | 1.19ms | 1.60ms | 3.88ms | 2.24ms | 7.74ms |
| update_1000to1 | 23μs | 11μs | 16μs | 39μs | 21μs | 70μs |
| update_1to2 | 4.63ms | 2.27ms | 3.13ms | 7.90ms | 4.36ms | 14.43ms |
| update_1to4 | 2.55ms | 1.19ms | 1.56ms | 3.89ms | 2.22ms | 7.39ms |
| update_1to1000 | 42μs | 50μs | 382μs | 146μs | 41μs | 160μs |
| cellx1000 | 9.51ms | 7.36ms | 6.10ms | 13.83ms | 9.56ms | 74.72ms |
| cellx2500 | 31.17ms | 19.79ms | 22.33ms | 34.08ms | 25.17ms | 259.85ms |
| cellx5000 | 60.97ms | 41.47ms | 74.68ms | 83.00ms | 64.41ms | 586.23ms |
| 10x5 - 2 sources - read 20.0% (simple) | 502.67ms | 236.87ms | 238.66ms | 347.96ms | 434.99ms | 1.94s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 275.68ms | 177.71ms | 197.15ms | 245.50ms | 278.20ms | 1.46s |
| 1000x12 - 4 sources - dynamic (large) | 3.58s | 278.61ms | 339.65ms | 464.36ms | 3.63s | 1.86s |
| 1000x5 - 25 sources (wide dense) | 3.55s | 407.88ms | 509.06ms | 599.09ms | 2.50s | 3.38s |
| 5x500 - 3 sources (deep) | 225.38ms | 194.49ms | 207.89ms | 260.26ms | 223.98ms | 1.11s |
| 100x15 - 6 sources - dynamic (very dynamic) | 475.90ms | 264.97ms | 255.47ms | 385.00ms | 453.86ms | 1.68s |

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
