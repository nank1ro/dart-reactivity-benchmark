# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.25s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.47s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 9.92s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.50s |
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
| Test Case | state_beacon | alien_signals | mobx | solidart(2.0-dev) | signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 148.90ms (fail) | 188.02ms | 2.33s | 280.99ms | 214.66ms | 204.38ms |
| broadPropagation | 5.82ms (fail) | 353.91ms | 4.26s | 498.68ms | 459.19ms | 454.16ms |
| deepPropagation | 136.76ms (fail) | 127.07ms | 1.55s | 174.63ms | 180.25ms | 176.14ms |
| diamond | 189.11ms (fail) | 239.02ms | 2.44s | 350.27ms | 287.64ms | 290.34ms |
| mux | 197.08ms (fail) | 369.40ms | 1.82s | 438.23ms | 410.67ms | 383.35ms |
| repeatedObservers | 53.05ms (fail) | 45.53ms | 229.74ms | 78.80ms | 45.73ms | 38.74ms |
| triangle | 78.24ms (fail) | 84.45ms | 771.25ms | 118.23ms | 100.70ms | 99.79ms |
| unstable | 336.95ms (fail) | 61.12ms | 349.64ms | 93.58ms | 72.91ms | 70.68ms |
| molBench | 1.12ms | 491.55ms | 578.86ms | 492.61ms | 488.39ms | 491.23ms |
| create_signals | 61.32ms | 25.73ms | 76.64ms | 73.97ms | 26.24ms | 4.83ms |
| comp_0to1 | 52.75ms | 7.95ms | 19.55ms | 26.41ms | 11.44ms | 17.88ms |
| comp_1to1 | 54.91ms | 4.30ms | 40.05ms | 49.19ms | 26.11ms | 10.86ms |
| comp_2to1 | 37.24ms | 2.39ms | 23.25ms | 36.03ms | 10.53ms | 18.07ms |
| comp_4to1 | 16.61ms | 7.90ms | 30.99ms | 4.72ms | 5.05ms | 8.46ms |
| comp_1000to1 | 43μs | 4μs | 25μs | 15μs | 5μs | 6μs |
| comp_1to2 | 46.09ms | 9.45ms | 37.88ms | 31.48ms | 13.55ms | 15.76ms |
| comp_1to4 | 44.23ms | 11.74ms | 21.08ms | 20.91ms | 11.75ms | 29.90ms |
| comp_1to8 | 43.80ms | 5.11ms | 23.53ms | 22.56ms | 6.92ms | 9.38ms |
| comp_1to1000 | 39.12ms | 3.65ms | 15.16ms | 14.69ms | 4.46ms | 10.14ms |
| update_1to1 | 5.74ms | 11.31ms | 21.98ms | 16.19ms | 9.22ms | 8.30ms |
| update_2to1 | 2.89ms | 3.60ms | 10.89ms | 7.98ms | 4.60ms | 4.06ms |
| update_4to1 | 1.48ms | 2.78ms | 7.03ms | 4.02ms | 2.33ms | 2.08ms |
| update_1000to1 | 15μs | 12μs | 60μs | 41μs | 23μs | 20μs |
| update_1to2 | 2.97ms | 5.59ms | 10.52ms | 8.02ms | 4.93ms | 4.06ms |
| update_1to4 | 1.47ms | 1.91ms | 5.27ms | 4.06ms | 2.33ms | 2.05ms |
| update_1to1000 | 396μs | 46μs | 176μs | 150μs | 44μs | 2.23ms |
| cellx1000 | 5.23ms | 7.63ms | 71.68ms | 11.21ms | 9.66ms | 9.46ms |
| cellx2500 | 27.00ms | 19.57ms | 242.66ms | 31.33ms | 32.21ms | 25.49ms |
| cellx5000 | 52.33ms | 41.53ms | 570.95ms | 71.00ms | 63.80ms | 65.06ms |
| 10x5 - 2 sources - read 20.0% (simple) | 243.33ms | 234.04ms | 2.05s | 353.99ms | 508.41ms | 441.01ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 199.37ms | 178.03ms | 1.54s | 248.27ms | 282.17ms | 277.06ms |
| 1000x12 - 4 sources - dynamic (large) | 334.22ms | 278.81ms | 1.92s | 461.97ms | 3.98s | 3.47s |
| 1000x5 - 25 sources (wide dense) | 506.18ms | 415.63ms | 3.57s | 596.49ms | 3.49s | 2.58s |
| 5x500 - 3 sources (deep) | 204.00ms | 191.15ms | 1.16s | 252.07ms | 225.19ms | 235.39ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 259.35ms | 266.50ms | 1.71s | 380.52ms | 479.63ms | 448.45ms |

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
