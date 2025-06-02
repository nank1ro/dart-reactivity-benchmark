# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.66s |
| 🥈 | preact_signals | 0.26 | 100.0% | 35/35 | 10.24s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.33s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.33s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.56s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.41s |

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
| Test Case | state_beacon | alien_signals | mobx | solidart(2.0-dev) | signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 163.25ms (fail) | 182.59ms | 2.32s | 279.93ms | 213.15ms | 202.21ms |
| broadPropagation | 5.86ms (fail) | 342.48ms | 4.43s | 514.83ms | 455.49ms | 495.60ms |
| deepPropagation | 139.71ms (fail) | 124.25ms | 1.57s | 176.38ms | 173.72ms | 175.59ms |
| diamond | 187.53ms (fail) | 234.19ms | 2.46s | 366.25ms | 283.74ms | 301.14ms |
| mux | 192.12ms (fail) | 364.43ms | 1.79s | 447.14ms | 460.44ms | 404.27ms |
| repeatedObservers | 55.33ms (fail) | 45.58ms | 230.03ms | 81.24ms | 45.44ms | 41.53ms |
| triangle | 76.72ms (fail) | 85.14ms | 778.44ms | 119.72ms | 100.76ms | 105.42ms |
| unstable | 336.05ms (fail) | 68.59ms | 350.50ms | 99.60ms | 79.10ms | 74.30ms |
| molBench | 907μs | 482.60ms | 571.02ms | 493.79ms | 487.15ms | 490.60ms |
| create_signals | 60.15ms | 28.45ms | 80.17ms | 95.68ms | 25.18ms | 4.64ms |
| comp_0to1 | 53.40ms | 6.72ms | 37.47ms | 35.74ms | 10.98ms | 17.19ms |
| comp_1to1 | 61.77ms | 4.13ms | 18.30ms | 47.37ms | 24.13ms | 12.47ms |
| comp_2to1 | 37.35ms | 2.30ms | 18.27ms | 37.48ms | 7.94ms | 11.46ms |
| comp_4to1 | 16.29ms | 10.02ms | 18.85ms | 5.12ms | 2.63ms | 9.40ms |
| comp_1000to1 | 42μs | 3μs | 18μs | 18μs | 5μs | 4μs |
| comp_1to2 | 44.63ms | 9.80ms | 37.92ms | 29.14ms | 13.65ms | 16.34ms |
| comp_1to4 | 44.04ms | 11.06ms | 24.30ms | 27.83ms | 9.51ms | 25.52ms |
| comp_1to8 | 43.37ms | 4.91ms | 22.20ms | 25.92ms | 9.02ms | 11.48ms |
| comp_1to1000 | 39.07ms | 3.46ms | 16.17ms | 17.05ms | 7.20ms | 6.54ms |
| update_1to1 | 5.67ms | 10.18ms | 24.96ms | 16.52ms | 9.25ms | 8.67ms |
| update_2to1 | 3.19ms | 2.27ms | 12.19ms | 7.90ms | 4.50ms | 4.34ms |
| update_4to1 | 1.44ms | 2.51ms | 6.80ms | 4.03ms | 2.22ms | 2.16ms |
| update_1000to1 | 14μs | 24μs | 70μs | 40μs | 22μs | 21μs |
| update_1to2 | 2.84ms | 5.06ms | 13.96ms | 8.05ms | 4.57ms | 4.66ms |
| update_1to4 | 1.44ms | 2.55ms | 7.01ms | 4.04ms | 2.60ms | 2.19ms |
| update_1to1000 | 387μs | 47μs | 184μs | 172μs | 43μs | 145μs |
| cellx1000 | 7.22ms | 7.01ms | 69.08ms | 11.85ms | 9.44ms | 10.02ms |
| cellx2500 | 32.55ms | 18.76ms | 255.87ms | 31.08ms | 30.40ms | 25.14ms |
| cellx5000 | 66.11ms | 40.31ms | 559.40ms | 65.47ms | 58.40ms | 62.09ms |
| 10x5 - 2 sources - read 20.0% (simple) | 241.06ms | 228.84ms | 2.05s | 364.72ms | 509.61ms | 436.65ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 197.83ms | 175.02ms | 1.54s | 248.07ms | 279.75ms | 268.54ms |
| 1000x12 - 4 sources - dynamic (large) | 331.86ms | 281.27ms | 1.88s | 460.04ms | 3.73s | 3.64s |
| 1000x5 - 25 sources (wide dense) | 498.60ms | 410.82ms | 3.53s | 578.21ms | 3.56s | 2.70s |
| 5x500 - 3 sources (deep) | 204.43ms | 193.91ms | 1.17s | 251.57ms | 225.42ms | 228.91ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 259.37ms | 267.45ms | 1.68s | 378.44ms | 484.57ms | 445.80ms |

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
