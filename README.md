# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.65s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.26s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.30s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.06s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.34s |
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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 214.24ms | 187.62ms | 146.11ms (fail) | 276.22ms | 207.66ms | 2.37s |
| broadPropagation | 457.08ms | 346.78ms | 6.18ms (fail) | 501.17ms | 448.78ms | 4.40s |
| deepPropagation | 169.22ms | 120.13ms | 142.55ms (fail) | 169.30ms | 175.66ms | 1.53s |
| diamond | 288.79ms | 228.81ms | 208.88ms (fail) | 355.21ms | 285.97ms | 2.39s |
| mux | 389.46ms | 358.25ms | 182.25ms (fail) | 418.63ms | 371.55ms | 1.87s |
| repeatedObservers | 46.04ms | 44.31ms | 52.24ms (fail) | 81.33ms | 40.37ms | 231.47ms |
| triangle | 103.05ms | 84.86ms | 83.12ms (fail) | 117.90ms | 100.27ms | 759.64ms |
| unstable | 78.37ms | 62.02ms | 336.86ms (fail) | 96.67ms | 69.54ms | 342.54ms |
| molBench | 495.14ms | 484.86ms | 946μs | 491.53ms | 487.68ms | 590.15ms |
| create_signals | 28.17ms | 22.69ms | 59.85ms | 61.07ms | 5.32ms | 68.66ms |
| comp_0to1 | 12.09ms | 8.32ms | 55.65ms | 25.95ms | 18.06ms | 28.22ms |
| comp_1to1 | 28.95ms | 4.21ms | 55.78ms | 49.58ms | 11.45ms | 37.66ms |
| comp_2to1 | 9.31ms | 2.27ms | 37.14ms | 16.84ms | 11.94ms | 34.71ms |
| comp_4to1 | 1.91ms | 8.54ms | 16.20ms | 14.89ms | 12.59ms | 24.60ms |
| comp_1000to1 | 6μs | 6μs | 44μs | 18μs | 6μs | 20μs |
| comp_1to2 | 21.54ms | 14.51ms | 48.07ms | 36.65ms | 29.34ms | 29.26ms |
| comp_1to4 | 12.64ms | 8.96ms | 47.55ms | 17.38ms | 28.12ms | 24.18ms |
| comp_1to8 | 7.08ms | 5.26ms | 45.68ms | 23.26ms | 5.89ms | 27.36ms |
| comp_1to1000 | 4.27ms | 3.57ms | 41.20ms | 14.56ms | 5.76ms | 15.63ms |
| update_1to1 | 9.29ms | 4.62ms | 6.09ms | 15.45ms | 9.03ms | 27.75ms |
| update_2to1 | 4.76ms | 2.38ms | 3.05ms | 7.77ms | 4.34ms | 10.16ms |
| update_4to1 | 2.32ms | 1.20ms | 1.56ms | 3.85ms | 2.22ms | 7.03ms |
| update_1000to1 | 23μs | 25μs | 16μs | 39μs | 22μs | 68μs |
| update_1to2 | 4.62ms | 2.24ms | 3.08ms | 7.88ms | 4.35ms | 13.81ms |
| update_1to4 | 2.53ms | 1.20ms | 1.57ms | 3.86ms | 2.24ms | 6.92ms |
| update_1to1000 | 45μs | 49μs | 402μs | 152μs | 934μs | 181μs |
| cellx1000 | 10.84ms | 7.35ms | 5.33ms | 14.37ms | 10.29ms | 71.50ms |
| cellx2500 | 45.67ms | 19.84ms | 27.44ms | 38.77ms | 34.87ms | 251.54ms |
| cellx5000 | 91.89ms | 55.29ms | 67.16ms | 96.80ms | 104.77ms | 582.06ms |
| 10x5 - 2 sources - read 20.0% (simple) | 500.36ms | 236.49ms | 249.78ms | 346.15ms | 432.07ms | 2.03s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 276.63ms | 173.66ms | 206.26ms | 243.22ms | 266.13ms | 1.48s |
| 1000x12 - 4 sources - dynamic (large) | 3.84s | 272.44ms | 343.75ms | 473.11ms | 3.66s | 1.91s |
| 1000x5 - 25 sources (wide dense) | 3.44s | 410.50ms | 503.76ms | 603.01ms | 2.53s | 3.41s |
| 5x500 - 3 sources (deep) | 224.00ms | 191.99ms | 204.62ms | 250.85ms | 230.15ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 477.08ms | 279.22ms | 262.81ms | 382.47ms | 451.54ms | 1.65s |

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
