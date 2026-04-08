# Dart Reactivity Benchmark [![Pub Version](https://img.shields.io/pub/v/reactivity_benchmark)](https://pub.dev/packages/reactivity_benchmark)

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Score Ranking

<!-- ranking start -->
| Rank | Framework | Score | Success Rate | Tests | Time |
|------|-----------|-------|--------------|-------|------|
| 🥇 | alien_signals | 0.72 | 100.0% | 35/35 | 3.72s |
| 🥈 | solidart(2.0-dev) | 0.28 | 100.0% | 35/35 | 5.16s |
| 🥉 | signals | 0.26 | 100.0% | 35/35 | 10.97s |
| 4 | preact_signals | 0.24 | 100.0% | 35/35 | 10.39s |
| 5 | mobx | 0.05 | 100.0% | 35/35 | 27.05s |
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
| Test Case | solidart(2.0-dev) | alien_signals | state_beacon | preact_signals | mobx | signals |
|---|---|---|---|---|---|---|
| avoidablePropagation | 272.94ms | 196.30ms | 146.94ms (fail) | 204.93ms | 2.35s | 199.76ms |
| broadPropagation | 493.59ms | 356.32ms | 6.82ms (fail) | 446.70ms | 4.47s | 462.52ms |
| deepPropagation | 166.30ms | 127.77ms | 139.20ms (fail) | 171.16ms | 1.55s | 175.55ms |
| diamond | 342.06ms | 247.25ms | 179.45ms (fail) | 277.18ms | 2.39s | 292.92ms |
| mux | 411.36ms | 362.90ms | 180.13ms (fail) | 367.03ms | 1.76s | 398.74ms |
| repeatedObservers | 80.36ms | 45.73ms | 56.82ms (fail) | 42.53ms | 233.76ms | 45.30ms |
| triangle | 111.68ms | 89.04ms | 76.80ms (fail) | 100.31ms | 771.51ms | 100.87ms |
| unstable | 94.63ms | 63.06ms | 335.23ms (fail) | 71.21ms | 346.19ms | 75.45ms |
| molBench | 483.95ms | 480.61ms | 1.06ms | 493.07ms | 580.43ms | 492.30ms |
| create_signals | 56.52ms | 28.33ms | 59.27ms | 5.34ms | 67.32ms | 25.24ms |
| comp_0to1 | 25.28ms | 7.80ms | 53.23ms | 17.38ms | 26.25ms | 11.15ms |
| comp_1to1 | 43.97ms | 4.18ms | 55.00ms | 10.69ms | 35.93ms | 23.95ms |
| comp_2to1 | 35.40ms | 2.27ms | 36.84ms | 13.64ms | 33.85ms | 9.29ms |
| comp_4to1 | 4.66ms | 7.57ms | 16.58ms | 15.19ms | 12.77ms | 2.06ms |
| comp_1000to1 | 28μs | 3μs | 45μs | 4μs | 20μs | 5μs |
| comp_1to2 | 29.63ms | 13.73ms | 48.72ms | 19.07ms | 28.61ms | 20.28ms |
| comp_1to4 | 14.78ms | 9.07ms | 45.73ms | 31.62ms | 37.89ms | 10.20ms |
| comp_1to8 | 19.13ms | 3.81ms | 44.09ms | 6.73ms | 23.98ms | 6.12ms |
| comp_1to1000 | 14.07ms | 3.48ms | 39.93ms | 5.28ms | 15.02ms | 4.14ms |
| update_1to1 | 15.69ms | 4.61ms | 8.46ms | 9.21ms | 21.23ms | 8.95ms |
| update_2to1 | 7.76ms | 2.36ms | 2.85ms | 4.62ms | 11.23ms | 4.45ms |
| update_4to1 | 3.81ms | 1.22ms | 2.42ms | 2.32ms | 5.24ms | 2.25ms |
| update_1000to1 | 39μs | 11μs | 14μs | 23μs | 52μs | 22μs |
| update_1to2 | 7.96ms | 2.32ms | 4.91ms | 4.50ms | 11.12ms | 4.41ms |
| update_1to4 | 3.92ms | 1.21ms | 1.46ms | 2.44ms | 5.30ms | 2.29ms |
| update_1to1000 | 143μs | 45μs | 398μs | 1.02ms | 160μs | 41μs |
| cellx1000 | 11.44ms | 7.80ms | 5.44ms | 9.82ms | 75.44ms | 9.80ms |
| cellx2500 | 30.97ms | 20.87ms | 28.25ms | 25.74ms | 213.62ms | 33.95ms |
| cellx5000 | 70.77ms | 47.84ms | 63.38ms | 64.59ms | 556.57ms | 74.24ms |
| 10x5 - 2 sources - read 20.0% (simple) | 349.71ms | 242.08ms | 233.80ms | 444.72ms | 1.98s | 507.22ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 249.91ms | 183.55ms | 199.56ms | 283.31ms | 1.50s | 279.64ms |
| 1000x12 - 4 sources - dynamic (large) | 463.51ms | 280.47ms | 334.80ms | 3.79s | 1.75s | 3.59s |
| 1000x5 - 25 sources (wide dense) | 600.80ms | 416.18ms | 515.21ms | 2.77s | 3.42s | 3.40s |
| 5x500 - 3 sources (deep) | 254.16ms | 197.92ms | 206.87ms | 236.89ms | 1.12s | 221.51ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 387.83ms | 264.14ms | 262.35ms | 447.84ms | 1.64s | 471.13ms |

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
