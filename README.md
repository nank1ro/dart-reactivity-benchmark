# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.18s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.35s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 9.96s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.16s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.44s |

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
| avoidablePropagation | 229.14ms | 187.35ms | 153.99ms (fail) | 280.37ms | 206.93ms | 2.39s |
| broadPropagation | 461.12ms | 349.40ms | 6.37ms (fail) | 496.52ms | 453.09ms | 4.41s |
| deepPropagation | 181.58ms | 128.12ms | 146.94ms (fail) | 171.31ms | 179.38ms | 1.52s |
| diamond | 297.07ms | 232.43ms | 178.36ms (fail) | 354.22ms | 282.90ms | 2.41s |
| mux | 393.54ms | 366.47ms | 178.79ms (fail) | 419.77ms | 370.37ms | 1.87s |
| repeatedObservers | 47.47ms | 43.67ms | 52.60ms (fail) | 80.92ms | 40.74ms | 230.03ms |
| triangle | 104.09ms | 86.81ms | 75.60ms (fail) | 116.04ms | 101.15ms | 762.97ms |
| unstable | 77.26ms | 62.91ms | 335.52ms (fail) | 95.89ms | 69.83ms | 343.36ms |
| molBench | 495.65ms | 486.13ms | 950μs | 490.02ms | 486.44ms | 590.58ms |
| create_signals | 25.35ms | 28.23ms | 66.77ms | 53.05ms | 5.25ms | 72.02ms |
| comp_0to1 | 11.15ms | 7.94ms | 60.58ms | 24.57ms | 17.77ms | 22.69ms |
| comp_1to1 | 27.19ms | 4.23ms | 60.07ms | 26.27ms | 13.89ms | 24.39ms |
| comp_2to1 | 11.45ms | 2.25ms | 43.32ms | 23.33ms | 20.55ms | 11.18ms |
| comp_4to1 | 4.01ms | 8.44ms | 17.64ms | 16.91ms | 14.43ms | 27.79ms |
| comp_1000to1 | 5μs | 3μs | 40μs | 17μs | 4μs | 21μs |
| comp_1to2 | 16.82ms | 12.61ms | 46.90ms | 38.18ms | 18.57ms | 30.90ms |
| comp_1to4 | 9.64ms | 15.10ms | 43.18ms | 21.30ms | 32.63ms | 24.60ms |
| comp_1to8 | 6.47ms | 4.37ms | 42.47ms | 22.11ms | 6.95ms | 23.64ms |
| comp_1to1000 | 4.16ms | 3.19ms | 38.13ms | 14.47ms | 6.14ms | 15.19ms |
| update_1to1 | 9.29ms | 4.60ms | 6.11ms | 15.53ms | 8.74ms | 24.66ms |
| update_2to1 | 5.29ms | 2.34ms | 3.08ms | 7.78ms | 4.33ms | 13.74ms |
| update_4to1 | 2.32ms | 1.21ms | 1.57ms | 3.88ms | 2.23ms | 7.22ms |
| update_1000to1 | 23μs | 19μs | 16μs | 38μs | 22μs | 81μs |
| update_1to2 | 4.65ms | 2.94ms | 3.06ms | 7.88ms | 4.35ms | 12.13ms |
| update_1to4 | 2.87ms | 1.42ms | 1.60ms | 3.88ms | 2.24ms | 7.03ms |
| update_1to1000 | 42μs | 50μs | 384μs | 143μs | 798μs | 161μs |
| cellx1000 | 9.58ms | 8.30ms | 5.23ms | 11.64ms | 9.58ms | 68.37ms |
| cellx2500 | 30.92ms | 20.03ms | 29.41ms | 30.35ms | 25.33ms | 247.27ms |
| cellx5000 | 60.18ms | 42.34ms | 85.47ms | 63.08ms | 65.68ms | 557.87ms |
| 10x5 - 2 sources - read 20.0% (simple) | 510.17ms | 236.51ms | 230.78ms | 350.09ms | 430.26ms | 1.97s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 276.78ms | 175.64ms | 196.68ms | 252.16ms | 272.22ms | 1.47s |
| 1000x12 - 4 sources - dynamic (large) | 3.80s | 276.92ms | 346.03ms | 455.90ms | 3.65s | 1.81s |
| 1000x5 - 25 sources (wide dense) | 3.54s | 411.14ms | 517.06ms | 591.22ms | 2.49s | 3.41s |
| 5x500 - 3 sources (deep) | 225.21ms | 196.79ms | 205.80ms | 261.06ms | 224.65ms | 1.09s |
| 100x15 - 6 sources - dynamic (very dynamic) | 470.33ms | 261.79ms | 257.40ms | 378.64ms | 449.09ms | 1.70s |

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
