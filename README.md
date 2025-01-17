# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 1.98s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 5.16s |
| 🥉 | signals | 0.24 | 100.0% | 35/35 | 6.84s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 13.77s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 19.49s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 1.81s |

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
| Test Case | preact_signals | mobx | alien_signals | solidart | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 102.55ms | 1.18s | 89.21ms | 1.09s | 102.18ms | 88.93ms (fail) |
| broadPropagation | 212.66ms | 2.12s | 165.82ms | 2.52s | 208.17ms | 3.14ms (fail) |
| deepPropagation | 94.05ms | 773.88ms | 53.33ms | 935.88ms | 92.29ms | 91.15ms (fail) |
| diamond | 147.34ms | 1.17s | 110.60ms | 1.62s | 146.45ms | 88.16ms (fail) |
| mux | 189.88ms | 898.11ms | 174.90ms | 977.48ms | 189.59ms | 99.22ms (fail) |
| repeatedObservers | 20.27ms | 113.82ms | 20.89ms | 101.49ms | 24.04ms | 25.04ms (fail) |
| triangle | 56.60ms | 389.83ms | 46.49ms | 541.24ms | 54.24ms | 41.57ms (fail) |
| unstable | 35.48ms | 161.27ms | 32.08ms | 162.06ms | 40.75ms | 187.03ms (fail) |
| molBench | 276.00ms | 330.45ms | 275.09ms | 992.28ms | 275.07ms | 415μs |
| create_signals | 2.19ms | 28.03ms | 7.70ms | 25.61ms | 19.82ms | 27.75ms |
| comp_0to1 | 7.54ms | 18.30ms | 2.27ms | 13.72ms | 7.95ms | 23.41ms |
| comp_1to1 | 6.53ms | 18.32ms | 3.97ms | 24.25ms | 14.04ms | 24.06ms |
| comp_2to1 | 10.46ms | 9.99ms | 4.29ms | 10.15ms | 3.88ms | 16.93ms |
| comp_4to1 | 6.93ms | 10.24ms | 5.49ms | 7.28ms | 1.41ms | 8.21ms |
| comp_1000to1 | 2μs | 8μs | 1μs | 1.84ms | 2μs | 18μs |
| comp_1to2 | 7.10ms | 17.86ms | 5.53ms | 12.00ms | 7.65ms | 21.44ms |
| comp_1to4 | 9.47ms | 9.25ms | 3.23ms | 14.98ms | 6.52ms | 19.71ms |
| comp_1to8 | 2.58ms | 10.85ms | 1.91ms | 12.45ms | 3.27ms | 20.40ms |
| comp_1to1000 | 1.75ms | 7.44ms | 1.65ms | 9.83ms | 1.92ms | 18.46ms |
| update_1to1 | 4.00ms | 9.13ms | 1.98ms | 18.59ms | 4.32ms | 2.78ms |
| update_2to1 | 2.02ms | 4.65ms | 1.02ms | 9.36ms | 2.03ms | 1.29ms |
| update_4to1 | 1.01ms | 2.41ms | 548μs | 4.69ms | 1.10ms | 655μs |
| update_1000to1 | 11μs | 22μs | 5μs | 53μs | 10μs | 6μs |
| update_1to2 | 2.02ms | 4.74ms | 1.01ms | 9.26ms | 2.03ms | 1.35ms |
| update_1to4 | 1.05ms | 2.47ms | 525μs | 4.67ms | 1.03ms | 701μs |
| update_1to1000 | 20μs | 88μs | 20μs | 100μs | 20μs | 188μs |
| cellx1000 | 4.57ms | 35.98ms | 3.51ms | 74.75ms | 4.31ms | 3.10ms |
| cellx2500 | 12.48ms | 114.70ms | 9.15ms | 220.48ms | 13.47ms | 10.64ms |
| cellx5000 | 33.98ms | 255.68ms | 23.65ms | 478.97ms | 34.13ms | 32.97ms |
| 10x5 - 2 sources - read 20.0% (simple) | 229.79ms | 1.04s | 146.41ms | 1.29s (partial) | 246.66ms | 142.14ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 120.47ms | 808.25ms | 99.46ms | 1.23s (partial) | 124.78ms | 105.36ms |
| 1000x12 - 4 sources - dynamic (large) | 1.84s | 884.31ms | 165.49ms | 2.08s (partial) | 2.58s | 187.58ms |
| 1000x5 - 25 sources (wide dense) | 1.39s | 1.87s | 249.21ms | 2.61s (partial) | 2.26s | 251.94ms |
| 5x500 - 3 sources (deep) | 114.06ms | 597.06ms | 115.30ms | 987.62ms (partial) | 106.46ms | 122.39ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 216.87ms | 876.11ms | 153.53ms | 1.40s (partial) | 254.00ms | 141.57ms |

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
