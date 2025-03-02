# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.68 | 100.0% | 35/35 | 3.70s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.37s |
| 🥉 | preact_signals | 0.28 | 100.0% | 35/35 | 9.91s |
| 4 | signals | 0.27 | 100.0% | 35/35 | 11.11s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.37s |
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
| Test Case | solidart(2.0-dev) | preact_signals | mobx | alien_signals | signals | state_beacon |
|---|---|---|---|---|---|---|
| avoidablePropagation | 274.61ms | 204.88ms | 2.34s | 184.85ms | 211.51ms | 148.93ms (fail) |
| broadPropagation | 514.70ms | 458.35ms | 4.22s | 355.05ms | 455.03ms | 6.26ms (fail) |
| deepPropagation | 174.08ms | 180.82ms | 1.50s | 124.63ms | 180.40ms | 137.45ms (fail) |
| diamond | 362.85ms | 278.61ms | 2.40s | 236.35ms | 289.77ms | 187.00ms (fail) |
| mux | 442.50ms | 383.60ms | 1.83s | 368.96ms | 406.22ms | 191.24ms (fail) |
| repeatedObservers | 78.07ms | 39.10ms | 230.51ms | 44.84ms | 46.56ms | 52.11ms (fail) |
| triangle | 116.36ms | 99.18ms | 764.10ms | 88.38ms | 108.58ms | 78.66ms (fail) |
| unstable | 95.63ms | 70.80ms | 352.71ms | 61.17ms | 74.89ms | 334.94ms (fail) |
| molBench | 495.76ms | 491.86ms | 586.48ms | 487.87ms | 485.08ms | 1.12ms |
| create_signals | 49.74ms | 12.95ms | 49.49ms | 26.03ms | 30.54ms | 60.50ms |
| comp_0to1 | 25.71ms | 20.07ms | 18.54ms | 7.93ms | 12.01ms | 56.10ms |
| comp_1to1 | 30.12ms | 7.23ms | 21.60ms | 4.28ms | 26.44ms | 52.63ms |
| comp_2to1 | 46.69ms | 19.04ms | 11.50ms | 2.21ms | 12.01ms | 35.40ms |
| comp_4to1 | 12.83ms | 11.37ms | 30.11ms | 8.41ms | 2.96ms | 16.20ms |
| comp_1000to1 | 28μs | 4μs | 14μs | 5μs | 5μs | 42μs |
| comp_1to2 | 31.14ms | 26.03ms | 33.72ms | 19.66ms | 13.04ms | 44.05ms |
| comp_1to4 | 15.42ms | 24.29ms | 23.53ms | 11.13ms | 11.24ms | 42.99ms |
| comp_1to8 | 22.33ms | 8.73ms | 20.80ms | 5.16ms | 6.89ms | 42.06ms |
| comp_1to1000 | 14.88ms | 5.36ms | 15.11ms | 3.52ms | 4.53ms | 37.72ms |
| update_1to1 | 16.14ms | 8.39ms | 22.82ms | 11.55ms | 9.20ms | 5.73ms |
| update_2to1 | 7.91ms | 4.08ms | 12.21ms | 3.72ms | 8.33ms | 2.88ms |
| update_4to1 | 4.05ms | 2.07ms | 6.64ms | 2.82ms | 2.33ms | 1.47ms |
| update_1000to1 | 40μs | 20μs | 67μs | 19μs | 23μs | 15μs |
| update_1to2 | 8.08ms | 4.09ms | 12.28ms | 5.62ms | 4.92ms | 2.95ms |
| update_1to4 | 4.07ms | 2.07ms | 5.59ms | 2.50ms | 2.32ms | 1.47ms |
| update_1to1000 | 152μs | 212μs | 167μs | 46μs | 44μs | 376μs |
| cellx1000 | 13.28ms | 9.48ms | 68.90ms | 7.78ms | 9.46ms | 5.09ms |
| cellx2500 | 32.21ms | 25.25ms | 254.88ms | 19.82ms | 31.26ms | 27.27ms |
| cellx5000 | 69.69ms | 64.86ms | 553.05ms | 43.01ms | 58.12ms | 59.96ms |
| 10x5 - 2 sources - read 20.0% (simple) | 422.77ms | 444.34ms | 2.04s | 233.63ms | 507.14ms | 239.26ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 261.71ms | 271.45ms | 1.57s | 186.05ms | 279.02ms | 205.06ms |
| 1000x12 - 4 sources - dynamic (large) | 472.07ms | 3.47s | 1.91s | 278.76ms | 3.77s | 349.87ms |
| 1000x5 - 25 sources (wide dense) | 604.75ms | 2.59s | 3.62s | 410.24ms | 3.35s | 509.07ms |
| 5x500 - 3 sources (deep) | 262.98ms | 232.44ms | 1.13s | 189.75ms | 228.48ms | 203.51ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 387.19ms | 439.71ms | 1.72s | 268.15ms | 474.33ms | 258.55ms |

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
