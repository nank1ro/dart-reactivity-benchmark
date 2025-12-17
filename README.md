# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.75 | 100.0% | 35/35 | 3.65s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.28s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.21s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.01s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.04s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.35s |

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
| avoidablePropagation | 217.24ms | 187.73ms | 145.15ms (fail) | 277.22ms | 212.32ms | 2.37s |
| broadPropagation | 454.69ms | 356.34ms | 5.89ms (fail) | 516.61ms | 462.84ms | 4.39s |
| deepPropagation | 169.62ms | 131.63ms | 138.25ms (fail) | 170.23ms | 183.24ms | 1.49s |
| diamond | 284.74ms | 233.55ms | 181.63ms (fail) | 355.68ms | 283.08ms | 2.38s |
| mux | 387.66ms | 352.96ms | 179.35ms (fail) | 420.85ms | 376.56ms | 1.86s |
| repeatedObservers | 50.95ms | 43.35ms | 52.38ms (fail) | 81.65ms | 40.44ms | 231.21ms |
| triangle | 100.99ms | 85.94ms | 76.88ms (fail) | 121.41ms | 100.09ms | 746.59ms |
| unstable | 78.00ms | 62.89ms | 336.59ms (fail) | 96.69ms | 69.50ms | 349.21ms |
| molBench | 495.03ms | 485.12ms | 969μs | 491.31ms | 484.79ms | 590.89ms |
| create_signals | 26.48ms | 21.54ms | 57.25ms | 88.59ms | 14.39ms | 52.09ms |
| comp_0to1 | 11.12ms | 7.89ms | 51.94ms | 41.76ms | 18.07ms | 15.81ms |
| comp_1to1 | 17.79ms | 4.29ms | 52.53ms | 45.26ms | 7.16ms | 40.65ms |
| comp_2to1 | 8.98ms | 2.30ms | 35.36ms | 24.57ms | 19.49ms | 35.37ms |
| comp_4to1 | 1.92ms | 8.61ms | 15.84ms | 4.44ms | 9.00ms | 23.09ms |
| comp_1000to1 | 8μs | 4μs | 39μs | 15μs | 6μs | 16μs |
| comp_1to2 | 13.81ms | 15.78ms | 43.73ms | 31.36ms | 16.72ms | 35.05ms |
| comp_1to4 | 16.02ms | 9.58ms | 43.42ms | 21.13ms | 21.21ms | 18.07ms |
| comp_1to8 | 11.03ms | 6.89ms | 41.71ms | 22.52ms | 7.23ms | 20.46ms |
| comp_1to1000 | 3.98ms | 3.38ms | 37.81ms | 14.57ms | 6.09ms | 15.65ms |
| update_1to1 | 9.31ms | 4.63ms | 6.10ms | 15.45ms | 8.88ms | 25.44ms |
| update_2to1 | 5.05ms | 2.34ms | 3.05ms | 7.74ms | 4.35ms | 13.68ms |
| update_4to1 | 2.37ms | 1.18ms | 1.56ms | 3.88ms | 2.23ms | 7.03ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 65μs |
| update_1to2 | 4.94ms | 2.43ms | 3.05ms | 7.87ms | 4.37ms | 13.89ms |
| update_1to4 | 2.57ms | 1.17ms | 1.58ms | 3.86ms | 2.22ms | 6.93ms |
| update_1to1000 | 62μs | 30μs | 377μs | 148μs | 891μs | 160μs |
| cellx1000 | 9.55ms | 7.34ms | 5.12ms | 11.94ms | 9.47ms | 76.01ms |
| cellx2500 | 25.86ms | 19.18ms | 25.23ms | 33.47ms | 25.82ms | 260.41ms |
| cellx5000 | 61.38ms | 41.63ms | 63.46ms | 81.57ms | 66.51ms | 554.41ms |
| 10x5 - 2 sources - read 20.0% (simple) | 507.02ms | 233.94ms | 235.93ms | 363.60ms | 432.64ms | 1.92s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 277.00ms | 172.23ms | 194.98ms | 244.13ms | 268.02ms | 1.45s |
| 1000x12 - 4 sources - dynamic (large) | 3.91s | 277.81ms | 338.50ms | 462.23ms | 3.65s | 1.85s |
| 1000x5 - 25 sources (wide dense) | 3.34s | 414.66ms | 519.64ms | 589.19ms | 2.52s | 3.46s |
| 5x500 - 3 sources (deep) | 225.83ms | 191.59ms | 202.20ms | 251.86ms | 228.63ms | 1.09s |
| 100x15 - 6 sources - dynamic (very dynamic) | 474.26ms | 261.87ms | 255.08ms | 373.93ms | 453.15ms | 1.64s |

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
