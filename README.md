# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.74s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.40s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.28s |
| 4 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.45s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.93s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.54s |

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
| avoidablePropagation | 214.09ms | 193.19ms | 163.84ms (fail) | 262.10ms | 215.98ms | 2.34s |
| broadPropagation | 459.60ms | 355.08ms | 6.28ms (fail) | 495.87ms | 458.75ms | 4.31s |
| deepPropagation | 176.44ms | 131.23ms | 140.92ms (fail) | 164.36ms | 182.08ms | 1.54s |
| diamond | 288.85ms | 237.06ms | 183.06ms (fail) | 351.91ms | 280.82ms | 2.45s |
| mux | 408.30ms | 380.11ms | 198.74ms (fail) | 439.09ms | 394.46ms | 1.85s |
| repeatedObservers | 46.49ms | 43.58ms | 52.69ms (fail) | 81.50ms | 40.18ms | 233.97ms |
| triangle | 101.78ms | 84.52ms | 77.89ms (fail) | 114.51ms | 98.48ms | 791.12ms |
| unstable | 77.52ms | 58.95ms | 355.96ms (fail) | 95.09ms | 74.44ms | 343.48ms |
| molBench | 485.67ms | 491.72ms | 970μs | 498.35ms | 477.71ms | 584.97ms |
| create_signals | 25.12ms | 28.67ms | 63.88ms | 57.40ms | 5.43ms | 67.33ms |
| comp_0to1 | 10.84ms | 8.47ms | 58.31ms | 26.02ms | 18.95ms | 16.38ms |
| comp_1to1 | 26.68ms | 4.21ms | 60.20ms | 39.92ms | 11.00ms | 40.53ms |
| comp_2to1 | 8.88ms | 2.29ms | 39.90ms | 34.21ms | 11.78ms | 35.93ms |
| comp_4to1 | 1.83ms | 8.20ms | 17.69ms | 4.35ms | 9.89ms | 27.87ms |
| comp_1000to1 | 5μs | 4μs | 47μs | 19μs | 4μs | 21μs |
| comp_1to2 | 22.71ms | 11.80ms | 49.26ms | 40.08ms | 16.54ms | 41.94ms |
| comp_1to4 | 13.15ms | 11.99ms | 47.16ms | 21.78ms | 24.72ms | 23.27ms |
| comp_1to8 | 7.17ms | 5.39ms | 46.96ms | 22.48ms | 7.15ms | 25.01ms |
| comp_1to1000 | 4.57ms | 3.55ms | 42.31ms | 14.17ms | 5.83ms | 15.52ms |
| update_1to1 | 10.39ms | 10.03ms | 6.01ms | 16.39ms | 8.31ms | 28.50ms |
| update_2to1 | 5.05ms | 2.18ms | 3.34ms | 8.14ms | 4.37ms | 14.24ms |
| update_4to1 | 2.59ms | 2.46ms | 1.52ms | 4.16ms | 2.10ms | 6.34ms |
| update_1000to1 | 25μs | 10μs | 15μs | 40μs | 20μs | 69μs |
| update_1to2 | 4.55ms | 4.96ms | 3.02ms | 8.41ms | 4.08ms | 11.89ms |
| update_1to4 | 2.57ms | 2.42ms | 1.50ms | 4.10ms | 2.10ms | 7.05ms |
| update_1to1000 | 42μs | 47μs | 419μs | 152μs | 173μs | 171μs |
| cellx1000 | 9.55ms | 8.00ms | 7.70ms | 17.27ms | 9.68ms | 122.85ms |
| cellx2500 | 31.43ms | 29.08ms | 35.08ms | 81.12ms | 29.46ms | 319.80ms |
| cellx5000 | 62.43ms | 62.82ms | 106.65ms | 195.08ms | 76.26ms | 659.96ms |
| 10x5 - 2 sources - read 20.0% (simple) | 508.48ms | 225.98ms | 244.49ms | 357.05ms | 445.55ms | 2.02s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 279.90ms | 179.90ms | 197.90ms | 248.83ms | 276.98ms | 1.52s |
| 1000x12 - 4 sources - dynamic (large) | 3.81s | 286.17ms | 348.82ms | 477.95ms | 3.74s | 1.91s |
| 1000x5 - 25 sources (wide dense) | 3.47s | 402.12ms | 512.36ms | 619.35ms | 2.77s | 3.68s |
| 5x500 - 3 sources (deep) | 223.49ms | 192.93ms | 206.71ms | 254.49ms | 227.85ms | 1.16s |
| 100x15 - 6 sources - dynamic (very dynamic) | 476.35ms | 268.45ms | 261.98ms | 392.65ms | 463.42ms | 1.74s |

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
