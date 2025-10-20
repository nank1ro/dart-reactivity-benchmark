# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.69s |
| 🥈 | solidart(2.0-dev) | 0.29 | 100.0% | 35/35 | 5.28s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.40s |
| 4 | preact_signals | 0.26 | 100.0% | 35/35 | 10.49s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.35s |
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
| Test Case | state_beacon | alien_signals | signals | solidart(2.0-dev) | mobx | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 159.30ms (fail) | 195.61ms | 216.79ms | 264.17ms | 2.30s | 201.41ms |
| broadPropagation | 6.49ms (fail) | 355.25ms | 459.59ms | 490.23ms | 4.32s | 472.59ms |
| deepPropagation | 140.93ms (fail) | 128.68ms | 179.09ms | 168.22ms | 1.55s | 178.21ms |
| diamond | 199.48ms (fail) | 234.83ms | 286.05ms | 352.36ms | 2.42s | 279.99ms |
| mux | 194.21ms (fail) | 376.66ms | 412.74ms | 428.91ms | 1.83s | 398.13ms |
| repeatedObservers | 53.14ms (fail) | 43.83ms | 47.07ms | 80.90ms | 231.22ms | 40.38ms |
| triangle | 89.72ms (fail) | 84.91ms | 101.50ms | 113.69ms | 750.48ms | 98.85ms |
| unstable | 339.48ms (fail) | 59.09ms | 76.41ms | 94.67ms | 345.16ms | 74.14ms |
| molBench | 1.14ms | 490.01ms | 485.08ms | 500.54ms | 581.04ms | 487.74ms |
| create_signals | 60.78ms | 24.23ms | 24.17ms | 100.36ms | 91.14ms | 5.29ms |
| comp_0to1 | 55.51ms | 8.69ms | 11.20ms | 35.28ms | 34.66ms | 18.00ms |
| comp_1to1 | 56.77ms | 4.18ms | 28.00ms | 40.00ms | 17.34ms | 15.22ms |
| comp_2to1 | 37.72ms | 2.28ms | 20.13ms | 24.15ms | 25.40ms | 20.75ms |
| comp_4to1 | 16.94ms | 7.85ms | 9.90ms | 14.88ms | 23.50ms | 11.43ms |
| comp_1000to1 | 44μs | 4μs | 5μs | 17μs | 16μs | 7μs |
| comp_1to2 | 47.64ms | 10.13ms | 22.09ms | 28.61ms | 37.12ms | 27.46ms |
| comp_1to4 | 46.06ms | 12.06ms | 10.83ms | 24.49ms | 23.59ms | 27.15ms |
| comp_1to8 | 44.98ms | 4.80ms | 6.58ms | 19.22ms | 22.13ms | 5.42ms |
| comp_1to1000 | 41.27ms | 3.52ms | 4.55ms | 13.88ms | 15.46ms | 6.74ms |
| update_1to1 | 6.06ms | 9.98ms | 10.20ms | 18.48ms | 25.83ms | 8.35ms |
| update_2to1 | 3.10ms | 2.17ms | 4.56ms | 8.01ms | 14.00ms | 4.43ms |
| update_4to1 | 1.54ms | 2.51ms | 2.64ms | 4.13ms | 6.61ms | 2.09ms |
| update_1000to1 | 15μs | 25μs | 25μs | 40μs | 69μs | 20μs |
| update_1to2 | 3.06ms | 5.04ms | 4.46ms | 8.36ms | 14.07ms | 4.11ms |
| update_1to4 | 1.54ms | 2.43ms | 2.54ms | 4.11ms | 6.35ms | 2.08ms |
| update_1to1000 | 409μs | 48μs | 44μs | 150μs | 186μs | 805μs |
| cellx1000 | 5.20ms | 7.10ms | 9.67ms | 12.14ms | 76.24ms | 9.59ms |
| cellx2500 | 27.36ms | 19.25ms | 31.21ms | 32.61ms | 286.45ms | 25.65ms |
| cellx5000 | 59.02ms | 41.69ms | 59.68ms | 84.74ms | 574.63ms | 64.42ms |
| 10x5 - 2 sources - read 20.0% (simple) | 262.56ms | 237.03ms | 509.44ms | 356.69ms | 2.00s | 511.99ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 203.82ms | 181.26ms | 280.04ms | 253.50ms | 1.53s | 292.55ms |
| 1000x12 - 4 sources - dynamic (large) | 342.09ms | 279.16ms | 3.95s | 456.33ms | 1.89s | 3.72s |
| 1000x5 - 25 sources (wide dense) | 514.30ms | 404.09ms | 3.42s | 612.85ms | 3.49s | 2.76s |
| 5x500 - 3 sources (deep) | 210.83ms | 188.87ms | 224.53ms | 251.47ms | 1.13s | 247.15ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 265.66ms | 259.00ms | 485.80ms | 381.32ms | 1.69s | 466.69ms |

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
