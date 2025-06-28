# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.65s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 10.25s |
| 🥉 | solidart(2.0-dev) | 0.27 | 100.0% | 35/35 | 5.25s |
| 4 | signals | 0.25 | 100.0% | 35/35 | 11.50s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 28.16s |
| 6 | state_beacon | 0.00 | 77.1% | 27/35 | 3.44s |

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
| Test Case | solidart(2.0-dev) | state_beacon | preact_signals | signals | mobx | alien_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 273.24ms | 161.36ms (fail) | 201.06ms | 209.71ms | 2.33s | 183.77ms |
| broadPropagation | 503.04ms | 6.43ms (fail) | 447.82ms | 459.33ms | 4.58s | 343.75ms |
| deepPropagation | 165.98ms | 144.13ms (fail) | 177.00ms | 177.18ms | 1.56s | 125.35ms |
| diamond | 357.39ms | 206.57ms (fail) | 278.18ms | 278.71ms | 2.46s | 228.76ms |
| mux | 446.65ms | 192.05ms (fail) | 401.00ms | 413.78ms | 1.84s | 371.81ms |
| repeatedObservers | 81.36ms | 54.70ms (fail) | 39.55ms | 44.87ms | 234.07ms | 45.63ms |
| triangle | 116.93ms | 82.79ms (fail) | 98.02ms | 101.42ms | 774.49ms | 85.41ms |
| unstable | 98.82ms | 338.50ms (fail) | 70.63ms | 79.48ms | 358.02ms | 66.85ms |
| molBench | 493.30ms | 908μs | 488.24ms | 486.04ms | 574.72ms | 484.58ms |
| create_signals | 75.50ms | 62.99ms | 5.29ms | 25.02ms | 88.83ms | 26.77ms |
| comp_0to1 | 27.80ms | 52.04ms | 16.92ms | 10.35ms | 23.43ms | 9.56ms |
| comp_1to1 | 39.92ms | 54.48ms | 10.70ms | 26.23ms | 43.06ms | 8.97ms |
| comp_2to1 | 35.16ms | 35.47ms | 12.67ms | 13.38ms | 23.10ms | 2.34ms |
| comp_4to1 | 13.17ms | 16.17ms | 12.18ms | 3.40ms | 18.03ms | 10.15ms |
| comp_1000to1 | 17μs | 45μs | 5μs | 5μs | 26μs | 3μs |
| comp_1to2 | 30.17ms | 44.38ms | 26.39ms | 13.07ms | 35.21ms | 15.16ms |
| comp_1to4 | 22.89ms | 43.30ms | 19.34ms | 18.86ms | 18.52ms | 6.05ms |
| comp_1to8 | 24.15ms | 42.13ms | 10.85ms | 7.83ms | 20.87ms | 4.90ms |
| comp_1to1000 | 16.91ms | 38.34ms | 3.53ms | 12.66ms | 16.00ms | 3.41ms |
| update_1to1 | 16.00ms | 5.68ms | 8.59ms | 8.99ms | 25.40ms | 9.42ms |
| update_2to1 | 7.80ms | 3.56ms | 4.22ms | 4.75ms | 12.34ms | 2.32ms |
| update_4to1 | 4.01ms | 1.46ms | 2.17ms | 2.27ms | 6.67ms | 2.58ms |
| update_1000to1 | 50μs | 14μs | 21μs | 22μs | 71μs | 24μs |
| update_1to2 | 7.99ms | 2.89ms | 4.78ms | 4.47ms | 12.10ms | 5.12ms |
| update_1to4 | 4.01ms | 1.45ms | 2.18ms | 2.24ms | 6.85ms | 2.50ms |
| update_1to1000 | 171μs | 374μs | 60μs | 42μs | 176μs | 46μs |
| cellx1000 | 11.88ms | 5.71ms | 11.94ms | 9.65ms | 73.24ms | 7.01ms |
| cellx2500 | 32.59ms | 24.99ms | 25.81ms | 31.66ms | 249.41ms | 18.66ms |
| cellx5000 | 71.91ms | 56.61ms | 62.91ms | 63.56ms | 546.42ms | 40.05ms |
| 10x5 - 2 sources - read 20.0% (simple) | 352.03ms | 248.82ms | 437.26ms | 525.25ms | 2.06s | 228.00ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 243.45ms | 204.37ms | 275.55ms | 279.98ms | 1.60s | 173.50ms |
| 1000x12 - 4 sources - dynamic (large) | 458.87ms | 336.15ms | 3.70s | 3.91s | 2.04s | 281.36ms |
| 1000x5 - 25 sources (wide dense) | 587.62ms | 500.68ms | 2.73s | 3.56s | 3.65s | 403.64ms |
| 5x500 - 3 sources (deep) | 250.93ms | 204.84ms | 227.28ms | 225.25ms | 1.17s | 191.80ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 380.89ms | 261.24ms | 451.67ms | 493.29ms | 1.70s | 260.63ms |

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
