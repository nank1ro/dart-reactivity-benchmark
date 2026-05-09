# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.77s |
| 🥈 | signals | 0.28 | 100.0% | 35/35 | 10.99s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.42s |
| 4 | preact_signals | 0.23 | 100.0% | 35/35 | 10.74s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.97s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.53s |

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
| Test Case | mobx | signals | alien_signals | preact_signals | solidart(2.0-dev) | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 2.32s | 200.40ms | 199.04ms | 209.52ms | 273.13ms | 149.90ms (fail) |
| broadPropagation | 4.38s | 463.10ms | 362.65ms | 473.19ms | 498.21ms | 6.06ms (fail) |
| deepPropagation | 1.56s | 171.51ms | 130.71ms | 173.76ms | 163.72ms | 138.71ms (fail) |
| diamond | 2.43s | 286.53ms | 246.01ms | 284.36ms | 354.84ms | 184.84ms (fail) |
| mux | 1.86s | 407.23ms | 370.03ms | 382.17ms | 424.67ms | 186.70ms (fail) |
| repeatedObservers | 241.29ms | 45.99ms | 44.90ms | 42.77ms | 81.00ms | 56.65ms (fail) |
| triangle | 766.11ms | 100.97ms | 89.09ms | 100.96ms | 113.45ms | 77.43ms (fail) |
| unstable | 356.47ms | 75.74ms | 62.33ms | 71.94ms | 96.23ms | 338.54ms (fail) |
| molBench | 588.83ms | 495.30ms | 483.30ms | 498.00ms | 494.73ms | 1.40ms |
| create_signals | 91.88ms | 27.07ms | 25.75ms | 5.54ms | 98.85ms | 62.55ms |
| comp_0to1 | 15.14ms | 12.33ms | 7.50ms | 18.97ms | 31.47ms | 58.75ms |
| comp_1to1 | 42.08ms | 21.45ms | 4.51ms | 12.92ms | 47.23ms | 57.34ms |
| comp_2to1 | 24.93ms | 10.78ms | 2.34ms | 25.76ms | 48.31ms | 39.08ms |
| comp_4to1 | 18.35ms | 1.97ms | 8.59ms | 16.79ms | 20.48ms | 17.59ms |
| comp_1000to1 | 15μs | 4μs | 5μs | 9μs | 14μs | 45μs |
| comp_1to2 | 35.45ms | 14.15ms | 19.67ms | 19.96ms | 31.95ms | 47.45ms |
| comp_1to4 | 22.04ms | 13.69ms | 9.61ms | 37.53ms | 21.06ms | 46.76ms |
| comp_1to8 | 24.02ms | 7.71ms | 5.13ms | 7.76ms | 21.29ms | 46.24ms |
| comp_1to1000 | 15.29ms | 4.42ms | 3.62ms | 5.74ms | 14.45ms | 40.72ms |
| update_1to1 | 21.35ms | 9.13ms | 4.64ms | 9.23ms | 15.76ms | 9.71ms |
| update_2to1 | 10.39ms | 4.45ms | 2.40ms | 4.61ms | 8.00ms | 2.85ms |
| update_4to1 | 5.35ms | 2.30ms | 1.25ms | 2.26ms | 3.94ms | 2.85ms |
| update_1000to1 | 53μs | 22μs | 22μs | 23μs | 39μs | 14μs |
| update_1to2 | 10.41ms | 4.48ms | 2.48ms | 4.62ms | 8.04ms | 3.91ms |
| update_1to4 | 5.20ms | 2.28ms | 1.25ms | 2.46ms | 3.98ms | 1.46ms |
| update_1to1000 | 155μs | 44μs | 46μs | 847μs | 147μs | 401μs |
| cellx1000 | 96.73ms | 12.54ms | 7.49ms | 11.51ms | 13.86ms | 9.10ms |
| cellx2500 | 312.12ms | 39.87ms | 25.00ms | 48.74ms | 47.99ms | 41.30ms |
| cellx5000 | 669.21ms | 96.39ms | 61.36ms | 141.87ms | 147.59ms | 114.13ms |
| 10x5 - 2 sources - read 20.0% (simple) | 1.98s | 507.49ms | 238.44ms | 451.40ms | 346.99ms | 244.44ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 1.47s | 285.13ms | 184.72ms | 278.63ms | 248.96ms | 199.87ms |
| 1000x12 - 4 sources - dynamic (large) | 2.00s | 3.50s | 282.91ms | 3.88s | 483.64ms | 354.02ms |
| 1000x5 - 25 sources (wide dense) | 3.46s | 3.46s | 423.99ms | 2.83s | 604.64ms | 516.12ms |
| 5x500 - 3 sources (deep) | 1.40s | 228.16ms | 196.67ms | 235.52ms | 258.19ms | 209.53ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 1.74s | 477.98ms | 266.06ms | 454.16ms | 389.57ms | 260.65ms |

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
