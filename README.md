# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.68s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.23s |
| 🥉 | signals | 0.25 | 100.0% | 35/35 | 11.13s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.04s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.20s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.39s |

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
| Test Case | solidart(2.0-dev) | preact_signals | alien_signals | state_beacon | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 266.11ms | 206.72ms | 184.53ms | 152.13ms (fail) | 2.29s | 213.11ms |
| broadPropagation | 513.68ms | 451.59ms | 353.67ms | 6.06ms (fail) | 4.27s | 456.73ms |
| deepPropagation | 172.86ms | 175.72ms | 125.33ms | 137.12ms (fail) | 1.52s | 175.96ms |
| diamond | 353.46ms | 277.30ms | 237.96ms | 189.99ms (fail) | 2.39s | 291.36ms |
| mux | 433.69ms | 387.74ms | 374.67ms | 194.00ms (fail) | 1.78s | 410.77ms |
| repeatedObservers | 78.90ms | 38.98ms | 44.82ms | 53.04ms (fail) | 234.72ms | 45.47ms |
| triangle | 118.45ms | 100.52ms | 85.45ms | 76.99ms (fail) | 782.42ms | 100.62ms |
| unstable | 94.34ms | 70.46ms | 60.07ms | 335.59ms (fail) | 348.74ms | 72.79ms |
| molBench | 491.67ms | 491.83ms | 491.73ms | 1.34ms | 578.61ms | 485.31ms |
| create_signals | 71.95ms | 5.16ms | 20.13ms | 59.03ms | 69.27ms | 30.84ms |
| comp_0to1 | 26.40ms | 17.73ms | 8.57ms | 52.24ms | 24.05ms | 13.94ms |
| comp_1to1 | 50.71ms | 13.98ms | 4.13ms | 60.64ms | 19.46ms | 19.14ms |
| comp_2to1 | 36.06ms | 19.70ms | 2.25ms | 35.94ms | 12.48ms | 11.07ms |
| comp_4to1 | 4.66ms | 14.30ms | 7.82ms | 15.94ms | 13.89ms | 1.92ms |
| comp_1000to1 | 15μs | 4μs | 3μs | 44μs | 15μs | 5μs |
| comp_1to2 | 31.08ms | 15.54ms | 9.64ms | 44.37ms | 33.79ms | 19.75ms |
| comp_1to4 | 15.38ms | 22.52ms | 11.56ms | 43.99ms | 23.51ms | 9.96ms |
| comp_1to8 | 20.28ms | 9.15ms | 4.84ms | 43.30ms | 23.24ms | 13.03ms |
| comp_1to1000 | 14.85ms | 7.28ms | 3.64ms | 38.18ms | 15.26ms | 6.39ms |
| update_1to1 | 16.13ms | 8.25ms | 11.28ms | 5.74ms | 24.83ms | 9.27ms |
| update_2to1 | 7.94ms | 4.05ms | 5.26ms | 2.87ms | 11.08ms | 5.35ms |
| update_4to1 | 4.07ms | 2.07ms | 2.77ms | 1.46ms | 6.69ms | 2.31ms |
| update_1000to1 | 40μs | 20μs | 10μs | 15μs | 60μs | 23μs |
| update_1to2 | 8.15ms | 4.06ms | 5.62ms | 2.93ms | 11.77ms | 4.92ms |
| update_1to4 | 4.05ms | 2.07ms | 2.43ms | 1.46ms | 5.75ms | 2.33ms |
| update_1to1000 | 150μs | 822μs | 48μs | 380μs | 166μs | 53μs |
| cellx1000 | 11.40ms | 9.46ms | 7.18ms | 5.06ms | 71.59ms | 9.49ms |
| cellx2500 | 30.28ms | 25.48ms | 19.21ms | 25.26ms | 231.52ms | 30.71ms |
| cellx5000 | 65.53ms | 64.49ms | 41.06ms | 56.20ms | 544.45ms | 56.75ms |
| 10x5 - 2 sources - read 20.0% (simple) | 350.68ms | 474.43ms | 232.02ms | 242.44ms | 2.02s | 500.75ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 245.02ms | 281.71ms | 184.38ms | 201.27ms | 1.54s | 282.71ms |
| 1000x12 - 4 sources - dynamic (large) | 461.01ms | 3.56s | 280.94ms | 336.71ms | 1.85s | 3.74s |
| 1000x5 - 25 sources (wide dense) | 593.49ms | 2.60s | 410.08ms | 501.71ms | 3.53s | 3.41s |
| 5x500 - 3 sources (deep) | 257.10ms | 234.53ms | 187.76ms | 204.34ms | 1.19s | 226.32ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 382.61ms | 446.12ms | 258.88ms | 261.84ms | 1.72s | 472.16ms |

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
