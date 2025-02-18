# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.69 | 100.0% | 35/35 | 3.66s |
| 🥈 | preact_signals | 0.28 | 100.0% | 35/35 | 9.97s |
| 🥉 | signals | 0.27 | 100.0% | 35/35 | 11.44s |
| 4 | mobx | 0.05 | 100.0% | 35/35 | 27.06s |
| 5 | solidart | 0.02 | 82.9% | 29/35 | 39.00s |
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
| Test Case | alien_signals | mobx | solidart | state_beacon | preact_signals | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 184.54ms | 2.29s | 2.18s | 153.57ms (fail) | 206.78ms | 211.98ms |
| broadPropagation | 353.49ms | 4.22s | 5.33s | 6.65ms (fail) | 464.92ms | 447.58ms |
| deepPropagation | 124.36ms | 1.52s | 1.99s | 138.51ms (fail) | 177.04ms | 173.50ms |
| diamond | 233.45ms | 2.41s | 3.41s | 186.57ms (fail) | 283.42ms | 291.98ms |
| mux | 384.94ms | 1.80s | 2.01s | 191.31ms (fail) | 382.38ms | 410.73ms |
| repeatedObservers | 45.32ms | 234.20ms | 205.80ms | 52.77ms (fail) | 38.24ms | 45.89ms |
| triangle | 83.18ms | 759.34ms | 1.13s | 76.39ms (fail) | 99.78ms | 102.49ms |
| unstable | 60.54ms | 350.32ms | 340.31ms | 336.85ms (fail) | 70.19ms | 72.88ms |
| molBench | 486.54ms | 584.05ms | 1.71s | 1.40ms | 492.88ms | 488.54ms |
| create_signals | 27.57ms | 69.75ms | 49.30ms | 67.35ms | 4.66ms | 25.05ms |
| comp_0to1 | 7.82ms | 24.13ms | 27.91ms | 52.32ms | 18.30ms | 10.98ms |
| comp_1to1 | 4.14ms | 27.72ms | 38.41ms | 53.65ms | 11.62ms | 21.48ms |
| comp_2to1 | 2.24ms | 11.48ms | 20.37ms | 36.04ms | 17.59ms | 9.02ms |
| comp_4to1 | 7.61ms | 19.50ms | 11.30ms | 16.17ms | 12.50ms | 1.99ms |
| comp_1000to1 | 4μs | 15μs | 2.17ms | 64μs | 4μs | 7μs |
| comp_1to2 | 9.56ms | 33.28ms | 55.26ms | 44.52ms | 29.41ms | 17.20ms |
| comp_1to4 | 11.87ms | 29.32ms | 23.82ms | 43.62ms | 21.76ms | 9.45ms |
| comp_1to8 | 4.89ms | 19.32ms | 24.54ms | 42.62ms | 11.95ms | 6.33ms |
| comp_1to1000 | 3.60ms | 14.96ms | 17.28ms | 38.16ms | 7.37ms | 4.48ms |
| update_1to1 | 7.04ms | 22.96ms | 40.87ms | 5.73ms | 8.28ms | 9.22ms |
| update_2to1 | 5.02ms | 11.48ms | 20.68ms | 2.88ms | 4.08ms | 4.61ms |
| update_4to1 | 1.75ms | 5.60ms | 10.19ms | 1.47ms | 2.05ms | 2.30ms |
| update_1000to1 | 24μs | 54μs | 112μs | 15μs | 20μs | 23μs |
| update_1to2 | 3.85ms | 11.24ms | 20.74ms | 2.94ms | 4.07ms | 4.93ms |
| update_1to4 | 1.87ms | 5.58ms | 10.48ms | 1.48ms | 2.05ms | 2.33ms |
| update_1to1000 | 50μs | 167μs | 208μs | 372μs | 39μs | 44μs |
| cellx1000 | 7.28ms | 78.11ms | 169.81ms | 5.37ms | 9.57ms | 9.62ms |
| cellx2500 | 19.45ms | 238.07ms | 509.88ms | 27.68ms | 26.86ms | 31.37ms |
| cellx5000 | 43.08ms | 577.20ms | 1.16s | 66.28ms | 67.87ms | 64.20ms |
| 10x5 - 2 sources - read 20.0% (simple) | 227.23ms | 2.00s | 2.59s (partial) | 240.92ms | 445.59ms | 506.04ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 175.99ms | 1.54s | 2.35s (partial) | 206.28ms | 268.61ms | 278.30ms |
| 1000x12 - 4 sources - dynamic (large) | 282.22ms | 1.74s | 3.96s (partial) | 370.39ms | 3.52s | 3.91s |
| 1000x5 - 25 sources (wide dense) | 401.74ms | 3.57s | 4.87s (partial) | 505.37ms | 2.58s | 3.56s |
| 5x500 - 3 sources (deep) | 187.45ms | 1.15s | 1.97s (partial) | 203.23ms | 229.39ms | 225.17ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 259.71ms | 1.70s | 2.75s (partial) | 258.97ms | 449.45ms | 475.37ms |

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
