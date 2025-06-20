# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.70 | 100.0% | 35/35 | 3.70s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.46s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.36s |
| 4 | signals | 0.26 | 100.0% | 35/35 | 11.32s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.22s |
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
| Test Case | solidart(2.0-dev) | signals | mobx | preact_signals | state_beacon | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 282.16ms | 206.48ms | 2.36s | 201.41ms | 147.43ms (fail) | 184.36ms |
| broadPropagation | 499.67ms | 456.06ms | 4.56s | 498.39ms | 6.24ms (fail) | 344.46ms |
| deepPropagation | 166.28ms | 169.50ms | 1.58s | 177.98ms | 141.03ms (fail) | 120.47ms |
| diamond | 347.38ms | 279.30ms | 2.49s | 295.87ms | 182.04ms (fail) | 229.22ms |
| mux | 442.42ms | 412.23ms | 1.85s | 406.57ms | 190.77ms (fail) | 371.06ms |
| repeatedObservers | 81.91ms | 45.19ms | 237.45ms | 41.39ms | 52.30ms (fail) | 47.49ms |
| triangle | 119.72ms | 101.10ms | 763.53ms | 103.51ms | 83.75ms (fail) | 84.32ms |
| unstable | 99.01ms | 78.14ms | 358.01ms | 73.55ms | 335.63ms (fail) | 66.71ms |
| molBench | 493.93ms | 485.74ms | 578.86ms | 490.87ms | 965μs | 488.21ms |
| create_signals | 78.87ms | 25.80ms | 91.83ms | 11.03ms | 71.34ms | 27.52ms |
| comp_0to1 | 29.21ms | 12.38ms | 16.45ms | 23.04ms | 57.97ms | 8.07ms |
| comp_1to1 | 47.97ms | 33.26ms | 52.88ms | 7.77ms | 63.85ms | 4.46ms |
| comp_2to1 | 38.88ms | 9.45ms | 24.59ms | 13.89ms | 44.79ms | 2.50ms |
| comp_4to1 | 12.79ms | 3.35ms | 14.98ms | 14.14ms | 17.38ms | 10.36ms |
| comp_1000to1 | 18μs | 4μs | 17μs | 5μs | 42μs | 4μs |
| comp_1to2 | 31.05ms | 20.93ms | 45.18ms | 15.91ms | 48.28ms | 11.74ms |
| comp_1to4 | 23.91ms | 11.02ms | 18.67ms | 30.83ms | 47.42ms | 14.97ms |
| comp_1to8 | 24.32ms | 6.51ms | 20.75ms | 7.67ms | 44.27ms | 4.56ms |
| comp_1to1000 | 17.55ms | 4.35ms | 16.19ms | 4.84ms | 39.02ms | 3.36ms |
| update_1to1 | 16.14ms | 8.89ms | 24.59ms | 8.78ms | 5.68ms | 10.21ms |
| update_2to1 | 7.85ms | 8.13ms | 11.07ms | 4.29ms | 3.10ms | 2.27ms |
| update_4to1 | 4.00ms | 4.07ms | 6.23ms | 2.20ms | 1.48ms | 2.58ms |
| update_1000to1 | 40μs | 40μs | 70μs | 21μs | 15μs | 24μs |
| update_1to2 | 8.04ms | 6.81ms | 11.41ms | 4.67ms | 2.86ms | 5.07ms |
| update_1to4 | 4.00ms | 2.23ms | 6.18ms | 2.23ms | 1.47ms | 2.47ms |
| update_1to1000 | 173μs | 47μs | 173μs | 41μs | 392μs | 46μs |
| cellx1000 | 12.95ms | 10.08ms | 73.88ms | 11.99ms | 6.29ms | 7.71ms |
| cellx2500 | 46.61ms | 36.40ms | 262.41ms | 32.88ms | 34.45ms | 23.00ms |
| cellx5000 | 120.36ms | 77.44ms | 617.64ms | 97.42ms | 94.35ms | 62.93ms |
| 10x5 - 2 sources - read 20.0% (simple) | 356.52ms | 509.49ms | 2.06s | 445.33ms | 250.89ms | 229.51ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 248.32ms | 286.00ms | 1.52s | 276.20ms | 200.22ms | 174.94ms |
| 1000x12 - 4 sources - dynamic (large) | 471.35ms | 3.83s | 1.96s | 3.75s | 350.87ms | 285.85ms |
| 1000x5 - 25 sources (wide dense) | 591.52ms | 3.46s | 3.63s | 2.72s | 507.69ms | 413.28ms |
| 5x500 - 3 sources (deep) | 252.83ms | 225.41ms | 1.20s | 233.19ms | 209.63ms | 190.22ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 384.81ms | 496.15ms | 1.76s | 455.39ms | 261.02ms | 264.82ms |

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
