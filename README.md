# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.34s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.40s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.40s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.33s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.58s |

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
| avoidablePropagation | 226.98ms | 193.04ms | 163.66ms (fail) | 278.15ms | 203.67ms | 2.36s |
| broadPropagation | 465.03ms | 354.51ms | 6.28ms (fail) | 503.91ms | 460.73ms | 4.29s |
| deepPropagation | 182.17ms | 123.27ms | 142.10ms (fail) | 165.71ms | 177.63ms | 1.56s |
| diamond | 283.12ms | 233.80ms | 204.98ms (fail) | 352.82ms | 279.67ms | 2.40s |
| mux | 414.83ms | 386.22ms | 194.28ms (fail) | 430.33ms | 388.89ms | 1.84s |
| repeatedObservers | 46.24ms | 43.65ms | 52.91ms (fail) | 82.05ms | 40.40ms | 228.64ms |
| triangle | 102.16ms | 85.67ms | 81.66ms (fail) | 115.49ms | 100.11ms | 763.25ms |
| unstable | 75.66ms | 60.66ms | 377.99ms (fail) | 98.27ms | 74.29ms | 343.42ms |
| molBench | 485.40ms | 489.33ms | 981μs | 493.90ms | 483.63ms | 582.77ms |
| create_signals | 26.26ms | 26.94ms | 70.29ms | 95.29ms | 5.54ms | 90.44ms |
| comp_0to1 | 11.40ms | 9.54ms | 62.94ms | 33.51ms | 17.67ms | 40.69ms |
| comp_1to1 | 23.45ms | 4.26ms | 63.28ms | 48.68ms | 11.06ms | 17.53ms |
| comp_2to1 | 7.98ms | 2.34ms | 43.58ms | 47.51ms | 23.04ms | 25.90ms |
| comp_4to1 | 3.00ms | 10.15ms | 19.24ms | 4.32ms | 13.88ms | 17.32ms |
| comp_1000to1 | 9μs | 6μs | 44μs | 14μs | 9μs | 17μs |
| comp_1to2 | 16.70ms | 11.87ms | 50.68ms | 35.08ms | 23.24ms | 40.57ms |
| comp_1to4 | 16.42ms | 13.50ms | 46.35ms | 20.90ms | 29.62ms | 22.64ms |
| comp_1to8 | 6.86ms | 4.38ms | 46.55ms | 23.65ms | 6.99ms | 24.55ms |
| comp_1to1000 | 4.38ms | 3.15ms | 40.98ms | 14.39ms | 6.56ms | 15.28ms |
| update_1to1 | 10.19ms | 10.02ms | 6.04ms | 19.39ms | 8.35ms | 28.20ms |
| update_2to1 | 4.53ms | 2.15ms | 3.86ms | 8.08ms | 4.34ms | 14.19ms |
| update_4to1 | 2.54ms | 2.48ms | 1.53ms | 4.11ms | 2.23ms | 7.16ms |
| update_1000to1 | 25μs | 14μs | 15μs | 40μs | 21μs | 68μs |
| update_1to2 | 4.54ms | 5.19ms | 3.05ms | 8.41ms | 4.12ms | 12.62ms |
| update_1to4 | 2.85ms | 2.41ms | 1.52ms | 4.13ms | 2.06ms | 5.63ms |
| update_1to1000 | 43μs | 48μs | 427μs | 150μs | 857μs | 177μs |
| cellx1000 | 9.88ms | 7.30ms | 6.15ms | 12.10ms | 9.72ms | 74.73ms |
| cellx2500 | 32.41ms | 19.36ms | 27.20ms | 33.35ms | 26.00ms | 250.32ms |
| cellx5000 | 66.29ms | 42.68ms | 63.87ms | 76.50ms | 71.32ms | 566.50ms |
| 10x5 - 2 sources - read 20.0% (simple) | 508.20ms | 238.43ms | 268.09ms | 355.60ms | 443.52ms | 2.00s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 283.30ms | 176.73ms | 199.72ms | 253.29ms | 277.72ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 4.04s | 280.51ms | 343.31ms | 461.36ms | 3.77s | 1.89s |
| 1000x5 - 25 sources (wide dense) | 3.33s | 404.39ms | 514.42ms | 609.65ms | 2.74s | 3.46s |
| 5x500 - 3 sources (deep) | 223.88ms | 191.83ms | 207.45ms | 263.23ms | 233.38ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 476.24ms | 265.49ms | 264.60ms | 385.71ms | 465.27ms | 1.70s |

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
