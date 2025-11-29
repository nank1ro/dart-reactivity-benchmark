# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.68s |
| 🥈 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.22s |
| 🥉 | preact_signals | 0.25 | 100.0% | 35/35 | 10.09s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.33s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.01s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.45s |

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
| avoidablePropagation | 212.27ms | 191.21ms | 148.93ms (fail) | 278.55ms | 220.48ms | 2.40s |
| broadPropagation | 458.68ms | 352.48ms | 6.89ms (fail) | 495.74ms | 468.91ms | 4.35s |
| deepPropagation | 165.49ms | 136.45ms | 138.96ms (fail) | 169.75ms | 175.81ms | 1.51s |
| diamond | 288.96ms | 230.84ms | 179.60ms (fail) | 349.16ms | 311.93ms | 2.37s |
| mux | 385.95ms | 358.99ms | 179.49ms (fail) | 419.65ms | 379.54ms | 1.82s |
| repeatedObservers | 46.51ms | 44.22ms | 54.16ms (fail) | 80.74ms | 45.33ms | 226.20ms |
| triangle | 100.42ms | 85.41ms | 81.31ms (fail) | 115.51ms | 104.06ms | 737.20ms |
| unstable | 77.71ms | 63.36ms | 343.45ms (fail) | 96.69ms | 74.66ms | 344.36ms |
| molBench | 494.98ms | 484.38ms | 921μs | 489.61ms | 488.02ms | 589.66ms |
| create_signals | 25.95ms | 24.92ms | 68.24ms | 77.35ms | 5.30ms | 70.64ms |
| comp_0to1 | 11.54ms | 7.57ms | 55.46ms | 26.10ms | 22.04ms | 26.49ms |
| comp_1to1 | 18.24ms | 4.20ms | 62.34ms | 39.77ms | 14.20ms | 41.90ms |
| comp_2to1 | 18.15ms | 2.34ms | 43.46ms | 35.64ms | 20.92ms | 23.58ms |
| comp_4to1 | 2.12ms | 10.11ms | 16.68ms | 4.45ms | 12.16ms | 21.40ms |
| comp_1000to1 | 5μs | 4μs | 39μs | 28μs | 5μs | 15μs |
| comp_1to2 | 18.84ms | 25.07ms | 45.39ms | 31.69ms | 18.84ms | 35.75ms |
| comp_1to4 | 14.19ms | 5.48ms | 46.89ms | 20.29ms | 26.43ms | 24.65ms |
| comp_1to8 | 8.35ms | 5.22ms | 43.88ms | 22.33ms | 7.04ms | 23.11ms |
| comp_1to1000 | 4.29ms | 3.46ms | 38.15ms | 14.48ms | 4.91ms | 15.38ms |
| update_1to1 | 9.34ms | 4.63ms | 6.10ms | 15.48ms | 8.78ms | 26.59ms |
| update_2to1 | 4.72ms | 2.35ms | 3.06ms | 7.75ms | 4.32ms | 12.95ms |
| update_4to1 | 2.34ms | 1.21ms | 1.56ms | 3.88ms | 2.28ms | 7.10ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 70μs |
| update_1to2 | 4.67ms | 2.29ms | 3.07ms | 7.86ms | 4.33ms | 13.65ms |
| update_1to4 | 2.54ms | 1.21ms | 1.59ms | 3.88ms | 2.25ms | 6.83ms |
| update_1to1000 | 43μs | 48μs | 391μs | 146μs | 158μs | 173μs |
| cellx1000 | 9.80ms | 9.14ms | 5.79ms | 13.29ms | 9.85ms | 70.11ms |
| cellx2500 | 32.38ms | 21.01ms | 37.06ms | 34.50ms | 29.13ms | 245.12ms |
| cellx5000 | 65.76ms | 44.89ms | 80.10ms | 73.90ms | 82.39ms | 555.34ms |
| 10x5 - 2 sources - read 20.0% (simple) | 508.47ms | 236.75ms | 233.04ms | 350.48ms | 429.67ms | 1.95s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.43ms | 175.12ms | 197.07ms | 243.35ms | 267.05ms | 1.48s |
| 1000x12 - 4 sources - dynamic (large) | 4.00s | 277.62ms | 344.07ms | 463.70ms | 3.67s | 1.83s |
| 1000x5 - 25 sources (wide dense) | 3.37s | 409.35ms | 521.70ms | 596.49ms | 2.51s | 3.44s |
| 5x500 - 3 sources (deep) | 220.64ms | 195.47ms | 200.42ms | 258.08ms | 228.91ms | 1.10s |
| 100x15 - 6 sources - dynamic (very dynamic) | 472.00ms | 264.52ms | 256.41ms | 379.66ms | 453.14ms | 1.64s |

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
