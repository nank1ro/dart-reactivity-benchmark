# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.66 | 100.0% | 35/35 | 3.66s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.24s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.16s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.36s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.68s |
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
| Test Case | solidart(2.0-dev) | signals | mobx | preact_signals | state_beacon | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 275.53ms | 206.68ms | 2.32s | 216.75ms | 148.52ms (fail) | 187.14ms |
| broadPropagation | 504.90ms | 454.27ms | 4.50s | 493.06ms | 5.92ms (fail) | 343.70ms |
| deepPropagation | 165.82ms | 171.07ms | 1.57s | 193.88ms | 140.12ms (fail) | 120.45ms |
| diamond | 352.50ms | 280.79ms | 2.43s | 307.55ms | 192.77ms (fail) | 226.74ms |
| mux | 437.67ms | 448.54ms | 1.87s | 409.93ms | 192.45ms (fail) | 374.38ms |
| repeatedObservers | 81.97ms | 44.95ms | 231.22ms | 39.54ms | 52.93ms (fail) | 45.45ms |
| triangle | 117.93ms | 105.11ms | 769.83ms | 104.58ms | 76.89ms (fail) | 85.00ms |
| unstable | 97.12ms | 79.48ms | 349.20ms | 72.03ms | 340.58ms (fail) | 67.55ms |
| molBench | 493.90ms | 486.25ms | 572.65ms | 488.08ms | 910μs | 482.41ms |
| create_signals | 76.24ms | 25.37ms | 85.57ms | 5.50ms | 66.43ms | 28.47ms |
| comp_0to1 | 27.85ms | 10.91ms | 39.67ms | 17.26ms | 62.41ms | 6.85ms |
| comp_1to1 | 28.04ms | 19.89ms | 18.38ms | 14.31ms | 61.38ms | 4.14ms |
| comp_2to1 | 41.51ms | 8.30ms | 27.69ms | 11.62ms | 44.92ms | 2.73ms |
| comp_4to1 | 5.17ms | 1.83ms | 16.32ms | 8.43ms | 16.97ms | 9.04ms |
| comp_1000to1 | 17μs | 5μs | 17μs | 6μs | 42μs | 3μs |
| comp_1to2 | 40.38ms | 16.17ms | 38.38ms | 16.02ms | 47.30ms | 15.02ms |
| comp_1to4 | 17.06ms | 13.90ms | 24.19ms | 21.67ms | 49.84ms | 5.29ms |
| comp_1to8 | 22.08ms | 6.32ms | 21.85ms | 7.53ms | 44.67ms | 7.09ms |
| comp_1to1000 | 17.04ms | 4.35ms | 16.28ms | 4.73ms | 39.13ms | 3.40ms |
| update_1to1 | 15.89ms | 8.91ms | 22.47ms | 8.68ms | 5.67ms | 10.39ms |
| update_2to1 | 7.80ms | 4.51ms | 10.98ms | 4.29ms | 3.10ms | 2.27ms |
| update_4to1 | 4.00ms | 2.24ms | 5.84ms | 2.16ms | 1.43ms | 2.50ms |
| update_1000to1 | 50μs | 22μs | 71μs | 21μs | 14μs | 24μs |
| update_1to2 | 7.99ms | 4.47ms | 10.95ms | 4.56ms | 2.84ms | 5.11ms |
| update_1to4 | 3.97ms | 2.24ms | 5.54ms | 2.14ms | 1.42ms | 2.53ms |
| update_1to1000 | 185μs | 42μs | 172μs | 127μs | 392μs | 46μs |
| cellx1000 | 14.14ms | 9.62ms | 71.58ms | 9.92ms | 5.38ms | 7.94ms |
| cellx2500 | 33.08ms | 31.15ms | 259.15ms | 27.13ms | 25.74ms | 19.12ms |
| cellx5000 | 74.93ms | 64.22ms | 564.51ms | 76.64ms | 61.99ms | 41.20ms |
| 10x5 - 2 sources - read 20.0% (simple) | 362.71ms | 503.90ms | 2.05s | 437.94ms | 240.26ms | 233.48ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 243.60ms | 280.19ms | 1.53s | 269.44ms | 196.72ms | 174.52ms |
| 1000x12 - 4 sources - dynamic (large) | 456.06ms | 3.76s | 1.90s | 3.71s | 330.67ms | 285.50ms |
| 1000x5 - 25 sources (wide dense) | 586.42ms | 3.40s | 3.54s | 2.68s | 478.80ms | 409.33ms |
| 5x500 - 3 sources (deep) | 251.16ms | 226.81ms | 1.13s | 234.80ms | 204.20ms | 190.11ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 379.36ms | 481.90ms | 1.68s | 458.53ms | 255.74ms | 259.75ms |

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
