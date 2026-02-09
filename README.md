# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.34s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 9.99s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.31s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.03s |
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
| avoidablePropagation | 213.35ms | 187.34ms | 144.81ms (fail) | 285.15ms | 208.66ms | 2.36s |
| broadPropagation | 460.87ms | 352.52ms | 6.43ms (fail) | 500.68ms | 448.57ms | 4.38s |
| deepPropagation | 174.18ms | 140.34ms | 138.46ms (fail) | 171.12ms | 178.47ms | 1.51s |
| diamond | 289.76ms | 238.19ms | 185.17ms (fail) | 360.12ms | 285.75ms | 2.37s |
| mux | 387.05ms | 362.25ms | 179.31ms (fail) | 422.27ms | 372.43ms | 1.83s |
| repeatedObservers | 46.40ms | 45.07ms | 52.32ms (fail) | 81.27ms | 40.13ms | 236.36ms |
| triangle | 104.97ms | 82.69ms | 76.19ms (fail) | 118.24ms | 100.75ms | 749.17ms |
| unstable | 78.76ms | 61.76ms | 338.85ms (fail) | 96.44ms | 69.34ms | 342.58ms |
| molBench | 495.68ms | 485.70ms | 996μs | 490.92ms | 482.90ms | 588.51ms |
| create_signals | 25.38ms | 28.99ms | 58.65ms | 76.97ms | 5.42ms | 55.77ms |
| comp_0to1 | 11.46ms | 8.15ms | 52.08ms | 26.08ms | 18.05ms | 15.51ms |
| comp_1to1 | 18.41ms | 4.22ms | 54.21ms | 33.80ms | 13.82ms | 40.55ms |
| comp_2to1 | 12.26ms | 2.26ms | 39.88ms | 34.92ms | 17.96ms | 39.47ms |
| comp_4to1 | 1.86ms | 8.28ms | 16.41ms | 4.34ms | 13.20ms | 16.18ms |
| comp_1000to1 | 5μs | 4μs | 41μs | 18μs | 7μs | 15μs |
| comp_1to2 | 21.14ms | 10.68ms | 44.82ms | 32.09ms | 27.71ms | 35.45ms |
| comp_1to4 | 9.42ms | 11.77ms | 45.17ms | 14.81ms | 26.77ms | 18.00ms |
| comp_1to8 | 12.24ms | 4.92ms | 43.82ms | 19.60ms | 8.55ms | 20.64ms |
| comp_1to1000 | 6.29ms | 3.64ms | 38.04ms | 14.57ms | 4.71ms | 15.26ms |
| update_1to1 | 9.42ms | 9.01ms | 6.11ms | 15.52ms | 8.75ms | 25.14ms |
| update_2to1 | 4.80ms | 4.24ms | 3.05ms | 7.74ms | 4.33ms | 11.81ms |
| update_4to1 | 2.32ms | 2.17ms | 1.57ms | 3.87ms | 2.26ms | 7.43ms |
| update_1000to1 | 23μs | 20μs | 16μs | 38μs | 22μs | 67μs |
| update_1to2 | 4.63ms | 3.39ms | 3.10ms | 7.87ms | 4.37ms | 11.94ms |
| update_1to4 | 4.30ms | 1.86ms | 1.58ms | 3.86ms | 2.24ms | 6.87ms |
| update_1to1000 | 43μs | 42μs | 391μs | 147μs | 154μs | 159μs |
| cellx1000 | 9.79ms | 8.51ms | 5.54ms | 11.98ms | 10.19ms | 76.66ms |
| cellx2500 | 31.65ms | 22.39ms | 25.73ms | 42.96ms | 27.51ms | 265.62ms |
| cellx5000 | 65.95ms | 55.28ms | 68.68ms | 79.79ms | 81.30ms | 591.94ms |
| 10x5 - 2 sources - read 20.0% (simple) | 506.71ms | 239.90ms | 236.85ms | 408.25ms | 431.84ms | 1.93s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 283.40ms | 176.54ms | 196.02ms | 249.34ms | 271.34ms | 1.47s |
| 1000x12 - 4 sources - dynamic (large) | 3.81s | 276.25ms | 354.39ms | 466.50ms | 3.62s | 1.84s |
| 1000x5 - 25 sources (wide dense) | 3.50s | 412.07ms | 520.66ms | 617.13ms | 2.51s | 3.42s |
| 5x500 - 3 sources (deep) | 224.90ms | 193.69ms | 203.52ms | 258.33ms | 230.93ms | 1.11s |
| 100x15 - 6 sources - dynamic (very dynamic) | 481.20ms | 264.79ms | 259.93ms | 384.91ms | 450.14ms | 1.65s |

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
