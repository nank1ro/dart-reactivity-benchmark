# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.71s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.39s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 10.97s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.21s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.63s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.47s |

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
| avoidablePropagation | 211.28ms | 188.01ms | 144.05ms (fail) | 277.67ms | 208.01ms | 2.38s |
| broadPropagation | 458.85ms | 351.79ms | 5.87ms (fail) | 503.35ms | 460.42ms | 4.49s |
| deepPropagation | 172.87ms | 130.09ms | 139.29ms (fail) | 168.95ms | 175.55ms | 1.51s |
| diamond | 284.71ms | 231.04ms | 185.72ms (fail) | 350.39ms | 284.15ms | 2.39s |
| mux | 393.71ms | 357.10ms | 185.34ms (fail) | 424.46ms | 374.56ms | 1.90s |
| repeatedObservers | 46.05ms | 43.41ms | 54.56ms (fail) | 80.59ms | 40.07ms | 228.46ms |
| triangle | 104.33ms | 83.99ms | 77.66ms (fail) | 114.29ms | 101.12ms | 743.23ms |
| unstable | 77.82ms | 62.94ms | 337.43ms (fail) | 95.73ms | 69.18ms | 338.83ms |
| molBench | 496.48ms | 485.43ms | 935μs | 491.38ms | 488.72ms | 589.27ms |
| create_signals | 53.80ms | 29.09ms | 66.91ms | 63.13ms | 14.22ms | 71.87ms |
| comp_0to1 | 13.21ms | 7.99ms | 57.23ms | 27.85ms | 20.59ms | 29.04ms |
| comp_1to1 | 22.68ms | 4.41ms | 64.21ms | 33.23ms | 7.28ms | 48.85ms |
| comp_2to1 | 9.37ms | 2.42ms | 45.26ms | 44.99ms | 12.24ms | 24.92ms |
| comp_4to1 | 2.83ms | 10.69ms | 17.48ms | 4.76ms | 16.53ms | 18.49ms |
| comp_1000to1 | 7μs | 7μs | 42μs | 24μs | 9μs | 26μs |
| comp_1to2 | 23.73ms | 20.69ms | 47.84ms | 35.21ms | 31.81ms | 38.80ms |
| comp_1to4 | 7.63ms | 7.96ms | 53.16ms | 15.34ms | 29.92ms | 17.70ms |
| comp_1to8 | 6.87ms | 7.92ms | 45.91ms | 21.99ms | 9.33ms | 21.95ms |
| comp_1to1000 | 4.39ms | 3.79ms | 40.50ms | 15.01ms | 5.07ms | 16.00ms |
| update_1to1 | 11.62ms | 4.62ms | 6.12ms | 15.51ms | 8.77ms | 24.36ms |
| update_2to1 | 4.72ms | 2.35ms | 3.06ms | 7.79ms | 4.33ms | 12.38ms |
| update_4to1 | 2.38ms | 1.16ms | 1.55ms | 3.87ms | 2.49ms | 7.11ms |
| update_1000to1 | 43μs | 11μs | 16μs | 38μs | 22μs | 68μs |
| update_1to2 | 4.64ms | 2.74ms | 3.64ms | 7.94ms | 4.35ms | 13.78ms |
| update_1to4 | 2.57ms | 1.16ms | 1.60ms | 3.90ms | 2.24ms | 6.88ms |
| update_1to1000 | 45μs | 48μs | 370μs | 158μs | 192μs | 164μs |
| cellx1000 | 11.65ms | 8.34ms | 5.93ms | 15.98ms | 12.42ms | 96.42ms |
| cellx2500 | 49.35ms | 24.46ms | 31.80ms | 62.07ms | 43.16ms | 322.74ms |
| cellx5000 | 128.94ms | 71.67ms | 80.16ms | 175.98ms | 131.80ms | 666.20ms |
| 10x5 - 2 sources - read 20.0% (simple) | 512.42ms | 234.44ms | 241.57ms | 349.81ms | 431.75ms | 1.93s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.33ms | 174.41ms | 196.25ms | 244.42ms | 269.23ms | 1.47s |
| 1000x12 - 4 sources - dynamic (large) | 3.57s | 292.98ms | 347.87ms | 476.60ms | 3.72s | 1.97s |
| 1000x5 - 25 sources (wide dense) | 3.28s | 401.27ms | 517.66ms | 608.00ms | 2.53s | 3.44s |
| 5x500 - 3 sources (deep) | 226.89ms | 197.49ms | 203.69ms | 261.36ms | 230.18ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 491.58ms | 265.35ms | 254.74ms | 392.61ms | 469.39ms | 1.69s |

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
