# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.39s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.34s |
| 4 | preact_signals | 0.27 | 100.0% | 35/35 | 10.34s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.73s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.39s |

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
| avoidablePropagation | 275.95ms | 210.56ms | 2.29s | 198.42ms | 157.58ms (fail) | 189.75ms |
| broadPropagation | 515.15ms | 461.33ms | 4.54s | 446.18ms | 6.57ms (fail) | 347.38ms |
| deepPropagation | 171.28ms | 170.56ms | 1.56s | 176.23ms | 142.21ms (fail) | 124.57ms |
| diamond | 366.07ms | 290.77ms | 2.42s | 284.25ms | 193.18ms (fail) | 231.09ms |
| mux | 443.25ms | 410.78ms | 1.86s | 402.60ms | 194.05ms (fail) | 368.63ms |
| repeatedObservers | 77.43ms | 45.56ms | 232.62ms | 40.05ms | 53.24ms (fail) | 46.69ms |
| triangle | 117.97ms | 103.93ms | 774.25ms | 98.49ms | 77.04ms (fail) | 83.01ms |
| unstable | 97.00ms | 79.05ms | 351.83ms | 70.05ms | 337.35ms (fail) | 67.65ms |
| molBench | 492.29ms | 489.44ms | 575.32ms | 488.45ms | 891μs | 486.80ms |
| create_signals | 77.38ms | 24.48ms | 73.32ms | 5.27ms | 59.64ms | 29.87ms |
| comp_0to1 | 28.83ms | 11.64ms | 29.07ms | 17.94ms | 53.38ms | 10.66ms |
| comp_1to1 | 39.83ms | 26.13ms | 44.20ms | 14.68ms | 55.97ms | 10.04ms |
| comp_2to1 | 38.51ms | 12.26ms | 36.97ms | 18.72ms | 36.76ms | 11.64ms |
| comp_4to1 | 4.99ms | 3.57ms | 17.70ms | 8.83ms | 16.60ms | 7.82ms |
| comp_1000to1 | 17μs | 4μs | 16μs | 5μs | 41μs | 3μs |
| comp_1to2 | 37.84ms | 21.99ms | 36.41ms | 20.95ms | 44.77ms | 14.17ms |
| comp_1to4 | 22.08ms | 13.32ms | 18.39ms | 25.83ms | 43.50ms | 8.17ms |
| comp_1to8 | 25.48ms | 12.56ms | 20.77ms | 5.84ms | 43.05ms | 3.81ms |
| comp_1to1000 | 17.36ms | 4.39ms | 15.84ms | 5.42ms | 38.55ms | 3.44ms |
| update_1to1 | 16.07ms | 8.91ms | 23.79ms | 8.65ms | 5.65ms | 10.28ms |
| update_2to1 | 7.84ms | 4.55ms | 11.86ms | 4.26ms | 3.13ms | 2.26ms |
| update_4to1 | 3.98ms | 2.26ms | 6.73ms | 2.21ms | 1.45ms | 2.50ms |
| update_1000to1 | 40μs | 22μs | 90μs | 21μs | 14μs | 27μs |
| update_1to2 | 8.07ms | 4.48ms | 12.05ms | 4.59ms | 2.84ms | 5.04ms |
| update_1to4 | 4.00ms | 2.25ms | 6.40ms | 2.12ms | 1.43ms | 2.48ms |
| update_1to1000 | 172μs | 42μs | 172μs | 761μs | 388μs | 37μs |
| cellx1000 | 12.05ms | 9.61ms | 72.83ms | 9.87ms | 5.71ms | 8.17ms |
| cellx2500 | 44.16ms | 31.74ms | 251.02ms | 26.51ms | 25.37ms | 19.63ms |
| cellx5000 | 148.97ms | 65.74ms | 578.94ms | 74.29ms | 70.43ms | 45.91ms |
| 10x5 - 2 sources - read 20.0% (simple) | 355.49ms | 518.57ms | 2.05s | 436.37ms | 241.07ms | 231.33ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 244.01ms | 279.04ms | 1.52s | 273.57ms | 197.23ms | 179.47ms |
| 1000x12 - 4 sources - dynamic (large) | 469.06ms | 3.74s | 1.91s | 3.76s | 334.93ms | 277.99ms |
| 1000x5 - 25 sources (wide dense) | 593.47ms | 3.56s | 3.56s | 2.72s | 479.15ms | 411.40ms |
| 5x500 - 3 sources (deep) | 252.93ms | 225.77ms | 1.16s | 229.76ms | 205.36ms | 190.88ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 380.95ms | 482.08ms | 1.68s | 452.80ms | 256.49ms | 267.53ms |

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
