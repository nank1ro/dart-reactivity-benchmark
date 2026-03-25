# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.35s |
| 🥈 | signals | 0.30 | 100.0% | 35/35 | 9.26s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 4.99s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 8.88s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.64s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.10s |

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
| Test Case | signals | mobx | state_beacon | alien_signals | preact_signals | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 198.74ms | 2.29s | 135.34ms (fail) | 170.77ms | 185.49ms | 243.10ms |
| broadPropagation | 386.54ms | 4.12s | 5.67ms (fail) | 301.38ms | 383.77ms | 465.15ms |
| deepPropagation | 177.85ms | 1.44s | 154.58ms (fail) | 107.28ms | 185.16ms | 151.64ms |
| diamond | 258.34ms | 2.22s | 176.52ms (fail) | 233.67ms | 252.90ms | 344.24ms |
| mux | 327.81ms | 1.86s | 160.88ms (fail) | 328.82ms | 328.38ms | 390.46ms |
| repeatedObservers | 39.93ms | 225.91ms | 45.26ms (fail) | 39.37ms | 33.56ms | 72.38ms |
| triangle | 92.67ms | 732.36ms | 75.28ms (fail) | 80.19ms | 91.43ms | 112.18ms |
| unstable | 66.59ms | 320.33ms | 321.32ms (fail) | 59.54ms | 58.80ms | 96.43ms |
| molBench | 366.90ms | 458.48ms | 845μs | 364.16ms | 389.70ms | 370.86ms |
| create_signals | 24.69ms | 72.34ms | 68.15ms | 33.51ms | 9.17ms | 77.49ms |
| comp_0to1 | 11.97ms | 27.84ms | 60.70ms | 9.54ms | 22.10ms | 28.76ms |
| comp_1to1 | 17.12ms | 54.29ms | 59.88ms | 6.04ms | 15.63ms | 56.44ms |
| comp_2to1 | 8.77ms | 25.09ms | 36.85ms | 3.47ms | 25.52ms | 36.40ms |
| comp_4to1 | 2.64ms | 28.75ms | 17.29ms | 10.73ms | 12.74ms | 5.91ms |
| comp_1000to1 | 6μs | 18μs | 42μs | 11μs | 9μs | 18μs |
| comp_1to2 | 23.68ms | 43.08ms | 47.27ms | 17.57ms | 29.25ms | 39.26ms |
| comp_1to4 | 9.56ms | 27.55ms | 47.98ms | 9.11ms | 36.81ms | 22.49ms |
| comp_1to8 | 9.00ms | 27.65ms | 46.12ms | 8.85ms | 9.21ms | 22.44ms |
| comp_1to1000 | 5.91ms | 16.80ms | 40.70ms | 4.45ms | 7.76ms | 15.46ms |
| update_1to1 | 8.46ms | 21.01ms | 4.43ms | 3.91ms | 7.84ms | 14.53ms |
| update_2to1 | 4.11ms | 9.97ms | 2.42ms | 1.83ms | 3.83ms | 7.20ms |
| update_4to1 | 2.06ms | 5.25ms | 1.17ms | 1.33ms | 1.99ms | 3.63ms |
| update_1000to1 | 21μs | 49μs | 10μs | 9μs | 21μs | 35μs |
| update_1to2 | 4.45ms | 10.41ms | 2.27ms | 1.90ms | 3.82ms | 7.40ms |
| update_1to4 | 2.31ms | 5.00ms | 1.16ms | 984μs | 2.06ms | 3.66ms |
| update_1to1000 | 62μs | 205μs | 417μs | 38μs | 567μs | 158μs |
| cellx1000 | 12.67ms | 102.39ms | 9.47ms | 9.54ms | 12.07ms | 21.03ms |
| cellx2500 | 40.15ms | 304.27ms | 33.23ms | 30.02ms | 34.25ms | 66.44ms |
| cellx5000 | 91.44ms | 611.83ms | 70.03ms | 73.48ms | 86.87ms | 182.00ms |
| 10x5 - 2 sources - read 20.0% (simple) | 426.08ms | 2.05s | 224.56ms | 229.42ms | 395.41ms | 366.08ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 241.35ms | 1.47s | 173.50ms | 172.62ms | 235.46ms | 252.03ms |
| 1000x12 - 4 sources - dynamic (large) | 3.16s | 1.76s | 275.10ms | 250.01ms | 3.07s | 376.90ms |
| 1000x5 - 25 sources (wide dense) | 2.62s | 3.41s | 379.95ms | 352.89ms | 2.33s | 543.85ms |
| 5x500 - 3 sources (deep) | 216.24ms | 1.18s | 204.47ms | 209.18ms | 231.16ms | 277.75ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 401.30ms | 1.72s | 221.36ms | 222.47ms | 393.07ms | 313.93ms |

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
