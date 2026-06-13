# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.71 | 100.0% | 35/35 | 3.75s |
| 🥈 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.35s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 10.91s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 9.91s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 26.85s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.38s |

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
| Test Case | preact_signals | state_beacon | signals | alien_signals | mobx | solidart(2.0-dev) |
|---|---|---|---|---|---|---|
| avoidablePropagation | 210.55ms | 158.63ms (fail) | 211.47ms | 184.77ms | 2.33s | 265.61ms |
| broadPropagation | 517.01ms | 6.24ms (fail) | 473.79ms | 357.00ms | 4.19s | 491.87ms |
| deepPropagation | 190.47ms | 155.77ms (fail) | 179.58ms | 118.62ms | 1.47s | 165.56ms |
| diamond | 284.41ms | 187.37ms (fail) | 288.71ms | 264.39ms | 2.27s | 375.31ms |
| mux | 388.19ms | 189.91ms (fail) | 394.06ms | 365.03ms | 1.72s | 422.73ms |
| repeatedObservers | 41.75ms | 54.28ms (fail) | 46.50ms | 43.00ms | 235.98ms | 89.21ms |
| triangle | 107.00ms | 81.09ms (fail) | 106.77ms | 88.14ms | 728.40ms | 122.46ms |
| unstable | 72.97ms | 342.36ms (fail) | 79.52ms | 60.09ms | 348.47ms | 106.39ms |
| molBench | 547.05ms | 1.08ms | 547.72ms | 553.50ms | 639.82ms | 559.10ms |
| create_signals | 5.76ms | 69.60ms | 28.87ms | 29.67ms | 99.43ms | 55.76ms |
| comp_0to1 | 20.41ms | 59.49ms | 12.20ms | 11.19ms | 15.15ms | 27.04ms |
| comp_1to1 | 15.08ms | 54.55ms | 26.16ms | 4.91ms | 33.32ms | 29.32ms |
| comp_2to1 | 20.81ms | 37.75ms | 13.90ms | 2.31ms | 34.00ms | 41.62ms |
| comp_4to1 | 12.94ms | 18.19ms | 2.28ms | 12.29ms | 29.11ms | 14.49ms |
| comp_1000to1 | 4μs | 40μs | 6μs | 4μs | 15μs | 16μs |
| comp_1to2 | 28.00ms | 44.60ms | 23.73ms | 21.40ms | 37.15ms | 36.27ms |
| comp_1to4 | 32.19ms | 43.79ms | 7.47ms | 7.30ms | 19.41ms | 22.44ms |
| comp_1to8 | 7.21ms | 41.07ms | 6.13ms | 3.91ms | 22.52ms | 19.80ms |
| comp_1to1000 | 6.35ms | 36.51ms | 3.95ms | 3.54ms | 14.60ms | 14.58ms |
| update_1to1 | 8.46ms | 6.22ms | 9.78ms | 4.31ms | 23.45ms | 16.29ms |
| update_2to1 | 4.21ms | 3.18ms | 5.16ms | 2.26ms | 11.45ms | 8.11ms |
| update_4to1 | 2.20ms | 1.58ms | 2.52ms | 1.11ms | 5.84ms | 4.13ms |
| update_1000to1 | 21μs | 16μs | 25μs | 11μs | 56μs | 53μs |
| update_1to2 | 4.20ms | 3.15ms | 4.86ms | 2.24ms | 11.36ms | 8.36ms |
| update_1to4 | 2.11ms | 1.60ms | 2.58ms | 1.09ms | 5.80ms | 4.12ms |
| update_1to1000 | 534μs | 356μs | 40μs | 28μs | 153μs | 143μs |
| cellx1000 | 9.92ms | 4.78ms | 9.34ms | 7.12ms | 73.55ms | 10.96ms |
| cellx2500 | 27.14ms | 25.99ms | 31.90ms | 19.80ms | 254.67ms | 32.34ms |
| cellx5000 | 75.59ms | 82.53ms | 64.84ms | 45.77ms | 603.53ms | 75.56ms |
| 10x5 - 2 sources - read 20.0% (simple) | 439.63ms | 249.83ms | 476.66ms | 244.37ms | 2.00s | 374.39ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 261.75ms | 196.25ms | 270.49ms | 184.69ms | 1.43s | 271.54ms |
| 1000x12 - 4 sources - dynamic (large) | 3.37s | 316.19ms | 3.56s | 266.38ms | 1.85s | 443.18ms |
| 1000x5 - 25 sources (wide dense) | 2.52s | 463.52ms | 3.32s | 412.29ms | 3.49s | 635.39ms |
| 5x500 - 3 sources (deep) | 249.96ms | 203.38ms | 230.78ms | 189.43ms | 1.16s | 267.24ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 427.64ms | 235.77ms | 469.95ms | 235.17ms | 1.70s | 342.20ms |

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
