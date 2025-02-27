# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.30s |
| 🥉 | preact_signals | 0.29 | 100.0% | 35/35 | 10.03s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 11.54s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.83s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.49s |

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
| avoidablePropagation | 272.73ms | 205.56ms | 2.30s | 189.78ms | 215.18ms | 150.27ms (fail) |
| broadPropagation | 505.63ms | 452.78ms | 4.29s | 361.00ms | 456.61ms | 6.62ms (fail) |
| deepPropagation | 166.39ms | 183.43ms | 1.56s | 127.51ms | 179.48ms | 139.91ms (fail) |
| diamond | 363.20ms | 277.32ms | 2.44s | 237.47ms | 287.60ms | 184.19ms (fail) |
| mux | 441.78ms | 396.31ms | 1.85s | 379.08ms | 415.62ms | 199.44ms (fail) |
| repeatedObservers | 78.76ms | 38.74ms | 231.32ms | 45.13ms | 47.13ms | 55.58ms (fail) |
| triangle | 117.80ms | 99.68ms | 770.53ms | 87.51ms | 103.25ms | 76.92ms (fail) |
| unstable | 95.44ms | 70.69ms | 346.41ms | 60.98ms | 73.11ms | 351.36ms (fail) |
| molBench | 497.28ms | 497.83ms | 587.89ms | 497.58ms | 491.51ms | 1.16ms |
| create_signals | 59.88ms | 4.86ms | 80.62ms | 27.29ms | 29.49ms | 62.57ms |
| comp_0to1 | 32.10ms | 19.58ms | 27.82ms | 7.89ms | 13.48ms | 55.57ms |
| comp_1to1 | 39.24ms | 12.06ms | 23.10ms | 4.74ms | 28.59ms | 63.31ms |
| comp_2to1 | 41.95ms | 18.09ms | 30.09ms | 2.76ms | 11.56ms | 38.56ms |
| comp_4to1 | 5.04ms | 9.32ms | 22.64ms | 9.14ms | 2.70ms | 17.42ms |
| comp_1000to1 | 16μs | 6μs | 23μs | 4μs | 5μs | 42μs |
| comp_1to2 | 38.55ms | 16.74ms | 40.89ms | 23.06ms | 20.76ms | 46.69ms |
| comp_1to4 | 21.90ms | 38.76ms | 28.17ms | 12.00ms | 12.65ms | 45.87ms |
| comp_1to8 | 23.87ms | 6.26ms | 22.29ms | 7.32ms | 7.33ms | 43.93ms |
| comp_1to1000 | 15.23ms | 5.64ms | 15.49ms | 3.66ms | 4.79ms | 39.58ms |
| update_1to1 | 17.04ms | 8.13ms | 22.32ms | 10.18ms | 9.19ms | 6.12ms |
| update_2to1 | 8.30ms | 4.07ms | 10.74ms | 3.13ms | 4.58ms | 3.10ms |
| update_4to1 | 4.07ms | 2.14ms | 6.05ms | 1.35ms | 2.35ms | 1.56ms |
| update_1000to1 | 40μs | 21μs | 58μs | 13μs | 23μs | 16μs |
| update_1to2 | 8.67ms | 4.13ms | 10.86ms | 3.44ms | 4.90ms | 3.17ms |
| update_1to4 | 4.04ms | 2.06ms | 5.86ms | 1.47ms | 2.30ms | 1.56ms |
| update_1to1000 | 155μs | 154μs | 166μs | 44μs | 48μs | 386μs |
| cellx1000 | 12.24ms | 10.69ms | 84.97ms | 7.42ms | 10.84ms | 5.99ms |
| cellx2500 | 34.18ms | 27.07ms | 302.17ms | 20.68ms | 38.67ms | 26.18ms |
| cellx5000 | 83.34ms | 74.17ms | 629.30ms | 49.78ms | 86.61ms | 72.74ms |
| 10x5 - 2 sources - read 20.0% (simple) | 357.62ms | 449.02ms | 2.05s | 232.91ms | 512.15ms | 247.55ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 245.27ms | 269.17ms | 1.55s | 175.78ms | 285.89ms | 206.91ms |
| 1000x12 - 4 sources - dynamic (large) | 467.42ms | 3.54s | 1.93s | 285.17ms | 3.89s | 348.53ms |
| 1000x5 - 25 sources (wide dense) | 594.77ms | 2.61s | 3.62s | 419.21ms | 3.58s | 514.15ms |
| 5x500 - 3 sources (deep) | 259.83ms | 234.02ms | 1.19s | 192.21ms | 229.46ms | 208.65ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 384.72ms | 443.11ms | 1.75s | 263.67ms | 478.60ms | 262.59ms |

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
