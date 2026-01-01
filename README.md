# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.67s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.29s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.06s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.04s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.23s |
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
| Test Case | signals | alien_signals | state_beacon | solidart(2.0-dev) | preact_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 215.78ms | 187.67ms | 148.62ms (fail) | 280.06ms | 207.90ms | 2.42s |
| broadPropagation | 470.94ms | 351.97ms | 6.42ms (fail) | 520.27ms | 448.91ms | 4.37s |
| deepPropagation | 181.30ms | 127.50ms | 138.87ms (fail) | 170.51ms | 178.47ms | 1.52s |
| diamond | 284.65ms | 235.69ms | 195.12ms (fail) | 359.58ms | 283.88ms | 2.39s |
| mux | 390.50ms | 357.39ms | 181.76ms (fail) | 421.25ms | 373.34ms | 1.87s |
| repeatedObservers | 46.02ms | 43.67ms | 53.98ms (fail) | 80.80ms | 40.23ms | 231.22ms |
| triangle | 102.98ms | 86.45ms | 80.91ms (fail) | 116.00ms | 101.06ms | 754.53ms |
| unstable | 78.08ms | 61.28ms | 336.59ms (fail) | 97.86ms | 69.16ms | 348.55ms |
| molBench | 494.84ms | 484.99ms | 1.03ms | 490.14ms | 479.68ms | 593.71ms |
| create_signals | 26.08ms | 29.36ms | 62.78ms | 76.32ms | 5.49ms | 72.87ms |
| comp_0to1 | 12.79ms | 6.85ms | 55.24ms | 25.75ms | 18.33ms | 15.06ms |
| comp_1to1 | 26.50ms | 4.22ms | 61.24ms | 35.33ms | 14.31ms | 43.90ms |
| comp_2to1 | 11.29ms | 2.34ms | 43.81ms | 40.78ms | 17.58ms | 41.66ms |
| comp_4to1 | 7.85ms | 10.64ms | 16.27ms | 10.95ms | 8.65ms | 17.19ms |
| comp_1000to1 | 5μs | 5μs | 40μs | 16μs | 4μs | 25μs |
| comp_1to2 | 19.86ms | 18.86ms | 44.29ms | 35.76ms | 25.17ms | 34.61ms |
| comp_1to4 | 17.57ms | 7.70ms | 44.59ms | 20.64ms | 22.19ms | 21.63ms |
| comp_1to8 | 7.25ms | 7.45ms | 42.31ms | 22.57ms | 8.66ms | 25.28ms |
| comp_1to1000 | 4.31ms | 3.58ms | 38.25ms | 14.42ms | 8.03ms | 15.05ms |
| update_1to1 | 9.33ms | 4.66ms | 6.11ms | 15.48ms | 8.81ms | 25.65ms |
| update_2to1 | 4.90ms | 2.31ms | 3.05ms | 7.75ms | 4.37ms | 12.51ms |
| update_4to1 | 2.42ms | 1.21ms | 1.59ms | 3.87ms | 2.20ms | 7.23ms |
| update_1000to1 | 24μs | 11μs | 19μs | 38μs | 22μs | 67μs |
| update_1to2 | 4.78ms | 2.25ms | 3.07ms | 7.85ms | 4.39ms | 13.83ms |
| update_1to4 | 2.57ms | 1.75ms | 1.59ms | 3.86ms | 2.25ms | 6.97ms |
| update_1to1000 | 42μs | 38μs | 371μs | 151μs | 3.02ms | 163μs |
| cellx1000 | 9.52ms | 8.73ms | 5.30ms | 11.94ms | 10.12ms | 78.70ms |
| cellx2500 | 32.09ms | 20.44ms | 24.07ms | 32.60ms | 31.92ms | 276.84ms |
| cellx5000 | 65.91ms | 47.84ms | 58.31ms | 77.19ms | 96.78ms | 583.09ms |
| 10x5 - 2 sources - read 20.0% (simple) | 508.15ms | 235.18ms | 247.56ms | 353.64ms | 435.09ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.02ms | 175.36ms | 211.95ms | 249.54ms | 262.97ms | 1.49s |
| 1000x12 - 4 sources - dynamic (large) | 3.55s | 277.24ms | 352.03ms | 467.49ms | 3.67s | 1.87s |
| 1000x5 - 25 sources (wide dense) | 3.49s | 408.08ms | 519.36ms | 597.48ms | 2.50s | 3.29s |
| 5x500 - 3 sources (deep) | 227.44ms | 194.80ms | 208.10ms | 255.54ms | 230.42ms | 1.09s |
| 100x15 - 6 sources - dynamic (very dynamic) | 473.50ms | 264.18ms | 268.04ms | 382.32ms | 462.11ms | 1.69s |

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
