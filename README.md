# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.42s |
| 🥉 | preact_signals | 0.25 | 100.0% | 35/35 | 10.63s |
| 4 | signals | 0.23 | 100.0% | 35/35 | 11.68s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.84s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.50s |

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
| avoidablePropagation | 213.61ms | 194.71ms | 156.34ms (fail) | 262.36ms | 207.62ms | 2.37s |
| broadPropagation | 460.76ms | 351.02ms | 6.46ms (fail) | 493.30ms | 459.17ms | 4.45s |
| deepPropagation | 179.44ms | 128.56ms | 143.15ms (fail) | 160.25ms | 179.61ms | 1.56s |
| diamond | 286.63ms | 235.95ms | 181.08ms (fail) | 349.90ms | 283.79ms | 2.41s |
| mux | 420.24ms | 379.92ms | 195.01ms (fail) | 431.70ms | 393.71ms | 1.83s |
| repeatedObservers | 46.46ms | 44.10ms | 53.62ms (fail) | 81.00ms | 40.57ms | 231.60ms |
| triangle | 104.06ms | 85.29ms | 84.83ms (fail) | 114.67ms | 99.96ms | 769.04ms |
| unstable | 76.93ms | 60.51ms | 342.70ms (fail) | 94.94ms | 74.62ms | 344.70ms |
| molBench | 486.50ms | 491.92ms | 945μs | 501.16ms | 489.18ms | 586.15ms |
| create_signals | 26.89ms | 28.59ms | 66.41ms | 78.14ms | 4.82ms | 82.92ms |
| comp_0to1 | 12.05ms | 7.67ms | 57.04ms | 26.56ms | 18.34ms | 20.75ms |
| comp_1to1 | 23.75ms | 4.42ms | 62.09ms | 53.28ms | 12.90ms | 31.76ms |
| comp_2to1 | 15.57ms | 2.28ms | 39.79ms | 36.59ms | 22.97ms | 17.61ms |
| comp_4to1 | 6.57ms | 10.00ms | 17.51ms | 4.43ms | 8.16ms | 26.75ms |
| comp_1000to1 | 7μs | 8μs | 45μs | 21μs | 4μs | 17μs |
| comp_1to2 | 29.08ms | 11.81ms | 48.83ms | 36.54ms | 15.63ms | 41.22ms |
| comp_1to4 | 7.84ms | 9.64ms | 47.03ms | 19.85ms | 27.19ms | 27.35ms |
| comp_1to8 | 6.77ms | 5.64ms | 46.04ms | 21.84ms | 7.32ms | 25.90ms |
| comp_1to1000 | 4.42ms | 3.61ms | 41.52ms | 14.27ms | 6.04ms | 15.72ms |
| update_1to1 | 10.30ms | 4.25ms | 6.02ms | 16.35ms | 8.64ms | 21.76ms |
| update_2to1 | 4.77ms | 2.16ms | 3.10ms | 8.07ms | 4.56ms | 10.79ms |
| update_4to1 | 2.62ms | 1.10ms | 1.54ms | 4.12ms | 2.20ms | 6.04ms |
| update_1000to1 | 26μs | 10μs | 15μs | 40μs | 20μs | 56μs |
| update_1to2 | 4.68ms | 2.13ms | 3.10ms | 8.36ms | 4.28ms | 10.74ms |
| update_1to4 | 2.64ms | 1.03ms | 1.53ms | 4.15ms | 2.18ms | 5.39ms |
| update_1to1000 | 44μs | 29μs | 420μs | 151μs | 176μs | 169μs |
| cellx1000 | 11.74ms | 8.05ms | 6.64ms | 16.60ms | 10.82ms | 93.67ms |
| cellx2500 | 45.05ms | 26.02ms | 38.14ms | 55.12ms | 39.17ms | 311.74ms |
| cellx5000 | 108.02ms | 74.67ms | 89.70ms | 164.81ms | 105.08ms | 659.82ms |
| 10x5 - 2 sources - read 20.0% (simple) | 519.14ms | 234.95ms | 241.94ms | 357.92ms | 507.18ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 286.71ms | 180.46ms | 197.79ms | 254.36ms | 288.12ms | 1.51s |
| 1000x12 - 4 sources - dynamic (large) | 3.96s | 289.34ms | 358.54ms | 476.75ms | 3.82s | 1.93s |
| 1000x5 - 25 sources (wide dense) | 3.62s | 412.03ms | 491.75ms | 618.76ms | 2.76s | 3.53s |
| 5x500 - 3 sources (deep) | 225.97ms | 192.57ms | 212.26ms | 255.53ms | 248.65ms | 1.17s |
| 100x15 - 6 sources - dynamic (very dynamic) | 480.69ms | 267.69ms | 261.36ms | 396.55ms | 476.50ms | 1.72s |

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
