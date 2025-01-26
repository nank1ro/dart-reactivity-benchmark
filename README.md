# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.77 | 100.0% | 35/35 | 3.76s |
| 🥈 | signals | 0.28 | 100.0% | 35/35 | 11.27s |
| 🥉 | preact_signals | 0.27 | 100.0% | 35/35 | 9.84s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 28.17s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 40.98s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.67s |

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
| Test Case | solidart | mobx | state_beacon | signals | alien_signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.25s | 2.34s | 162.31ms (fail) | 208.49ms | 189.24ms | 209.18ms |
| broadPropagation | 5.62s | 4.45s | 6.22ms (fail) | 461.13ms | 357.05ms | 453.94ms |
| deepPropagation | 2.08s | 1.61s | 150.78ms (fail) | 180.95ms | 127.65ms | 175.80ms |
| diamond | 3.53s | 2.47s | 208.90ms (fail) | 286.62ms | 239.20ms | 275.93ms |
| mux | 2.09s | 1.86s | 204.74ms (fail) | 434.14ms | 384.96ms | 392.86ms |
| repeatedObservers | 215.26ms | 234.41ms | 54.62ms (fail) | 44.84ms | 43.89ms | 41.26ms |
| triangle | 1.15s | 784.64ms | 79.73ms (fail) | 100.91ms | 87.34ms | 100.47ms |
| unstable | 348.76ms | 350.61ms | 348.43ms (fail) | 78.25ms | 60.55ms | 67.45ms |
| molBench | 1.72s | 600.05ms | 1.03ms | 493.11ms | 485.05ms | 489.51ms |
| create_signals | 72.18ms | 60.49ms | 78.47ms | 32.69ms | 22.73ms | 5.67ms |
| comp_0to1 | 52.61ms | 37.90ms | 58.29ms | 12.60ms | 5.49ms | 19.79ms |
| comp_1to1 | 47.45ms | 31.44ms | 56.39ms | 26.00ms | 10.34ms | 21.37ms |
| comp_2to1 | 28.04ms | 9.83ms | 38.08ms | 10.23ms | 4.42ms | 16.23ms |
| comp_4to1 | 14.03ms | 24.55ms | 19.21ms | 3.03ms | 7.89ms | 11.50ms |
| comp_1000to1 | 2.53ms | 24μs | 53μs | 6μs | 5μs | 6μs |
| comp_1to2 | 32.95ms | 38.83ms | 51.73ms | 24.90ms | 15.27ms | 32.00ms |
| comp_1to4 | 32.62ms | 20.88ms | 45.29ms | 9.54ms | 9.85ms | 32.23ms |
| comp_1to8 | 27.09ms | 23.82ms | 45.75ms | 7.63ms | 4.26ms | 7.62ms |
| comp_1to1000 | 19.79ms | 15.67ms | 40.76ms | 4.92ms | 3.87ms | 6.36ms |
| update_1to1 | 43.70ms | 28.65ms | 6.68ms | 9.36ms | 4.41ms | 8.78ms |
| update_2to1 | 21.39ms | 14.39ms | 3.38ms | 4.77ms | 2.71ms | 4.38ms |
| update_4to1 | 10.94ms | 7.11ms | 1.81ms | 2.33ms | 1.27ms | 2.27ms |
| update_1000to1 | 118μs | 70μs | 18μs | 23μs | 13μs | 21μs |
| update_1to2 | 21.52ms | 14.40ms | 3.40ms | 4.74ms | 2.58ms | 4.37ms |
| update_1to4 | 11.09ms | 6.92ms | 1.66ms | 2.33ms | 1.37ms | 2.25ms |
| update_1to1000 | 237μs | 194μs | 421μs | 50μs | 46μs | 862μs |
| cellx1000 | 236.68ms | 96.15ms | 6.91ms | 10.24ms | 7.68ms | 10.19ms |
| cellx2500 | 672.43ms | 327.27ms | 35.53ms | 44.98ms | 27.11ms | 34.76ms |
| cellx5000 | 1.35s | 687.02ms | 110.20ms | 111.35ms | 62.77ms | 108.57ms |
| 10x5 - 2 sources - read 20.0% (simple) | 2.72s (partial) | 2.05s | 248.95ms | 512.40ms | 237.49ms | 431.49ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 2.45s (partial) | 1.54s | 205.49ms | 280.45ms | 183.82ms | 272.77ms |
| 1000x12 - 4 sources - dynamic (large) | 4.15s (partial) | 1.87s | 364.84ms | 3.70s | 293.97ms | 3.38s |
| 1000x5 - 25 sources (wide dense) | 5.02s (partial) | 3.62s | 531.27ms | 3.46s | 414.37ms | 2.55s |
| 5x500 - 3 sources (deep) | 2.09s (partial) | 1.19s | 236.69ms | 234.19ms | 203.12ms | 231.31ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 2.84s (partial) | 1.76s | 263.90ms | 481.38ms | 262.10ms | 446.83ms |

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
