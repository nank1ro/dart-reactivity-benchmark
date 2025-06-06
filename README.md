# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.66s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 11.33s |
| 🥉 | preact_signals | 0.25 | 100.0% | 35/35 | 10.28s |
| 4 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.34s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 27.89s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.47s |

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
| Test Case | state_beacon | alien_signals | mobx | solidart(2.0-dev) | signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 150.11ms (fail) | 183.32ms | 2.34s | 278.11ms | 210.60ms | 201.42ms |
| broadPropagation | 6.04ms (fail) | 347.25ms | 4.46s | 514.87ms | 451.57ms | 451.91ms |
| deepPropagation | 141.31ms (fail) | 117.20ms | 1.59s | 167.04ms | 176.45ms | 176.47ms |
| diamond | 192.15ms (fail) | 236.70ms | 2.46s | 350.98ms | 282.22ms | 282.48ms |
| mux | 190.66ms (fail) | 368.08ms | 1.84s | 440.86ms | 422.00ms | 403.79ms |
| repeatedObservers | 52.80ms (fail) | 47.13ms | 234.55ms | 81.11ms | 45.19ms | 40.49ms |
| triangle | 86.31ms (fail) | 85.02ms | 765.44ms | 119.36ms | 98.47ms | 98.05ms |
| unstable | 338.08ms (fail) | 66.87ms | 354.99ms | 102.41ms | 80.64ms | 70.29ms |
| molBench | 913μs | 481.65ms | 572.61ms | 493.58ms | 485.70ms | 488.38ms |
| create_signals | 72.14ms | 28.00ms | 52.62ms | 99.65ms | 24.79ms | 5.38ms |
| comp_0to1 | 61.85ms | 7.74ms | 16.70ms | 37.62ms | 12.08ms | 16.94ms |
| comp_1to1 | 60.21ms | 4.22ms | 53.51ms | 44.21ms | 26.71ms | 14.22ms |
| comp_2to1 | 40.87ms | 2.34ms | 33.99ms | 38.80ms | 11.45ms | 16.23ms |
| comp_4to1 | 19.09ms | 7.58ms | 32.08ms | 12.24ms | 2.07ms | 12.50ms |
| comp_1000to1 | 41μs | 3μs | 28μs | 17μs | 5μs | 5μs |
| comp_1to2 | 48.32ms | 10.05ms | 40.31ms | 30.60ms | 19.79ms | 17.63ms |
| comp_1to4 | 48.63ms | 11.65ms | 24.02ms | 23.34ms | 7.91ms | 37.25ms |
| comp_1to8 | 44.96ms | 4.94ms | 25.30ms | 25.30ms | 6.16ms | 8.02ms |
| comp_1to1000 | 40.21ms | 3.58ms | 16.66ms | 17.29ms | 5.89ms | 5.05ms |
| update_1to1 | 5.70ms | 10.40ms | 23.95ms | 15.87ms | 9.41ms | 8.65ms |
| update_2to1 | 3.24ms | 2.27ms | 11.44ms | 7.79ms | 4.64ms | 5.74ms |
| update_4to1 | 1.45ms | 2.49ms | 6.48ms | 4.00ms | 2.38ms | 2.17ms |
| update_1000to1 | 15μs | 29μs | 69μs | 40μs | 23μs | 21μs |
| update_1to2 | 2.84ms | 5.03ms | 11.14ms | 8.01ms | 4.93ms | 4.61ms |
| update_1to4 | 1.45ms | 2.52ms | 5.67ms | 4.00ms | 2.41ms | 2.17ms |
| update_1to1000 | 391μs | 47μs | 177μs | 171μs | 42μs | 161μs |
| cellx1000 | 5.27ms | 7.06ms | 76.39ms | 13.38ms | 9.70ms | 9.77ms |
| cellx2500 | 25.21ms | 19.29ms | 273.22ms | 35.05ms | 32.03ms | 27.57ms |
| cellx5000 | 79.87ms | 42.10ms | 615.73ms | 98.40ms | 75.62ms | 75.62ms |
| 10x5 - 2 sources - read 20.0% (simple) | 254.89ms | 232.70ms | 2.03s | 351.01ms | 555.97ms | 433.98ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 205.52ms | 188.47ms | 1.53s | 244.60ms | 294.87ms | 275.33ms |
| 1000x12 - 4 sources - dynamic (large) | 346.16ms | 274.76ms | 1.93s | 464.67ms | 3.88s | 3.68s |
| 1000x5 - 25 sources (wide dense) | 479.07ms | 409.32ms | 3.56s | 586.09ms | 3.37s | 2.72s |
| 5x500 - 3 sources (deep) | 204.87ms | 186.40ms | 1.17s | 247.67ms | 228.48ms | 234.08ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 254.53ms | 261.72ms | 1.73s | 379.99ms | 491.63ms | 451.84ms |

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
