# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.74s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.29s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.26s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.37s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.46s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.56s |

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
| Test Case | preact_signals | state_beacon | solidart(2.0-dev) | signals | alien_signals | mobx |
|---|---|---|---|---|---|---|
| avoidablePropagation | 201.50ms | 176.97ms (fail) | 264.20ms | 210.47ms | 194.01ms | 2.37s |
| broadPropagation | 457.87ms | 6.55ms (fail) | 507.45ms | 464.03ms | 361.67ms | 4.35s |
| deepPropagation | 173.76ms | 143.22ms (fail) | 161.10ms | 180.65ms | 131.36ms | 1.55s |
| diamond | 278.12ms | 188.53ms (fail) | 355.54ms | 285.77ms | 237.81ms | 2.42s |
| mux | 389.67ms | 196.26ms (fail) | 428.43ms | 414.83ms | 378.06ms | 1.83s |
| repeatedObservers | 40.28ms | 52.57ms (fail) | 80.61ms | 46.51ms | 43.97ms | 234.47ms |
| triangle | 99.23ms | 88.41ms (fail) | 113.45ms | 102.21ms | 85.84ms | 767.78ms |
| unstable | 74.18ms | 343.46ms (fail) | 95.24ms | 77.78ms | 60.35ms | 350.76ms |
| molBench | 483.63ms | 957μs | 501.29ms | 485.78ms | 491.32ms | 586.01ms |
| create_signals | 5.20ms | 62.81ms | 94.97ms | 25.77ms | 26.23ms | 51.23ms |
| comp_0to1 | 17.66ms | 57.46ms | 37.04ms | 11.53ms | 7.41ms | 15.93ms |
| comp_1to1 | 12.63ms | 58.45ms | 47.77ms | 21.73ms | 4.22ms | 37.42ms |
| comp_2to1 | 17.54ms | 39.00ms | 23.67ms | 19.08ms | 2.32ms | 21.94ms |
| comp_4to1 | 10.78ms | 17.31ms | 10.70ms | 1.95ms | 9.92ms | 16.34ms |
| comp_1000to1 | 9μs | 47μs | 16μs | 6μs | 3μs | 15μs |
| comp_1to2 | 20.38ms | 52.98ms | 31.74ms | 19.13ms | 10.74ms | 39.80ms |
| comp_1to4 | 29.12ms | 51.69ms | 19.52ms | 11.82ms | 8.85ms | 17.15ms |
| comp_1to8 | 5.64ms | 48.02ms | 23.68ms | 6.47ms | 4.99ms | 19.98ms |
| comp_1to1000 | 6.62ms | 43.54ms | 14.39ms | 4.42ms | 3.42ms | 14.98ms |
| update_1to1 | 8.31ms | 6.00ms | 16.33ms | 10.27ms | 10.33ms | 28.42ms |
| update_2to1 | 4.42ms | 3.10ms | 8.04ms | 4.80ms | 2.15ms | 13.91ms |
| update_4to1 | 2.11ms | 1.55ms | 4.06ms | 2.62ms | 2.53ms | 7.16ms |
| update_1000to1 | 20μs | 15μs | 40μs | 26μs | 22μs | 79μs |
| update_1to2 | 4.09ms | 3.01ms | 8.45ms | 4.85ms | 5.04ms | 12.12ms |
| update_1to4 | 2.08ms | 1.55ms | 4.07ms | 2.61ms | 2.11ms | 7.01ms |
| update_1to1000 | 893μs | 430μs | 151μs | 43μs | 45μs | 168μs |
| cellx1000 | 9.77ms | 5.38ms | 12.45ms | 9.87ms | 8.85ms | 71.69ms |
| cellx2500 | 26.61ms | 28.01ms | 35.67ms | 35.48ms | 21.58ms | 253.49ms |
| cellx5000 | 82.08ms | 67.75ms | 79.75ms | 73.65ms | 43.73ms | 554.35ms |
| 10x5 - 2 sources - read 20.0% (simple) | 441.73ms | 255.47ms | 351.30ms | 512.60ms | 238.40ms | 2.03s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 277.88ms | 212.51ms | 249.79ms | 281.82ms | 180.89ms | 1.53s |
| 1000x12 - 4 sources - dynamic (large) | 3.77s | 360.08ms | 461.02ms | 3.77s | 285.25ms | 1.92s |
| 1000x5 - 25 sources (wide dense) | 2.72s | 513.01ms | 609.30ms | 3.45s | 413.94ms | 3.51s |
| 5x500 - 3 sources (deep) | 231.77ms | 211.63ms | 253.73ms | 220.75ms | 192.31ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 464.88ms | 262.83ms | 388.78ms | 490.54ms | 270.34ms | 1.69s |

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
