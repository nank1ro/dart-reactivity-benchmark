# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.74s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.36s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.30s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.59s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.16s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.48s |

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
| avoidablePropagation | 203.44ms | 195.34ms | 147.71ms (fail) | 279.04ms | 204.54ms | 2.29s |
| broadPropagation | 460.92ms | 353.74ms | 5.98ms (fail) | 510.88ms | 462.48ms | 4.26s |
| deepPropagation | 170.12ms | 129.32ms | 137.52ms (fail) | 167.25ms | 179.89ms | 1.52s |
| diamond | 286.14ms | 245.78ms | 181.36ms (fail) | 352.20ms | 289.54ms | 2.34s |
| mux | 396.12ms | 362.20ms | 179.94ms (fail) | 420.35ms | 376.18ms | 1.77s |
| repeatedObservers | 45.56ms | 45.49ms | 55.09ms (fail) | 81.20ms | 41.75ms | 229.33ms |
| triangle | 99.18ms | 86.38ms | 77.27ms (fail) | 115.60ms | 100.76ms | 758.51ms |
| unstable | 76.08ms | 61.83ms | 334.56ms (fail) | 96.02ms | 71.36ms | 346.54ms |
| molBench | 492.98ms | 488.05ms | 1.31ms | 488.99ms | 495.25ms | 592.15ms |
| create_signals | 26.68ms | 28.26ms | 61.34ms | 77.11ms | 5.27ms | 72.60ms |
| comp_0to1 | 12.42ms | 7.22ms | 55.18ms | 27.52ms | 23.70ms | 29.68ms |
| comp_1to1 | 28.13ms | 4.34ms | 55.48ms | 44.87ms | 11.23ms | 56.52ms |
| comp_2to1 | 12.87ms | 2.44ms | 38.44ms | 39.98ms | 18.62ms | 24.88ms |
| comp_4to1 | 1.99ms | 8.86ms | 17.02ms | 4.63ms | 8.58ms | 32.47ms |
| comp_1000to1 | 4μs | 4μs | 44μs | 15μs | 6μs | 27μs |
| comp_1to2 | 20.76ms | 11.36ms | 46.25ms | 31.04ms | 14.24ms | 37.80ms |
| comp_1to4 | 9.97ms | 17.43ms | 45.84ms | 20.91ms | 27.54ms | 17.75ms |
| comp_1to8 | 6.30ms | 5.17ms | 44.02ms | 20.17ms | 7.50ms | 23.24ms |
| comp_1to1000 | 4.03ms | 3.18ms | 40.53ms | 14.69ms | 4.78ms | 14.98ms |
| update_1to1 | 8.99ms | 4.72ms | 9.38ms | 16.90ms | 9.00ms | 21.18ms |
| update_2to1 | 4.46ms | 2.32ms | 2.96ms | 8.49ms | 4.57ms | 10.34ms |
| update_4to1 | 2.22ms | 1.21ms | 1.57ms | 4.21ms | 2.27ms | 5.44ms |
| update_1000to1 | 22μs | 11μs | 15μs | 43μs | 28μs | 60μs |
| update_1to2 | 4.44ms | 2.30ms | 4.28ms | 8.63ms | 4.50ms | 10.40ms |
| update_1to4 | 2.22ms | 1.18ms | 1.49ms | 4.25ms | 2.40ms | 5.19ms |
| update_1to1000 | 42μs | 50μs | 384μs | 153μs | 184μs | 153μs |
| cellx1000 | 11.02ms | 8.75ms | 7.33ms | 16.34ms | 13.22ms | 87.49ms |
| cellx2500 | 38.70ms | 21.80ms | 30.12ms | 41.97ms | 33.49ms | 301.91ms |
| cellx5000 | 100.98ms | 60.69ms | 92.60ms | 128.66ms | 93.48ms | 684.72ms |
| 10x5 - 2 sources - read 20.0% (simple) | 504.88ms | 230.62ms | 254.61ms | 346.36ms | 457.13ms | 1.96s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 278.93ms | 182.38ms | 200.83ms | 249.15ms | 277.38ms | 1.48s |
| 1000x12 - 4 sources - dynamic (large) | 3.90s | 283.10ms | 361.64ms | 471.94ms | 3.80s | 1.90s |
| 1000x5 - 25 sources (wide dense) | 3.38s | 412.51ms | 514.85ms | 616.36ms | 2.84s | 3.39s |
| 5x500 - 3 sources (deep) | 224.58ms | 198.06ms | 210.30ms | 256.93ms | 235.58ms | 1.16s |
| 100x15 - 6 sources - dynamic (very dynamic) | 483.06ms | 274.52ms | 262.47ms | 394.77ms | 461.55ms | 1.70s |

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
