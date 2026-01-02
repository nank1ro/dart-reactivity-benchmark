# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.73 | 100.0% | 35/35 | 3.62s |
| 🥈 | signals | 0.26 | 100.0% | 35/35 | 10.83s |
| 🥉 | solidart(2.0-dev) | 0.26 | 100.0% | 35/35 | 5.28s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.01s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 27.13s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.40s |

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
| avoidablePropagation | 208.10ms | 189.98ms | 153.89ms (fail) | 275.10ms | 204.10ms | 2.40s |
| broadPropagation | 460.79ms | 352.03ms | 6.36ms (fail) | 501.07ms | 475.00ms | 4.45s |
| deepPropagation | 178.42ms | 121.14ms | 137.42ms (fail) | 167.78ms | 177.75ms | 1.50s |
| diamond | 288.46ms | 232.17ms | 179.48ms (fail) | 350.63ms | 284.36ms | 2.39s |
| mux | 390.76ms | 359.41ms | 180.00ms (fail) | 417.35ms | 371.86ms | 1.86s |
| repeatedObservers | 46.48ms | 45.07ms | 52.32ms (fail) | 81.20ms | 40.48ms | 230.39ms |
| triangle | 103.60ms | 84.24ms | 84.44ms (fail) | 115.48ms | 100.62ms | 752.67ms |
| unstable | 78.28ms | 62.38ms | 335.84ms (fail) | 95.16ms | 69.40ms | 345.36ms |
| molBench | 494.90ms | 484.66ms | 995μs | 489.86ms | 480.86ms | 589.74ms |
| create_signals | 26.08ms | 24.62ms | 62.12ms | 106.20ms | 5.55ms | 68.05ms |
| comp_0to1 | 11.39ms | 8.92ms | 52.41ms | 35.76ms | 17.60ms | 15.35ms |
| comp_1to1 | 27.13ms | 4.30ms | 57.35ms | 51.52ms | 13.01ms | 42.47ms |
| comp_2to1 | 8.69ms | 2.30ms | 42.39ms | 48.91ms | 17.33ms | 31.55ms |
| comp_4to1 | 1.99ms | 7.70ms | 17.79ms | 4.63ms | 9.44ms | 31.05ms |
| comp_1000to1 | 6μs | 4μs | 42μs | 31μs | 4μs | 27μs |
| comp_1to2 | 19.50ms | 15.92ms | 46.70ms | 35.27ms | 15.71ms | 31.92ms |
| comp_1to4 | 12.36ms | 9.85ms | 46.55ms | 20.82ms | 26.20ms | 21.59ms |
| comp_1to8 | 6.65ms | 3.93ms | 43.05ms | 20.35ms | 5.90ms | 24.00ms |
| comp_1to1000 | 4.28ms | 3.62ms | 38.32ms | 14.39ms | 6.20ms | 15.08ms |
| update_1to1 | 9.38ms | 4.65ms | 6.14ms | 15.49ms | 8.79ms | 27.39ms |
| update_2to1 | 4.70ms | 2.36ms | 3.06ms | 7.78ms | 4.38ms | 13.00ms |
| update_4to1 | 2.34ms | 1.22ms | 1.58ms | 3.88ms | 2.22ms | 7.04ms |
| update_1000to1 | 24μs | 11μs | 16μs | 38μs | 22μs | 61μs |
| update_1to2 | 4.71ms | 2.32ms | 3.06ms | 7.92ms | 4.34ms | 13.65ms |
| update_1to4 | 2.56ms | 1.23ms | 1.59ms | 3.88ms | 2.23ms | 6.90ms |
| update_1to1000 | 42μs | 49μs | 383μs | 146μs | 921μs | 172μs |
| cellx1000 | 9.55ms | 8.30ms | 5.21ms | 15.64ms | 9.53ms | 74.71ms |
| cellx2500 | 31.82ms | 20.18ms | 26.14ms | 34.53ms | 25.36ms | 253.61ms |
| cellx5000 | 65.37ms | 43.37ms | 72.80ms | 75.46ms | 69.47ms | 577.26ms |
| 10x5 - 2 sources - read 20.0% (simple) | 508.19ms | 228.16ms | 235.35ms | 346.61ms | 431.23ms | 1.93s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 280.27ms | 171.73ms | 197.92ms | 242.99ms | 265.28ms | 1.45s |
| 1000x12 - 4 sources - dynamic (large) | 3.54s | 272.11ms | 332.26ms | 457.87ms | 3.65s | 1.78s |
| 1000x5 - 25 sources (wide dense) | 3.29s | 397.01ms | 515.26ms | 594.67ms | 2.53s | 3.40s |
| 5x500 - 3 sources (deep) | 223.98ms | 192.63ms | 200.20ms | 259.02ms | 232.62ms | 1.13s |
| 100x15 - 6 sources - dynamic (very dynamic) | 477.75ms | 263.17ms | 257.30ms | 381.62ms | 451.94ms | 1.66s |

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
