# Dart Reactivity Benchmark

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Usage

Dart VM
```bash
dart run bin/[framework_name].dart
```

Run all benchamrks
```bash
bash bench.sh
```

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score |
|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 29.26 |
| 🥈 | [preact_signals](https://pub.dev/packages/preact_signals) | 20.61 |
| 🥉 | [signals](https://pub.dev/packages/signals) | 19.22 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 14.66 |
| 5 | [solidart](https://pub.dev/packages/solidart) | 3.41 |
<!-- Rank Table End -->

> [!TIP]
> ## Ranking algorithm
>
> 1. The score of the test with the shortest test time is 1.0, and the score of the other frameworks is the time of the same test divided by the shortest time. For example, if the shortest time is 100ms and the time of other frameworks is 200ms, the scores of the others are 0.5
> 2. If the test case status is fail, the score is 0
> 3. If the test case status contains sun and count, and both count and sum are pass, the score is calculated as 1 algorithm. If only one of them is fail, the score is divided by 2, and if all fail, the score is 0
> 4. The total score of each framework is the sum of the total scores of all test cases.

## Performance benchmark results of each framework (unit: microsecond μs)

<!-- Benchmark Table -->
| Test Case | preact_signals | alien_signals | solidart | signals | state_beacon |
|---|---|---|---|---|---|
| kairo avoidablePropagation | 99.02ms | 93.28ms | 1.0921s | 93.19ms | 93.24ms (fail) |
| kairo broadPropagation | 217.79ms | 187.69ms | 2.5504s | 206.29ms | 3.04ms (fail) |
| kairo deepPropagation | 91.72ms | 71.38ms | 958.74ms | 93.23ms | 90.81ms (fail) |
| kairo diamond | 146.08ms | 111.09ms | 1.6734s | 145.43ms | 96.56ms (fail) |
| kairo mux | 193.79ms | 193.63ms | 1.0114s | 197.47ms | 97.79ms (fail) |
| kairo repeatedObservers | 21.39ms | 10.87ms | 102.68ms | 24.13ms | 25.45ms (fail) |
| kairo triangle | 55.14ms | 46.72ms | 556.46ms | 54.17ms | 43.21ms (fail) |
| kairo unstable | 36.29ms | 22.92ms | 161.69ms | 41.05ms | 191.67ms (fail) |
| molBench | 273.52ms | 272.95ms | 1.0225s | 276.99ms | 399μs |
| create_signals | 2.03ms | 9.10ms | 21.53ms | 17.54ms | 28.57ms |
| comp_0to1 | 7.15ms | 2.29ms | 19.03ms | 6.91ms | 24.49ms |
| comp_1to1 | 14.55ms | 7.56ms | 21.02ms | 7.22ms | 24.45ms |
| comp_2to1 | 1.26ms | 5.37ms | 12.24ms | 4.73ms | 15.40ms |
| comp_4to1 | 6.64ms | 708μs | 5.05ms | 3.67ms | 8.50ms |
| comp_1000to1 | 3μs | 2μs | 1.83ms | 2μs | 20μs |
| comp_1to2 | 2.69ms | 4.93ms | 18.40ms | 8.91ms | 22.75ms |
| comp_1to4 | 15.33ms | 5.92ms | 10.57ms | 3.29ms | 21.28ms |
| comp_1to8 | 3.04ms | 2.29ms | 12.32ms | 3.63ms | 21.53ms |
| comp_1to1000 | 2.29ms | 1.60ms | 9.45ms | 2.00ms | 20.00ms |
| update_1to1 | 3.93ms | 1.72ms | 19.47ms | 4.44ms | 2.76ms |
| update_2to1 | 2.05ms | 944μs | 9.60ms | 2.09ms | 1.38ms |
| update_4to1 | 1.12ms | 463μs | 4.73ms | 1.02ms | 688μs |
| update_1000to1 | 10μs | 5μs | 53μs | 10μs | 7μs |
| update_1to2 | 2.02ms | 961μs | 9.63ms | 2.18ms | 1.38ms |
| update_1to4 | 1.09ms | 449μs | 4.73ms | 1.10ms | 706μs |
| update_1to1000 | 18μs | 22μs | 111μs | 20μs | 199μs |
| cellx1000 | 4.15ms | 3.88ms | 76.79ms | 4.17ms | 3.10ms |
| cellx2500 | 11.12ms | 10.95ms | 233.70ms | 14.08ms | 10.40ms |
| cellx5000 | 32.84ms | 24.43ms | 494.19ms | 34.21ms | 28.76ms |
| 10x5 - 2 sources - read 20.0% (simple) | 226.04ms | 147.56ms | 1.3123s (half) | 248.19ms | 150.16ms |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 120.41ms | 101.22ms | 1.2561s (half) | 125.76ms | 106.03ms |
| 1000x12 - 4 sources - dynamic (large) | 1.9637s | 149.96ms | 2.0363s (half) | 2.5521s | 189.29ms |
| 1000x5 - 25 sources (wide dense) | 1.4174s | 243.63ms | 2.6086s (half) | 2.2777s | 260.22ms |
| 5x500 - 3 sources (deep) | 103.92ms | 120.20ms | 1.0028s (half) | 108.09ms | 123.78ms |
| 100x15 - 6 sources - dynamic (very dynamic) | 217.49ms | 143.59ms | 1.4209s (half) | 251.07ms | 143.71ms |
<!-- Benchmark Table End -->
