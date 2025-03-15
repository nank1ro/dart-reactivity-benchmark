# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.65 | 100.0% | 35/35 | 3.70s |
| 🥈 | preact_signals | 0.29 | 100.0% | 35/35 | 9.96s |
| 🥉 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.28s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.03s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.90s |
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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 271.11ms | 204.84ms | 2.34s | 185.84ms | 209.87ms | 158.36ms (fail) |
| broadPropagation | 512.60ms | 464.81ms | 4.34s | 348.69ms | 453.06ms | 6.11ms (fail) |
| deepPropagation | 167.07ms | 180.84ms | 1.53s | 122.57ms | 174.15ms | 135.68ms (fail) |
| diamond | 357.62ms | 280.56ms | 2.41s | 235.79ms | 292.19ms | 186.19ms (fail) |
| mux | 442.88ms | 383.88ms | 1.87s | 369.15ms | 405.82ms | 189.00ms (fail) |
| repeatedObservers | 78.84ms | 38.24ms | 232.13ms | 45.18ms | 46.46ms | 51.05ms (fail) |
| triangle | 114.82ms | 101.15ms | 770.43ms | 85.58ms | 105.55ms | 78.28ms (fail) |
| unstable | 93.62ms | 70.82ms | 344.24ms | 61.21ms | 71.49ms | 337.12ms (fail) |
| molBench | 475.61ms | 491.25ms | 580.50ms | 491.44ms | 487.41ms | 1.16ms |
| create_signals | 53.73ms | 4.72ms | 81.83ms | 26.37ms | 25.77ms | 60.13ms |
| comp_0to1 | 28.87ms | 17.78ms | 15.38ms | 7.06ms | 12.02ms | 53.39ms |
| comp_1to1 | 48.72ms | 10.88ms | 47.03ms | 4.16ms | 28.92ms | 54.70ms |
| comp_2to1 | 51.70ms | 18.64ms | 23.25ms | 2.31ms | 11.14ms | 37.30ms |
| comp_4to1 | 4.49ms | 3.27ms | 30.58ms | 10.87ms | 1.94ms | 16.87ms |
| comp_1000to1 | 15μs | 5μs | 27μs | 5μs | 5μs | 41μs |
| comp_1to2 | 39.98ms | 10.03ms | 33.57ms | 19.95ms | 21.46ms | 45.55ms |
| comp_1to4 | 19.47ms | 19.22ms | 22.09ms | 7.53ms | 12.77ms | 44.64ms |
| comp_1to8 | 23.31ms | 17.82ms | 22.53ms | 7.75ms | 8.84ms | 44.75ms |
| comp_1to1000 | 15.17ms | 4.58ms | 14.81ms | 3.52ms | 4.64ms | 39.07ms |
| update_1to1 | 16.07ms | 9.97ms | 23.68ms | 11.35ms | 9.35ms | 5.72ms |
| update_2to1 | 8.01ms | 4.10ms | 10.83ms | 4.95ms | 4.61ms | 2.88ms |
| update_4to1 | 4.05ms | 2.06ms | 6.93ms | 2.84ms | 2.32ms | 1.47ms |
| update_1000to1 | 40μs | 30μs | 66μs | 10μs | 23μs | 15μs |
| update_1to2 | 8.06ms | 4.07ms | 11.41ms | 5.61ms | 4.91ms | 2.96ms |
| update_1to4 | 4.03ms | 2.07ms | 5.60ms | 2.44ms | 2.32ms | 1.47ms |
| update_1to1000 | 150μs | 40μs | 163μs | 47μs | 48μs | 400μs |
| cellx1000 | 11.71ms | 9.63ms | 80.03ms | 7.30ms | 9.66ms | 5.91ms |
| cellx2500 | 38.21ms | 32.33ms | 283.38ms | 19.78ms | 32.68ms | 25.78ms |
| cellx5000 | 103.51ms | 86.05ms | 620.89ms | 47.95ms | 70.54ms | 83.76ms |
| 10x5 - 2 sources - read 20.0% (simple) | 345.75ms | 442.24ms | 2.03s | 231.60ms | 507.84ms | 237.82ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 242.72ms | 274.52ms | 1.55s | 175.51ms | 277.80ms | 197.73ms |
| 1000x12 - 4 sources - dynamic (large) | 467.69ms | 3.51s | 1.98s | 287.91ms | 3.61s | 345.58ms |
| 1000x5 - 25 sources (wide dense) | 588.57ms | 2.58s | 3.59s | 407.32ms | 3.42s | 500.46ms |
| 5x500 - 3 sources (deep) | 258.50ms | 233.95ms | 1.20s | 194.29ms | 225.52ms | 203.84ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 379.88ms | 448.75ms | 1.79s | 269.18ms | 481.65ms | 258.20ms |

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
