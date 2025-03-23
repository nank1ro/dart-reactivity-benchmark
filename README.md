# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.26s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.22s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.03s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.43s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.46s |

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
| avoidablePropagation | 271.59ms | 204.63ms | 2.30s | 186.01ms | 215.92ms | 148.78ms (fail) |
| broadPropagation | 501.32ms | 460.12ms | 4.22s | 360.59ms | 458.61ms | 6.30ms (fail) |
| deepPropagation | 166.91ms | 179.86ms | 1.54s | 121.62ms | 174.61ms | 138.50ms (fail) |
| diamond | 346.24ms | 300.23ms | 2.37s | 235.78ms | 288.07ms | 184.79ms (fail) |
| mux | 435.67ms | 387.38ms | 1.80s | 378.11ms | 407.29ms | 192.05ms (fail) |
| repeatedObservers | 78.06ms | 38.71ms | 228.37ms | 44.98ms | 47.02ms | 52.03ms (fail) |
| triangle | 116.54ms | 100.07ms | 771.54ms | 84.59ms | 105.31ms | 76.54ms (fail) |
| unstable | 93.89ms | 71.01ms | 343.29ms | 59.95ms | 75.30ms | 335.82ms (fail) |
| molBench | 492.61ms | 490.99ms | 580.71ms | 489.77ms | 488.39ms | 2.02ms |
| create_signals | 72.16ms | 4.80ms | 77.63ms | 26.84ms | 24.64ms | 70.02ms |
| comp_0to1 | 28.44ms | 17.55ms | 36.52ms | 7.10ms | 11.70ms | 61.85ms |
| comp_1to1 | 36.84ms | 14.37ms | 16.94ms | 4.18ms | 28.20ms | 60.21ms |
| comp_2to1 | 24.51ms | 12.38ms | 22.20ms | 2.25ms | 7.98ms | 38.89ms |
| comp_4to1 | 14.02ms | 8.72ms | 18.07ms | 8.54ms | 2.92ms | 16.57ms |
| comp_1000to1 | 17μs | 5μs | 33μs | 4μs | 4μs | 41μs |
| comp_1to2 | 23.80ms | 31.11ms | 36.14ms | 15.02ms | 14.75ms | 46.06ms |
| comp_1to4 | 22.12ms | 30.88ms | 25.38ms | 6.89ms | 7.04ms | 47.11ms |
| comp_1to8 | 20.74ms | 7.47ms | 20.65ms | 4.28ms | 6.54ms | 43.22ms |
| comp_1to1000 | 14.80ms | 6.68ms | 14.77ms | 3.39ms | 4.43ms | 37.74ms |
| update_1to1 | 16.15ms | 8.16ms | 22.74ms | 11.28ms | 9.21ms | 5.73ms |
| update_2to1 | 7.98ms | 4.13ms | 10.48ms | 5.03ms | 4.58ms | 2.88ms |
| update_4to1 | 4.03ms | 2.12ms | 5.94ms | 2.96ms | 2.33ms | 1.43ms |
| update_1000to1 | 40μs | 20μs | 68μs | 24μs | 23μs | 14μs |
| update_1to2 | 8.10ms | 4.05ms | 10.46ms | 5.66ms | 4.91ms | 2.93ms |
| update_1to4 | 4.23ms | 2.09ms | 5.21ms | 2.50ms | 2.41ms | 1.43ms |
| update_1to1000 | 150μs | 939μs | 187μs | 35μs | 91μs | 382μs |
| cellx1000 | 11.78ms | 9.95ms | 71.95ms | 7.32ms | 11.93ms | 5.28ms |
| cellx2500 | 32.54ms | 30.54ms | 257.26ms | 20.95ms | 37.30ms | 23.15ms |
| cellx5000 | 76.86ms | 88.01ms | 549.07ms | 45.93ms | 82.74ms | 79.19ms |
| 10x5 - 2 sources - read 20.0% (simple) | 391.22ms | 444.28ms | 2.07s | 238.08ms | 506.51ms | 242.03ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 252.14ms | 272.95ms | 1.56s | 178.10ms | 285.38ms | 211.28ms |
| 1000x12 - 4 sources - dynamic (large) | 461.21ms | 3.52s | 1.93s | 283.62ms | 3.76s | 354.84ms |
| 1000x5 - 25 sources (wide dense) | 590.41ms | 2.60s | 3.62s | 414.50ms | 3.45s | 508.55ms |
| 5x500 - 3 sources (deep) | 255.94ms | 230.58ms | 1.14s | 189.76ms | 226.48ms | 206.22ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 382.74ms | 446.37ms | 1.76s | 261.35ms | 469.54ms | 259.06ms |

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
