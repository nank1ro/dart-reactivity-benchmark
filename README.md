# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.78s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 9.98s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.45s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.65s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.61s |
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
| avoidablePropagation | 221.85ms | 185.92ms | 153.23ms (fail) | 270.40ms | 228.87ms | 2.21s |
| broadPropagation | 501.96ms | 354.79ms | 6.01ms (fail) | 496.47ms | 502.04ms | 4.18s |
| deepPropagation | 186.15ms | 116.38ms | 149.85ms (fail) | 167.02ms | 208.31ms | 1.50s |
| diamond | 293.57ms | 266.03ms | 186.02ms (fail) | 375.23ms | 312.63ms | 2.20s |
| mux | 383.81ms | 368.55ms | 187.25ms (fail) | 422.32ms | 389.70ms | 1.72s |
| repeatedObservers | 47.07ms | 43.81ms | 54.16ms (fail) | 89.11ms | 42.36ms | 223.38ms |
| triangle | 106.50ms | 91.15ms | 80.73ms (fail) | 121.91ms | 110.66ms | 726.99ms |
| unstable | 80.03ms | 60.88ms | 339.90ms (fail) | 108.50ms | 72.85ms | 341.85ms |
| molBench | 548.23ms | 552.52ms | 989μs | 552.90ms | 563.15ms | 640.61ms |
| create_signals | 30.34ms | 27.60ms | 68.47ms | 86.24ms | 5.72ms | 57.42ms |
| comp_0to1 | 13.31ms | 8.72ms | 60.41ms | 26.29ms | 20.11ms | 14.94ms |
| comp_1to1 | 30.18ms | 4.08ms | 61.24ms | 44.06ms | 15.90ms | 41.99ms |
| comp_2to1 | 11.80ms | 2.23ms | 37.96ms | 47.64ms | 22.12ms | 26.77ms |
| comp_4to1 | 4.86ms | 9.88ms | 19.31ms | 15.65ms | 15.03ms | 22.48ms |
| comp_1000to1 | 4μs | 4μs | 40μs | 31μs | 4μs | 15μs |
| comp_1to2 | 21.93ms | 17.86ms | 45.90ms | 36.94ms | 22.66ms | 38.37ms |
| comp_1to4 | 14.06ms | 5.35ms | 44.70ms | 21.51ms | 14.94ms | 17.39ms |
| comp_1to8 | 6.63ms | 4.32ms | 40.52ms | 19.62ms | 7.75ms | 20.48ms |
| comp_1to1000 | 4.15ms | 3.45ms | 35.72ms | 14.14ms | 3.96ms | 14.65ms |
| update_1to1 | 9.49ms | 4.70ms | 6.58ms | 16.36ms | 8.49ms | 22.89ms |
| update_2to1 | 4.70ms | 3.65ms | 3.53ms | 8.14ms | 4.24ms | 11.40ms |
| update_4to1 | 2.40ms | 1.21ms | 1.67ms | 4.08ms | 2.14ms | 6.41ms |
| update_1000to1 | 23μs | 20μs | 17μs | 40μs | 22μs | 57μs |
| update_1to2 | 4.72ms | 2.41ms | 3.22ms | 8.25ms | 4.22ms | 11.32ms |
| update_1to4 | 2.37ms | 1.25ms | 1.65ms | 4.07ms | 2.15ms | 5.71ms |
| update_1to1000 | 41μs | 45μs | 350μs | 140μs | 50μs | 153μs |
| cellx1000 | 10.05ms | 7.19ms | 5.59ms | 11.97ms | 10.05ms | 85.69ms |
| cellx2500 | 40.61ms | 26.61ms | 34.65ms | 33.79ms | 38.61ms | 311.43ms |
| cellx5000 | 109.21ms | 81.98ms | 100.33ms | 117.33ms | 99.79ms | 675.48ms |
| 10x5 - 2 sources - read 20.0% (simple) | 501.39ms | 233.69ms | 241.60ms | 375.75ms | 455.62ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.30ms | 183.12ms | 203.39ms | 268.79ms | 262.70ms | 1.43s |
| 1000x12 - 4 sources - dynamic (large) | 3.92s | 272.75ms | 320.57ms | 440.26ms | 3.29s | 1.81s |
| 1000x5 - 25 sources (wide dense) | 3.56s | 414.91ms | 463.31ms | 638.61ms | 2.58s | 3.44s |
| 5x500 - 3 sources (deep) | 233.84ms | 191.10ms | 203.15ms | 264.72ms | 236.92ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 469.65ms | 235.69ms | 237.11ms | 342.08ms | 431.60ms | 1.65s |

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
