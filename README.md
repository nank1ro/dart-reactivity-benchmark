# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.67 | 100.0% | 35/35 | 3.68s |
| 🥈 | signals | 0.27 | 100.0% | 35/35 | 11.46s |
| 🥉 | solidart(2.0-dev) | 0.25 | 100.0% | 35/35 | 5.37s |
| 4 | preact_signals | 0.25 | 100.0% | 35/35 | 10.35s |
| 5 | mobx | 0.04 | 100.0% | 35/35 | 28.18s |
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
| Test Case | state_beacon | alien_signals | mobx | solidart(2.0-dev) | signals | preact_signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 175.01ms (fail) | 183.09ms | 2.38s | 278.02ms | 208.08ms | 198.08ms |
| broadPropagation | 5.94ms (fail) | 344.35ms | 4.56s | 508.60ms | 453.45ms | 446.69ms |
| deepPropagation | 147.41ms (fail) | 125.69ms | 1.58s | 168.86ms | 165.78ms | 178.77ms |
| diamond | 184.22ms (fail) | 231.17ms | 2.54s | 350.71ms | 277.02ms | 278.65ms |
| mux | 191.20ms (fail) | 368.41ms | 1.91s | 444.27ms | 414.71ms | 403.41ms |
| repeatedObservers | 52.26ms (fail) | 46.02ms | 236.49ms | 81.53ms | 44.47ms | 40.92ms |
| triangle | 77.18ms (fail) | 83.34ms | 782.21ms | 117.07ms | 100.51ms | 98.33ms |
| unstable | 347.24ms (fail) | 66.86ms | 353.00ms | 98.56ms | 79.21ms | 67.40ms |
| molBench | 920μs | 488.41ms | 586.76ms | 493.38ms | 485.64ms | 488.56ms |
| create_signals | 68.67ms | 26.01ms | 84.85ms | 97.43ms | 26.37ms | 5.32ms |
| comp_0to1 | 59.36ms | 6.93ms | 22.48ms | 58.54ms | 12.18ms | 17.89ms |
| comp_1to1 | 61.27ms | 4.26ms | 52.89ms | 50.39ms | 33.64ms | 14.52ms |
| comp_2to1 | 42.31ms | 2.37ms | 30.30ms | 39.59ms | 8.37ms | 22.47ms |
| comp_4to1 | 16.98ms | 8.94ms | 28.88ms | 5.03ms | 2.77ms | 14.51ms |
| comp_1000to1 | 60μs | 3μs | 16μs | 30μs | 4μs | 5μs |
| comp_1to2 | 44.75ms | 20.68ms | 34.48ms | 36.98ms | 15.02ms | 18.05ms |
| comp_1to4 | 43.85ms | 6.99ms | 18.63ms | 21.59ms | 6.80ms | 25.61ms |
| comp_1to8 | 42.59ms | 4.71ms | 20.83ms | 22.47ms | 6.14ms | 5.37ms |
| comp_1to1000 | 39.26ms | 3.52ms | 16.12ms | 16.78ms | 4.19ms | 5.85ms |
| update_1to1 | 5.75ms | 10.27ms | 23.88ms | 16.13ms | 8.86ms | 8.77ms |
| update_2to1 | 3.11ms | 2.27ms | 14.49ms | 8.00ms | 4.49ms | 4.23ms |
| update_4to1 | 1.44ms | 2.55ms | 6.97ms | 4.04ms | 2.22ms | 2.21ms |
| update_1000to1 | 15μs | 24μs | 71μs | 40μs | 22μs | 21μs |
| update_1to2 | 2.86ms | 5.08ms | 11.19ms | 8.29ms | 4.83ms | 4.64ms |
| update_1to4 | 1.45ms | 2.48ms | 5.59ms | 4.06ms | 2.24ms | 2.19ms |
| update_1to1000 | 382μs | 47μs | 173μs | 171μs | 42μs | 824μs |
| cellx1000 | 5.16ms | 7.39ms | 79.45ms | 12.55ms | 9.80ms | 9.76ms |
| cellx2500 | 24.08ms | 21.30ms | 281.64ms | 41.64ms | 34.92ms | 26.56ms |
| cellx5000 | 58.13ms | 50.54ms | 628.99ms | 102.74ms | 82.82ms | 72.65ms |
| 10x5 - 2 sources - read 20.0% (simple) | 237.24ms | 229.05ms | 2.05s | 355.85ms | 527.37ms | 488.08ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 200.32ms | 178.76ms | 1.53s | 244.63ms | 281.29ms | 280.80ms |
| 1000x12 - 4 sources - dynamic (large) | 345.13ms | 282.93ms | 1.92s | 464.64ms | 3.83s | 3.73s |
| 1000x5 - 25 sources (wide dense) | 505.82ms | 407.25ms | 3.55s | 578.25ms | 3.63s | 2.70s |
| 5x500 - 3 sources (deep) | 203.00ms | 190.31ms | 1.13s | 253.38ms | 225.25ms | 231.81ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 259.28ms | 263.19ms | 1.71s | 380.92ms | 477.30ms | 453.24ms |

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
