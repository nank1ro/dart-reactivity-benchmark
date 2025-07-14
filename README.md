# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.29s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 10.29s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.44s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.00s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.44s |

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
| Test Case | state_beacon | mobx | solidart(2.0-dev) | preact_signals | signals | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 161.71ms (fail) | 2.36s | 282.32ms | 198.85ms | 208.92ms | 186.54ms |
| broadPropagation | 6.06ms (fail) | 4.49s | 503.36ms | 450.47ms | 452.78ms | 344.89ms |
| deepPropagation | 137.68ms (fail) | 1.55s | 170.42ms | 177.44ms | 168.75ms | 122.34ms |
| diamond | 184.39ms (fail) | 2.48s | 350.21ms | 281.21ms | 279.71ms | 229.87ms |
| mux | 193.15ms (fail) | 1.84s | 436.20ms | 401.08ms | 409.42ms | 371.25ms |
| repeatedObservers | 52.61ms (fail) | 235.60ms | 81.59ms | 39.71ms | 44.71ms | 45.40ms |
| triangle | 76.72ms (fail) | 789.82ms | 120.39ms | 100.60ms | 99.62ms | 84.29ms |
| unstable | 337.00ms (fail) | 358.98ms | 97.82ms | 70.68ms | 79.06ms | 67.17ms |
| molBench | 967μs | 573.36ms | 492.29ms | 482.02ms | 487.18ms | 487.14ms |
| create_signals | 70.17ms | 56.15ms | 68.30ms | 4.56ms | 26.39ms | 27.82ms |
| comp_0to1 | 64.34ms | 16.45ms | 37.46ms | 23.18ms | 12.22ms | 7.80ms |
| comp_1to1 | 59.62ms | 46.19ms | 50.84ms | 14.95ms | 18.94ms | 4.30ms |
| comp_2to1 | 39.78ms | 28.03ms | 11.64ms | 17.44ms | 9.45ms | 2.37ms |
| comp_4to1 | 18.13ms | 27.44ms | 16.27ms | 13.98ms | 8.97ms | 7.68ms |
| comp_1000to1 | 43μs | 16μs | 22μs | 4μs | 4μs | 3μs |
| comp_1to2 | 47.48ms | 36.34ms | 32.61ms | 18.01ms | 15.81ms | 9.91ms |
| comp_1to4 | 45.56ms | 18.81ms | 27.24ms | 36.29ms | 22.66ms | 11.87ms |
| comp_1to8 | 44.61ms | 21.54ms | 27.46ms | 8.03ms | 5.93ms | 5.04ms |
| comp_1to1000 | 39.80ms | 16.20ms | 16.89ms | 5.16ms | 6.20ms | 3.75ms |
| update_1to1 | 5.64ms | 27.13ms | 16.08ms | 8.75ms | 8.97ms | 10.41ms |
| update_2to1 | 3.11ms | 13.28ms | 7.84ms | 4.29ms | 4.50ms | 2.27ms |
| update_4to1 | 1.45ms | 6.70ms | 4.00ms | 2.14ms | 2.25ms | 2.59ms |
| update_1000to1 | 15μs | 63μs | 40μs | 21μs | 22μs | 26μs |
| update_1to2 | 2.85ms | 12.62ms | 8.07ms | 4.58ms | 4.46ms | 5.14ms |
| update_1to4 | 1.46ms | 6.67ms | 4.03ms | 2.15ms | 2.21ms | 2.52ms |
| update_1to1000 | 389μs | 182μs | 170μs | 160μs | 44μs | 50μs |
| cellx1000 | 5.92ms | 81.23ms | 12.10ms | 9.65ms | 10.22ms | 7.34ms |
| cellx2500 | 22.06ms | 269.16ms | 35.37ms | 27.48ms | 28.22ms | 20.71ms |
| cellx5000 | 65.45ms | 611.97ms | 81.20ms | 80.77ms | 68.46ms | 52.47ms |
| 10x5 - 2 sources - read 20.0% (simple) | 242.20ms | 2.03s | 360.54ms | 439.51ms | 518.06ms | 229.99ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 199.92ms | 1.53s | 244.38ms | 268.13ms | 281.71ms | 178.00ms |
| 1000x12 - 4 sources - dynamic (large) | 342.10ms | 1.97s | 465.44ms | 3.70s | 3.96s | 286.20ms |
| 1000x5 - 25 sources (wide dense) | 502.06ms | 3.59s | 586.38ms | 2.71s | 3.48s | 413.07ms |
| 5x500 - 3 sources (deep) | 205.31ms | 1.18s | 255.06ms | 225.46ms | 223.40ms | 191.28ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 261.52ms | 1.72s | 386.59ms | 452.93ms | 493.62ms | 267.83ms |

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
