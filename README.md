# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.74s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.32s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.56s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.51s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.28s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.52s |

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
| avoidablePropagation | 154.05ms (fail) | 2.32s | 276.21ms | 202.91ms | 205.95ms | 186.71ms |
| broadPropagation | 6.57ms (fail) | 4.48s | 523.26ms | 467.04ms | 452.18ms | 349.80ms |
| deepPropagation | 142.91ms (fail) | 1.58s | 170.13ms | 187.17ms | 176.54ms | 123.09ms |
| diamond | 180.29ms (fail) | 2.47s | 354.53ms | 283.52ms | 280.84ms | 233.54ms |
| mux | 199.18ms (fail) | 1.89s | 445.01ms | 401.69ms | 415.92ms | 376.47ms |
| repeatedObservers | 54.92ms (fail) | 229.57ms | 81.05ms | 40.04ms | 45.04ms | 46.05ms |
| triangle | 82.59ms (fail) | 770.20ms | 116.69ms | 102.88ms | 101.08ms | 85.10ms |
| unstable | 349.06ms (fail) | 347.25ms | 97.77ms | 69.98ms | 80.27ms | 68.38ms |
| molBench | 1.06ms | 574.76ms | 496.17ms | 485.56ms | 487.78ms | 490.80ms |
| create_signals | 69.28ms | 87.34ms | 101.23ms | 5.76ms | 30.41ms | 28.33ms |
| comp_0to1 | 59.11ms | 36.80ms | 53.32ms | 19.33ms | 13.06ms | 9.59ms |
| comp_1to1 | 57.85ms | 49.82ms | 54.08ms | 14.73ms | 32.27ms | 5.48ms |
| comp_2to1 | 39.93ms | 40.26ms | 25.72ms | 12.03ms | 15.01ms | 2.79ms |
| comp_4to1 | 17.92ms | 26.91ms | 10.52ms | 17.81ms | 4.35ms | 10.69ms |
| comp_1000to1 | 63μs | 17μs | 31μs | 7μs | 7μs | 5μs |
| comp_1to2 | 45.74ms | 40.34ms | 35.93ms | 27.89ms | 25.93ms | 18.16ms |
| comp_1to4 | 45.14ms | 18.80ms | 35.91ms | 30.83ms | 16.64ms | 10.62ms |
| comp_1to8 | 42.74ms | 22.12ms | 27.27ms | 8.13ms | 12.07ms | 7.76ms |
| comp_1to1000 | 38.66ms | 16.27ms | 18.72ms | 6.29ms | 4.54ms | 3.87ms |
| update_1to1 | 5.68ms | 23.56ms | 16.00ms | 9.55ms | 8.87ms | 8.55ms |
| update_2to1 | 3.15ms | 11.48ms | 7.87ms | 4.43ms | 4.46ms | 2.29ms |
| update_4to1 | 1.46ms | 7.38ms | 4.02ms | 2.25ms | 2.28ms | 2.64ms |
| update_1000to1 | 14μs | 68μs | 41μs | 21μs | 22μs | 11μs |
| update_1to2 | 2.88ms | 10.88ms | 7.87ms | 4.66ms | 4.47ms | 3.95ms |
| update_1to4 | 1.46ms | 5.65ms | 4.00ms | 2.19ms | 2.24ms | 1.28ms |
| update_1to1000 | 373μs | 180μs | 176μs | 2.76ms | 45μs | 49μs |
| cellx1000 | 6.42ms | 101.94ms | 16.46ms | 13.30ms | 10.63ms | 7.83ms |
| cellx2500 | 36.97ms | 340.81ms | 54.47ms | 37.57ms | 45.67ms | 21.39ms |
| cellx5000 | 97.70ms | 729.12ms | 199.43ms | 150.94ms | 106.88ms | 60.71ms |
| 10x5 - 2 sources - read 20.0% (simple) | 245.75ms | 2.04s | 357.63ms | 435.17ms | 521.98ms | 228.26ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 198.05ms | 1.54s | 247.71ms | 271.02ms | 279.29ms | 177.35ms |
| 1000x12 - 4 sources - dynamic (large) | 361.11ms | 1.96s | 483.89ms | 3.79s | 3.78s | 292.07ms |
| 1000x5 - 25 sources (wide dense) | 504.59ms | 3.58s | 590.86ms | 2.72s | 3.44s | 412.97ms |
| 5x500 - 3 sources (deep) | 206.33ms | 1.18s | 260.07ms | 231.76ms | 227.82ms | 191.72ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 264.10ms | 1.75s | 387.39ms | 456.76ms | 486.99ms | 268.41ms |

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
