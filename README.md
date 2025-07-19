# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.67s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.21s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.41s |
| 4 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.37s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.97s |
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
| Test Case | state_beacon | mobx | solidart(2.0-dev) | preact_signals | signals | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 148.36ms (fail) | 2.35s | 282.89ms | 200.90ms | 209.76ms | 183.04ms |
| broadPropagation | 6.05ms (fail) | 4.52s | 508.48ms | 443.94ms | 461.98ms | 348.45ms |
| deepPropagation | 138.10ms (fail) | 1.56s | 167.74ms | 178.68ms | 175.25ms | 124.92ms |
| diamond | 182.56ms (fail) | 2.49s | 362.71ms | 279.03ms | 280.06ms | 229.66ms |
| mux | 191.94ms (fail) | 1.86s | 436.89ms | 397.97ms | 412.41ms | 375.98ms |
| repeatedObservers | 52.65ms (fail) | 235.36ms | 81.26ms | 39.96ms | 44.88ms | 45.52ms |
| triangle | 76.38ms (fail) | 786.94ms | 120.09ms | 98.01ms | 101.16ms | 85.66ms |
| unstable | 336.58ms (fail) | 359.66ms | 98.15ms | 71.02ms | 79.25ms | 66.83ms |
| molBench | 914μs | 581.20ms | 493.75ms | 488.43ms | 485.56ms | 486.21ms |
| create_signals | 59.86ms | 87.50ms | 95.50ms | 5.16ms | 28.93ms | 23.67ms |
| comp_0to1 | 52.49ms | 39.84ms | 37.37ms | 22.29ms | 10.69ms | 7.02ms |
| comp_1to1 | 54.81ms | 18.44ms | 52.55ms | 12.87ms | 26.80ms | 9.76ms |
| comp_2to1 | 35.80ms | 23.43ms | 45.03ms | 17.71ms | 9.06ms | 4.47ms |
| comp_4to1 | 18.37ms | 16.55ms | 19.79ms | 10.00ms | 2.04ms | 5.26ms |
| comp_1000to1 | 57μs | 28μs | 21μs | 5μs | 4μs | 3μs |
| comp_1to2 | 46.52ms | 32.92ms | 37.35ms | 18.36ms | 22.49ms | 13.05ms |
| comp_1to4 | 43.10ms | 23.04ms | 22.78ms | 18.43ms | 9.02ms | 7.81ms |
| comp_1to8 | 42.08ms | 24.11ms | 24.87ms | 6.85ms | 8.36ms | 3.69ms |
| comp_1to1000 | 38.50ms | 15.76ms | 17.05ms | 3.79ms | 6.84ms | 3.49ms |
| update_1to1 | 5.65ms | 24.28ms | 15.85ms | 8.81ms | 8.98ms | 10.12ms |
| update_2to1 | 3.15ms | 11.33ms | 7.86ms | 4.25ms | 4.59ms | 2.29ms |
| update_4to1 | 1.46ms | 6.87ms | 3.98ms | 2.19ms | 2.27ms | 2.65ms |
| update_1000to1 | 24μs | 81μs | 39μs | 21μs | 22μs | 25μs |
| update_1to2 | 2.87ms | 11.09ms | 8.10ms | 4.65ms | 4.47ms | 5.30ms |
| update_1to4 | 1.47ms | 6.19ms | 4.00ms | 2.17ms | 2.28ms | 2.45ms |
| update_1to1000 | 386μs | 173μs | 171μs | 63μs | 42μs | 47μs |
| cellx1000 | 5.41ms | 71.57ms | 12.59ms | 9.67ms | 9.46ms | 7.77ms |
| cellx2500 | 22.27ms | 249.51ms | 36.73ms | 26.54ms | 31.60ms | 19.72ms |
| cellx5000 | 57.27ms | 559.87ms | 81.84ms | 63.96ms | 66.44ms | 41.64ms |
| 10x5 - 2 sources - read 20.0% (simple) | 241.03ms | 2.06s | 357.03ms | 436.68ms | 510.41ms | 231.53ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 198.73ms | 1.58s | 244.84ms | 269.35ms | 279.95ms | 172.07ms |
| 1000x12 - 4 sources - dynamic (large) | 329.76ms | 1.87s | 465.80ms | 3.70s | 3.82s | 283.48ms |
| 1000x5 - 25 sources (wide dense) | 491.71ms | 3.59s | 598.76ms | 2.70s | 3.59s | 408.96ms |
| 5x500 - 3 sources (deep) | 203.81ms | 1.17s | 250.85ms | 226.59ms | 224.87ms | 195.35ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 256.04ms | 1.73s | 377.48ms | 448.62ms | 478.82ms | 260.35ms |

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
