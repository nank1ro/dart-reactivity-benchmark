# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.76 | 100.0% | 35/35 | 3.76s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.60s |
| 🥉 | preact_signals | 0.26 | 100.0% | 35/35 | 10.57s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.33s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.37s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.59s |

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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 204.81ms | 2.35s | 160.64ms (fail) | 198.19ms | 206.36ms | 286.04ms |
| broadPropagation | 462.07ms | 4.25s | 9.14ms (fail) | 360.05ms | 456.57ms | 528.25ms |
| deepPropagation | 167.65ms | 1.54s | 139.37ms (fail) | 130.02ms | 179.54ms | 172.17ms |
| diamond | 286.87ms | 2.38s | 195.47ms (fail) | 247.01ms | 287.28ms | 354.54ms |
| mux | 406.60ms | 1.76s | 189.04ms (fail) | 368.87ms | 383.65ms | 433.10ms |
| repeatedObservers | 46.40ms | 232.62ms | 56.16ms (fail) | 45.26ms | 41.45ms | 81.12ms |
| triangle | 101.50ms | 769.61ms | 78.18ms (fail) | 88.88ms | 99.07ms | 116.16ms |
| unstable | 75.47ms | 355.10ms | 348.77ms (fail) | 62.83ms | 71.89ms | 96.60ms |
| molBench | 499.29ms | 597.83ms | 1.38ms | 493.89ms | 500.75ms | 500.92ms |
| create_signals | 32.80ms | 100.15ms | 65.05ms | 22.00ms | 6.33ms | 90.11ms |
| comp_0to1 | 13.95ms | 23.58ms | 60.34ms | 9.16ms | 21.20ms | 30.85ms |
| comp_1to1 | 36.92ms | 62.98ms | 59.48ms | 5.02ms | 14.55ms | 69.84ms |
| comp_2to1 | 24.83ms | 26.54ms | 41.13ms | 3.08ms | 21.93ms | 11.03ms |
| comp_4to1 | 2.76ms | 28.83ms | 17.52ms | 8.54ms | 9.29ms | 14.30ms |
| comp_1000to1 | 7μs | 15μs | 44μs | 3μs | 10μs | 19μs |
| comp_1to2 | 21.94ms | 43.03ms | 47.93ms | 11.03ms | 12.72ms | 44.92ms |
| comp_1to4 | 14.46ms | 23.99ms | 47.14ms | 15.73ms | 34.40ms | 18.19ms |
| comp_1to8 | 7.95ms | 24.94ms | 44.75ms | 5.42ms | 7.79ms | 25.19ms |
| comp_1to1000 | 4.87ms | 15.47ms | 40.55ms | 3.81ms | 5.20ms | 14.41ms |
| update_1to1 | 8.97ms | 21.30ms | 6.67ms | 4.68ms | 8.96ms | 15.85ms |
| update_2to1 | 4.49ms | 10.42ms | 3.29ms | 2.35ms | 4.59ms | 7.94ms |
| update_4to1 | 2.30ms | 5.36ms | 2.19ms | 1.17ms | 2.29ms | 3.95ms |
| update_1000to1 | 23μs | 65μs | 15μs | 11μs | 27μs | 40μs |
| update_1to2 | 4.46ms | 10.50ms | 3.10ms | 2.37ms | 4.48ms | 7.93ms |
| update_1to4 | 2.29ms | 5.44ms | 1.41ms | 1.21ms | 2.37ms | 3.98ms |
| update_1to1000 | 46μs | 173μs | 383μs | 52μs | 202μs | 172μs |
| cellx1000 | 10.83ms | 83.80ms | 7.91ms | 9.33ms | 11.35ms | 12.87ms |
| cellx2500 | 47.69ms | 298.60ms | 42.82ms | 21.55ms | 37.80ms | 45.30ms |
| cellx5000 | 106.50ms | 671.79ms | 90.72ms | 47.83ms | 117.08ms | 257.85ms |
| 10x5 - 2 sources - read 20.0% (simple) | 501.69ms | 1.95s | 253.33ms | 239.94ms | 455.39ms | 346.86ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 281.40ms | 1.48s | 206.06ms | 179.97ms | 273.46ms | 252.45ms |
| 1000x12 - 4 sources - dynamic (large) | 3.95s | 1.90s | 364.92ms | 282.35ms | 3.81s | 474.96ms |
| 1000x5 - 25 sources (wide dense) | 3.29s | 3.48s | 528.85ms | 422.13ms | 2.78s | 606.82ms |
| 5x500 - 3 sources (deep) | 225.22ms | 1.16s | 208.16ms | 196.07ms | 230.19ms | 274.39ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 478.03ms | 1.71s | 267.35ms | 268.46ms | 468.57ms | 398.26ms |

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
