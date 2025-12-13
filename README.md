# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.33s |
| 🥈 | signals | 0.29 | 100.0% | 35/35 | 9.17s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 8.58s |
| 4 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 4.94s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.40s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.09s |

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
| avoidablePropagation | 195.09ms | 167.65ms | 135.81ms (fail) | 247.24ms | 183.34ms | 2.24s |
| broadPropagation | 392.46ms | 303.30ms | 5.52ms (fail) | 456.17ms | 384.38ms | 4.10s |
| deepPropagation | 170.76ms | 107.80ms | 151.26ms (fail) | 150.99ms | 173.69ms | 1.46s |
| diamond | 259.50ms | 236.35ms | 176.12ms (fail) | 344.39ms | 254.15ms | 2.23s |
| mux | 330.00ms | 324.04ms | 160.03ms (fail) | 393.68ms | 325.64ms | 1.79s |
| repeatedObservers | 39.06ms | 40.63ms | 47.81ms (fail) | 72.89ms | 32.76ms | 221.58ms |
| triangle | 92.41ms | 80.71ms | 74.86ms (fail) | 112.65ms | 93.63ms | 731.17ms |
| unstable | 64.86ms | 59.08ms | 325.16ms (fail) | 97.73ms | 56.95ms | 320.78ms |
| molBench | 390.68ms | 365.77ms | 752μs | 396.02ms | 364.81ms | 482.15ms |
| create_signals | 24.38ms | 32.45ms | 65.52ms | 78.38ms | 7.02ms | 49.81ms |
| comp_0to1 | 12.51ms | 9.38ms | 52.41ms | 53.82ms | 19.45ms | 43.15ms |
| comp_1to1 | 32.61ms | 6.30ms | 61.11ms | 42.68ms | 19.99ms | 36.37ms |
| comp_2to1 | 8.43ms | 3.36ms | 35.97ms | 33.16ms | 23.63ms | 24.35ms |
| comp_4to1 | 2.80ms | 12.76ms | 17.24ms | 16.31ms | 14.83ms | 15.15ms |
| comp_1000to1 | 7μs | 12μs | 47μs | 19μs | 7μs | 27μs |
| comp_1to2 | 12.45ms | 11.39ms | 45.32ms | 35.45ms | 21.02ms | 41.44ms |
| comp_1to4 | 15.31ms | 13.41ms | 45.98ms | 23.07ms | 38.79ms | 30.46ms |
| comp_1to8 | 7.99ms | 5.81ms | 44.62ms | 24.20ms | 9.49ms | 26.81ms |
| comp_1to1000 | 4.58ms | 4.65ms | 39.20ms | 15.05ms | 6.30ms | 16.60ms |
| update_1to1 | 8.98ms | 3.87ms | 4.70ms | 14.53ms | 8.68ms | 20.10ms |
| update_2to1 | 4.54ms | 1.86ms | 2.51ms | 7.27ms | 3.71ms | 9.72ms |
| update_4to1 | 2.31ms | 1.03ms | 1.23ms | 3.62ms | 2.04ms | 5.38ms |
| update_1000to1 | 23μs | 10μs | 12μs | 35μs | 18μs | 50μs |
| update_1to2 | 4.39ms | 2.15ms | 2.43ms | 7.44ms | 4.30ms | 9.60ms |
| update_1to4 | 2.21ms | 1.06ms | 1.21ms | 3.60ms | 2.20ms | 5.08ms |
| update_1to1000 | 66μs | 47μs | 380μs | 156μs | 154μs | 172μs |
| cellx1000 | 9.68ms | 8.42ms | 10.02ms | 18.81ms | 9.87ms | 92.77ms |
| cellx2500 | 37.43ms | 29.36ms | 34.47ms | 56.01ms | 29.11ms | 268.76ms |
| cellx5000 | 76.33ms | 65.91ms | 75.53ms | 129.51ms | 89.50ms | 589.94ms |
| 10x5 - 2 sources - read 20.0% (simple) | 418.16ms | 226.00ms | 225.32ms | 358.25ms | 389.62ms | 2.05s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 236.04ms | 175.71ms | 173.81ms | 251.94ms | 231.03ms | 1.49s |
| 1000x12 - 4 sources - dynamic (large) | 3.12s | 250.49ms | 271.42ms | 371.09ms | 2.95s | 1.75s |
| 1000x5 - 25 sources (wide dense) | 2.58s | 355.78ms | 380.07ms | 540.12ms | 2.24s | 3.42s |
| 5x500 - 3 sources (deep) | 213.59ms | 200.28ms | 201.64ms | 272.60ms | 220.58ms | 1.17s |
| 100x15 - 6 sources - dynamic (very dynamic) | 391.75ms | 224.71ms | 220.01ms | 306.68ms | 381.15ms | 1.67s |

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
