# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.63s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 10.83s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.25s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 9.94s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 27.34s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.41s |

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
| avoidablePropagation | 215.41ms | 189.74ms | 152.25ms (fail) | 282.01ms | 204.04ms | 2.41s |
| broadPropagation | 450.08ms | 351.94ms | 6.09ms (fail) | 495.89ms | 450.34ms | 4.47s |
| deepPropagation | 172.55ms | 129.02ms | 137.81ms (fail) | 172.16ms | 177.20ms | 1.52s |
| diamond | 283.50ms | 230.33ms | 180.34ms (fail) | 350.86ms | 293.55ms | 2.44s |
| mux | 395.54ms | 354.87ms | 184.32ms (fail) | 415.29ms | 374.01ms | 1.84s |
| repeatedObservers | 44.36ms | 43.35ms | 53.69ms (fail) | 80.38ms | 40.43ms | 228.66ms |
| triangle | 102.29ms | 82.62ms | 78.57ms (fail) | 114.04ms | 101.29ms | 743.78ms |
| unstable | 77.30ms | 62.14ms | 337.08ms (fail) | 96.88ms | 69.08ms | 345.31ms |
| molBench | 496.56ms | 485.31ms | 941μs | 493.40ms | 480.44ms | 590.06ms |
| create_signals | 25.38ms | 27.43ms | 56.53ms | 76.39ms | 5.59ms | 71.55ms |
| comp_0to1 | 11.52ms | 7.91ms | 50.72ms | 30.52ms | 22.82ms | 25.21ms |
| comp_1to1 | 19.48ms | 4.40ms | 53.74ms | 26.81ms | 10.83ms | 17.13ms |
| comp_2to1 | 8.42ms | 2.28ms | 38.47ms | 34.94ms | 9.64ms | 20.26ms |
| comp_4to1 | 1.98ms | 9.82ms | 17.63ms | 20.60ms | 13.75ms | 26.51ms |
| comp_1000to1 | 5μs | 5μs | 40μs | 15μs | 4μs | 36μs |
| comp_1to2 | 17.38ms | 15.26ms | 46.15ms | 34.01ms | 23.71ms | 31.26ms |
| comp_1to4 | 7.36ms | 6.99ms | 46.97ms | 20.63ms | 21.45ms | 33.24ms |
| comp_1to8 | 6.23ms | 6.87ms | 43.18ms | 22.08ms | 7.91ms | 23.24ms |
| comp_1to1000 | 4.15ms | 3.34ms | 38.00ms | 14.54ms | 6.22ms | 15.69ms |
| update_1to1 | 9.31ms | 4.64ms | 6.11ms | 15.44ms | 8.88ms | 26.17ms |
| update_2to1 | 4.92ms | 2.30ms | 3.05ms | 7.73ms | 4.31ms | 11.64ms |
| update_4to1 | 2.33ms | 1.23ms | 1.53ms | 6.59ms | 2.20ms | 7.40ms |
| update_1000to1 | 24μs | 11μs | 16μs | 62μs | 22μs | 69μs |
| update_1to2 | 4.62ms | 2.83ms | 3.08ms | 7.96ms | 4.35ms | 13.99ms |
| update_1to4 | 2.53ms | 1.16ms | 1.57ms | 3.87ms | 2.25ms | 6.76ms |
| update_1to1000 | 43μs | 30μs | 365μs | 147μs | 501μs | 165μs |
| cellx1000 | 9.72ms | 7.23ms | 6.31ms | 11.87ms | 9.64ms | 71.56ms |
| cellx2500 | 31.35ms | 18.98ms | 27.54ms | 30.99ms | 25.29ms | 264.89ms |
| cellx5000 | 62.05ms | 41.14ms | 74.54ms | 68.32ms | 67.98ms | 560.28ms |
| 10x5 - 2 sources - read 20.0% (simple) | 501.36ms | 236.79ms | 242.78ms | 346.83ms | 428.19ms | 1.99s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 275.55ms | 172.98ms | 197.48ms | 246.66ms | 270.55ms | 1.48s |
| 1000x12 - 4 sources - dynamic (large) | 3.67s | 272.25ms | 338.39ms | 474.45ms | 3.61s | 1.91s |
| 1000x5 - 25 sources (wide dense) | 3.22s | 399.78ms | 525.82ms | 595.69ms | 2.51s | 3.41s |
| 5x500 - 3 sources (deep) | 225.14ms | 191.72ms | 203.69ms | 256.69ms | 228.55ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 470.73ms | 260.90ms | 257.39ms | 393.06ms | 446.76ms | 1.64s |

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
