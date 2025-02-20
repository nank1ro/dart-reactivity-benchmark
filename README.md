# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.69s |
| 🥈 | preact_signals | 0.27 | 100.0% | 35/35 | 10.02s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 11.42s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.52s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.35s |
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
| Test Case | alien_signals | mobx | solidart | state_beacon | preact_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 186.56ms | 2.30s | 2.16s | 153.42ms (fail) | 204.98ms | 207.89ms |
| broadPropagation | 355.26ms | 4.25s | 5.36s | 6.18ms (fail) | 451.63ms | 462.47ms |
| deepPropagation | 119.84ms | 1.53s | 1.98s | 140.07ms (fail) | 175.44ms | 169.97ms |
| diamond | 236.39ms | 2.38s | 3.37s | 195.49ms (fail) | 274.88ms | 289.52ms |
| mux | 389.67ms | 1.84s | 2.00s | 193.25ms (fail) | 380.39ms | 410.96ms |
| repeatedObservers | 45.09ms | 225.21ms | 202.68ms | 53.36ms (fail) | 37.99ms | 45.26ms |
| triangle | 85.68ms | 771.21ms | 1.13s | 79.26ms (fail) | 98.48ms | 101.05ms |
| unstable | 59.90ms | 347.56ms | 338.37ms | 349.07ms (fail) | 70.26ms | 71.42ms |
| molBench | 492.08ms | 582.93ms | 1.71s | 924μs | 492.32ms | 487.67ms |
| create_signals | 25.91ms | 81.67ms | 79.09ms | 65.48ms | 4.53ms | 20.56ms |
| comp_0to1 | 7.52ms | 49.75ms | 32.69ms | 58.86ms | 17.68ms | 10.62ms |
| comp_1to1 | 4.17ms | 27.26ms | 42.60ms | 62.77ms | 11.41ms | 18.99ms |
| comp_2to1 | 2.27ms | 9.03ms | 21.30ms | 38.81ms | 23.41ms | 19.27ms |
| comp_4to1 | 7.69ms | 17.99ms | 17.95ms | 18.78ms | 15.27ms | 1.95ms |
| comp_1000to1 | 4μs | 16μs | 2.21ms | 48μs | 4μs | 5μs |
| comp_1to2 | 10.31ms | 42.08ms | 32.42ms | 49.13ms | 18.39ms | 21.78ms |
| comp_1to4 | 11.95ms | 24.85ms | 32.63ms | 46.96ms | 35.59ms | 11.25ms |
| comp_1to8 | 4.84ms | 20.71ms | 26.39ms | 46.37ms | 7.70ms | 8.85ms |
| comp_1to1000 | 3.65ms | 17.06ms | 17.80ms | 40.78ms | 5.59ms | 4.57ms |
| update_1to1 | 5.99ms | 21.78ms | 41.27ms | 5.73ms | 8.20ms | 9.36ms |
| update_2to1 | 5.04ms | 10.47ms | 20.59ms | 2.88ms | 4.07ms | 4.57ms |
| update_4to1 | 1.18ms | 5.91ms | 10.25ms | 1.48ms | 2.04ms | 2.32ms |
| update_1000to1 | 24μs | 65μs | 145μs | 15μs | 20μs | 22μs |
| update_1to2 | 3.69ms | 10.45ms | 20.75ms | 2.98ms | 4.06ms | 5.73ms |
| update_1to4 | 2.19ms | 6.33ms | 10.25ms | 1.48ms | 2.04ms | 2.98ms |
| update_1to1000 | 50μs | 177μs | 217μs | 413μs | 210μs | 44μs |
| cellx1000 | 7.37ms | 72.68ms | 193.73ms | 5.15ms | 9.57ms | 10.23ms |
| cellx2500 | 20.69ms | 258.79ms | 496.82ms | 24.65ms | 28.74ms | 35.61ms |
| cellx5000 | 48.43ms | 562.89ms | 1.22s | 79.85ms | 84.14ms | 66.47ms |
| 10x5 - 2 sources - read 20.0% (simple) | 228.91ms | 2.02s | 2.62s (partial) | 249.45ms | 465.12ms | 510.54ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 176.11ms | 1.59s | 2.50s (partial) | 202.65ms | 274.98ms | 278.65ms |
| 1000x12 - 4 sources - dynamic (large) | 276.99ms | 1.94s | 4.03s (partial) | 336.09ms | 3.54s | 3.98s |
| 1000x5 - 25 sources (wide dense) | 404.12ms | 3.62s | 4.88s (partial) | 493.17ms | 2.59s | 3.44s |
| 5x500 - 3 sources (deep) | 190.08ms | 1.17s | 1.98s (partial) | 205.03ms | 229.65ms | 225.64ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 265.50ms | 1.71s | 2.79s (partial) | 255.82ms | 451.89ms | 478.12ms |

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
